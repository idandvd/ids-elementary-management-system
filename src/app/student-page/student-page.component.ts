import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService } from '../_services';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-student-page',
  templateUrl: './student-page.component.html',
  styleUrls: ['./student-page.component.css']
})
export class StudentPageComponent implements OnInit {

  public studentId;
  public student;
  public studentScheduleTable;


  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.params.subscribe(routeParams => {
      this.studentId = routeParams.studentId;
      this.getStudentScheduleTable();
    });
  }


  getStudentScheduleTable() {
    const that = this;

    this.apiService.getControllerByActionAndId("Students", "Schedule", this.studentId).subscribe(
      data => {
        this.studentScheduleTable = data;
        that.student = this.studentScheduleTable.Student;
        that.student.Name = that.student.FirstName + " " + that.student.LastName;
        that.student.Mother.Name = that.student.Mother.FirstName + " " + that.student.Mother.LastName;
        that.student.Father.Name = that.student.Father.FirstName + " " + that.student.Father.LastName;
      },
      err => console.error(this.studentId),
      () => { console.log('done loading StudentsScheduleTable'); console.log(this.studentScheduleTable); }
    );

  }

}
