import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService } from '../_services';

@Component({
  selector: 'app-manage-teachers',
  templateUrl: './manage-teachers.component.html',
  styleUrls: ['./manage-teachers.component.css']
})
export class ManageTeachersComponent implements OnInit {

  public classes;
  public teachers;
  public teacherClassAccess;
  public teacherTypes;
  public users;

  public selectedTeacher;
  public selectedTeacherType;
  public selectedTeacherUser;
  public selectedTeacherClassAccesses;

  public newTeacher: { [key: string]: any } = {};
  public newTeacherType;
  public newTeacherUser;

  constructor(private apiService: ApiService,
    private alertService: AlertService) { }

  ngOnInit() {

    this.getClasses();
    this.getTeachers();
    this.getTeacherClassAccess();
    this.getTeacherTypes();
    this.getUsers();
  }

  hasTeacherGotAccessToClass(currentClass) {
    return this.teacherClassAccess.filter(teacherClassAccess => {
      return teacherClassAccess.Class.Id === currentClass.Id &&
        teacherClassAccess.Teacher.Id === this.selectedTeacher.Id;
    }).length > 0;
  }

  onTeacherChange(selectedTeacher) {
    this.selectedTeacherType = this.teacherTypes.filter(teacherType => {
      return teacherType.Id === selectedTeacher.TeacherType.Id;
    })[0];
    this.selectedTeacherUser = this.users.filter(user => {
      return user.Id === selectedTeacher.User.Id;
    })[0];



    let arr: Array<{ class: any, hasAccess: any }> = [];

    for (let currentClass of this.classes) {
      arr.push({
        class: currentClass,
        hasAccess:
          (this.teacherClassAccess.filter(teacherClassAccess => {
            return teacherClassAccess.Class.Id === currentClass.Id &&
              teacherClassAccess.Teacher.Id === this.selectedTeacher.Id;
          }).length > 0)
      });
    }
    this.selectedTeacherClassAccesses = arr;
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
      (data) => { this.teachers = data; },
      (err) => { console.error("Error loading Teachers"); },
      () => { console.log("Done loading Teachers"); console.log(this.teachers);}
    )
  }
  getTeacherClassAccess() {
    this.apiService.getController("TeacherClassAccess").subscribe(
      (data) => { this.teacherClassAccess = data; },
      (err) => { console.error("Error loading TeacherClassAccess"); },
      () => { console.log("Done loading ClassesTeachers"); console.log(this.teacherClassAccess); }
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

  saveTeacher() {
    this.selectedTeacher.TeacherType = this.selectedTeacherType;
    this.selectedTeacher.User = this.selectedTeacherUser;
    this.apiService.addModel(this.selectedTeacher, "Teachers").subscribe(
      () => { },
      () => { this.alertService.error("שגיאה בשמירת נתונים"); },
      () => {
        this.selectedTeacher = null;
        this.alertService.success("מורה נשמר בהצלחה");
      }
    );
    let arr: Array<{ class: any, teacher: any }> = [];
    for(let teacherClassAccess of this.selectedTeacherClassAccesses)
    {
      if(teacherClassAccess.hasAccess)
        arr.push({class:teacherClassAccess.class,teacher:this.selectedTeacher});
    }
    this.apiService.saveTeacherClassAccesses(this.selectedTeacherClassAccesses).subscribe(
      () => { },
      () => this.alertService.error("שגיאה בשמירת נתונים"),
      () => this.alertService.success("גישה נשמר בהצלחה")
    )

  }
  addTeacher() {
    this.newTeacher.TeacherType = this.newTeacherType;
    this.newTeacher.User = this.newTeacherUser;
    this.apiService.addModel(this.newTeacher, "Teachers").subscribe(
      () => { },
      () => { this.alertService.error("שגיאה בשמירת נתונים"); },
      () => {
        this.getTeachers();
        this.selectedTeacher = null;
        this.alertService.success("מורה נשמר בהצלחה");
      }
    );


  }
}

