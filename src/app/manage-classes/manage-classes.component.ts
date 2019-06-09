import { Component, OnInit } from '@angular/core';
import { AlertService } from '../_services';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-manage-classes',
  templateUrl: './manage-classes.component.html',
  styleUrls: ['./manage-classes.component.css']
})
export class ManageClassesComponent implements OnInit {

  public classes;
  public teachers;
  public teacherClassAccess;
  public teacherTypes;

  public selectedClass;
  public selectedEducator;

  constructor(private apiService: ApiService,
    private alertService: AlertService) { }

  ngOnInit() {
    this.getClasses();
    this.getTeachers();
    this.getTeacherClassAccess();
    this.getTeacherTypes();
  }

  onClassChange(selectedClass) {
    var possibleEducators = this.teacherClassAccess.filter(teacherClassAccess => {
      return teacherClassAccess.Class.Id === selectedClass.Id &&
        (teacherClassAccess.Teacher.TeacherType.Name === "מחנך" ||
          teacherClassAccess.Teacher.TeacherType.Name === "מחנכת")
    });
    if (possibleEducators.length > 0) {
      this.selectedEducator = this.teachers.filter(teacher => {
        // console.log(teacher);
        return teacher.Id === possibleEducators[0].Teacher.Id
      })[0];
    }
    else { this.selectedEducator = null; }
    console.log(this.selectedEducator);
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
      () => { console.log("Done loading Teachers"); }
    )
  }
  getTeacherClassAccess() {
    this.apiService.getController("TeacherClassAccess").subscribe(
      (data) => { this.teacherClassAccess = data; },
      (err) => { console.error("Error loading TeacherClassAccess"); },
      () => { console.log("Done loading ClassesTeachers"); }
    )
  }
  getTeacherTypes() {
    this.apiService.getController("TeacherTypes").subscribe(
      (data) => { this.teacherTypes = data; },
      (err) => { console.error("Error loading TeacherTypes"); },
      () => { console.log("Done loading TeacherTypes"); }
    )
  }
  saveClass() {

  }

}
