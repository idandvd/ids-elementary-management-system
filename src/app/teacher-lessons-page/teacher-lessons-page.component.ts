import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService, AuthenticationService } from '../_services';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-teacher-lessons-page',
  templateUrl: './teacher-lessons-page.component.html',
  styleUrls: ['./teacher-lessons-page.component.css']
})
export class TeacherLessonsPageComponent implements OnInit {

  public currentTeacher;
  public lessons;

  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService,
    private route: ActivatedRoute,
    private router: Router) {

    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);

  }

  ngOnInit() {
    this.getLessons();

  }

  getLessons() {
    this.apiService.getController("Lessons").subscribe(
      data => {
        this.lessons = data;
        this.lessons = this.lessons.filter(lesson => lesson.Teacher.Id == this.currentTeacher.Id)
        this.lessons.sort((a, b) => a.Name.localeCompare(b.Name));

        this.lessons.sort((b, a) => a.LessonType.Name.localeCompare(b.LessonType.Name));
      },
      err => console.error("Error Loading Lessons"),
      () => console.log('Done loading Lessons')
    );
  }

  gotoLessonEvaluation(lesson) {
    let lessonId = lesson.Id;
    this.router.navigate(['/LessonEvaluationPage', { lessonId }]);
  }

}
