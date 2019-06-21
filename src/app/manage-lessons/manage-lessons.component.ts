import { Component, OnInit } from '@angular/core';
import { AlertService } from '../_services';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-manage-lessons',
  templateUrl: './manage-lessons.component.html',
  styleUrls: ['./manage-lessons.component.css']
})
export class ManageLessonsComponent implements OnInit {
  file: File;

  public lessons;
  public teachers;
  public lessonTypes;
  public manageType = "addItem";


  public selectedLesson;
  public selectedLessonTeacher;
  public selectedLessonLessonType;

  public newLesson: { [key: string]: any } = {};
  public newLessonTeacher;
  public newLessonLessonType;

  constructor(private apiService: ApiService,
    private alertService: AlertService) { }

  ngOnInit() {
    this.getLessons();
    this.getTeachers();
    this.getLessonsTypes();

    this.newLesson.HasEvaluation = true;
    this.newLesson.HasGrade = false;
  }


  onLessonChange(selectedLesson) {
    this.selectedLessonTeacher = this.teachers.filter(teacher => {
      return teacher.Id === selectedLesson.Teacher.Id;
    })[0];
    this.selectedLessonLessonType = this.lessonTypes.filter(lessonType => {
      return lessonType.Id === selectedLesson.LessonType.Id;
    })[0];
  }

  getLessons() {
    this.apiService.getController("Lessons").subscribe(
      data => {
        this.lessons = data;
        this.lessons.sort((a, b) => a.Name.localeCompare(b.Name));
      },
      err => console.error("Error Loading Lessons"),
      () => console.log('Done loading Lessons')
    );
  }


  getTeachers() {
    this.apiService.getController("Teachers").subscribe(
      data => {
        this.teachers = data;
        this.teachers.sort((a, b) => a.LastName.localeCompare(b.LastName));
        this.teachers.sort((a, b) => a.FirstName.localeCompare(b.FirstName));
      },
      err => console.error("Error Loading Teachers"),
      () => console.log('Done loading Teachers')
    );
  }


  getLessonsTypes() {
    this.apiService.getController("LessonTypes").subscribe(
      data => { this.lessonTypes = data },
      err => console.error("Error Loading LessonTypes"),
      () => console.log('Done loading LessonTypes')
    );
  }

  addLesson() {
    this.newLesson.Teacher = this.newLessonTeacher;
    this.newLesson.LessonType = this.newLessonLessonType;
    this.apiService.addModel(this.newLesson, "Lessons").subscribe(
      data => { },
      err => { this.alertService.error("שגיאה בשמירת נתונים"); },
      () => {
        this.lessons = null;
        this.newLessonTeacher = null;
        this.newLessonLessonType = null;
        this.newLesson = {}
        this.newLesson.HasEvaluation = true;
        this.newLesson.HasGrade = false;
        this.selectedLesson = null;
        this.getLessons();
        this.alertService.success("שיעור נשמר בהצלחה");
      }
    );
  }

  saveLesson() {
    this.selectedLesson.Teacher = this.selectedLessonTeacher;
    this.selectedLesson.LessonType = this.selectedLessonLessonType;
    this.apiService.addModel(this.selectedLesson, "Lessons").subscribe(
      data => { },
      err => { this.alertService.error("שגיאה בשמירת נתונים"); },
      () => {
        this.selectedLesson = null
        this.alertService.success("שיעור נוסף בהצלחה");
      }
    );
  }



  deleteLesson() {
    if (confirm("מחיקת שיעור תמחק את כל הנתונים הקשורים לאותו שיעור.\n האם את/ה בטוח/ה שברצונך למחוק?")) {
      this.selectedLesson.Teacher = this.selectedLessonTeacher;
      this.selectedLesson.LessonType = this.selectedLessonLessonType;
      this.apiService.deleteModelById(this.selectedLesson.Id, "Lessons").subscribe(
        data => { },
        err => { this.alertService.error("שגיאה בשמירת נתונים"); },
        () => {
          this.selectedLesson = null
          this.alertService.success("שיעור נמחק בהצלחה");
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
    this.apiService.uploadFile(formData, "Lessons").subscribe(
      data => { console.log(data) },
      err => { },
      () => {
        this.lessons = null;
        this.getLessons();
        this.alertService.success("שיעורים נוספו בהצלחה");
      }
    );
  }

}
