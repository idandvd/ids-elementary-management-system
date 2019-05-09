import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { ApiService } from '../api.service';
import { ArrayType } from '@angular/compiler';
import { Subject } from 'rxjs';
import { debounceTime } from 'rxjs/operators';
import { AlertService } from '../_services';
import { FormGroup, FormBuilder, Validators, FormControl } from '@angular/forms';

@Component({
  selector: 'app-add-student-form',
  templateUrl: './add-student-form.component.html',
  styleUrls: ['./add-student-form.component.css']
})
export class AddStudentFormComponent implements OnInit {


  file: File;
  public classes;
  public mothers;
  public fathers;
  public keyword = "FirstName";

  public newStudent: { [key: string]: any } = {};

  public MotherFromList;
  public selectedMother: any;

  public FatherFromList;
  public selectedFather: any;

  
  constructor(private apiService: ApiService, private alertService: AlertService, private _fb: FormBuilder) {

  }

  ngOnInit() {
    this.newStudent.FirstName = "עידן";
    this.newStudent.LastName = "דוד";
    this.newStudent.Settlement = "ירושלים";
    this.newStudent.HomePhone = "02-6787905";
    this.MotherFromList = true;
    this.FatherFromList = false;

    this.newStudent.Father = {};
    this.newStudent.Mother = {};
    this.newStudent.Father.FirstName = "אבנר";
    this.newStudent.Father.LastName = "דוד";
    this.newStudent.Father.Cellphone = "033333333";
    this.newStudent.Father.Email = "mail.mail.com";
    this.getClasses();
    this.getParents();

  }




  getClasses() {
    this.apiService.getController("Classes").subscribe(
      data => {
        this.classes = data;
        this.newStudent.Class = data[0];
      },
      err => console.error("Classes err")
    );
  }

  getParents() {
    var that = this;
    this.apiService.getController("Parents").subscribe(
      data => {
        that.mothers = (<Array<any>>data).filter(prnt => prnt.Gender === "female").map(function (mother) {
          mother.Name = mother.FirstName + " " + mother.LastName
          return mother;
        });
        that.fathers = (<Array<any>>data).filter(prnt => prnt.Gender === "male").map(function (father) {
          father.Name = father.FirstName + " " + father.LastName
          return father;
        });

        //this.selectedMother = data[2];

      },
      err => console.error("Parents err")
    );
  }

  public changeSuccessMessage() {
    this.alertService.success("תלמיד נוסף בהצלחה");
  }
  public changeErrorMessage() {
    //this._error.next("שגיאה בהוספת תלמיד");
    this.alertService.error("שגיאה בהוספת תלמיד");
  }

  addStudent() {
    this.newStudent.Mother = this.getNewMother();
    this.newStudent.Father = this.getNewFather();
    this.apiService.addModel(this.newStudent, "Students").subscribe(
      data => { },
      err => { console.error("Parents err"); this.changeErrorMessage(); },
      () => { this.changeSuccessMessage(); }
    );
  }


  getNewMother() {
    if (this.MotherFromList) {
      return this.selectedMother;
    }
    return this.newStudent.Mother;
  }
  getNewFather() {
    if (this.FatherFromList) {
      return this.selectedFather;
    }
    return this.newStudent.Father;
  }

  motherFromList() {
    //setTimeout(() => this.autocomplete.inputEL.nativeElement.value = this.mothers[1]);
    this.selectedMother = this.mothers[1];
  }
  fatherFromList() {
    this.selectedFather = null;
  }


  selectEvent(item) {
    // do something with selected item
  }

  onChangeSearch(val: string) {
    //this.selectedMother = this.mothers[1];

    // fetch remote data from here
    // And reassign the 'data' which is binded to 'data' property.
  }

  onFocused(e) {
    // do something when input is focused
  }

  incomingfile(event) {
    this.file = event.target.files[0];
  }

  Upload(files) {
    let fileToUpload = <File>this.file;
    const formData = new FormData();
    formData.append('file', fileToUpload, fileToUpload.name);
    this.apiService.uploadFile(formData,"Students").subscribe(
      data => { console.log(data) },
      err => { },
      () => { this.alertService.success("תלמידים נוספו בהצלחה"); }
    );
  }
}
