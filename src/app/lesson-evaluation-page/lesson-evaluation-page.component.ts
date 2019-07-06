import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService, AuthenticationService } from '../_services';
import { ActivatedRoute, Router } from '@angular/router';
import { forkJoin } from 'rxjs';

@Component({
  selector: 'app-lesson-evaluation-page',
  templateUrl: './lesson-evaluation-page.component.html',
  styleUrls: ['./lesson-evaluation-page.component.css']
})
export class LessonEvaluationPageComponent implements OnInit {

  public currentTeacher;
  public lessonClasses
  public lesson;
  public lessonId;
  public selectedClass;
  public classStudents;

  public evaluations;
  public classEvaluations;

  public grades;
  public classGrades;

  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService,
    private route: ActivatedRoute,
    private router: Router) {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);

  }

  ngOnInit() {
    this.route.params.subscribe(routeParams => {
      this.lessonId = routeParams.lessonId;
      let responseLessons = this.getLesson();
      let responseClasses = this.getClasses();
      let responseEvaluations = this.getEvaluations();
      let responseGrades = this.getGrades();
      forkJoin([responseLessons, responseClasses, responseEvaluations, responseGrades]).subscribe(
        () => { },
        () => { },
        () => {
          setTimeout(() => { this.changeClass(); }, 400)
        }
      );
    });
  }

  getLesson() {
    let response = this.apiService.getControllerById("Lessons", this.lessonId);
    response.subscribe(
      (data) => {
        this.lesson = data;
      },
      (err) => { console.error("Error loading Lessons"); },
      () => { console.log("Done loading Lessons"); }
    )
    return response;
  }

  getClasses() {
    let response = this.apiService.getControllerByActionAndId("Classes", "GetClassesByLesson", this.lessonId);
    response.subscribe(
      (data) => {
        this.lessonClasses = data;
        if (this.lessonClasses && this.lessonClasses.length > 0) {
          this.selectedClass = this.lessonClasses[0];
          // this.changeClass();
        }

      },
      (err) => { console.error("Error loading Classes"); },
      () => { console.log("Done loading Classes"); }
    );
    return response;
  }
  getEvaluations() {
    let response = this.apiService.getController("LessonEvaluations");
    response.subscribe(
      (data) => {
        this.evaluations = data;
        // if (!this.lessonClasses)
        //   this.getClasses();
        // else
        //   this.changeClass();

      },
      (err) => { console.error("Error loading Evaluations"); },
      () => { console.log("Done loading Evaluations"); });
    return response;
  }


  getGrades() {
    let response = this.apiService.getController("LessonGrades");
    response.subscribe(
      (data) => {
        this.grades = data;
        // if (!this.lessonClasses)
        //   this.getClasses();
        // else
        //   this.changeClass();

      },
      (err) => { console.error("Error loading Grades"); },
      () => { console.log("Done loading Grades"); });
    return response;
  }


  saveEvaluation(evaluation, student) {
    let lessonEvaluation: { [key: string]: any } = {};
    lessonEvaluation.Student = student;
    lessonEvaluation.Lesson = this.lesson;
    lessonEvaluation.Evaluation = evaluation;

    let studentEvaluations = this.classEvaluations.filter(evaluation => evaluation.Student.Id == student.Id);
    if (studentEvaluations.length > 0) {
      // lessonEvaluation.Id = studentEvaluations[0].Id;
      studentEvaluations[0].Evaluation = evaluation
    }
    else {
      this.classEvaluations.push(lessonEvaluation);
      studentEvaluations = this.classEvaluations.filter(evaluation => evaluation.Student.Id == student.Id);
    }

    this.apiService.addModel(studentEvaluations[0], "LessonEvaluations").subscribe(
      (data) => { studentEvaluations[0].Id = data },
      (err) => { console.error("Error Saving LessonEvaluations"); },
      () => { console.log("Done Saving LessonEvaluations"); }
    )

    // console.log(evaluation);
    // console.log(student);
  }


  saveGrade(grade, student) {
    if (grade > 100) grade = 100;
    if (grade < 0) grade = 0;

    let lessonGrade: { [key: string]: any } = {};
    lessonGrade.Student = student;
    lessonGrade.Lesson = this.lesson;
    lessonGrade.Grade = grade;
    let my_stud = this.classStudents.filter(stud => stud.Id == student.Id)[0];
    my_stud.Grade = grade;

    let studentGrades = this.classGrades.filter(grade => grade.Student.Id == student.Id);
    if (studentGrades.length > 0) {
      // lessonEvaluation.Id = studentEvaluations[0].Id;
      studentGrades[0].Grade = grade
    }
    else {
      this.classGrades.push(lessonGrade);
      studentGrades = this.classGrades.filter(grade => grade.Student.Id == student.Id);
    }

    this.apiService.addModel(studentGrades[0], "LessonGrades").subscribe(
      (data) => { studentGrades[0].Id = data },
      (err) => { console.error("Error Saving LessonGrades"); },
      () => { console.log("Done Saving LessonGrades"); }
    )

    // console.log(evaluation);
    // console.log(student);
  }


  onClassChange() {
    this.getEvaluations();
  }

  changeClass() {
    console.log(this.selectedClass);
    this.classEvaluations = this.evaluations.filter(evaluation => evaluation.Student.Class.Id == this.selectedClass.Id);
    this.classGrades = this.grades.filter(grade => grade.Student.Class.Id == this.selectedClass.Id);
    console.log(this.classEvaluations);
    console.log(this.classGrades);
    this.apiService.getControllerByActionAndId("Students", "OfClass", this.selectedClass.Id).subscribe(
      (data) => {
        this.classStudents = data;
        for (let student of this.classStudents) {
          let studentEvaluations = this.classEvaluations.filter(evaluation => evaluation.Student.Id == student.Id);
          if (studentEvaluations.length > 0)
            student.Evaluation = studentEvaluations[0].Evaluation;
          else
            student.Evaluation = "";

          let studentGrades = this.classGrades.filter(grade => grade.Student.Id == student.Id);
          if (studentGrades.length > 0)
            student.Grade = studentGrades[0].Grade;
          else
            student.Grade = "";

          // console.log(student);
          // console.log(studentEvaluations);

        }
      },
      (err) => { console.error("Error loading Students"); },
      () => { console.log("Done loading Students"); }
    )

  }

}
