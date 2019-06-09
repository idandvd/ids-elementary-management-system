import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService } from '../_services';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-manage-students',
  templateUrl: './manage-students.component.html',
  styleUrls: ['./manage-students.component.css']
})
export class ManageStudentsComponent implements OnInit {
  public classId;
  public class;
  public students;
  public classes;
  public mothers;
  public fathers;
  public manageType = "addItem";
  public file: File;


  public selectedStudent;
  public selectedClass;

  public selectedStudentMotherFromList;
  public selectedStudentSelectedMother: any;

  public selectedStudentFatherFromList;
  public selectedStudentSelectedFather: any;

  public newStudent: { [key: string]: any } = {};
  public newStudentMotherFromList;
  public newStudentFatherFromList;



  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private route: ActivatedRoute
  ) { }


  ngOnInit() {

    this.selectedStudentMotherFromList = true;
    this.selectedStudentFatherFromList = true;
    this.newStudentMotherFromList = true;
    this.newStudentFatherFromList = true;
    this.newStudent.Father = {};
    this.newStudent.Mother = {};

    // this.classId = this.route.snapshot.paramMap.get('classId');
    this.route.params.subscribe(routeParams => {
      this.classId = routeParams.classId;
      this.getStudents();
    });

    this.getClasses();
    this.getParents();


  }

  getClasses() {
    this.apiService.getController("Classes").subscribe(
      data => {
      this.classes = data;
        this.class = (<Array<any>>data).filter(cls => cls.Id == this.classId)[0]
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
  onStudentChange(selectedStudent) {
    this.selectedClass = this.classes.filter(cls => {
      return cls.Id === selectedStudent.Class.Id;
    })[0];
    this.selectedStudentSelectedMother = this.mothers.filter(mother => {
      return mother.Id === selectedStudent.Mother.Id;
    })[0];
    this.selectedStudentSelectedFather = this.fathers.filter(father => {
      return father.Id === selectedStudent.Father.Id;
    })[0];
  }
  addStudent() {
    // this.newStudent.Mother = this.getNewMother();
    // this.newStudent.Father = this.getNewFather();
    if (this.classId != 0)
      this.newStudent.Class = this.class;
    this.apiService.addModel(this.newStudent, "Students").subscribe(
      data => { },
      err => { console.error("Students err"); this.alertService.error("שגיאה בהוספת תלמיד"); },
      () => { this.alertService.success("תלמיד נוסף בהצלחה"); }
    );
  }

  saveStudent() {

    this.selectedStudent.Mother = this.selectedStudentSelectedMother;
    this.selectedStudent.Father = this.selectedStudentSelectedFather;
    this.selectedStudent.Class = this.selectedClass;
    this.apiService.addModel(this.selectedStudent, "Students").subscribe(
      data => { },
      err => { console.error("Students err"); this.alertService.error("שגיאה בשמירת תלמיד"); },
      () => {
        this.alertService.success("תלמיד נשמר בהצלחה");
        this.students = null;
        this.selectedStudent = null;
        this.getStudents();
      }
    );
  }

  deleteStudent() {
    if (confirm("מחיקת תלמיד תמחק את כל הנתונים הקשורים לאותו תלמיד.\n האם את/ה בטוח/ה שברצונך למחוק?")) {
      this.apiService.deleteModel(this.selectedStudent.Id, "Teachers").subscribe(
        () => { },
        () => { this.alertService.error("שגיאה בשמירת נתונים"); },
        () => {
          this.students = null;
          this.selectedStudent = null;
          this.getStudents();

          this.alertService.success("תלמיד נמחק בהצלחה");
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
    this.apiService.uploadFile(formData,"Students").subscribe(
      data => { console.log(data) },
      err => { },
      () => { this.alertService.success("תלמידים נוספו בהצלחה"); }
    );
  }
}
