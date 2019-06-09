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
  public classScheduleTable;
  
  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService) { }

  ngOnInit() {
    this.getTeacherSchedule();
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);

  }

  getTeacherSchedule() {
    this.apiService.getControllerByActionAndId("Teachers","Schedule", 1).subscribe(
      data => { this.classScheduleTable = data; },
      err => console.error(this.classId),
      () => { console.log('done loading ClassScheduleTable'); console.log(this.classScheduleTable); }
    );

  }

}
