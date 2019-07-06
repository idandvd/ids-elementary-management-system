import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService, AuthenticationService } from '../_services';
import { Teacher } from '../_models';
import { forkJoin } from 'rxjs';

@Component({
  selector: 'app-manage-teachers',
  templateUrl: './manage-teachers.component.html',
  styleUrls: ['./manage-teachers.component.css']
})
export class ManageTeachersComponent implements OnInit {
  public currentTeacher: Teacher;

  file: File;

  public classes;
  public teachers;
  public teacherTypes;
  public users;
  public userTypes;
  public manageType = "addItem";


  public isNewUser;
  public newUser: { [key: string]: any } = {};


  public selectedTeacher;
  public selectedTeacherType;
  public selectedTeacherUser;

  public newTeacher: { [key: string]: any } = {};
  public newTeacherType;
  public newTeacherUser;

  constructor(private apiService: ApiService,
    private authenticationService: AuthenticationService,
    private alertService: AlertService) {

    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);

  }

  ngOnInit() {

    this.newTeacher.ClassAccess = [];
    this.isNewUser = true;

    this.getUserTypes();
    this.getClasses();
    this.getTeachers();
    this.getTeacherTypes();
    this.getUsers();
  }

  hasTeacherGotAccessToClass(currentClass) {
    return this.selectedTeacher.ClassAccess.filter(classAccess => {
      return classAccess.Id === currentClass.Id
    }).length > 0;
  }

  onTeacherChange(selectedTeacher) {
    this.selectedTeacherType = this.teacherTypes.filter(teacherType => {
      return teacherType.Id === selectedTeacher.TeacherType.Id;
    })[0];
    this.selectedTeacherUser = this.users.filter(user => {
      return user.Id === selectedTeacher.User.Id;
    })[0];
  }

  getUserTypes() {
    this.apiService.getController("UserTypes").subscribe(
      (data) => { this.userTypes = data; },
      (err) => { console.error("Error loading UserTypes"); },
      () => { console.log("Done loading UserTypes"); }
    )
  }

  getClasses() {
    this.apiService.getController("Classes").subscribe(
      (data) => { this.classes = data; },
      (err) => { console.error("Error loading Classes"); },
      () => { console.log("Done loading Classes"); }
    )
  }
  getTeachers() {
    this.apiService.getController("Teachers").subscribe(
      (data) => {
        this.teachers = data;
        this.teachers.sort((a, b) => a.LastName.localeCompare(b.LastName));
        this.teachers.sort((a, b) => a.FirstName.localeCompare(b.FirstName));
      },
      (err) => { console.error("Error loading Teachers"); },
      () => { console.log("Done loading Teachers"); }
    )
  }

  getTeacherTypes() {
    this.apiService.getController("TeacherTypes").subscribe(
      (data) => { this.teacherTypes = data; },
      (err) => { console.error("Error loading TeacherTypes"); },
      () => { console.log("Done loading TeacherTypes"); }
    )
  }
  getUsers() {
    this.apiService.getController("Users").subscribe(
      (data) => { this.users = data; },
      (err) => { console.error("Error loading Users"); },
      () => { console.log("Done loading Users"); }
    )
  }

  classCheckboxOnChange(teacher: any, classAccess: any, isChecked: boolean) {
    if (isChecked) {
      teacher.ClassAccess.push(classAccess);
    }
    else {
      let classAccessInList = teacher.ClassAccess.filter(
        classAccessInListFilter => {
          return classAccessInListFilter.Id === classAccess.Id;
        })[0];
      const index: number = teacher.ClassAccess.indexOf(classAccessInList);
      if (index !== -1) {
        teacher.ClassAccess.splice(index, 1);
      }
    }
  }

  saveTeacher() {

    this.selectedTeacher.TeacherType = this.selectedTeacherType;
    this.selectedTeacher.User = this.selectedTeacherUser;
    this.apiService.saveModelWithRoute(this.selectedTeacher, "Teachers", "Save").subscribe(
      () => { },
      () => { this.alertService.error("שגיאה בשמירת נתונים"); },
      () => {
        if (this.currentTeacher.Id == this.selectedTeacher.Id)
          location.reload();
        this.selectedTeacher = null;
        this.alertService.success("מורה נשמר בהצלחה");

      }
    );

  }

  addTeacherToDB() {
    this.newTeacher.TeacherType = this.newTeacherType;

    this.apiService.saveModelWithRoute(this.newTeacher, "Teachers", "Save").subscribe(
      () => { },
      () => { this.alertService.error("שגיאה בשמירת נתונים"); },
      () => {

        this.newTeacherType = null;
        this.newTeacherUser = null;
        this.users = null;
        this.newUser = {};
        this.newTeacher = {}
        this.newTeacher.ClassAccess = [];
        this.selectedTeacher = null;
        this.getTeachers();
        this.getUsers();
        this.alertService.success("מורה נשמר בהצלחה");
      }
    );
  }

  addTeacher() {
    if (this.isNewUser) {
      this.apiService.addModel(this.newUser, "Users").subscribe(
        (data) => { this.newUser.Id = data; },
        (err) => { },
        () => {
          this.newTeacher.User = this.newUser;
          this.addTeacherToDB();
        }
      );
    }
    else {
      this.newTeacher.User = this.newTeacherUser;
      this.addTeacherToDB();
    }
  }

  deleteTeacher() {
    if (confirm("מחיקת מורה תמחק את כל הנתונים הקשורים לאותו מורה.\n האם את/ה בטוח/ה שברצונך למחוק?")) {
      this.selectedTeacher.TeacherType = this.selectedTeacherType;
      this.selectedTeacher.User = this.selectedTeacherUser;
      this.apiService.deleteModelById(this.selectedTeacher.Id, "Teachers").subscribe(
        () => { },
        () => { this.alertService.error("שגיאה בשמירת נתונים"); },
        () => {
          this.teachers = null;
          this.selectedTeacher = null;
          this.getTeachers();

          this.alertService.success("מורה נמחק בהצלחה");
        }
      );
    }
  }

  incomingfile(event) {
    this.file = event.target.files[0];
  }

  Upload() {
    let fileToUpload = <File>this.file;
    const formData = new FormData();
    formData.append('file', fileToUpload, fileToUpload.name);
    this.apiService.uploadFile(formData, "Teachers").subscribe(
      data => { console.log(data) },
      err => { },
      () => {
        this.teachers = null;
        this.getTeachers();
        this.alertService.success("מורים נוספו בהצלחה");
      }
    );
  }

}

