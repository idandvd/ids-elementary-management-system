import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { NONE_TYPE } from '@angular/compiler/src/output/output_ast';
import { AlertService } from '../_services';

@Component({
  selector: 'app-add-lesson-form',
  templateUrl: './add-lesson-form.component.html',
  styleUrls: ['./add-lesson-form.component.css']
})
export class AddLessonFormComponent implements OnInit {

  public teachers;
  public lessonTypes;
  public LessonName;
  public selectedTeacher:any;
  public selectedLessonType:any;
  public hasEvaluation;
  public hasGrade;

  constructor(private apiService: ApiService,
    private alertService: AlertService) { }

  ngOnInit() {
    this.getTeachers();
    this.getLessonsTypes();
    this.hasEvaluation = true;
    this.hasGrade = false;
    // this.LessonName="";
    // this.selectedTeacher = NONE_TYPE;
  }

  getTeachers() {
    this.apiService.getController("Teachers").subscribe(
      data => { this.teachers = data },
      err => console.error("teachers err"),
      () => console.log('done loading Teachers')
    );
  }

  getLessonsTypes() {
    this.apiService.getController("LessonTypes").subscribe(
      data => { this.lessonTypes = data },
      err => console.error("teachers err"),
      () => console.log('done loading LessonTypes')
    );
  }
  addLesson()
  {
    var lesson: {[key: string]: any} = {};
    lesson.Name = this.LessonName;
    lesson.Teacher = this.selectedTeacher;
    lesson.LessonType = this.selectedLessonType;
    lesson.HasEvaluation = this.hasEvaluation;
    lesson.HasGrade = this.hasGrade;
    lesson.Description = "";
    this.apiService.addModel(lesson,"Lessons").subscribe(
      data => {this.alertService.success("שיעור נוסף בהצלחה") },
      err =>{},
      () => {}
    );
  }

}
