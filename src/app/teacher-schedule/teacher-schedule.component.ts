import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService, AuthenticationService } from '../_services';
import { Teacher } from '../_models';

@Component({
  selector: 'app-teacher-schedule',
  templateUrl: './teacher-schedule.component.html',
  styleUrls: ['./teacher-schedule.component.css']
})
export class TeacherScheduleComponent implements OnInit {
  currentTeacher: Teacher;

  public classId;
  public teacherScheduleTable;
  public conflicts = []
  // public classes;
  // public hoursInDay;
  // public days;

  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService) { }

  ngOnInit() {

    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
    // this.getHoursInDay();
    // this.getDays();
    this.getTeacherSchedule();

  }

  getTeacherSchedule() {
    this.apiService.getControllerByActionAndId("Teachers", "Schedule", this.currentTeacher.Id).subscribe(
      data => {
        this.teacherScheduleTable = data;
        this.replaceNewLines()
      },
      err => console.error(this.classId),
      () => { console.log('done loading TheacerScheduleTable'); console.log(this.teacherScheduleTable); }
    );

  }

  replaceNewLines() {
    let data = this.teacherScheduleTable
    for (let day of data.Days) {
      this.conflicts.push(day.Id);
      this.conflicts[day.Id] = []
      for (let hour of data.HoursInDay) {
        this.conflicts[day.Id].push(hour.Id);
        
        if (data.TeacherScheduleClasses[day.Id] && data.TeacherScheduleClasses[day.Id][hour.Id]) {
          this.conflicts[day.Id][hour.Id] = 
          (data.TeacherScheduleClasses[day.Id][hour.Id].match(/\n/g) || []).length > 0
        }
      }
    }
  }

  // getClasses() {
  //   this.apiService.getController("Classes").subscribe(
  //     data => { this.classes = data; },
  //     err => console.error(this.classId),
  //     () => { console.log('done loading Classes'); console.log(this.classes); }
  //   );

  // }
  // getHoursInDay() {
  //   this.apiService.getController("HoursInDay").subscribe(
  //     data => { this.hoursInDay = data; },
  //     err => console.error(this.classId),
  //     () => { console.log('done loading HoursInDay'); console.log(this.hoursInDay); }
  //   );

  // }
  // getDays() {
  //   this.apiService.getController("Days").subscribe(
  //     data => { this.days = data; },
  //     err => console.error(this.classId),
  //     () => { console.log('done loading Days'); console.log(this.days); }
  //   );

  // }

}
