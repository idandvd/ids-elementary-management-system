import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import {Subject} from 'rxjs';
import {debounceTime} from 'rxjs/operators';
import { Observable } from 'rxjs';

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
  constructor(private apiService: ApiService) { }

  ngOnInit() {
    this._success.subscribe((message) => this.successMessage = message);
    this._success.pipe(
      debounceTime(5000)
    ).subscribe(() => this.successMessage = null);
    this._error.subscribe((message) => this.errorMessage = message);
    this._error.pipe(
      debounceTime(5000)
    ).subscribe(() => this.errorMessage = null);
  }

  public changeSuccessMessage() {
    this._success.next("סוג מורה נוסף בהצלחה");
  }
  public changeErrorMessage() {
    this._error.next("שגיאה שהוספת סוג מורה");
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
