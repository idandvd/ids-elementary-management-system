import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import {Subject} from 'rxjs';
import {debounceTime} from 'rxjs/operators';
import { Observable } from 'rxjs';
import { AlertService } from '../_services';

@Component({
  selector: 'app-add-teacher-type-form',
  templateUrl: './add-teacher-type-form.component.html',
  styleUrls: ['./add-teacher-type-form.component.css']
})
export class AddTeacherTypeFormComponent implements OnInit {
  private _success = new Subject<string>();
  private _error = new Subject<string>();
  successMessage: string;
  errorMessage:string;
  public teacherTypeName:string;
  constructor(private apiService: ApiService,private alertService:AlertService) { }

  ngOnInit() {

  }

  public changeSuccessMessage() {
    this.alertService.success("סוג מורה נוסף בהצלחה");
  }
  public changeErrorMessage() {
    this.alertService.error("שגיאה שהוספת סוג מורה");
  }

  addTeacher()
  {
    var teacherType: {[key: string]: any} = {};
    teacherType.Name = this.teacherTypeName
    this.apiService.addModel(teacherType,"TeacherTypes").subscribe(
      data => { },
      err =>{this.changeErrorMessage(); this.teacherTypeName = ""},
      () => {this.changeSuccessMessage(); this.teacherTypeName = ""}
    );
    
  }

}
