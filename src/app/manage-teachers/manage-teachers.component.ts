import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService } from '../_services';

@Component({
  selector: 'app-manage-teachers',
  templateUrl: './manage-teachers.component.html',
  styleUrls: ['./manage-teachers.component.css']
})
export class ManageTeachersComponent implements OnInit {

  file: File;

  public classes;
  public teachers;
  public teacherTypes;
  public users;

  public selectedTeacher;
  public selectedTeacherType;
  public selectedTeacherUser;

  public newTeacher: { [key: string]: any } = {};
  public newTeacherType;
  public newTeacherUser;

  constructor(private apiService: ApiService,
    private alertService: AlertService) { }

  ngOnInit() {

    this.newTeacher.ClassAccess = [];
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

  getClasses() {
    this.apiService.getController("Classes").subscribe(
      (data) => { this.classes = data; },
      (err) => { console.error("Error loading Classes"); },
      () => { console.log("Done loading Classes"); }
    )
  }
  getTeachers() {
    this.apiService.getController("Teachers").subscribe(
      (data) => { this.teachers = data;
                  this.teachers.sort((a,b) => a.LastName.localeCompare(b.LastName));
                  this.teachers.sort((a,b) => a.FirstName.localeCompare(b.FirstName));},
      (err) => { console.error("Error loading Teachers"); },
      () => { console.log("Done loading Teachers"); console.log(this.teachers); }
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
        this.selectedTeacher = null;
        this.alertService.success("מורה נשמר בהצלחה");
      }
    );

  }
  addTeacher() {
    this.newTeacher.TeacherType = this.newTeacherType;
    this.newTeacher.User = this.newTeacherUser;
    this.apiService.saveModelWithRoute(this.newTeacher, "Teachers", "Save").subscribe(
      () => { },
      () => { this.alertService.error("שגיאה בשמירת נתונים"); },
      () => {
        this.teachers = null;
        this.newTeacherType = null;
        this.newTeacherUser = null;
        this.newTeacher = {}
        this.newTeacher.ClassAccess = [];
        this.selectedTeacher = null;
        this.getTeachers();
        this.alertService.success("מורה נשמר בהצלחה");
      }
    );


  }

  incomingfile(event) {
    this.file = event.target.files[0];
  }

  Upload(files) {
    let fileToUpload = <File>this.file;
    const formData = new FormData();
    formData.append('file', fileToUpload, fileToUpload.name);
    this.apiService.uploadFile(formData,"Teachers").subscribe(
      data => { console.log(data) },
      err => { },
      () => { this.alertService.success("מורים נוספו בהצלחה");
              this.getTeachers(); }
    );
  }

}

