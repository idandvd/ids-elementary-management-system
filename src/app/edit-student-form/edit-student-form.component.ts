import { Component, OnInit, ViewChild } from '@angular/core';
import { ApiService } from '../api.service';
import { Subject } from 'rxjs';
import { debounceTime } from 'rxjs/operators';
import { AlertService } from '../_services';

@Component({
  selector: 'app-edit-student-form',
  templateUrl: './edit-student-form.component.html',
  styleUrls: ['./edit-student-form.component.css']
})
export class EditStudentFormComponent implements OnInit {
  private _success = new Subject<string>();
  private _error = new Subject<string>();
  successMessage: string;
  errorMessage: string;

  public students;
  public classes;
  public mothers;
  public fathers;
  public keyword = "Name";

  public selectedStudent;
  
  public MotherFromList;
  public selectedMother: any;

  public FatherFromList;
  public selectedFather: any;
  
  @ViewChild('auto') auto;

  constructor(private apiService: ApiService, private alertService: AlertService) { }

  ngOnInit() {
    this.MotherFromList = true;
    this.FatherFromList = true;
    
    this.getClasses();
    this.getParents();
    this.getStudents();
  }
  
  saveStudent()
  {
    this.auto.close();

    this.selectedStudent.Mother = this.getNewMother();
    this.selectedStudent.Father = this.getNewFather();
    this.apiService.addModel(this.selectedStudent, "Students").subscribe(
      data => { },
      err => { console.error("Parents err"); this.changeErrorMessage(); },
      () => { this.changeSuccessMessage();this.students = null;this.selectedStudent = null; this.getStudents(); }
    );
  }
  selectedStudentExists()
  {
    if(this.students && this.students.indexOf(this.selectedStudent) != -1)
      return true;
    return false;
  }

  public changeSuccessMessage() {
    this.alertService.success("תלמיד נשמר בהצלחה");
  }
  public changeErrorMessage() {
    //this._error.next("שגיאה בהוספת תלמיד");
    this.alertService.error("שגיאה בשמירת תלמיד");
  }


  getNewMother() {
    if (this.MotherFromList) {
      return this.selectedMother;
    }
    return this.selectedStudent.Mother;
  }
  getNewFather() {
    if (this.FatherFromList) {
      return this.selectedFather;
    }
    return this.selectedStudent.Father;
  }

  getClasses() {

    this.apiService.getController("Classes").subscribe(
      data => {
        this.classes = data;
      },
      err => console.error("Classes err")
    );
  }

  getParents() {
    this.apiService.getController("Parents").subscribe(
      data => {
        this.mothers = (<Array<any>>data).filter(prnt => prnt.Gender === "female").map(function (mother) {
          mother.Name = mother.FirstName + " " + mother.LastName
          return mother;
        });
        this.fathers = (<Array<any>>data).filter(prnt => prnt.Gender === "male").map(function (father) {
          father.Name = father.FirstName + " " + father.LastName
          return father;
        });
        //this.selectedMother = data[2];

      },
      err => console.error("Parents err"),
      () => console.log("Classes Loaded")

    );
  }

  getStudents() {
    const that = this;

    this.apiService.getController("Students").subscribe(
      data => { this.students = (<Array<any>>data).filter(student => student.Class === student.Class ).map(function (student) {
        student.Name = student.FirstName + " " + student.LastName;
        student.Class = that.classes.filter(cls => cls.Id === student.Class.Id)[0];
        student.mother = that.mothers.filter(mother => mother.Id == student.Mother.Id)[0];
        student.father = that.fathers.filter(father => father.Id == student.Father.Id)[0];
        return student;
      }); },
      () => this.alertService.error("שגיאה בטעינת תלמידים"),
      () => console.log("Students Loaded")
    );
  }

  selectEvent(item) {
    // do something with selected item
  }

  onChangeSearch(val: string) {
    // fetch remote data from here
    // And reassign the 'data' which is binded to 'data' property.
  }

  onFocused(e) {
    // do something when input is focused
  }
}
