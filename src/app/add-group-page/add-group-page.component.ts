import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService, AuthenticationService } from '../_services';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-add-group-page',
  templateUrl: './add-group-page.component.html',
  styleUrls: ['./add-group-page.component.css']
})
export class AddGroupPageComponent implements OnInit {

  public classId;
  public dayId;
  public day;
  public hourId;
  public hour;
  public lessons;
  public selectedLesson;
  public students;
  public selectedStudents;

  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService,
    private route: ActivatedRoute,
    private router: Router) { }

  ngOnInit() {
    this.route.params.subscribe(routeParams => {
      this.classId = routeParams.classId;
      this.dayId = routeParams.dayId;
      this.hourId = routeParams.hourId;
      this.getStudents();
      this.getDay();
      this.getHour();

    });
    this.getLessons();
  }

  studentChecked(event: any) {

    console.log(event);
  }

  getLessons() {
    this.apiService.getController("Lessons").subscribe(
      data => {
        this.lessons = data;
        this.lessons = this.lessons.filter(lesson => lesson.LessonType.Name == 'קבוצה')
        this.lessons.sort((a, b) => a.Name.localeCompare(b.Name));
      },
      () => { console.error("Error loading Lessons") },
      () => { console.log("Done loading Lessons") }
    )
  }

  getStudents() {
    const that = this;

    this.apiService.getControllerByActionAndId("Students", "OfClass", this.classId).subscribe(
      data => {
        this.students = (<Array<any>>data).filter(student => student.Class === student.Class).map(function (student) {
          student.Name = student.FirstName + " " + student.LastName;
          student.checked = false;
          // student.Class = that.classes.filter(cls => cls.Id === student.Class.Id)[0];
          // student.mother = that.mothers.filter(mother => mother.Id == student.Mother.Id)[0];
          // student.father = that.fathers.filter(father => father.Id == student.Father.Id)[0];
          return student;
        });
      },
      () => this.alertService.error("שגיאה בטעינת תלמידים"),
      () => console.log("Students Loaded")
    );
  }

  getDay() {
    this.apiService.getControllerById("Days", this.dayId).subscribe(
      data => { this.day = data; },
      () => { console.error("Error loading Day") },
      () => { console.log("Done loading Day") }
    )
  }

  getHour() {
    this.apiService.getControllerById("HoursInDay", this.hourId).subscribe(
      data => { this.hour = data; },
      () => { console.error("Error loading Hour") },
      () => { console.log("Done loading Hour") }
    )
  }

  saveGroup() {
    let classId = this.classId;
    let dayId = this.dayId;
    let hourId = this.hourId;
    let group: { [key: string]: any } = {};
    group.Day = this.day;
    group.Hour = this.hour;
    group.lesson = this.selectedLesson;
    group.Students = this.students.filter(student => student.checked);
    this.apiService.addModel(group, "Groups").subscribe(
      () => { },
      () => { console.error("error") },
      () => {
        this.router.navigate(['/GroupsPage/', { classId, dayId, hourId }]);
        console.log("Ok");
      },

    )
  }
}
