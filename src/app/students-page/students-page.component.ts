import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { ActivatedRoute } from '@angular/router';
import { AlertService } from '../_services';

@Component({
  selector: 'app-students-page',
  templateUrl: './students-page.component.html',
  styleUrls: ['./students-page.component.css']
})
export class StudentsPageComponent implements OnInit {
  public classId;
  public students;

  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.params.subscribe(routeParams => {
      this.classId = routeParams.classId;
      this.getStudents();
    });
  }

  getStudents() {
    const that = this;

    this.apiService.getControllerByActionAndId("Students", "OfClass", this.classId).subscribe(
      data => {
        this.students = (<Array<any>>data).filter(student => student.Class === student.Class).map(function (student) {
          student.Name = student.FirstName + " " + student.LastName;
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

}
