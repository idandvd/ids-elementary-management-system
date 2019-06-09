import { Component, OnInit, HostListener } from '@angular/core';
import { ApiService } from '../api.service';
import { CdkDragDrop, CdkDropList, CdkDrag, moveItemInArray, transferArrayItem, } from '@angular/cdk/drag-drop';
import { ConnectedOverlayPositionChange } from '@angular/cdk/overlay';
import { AlertService, AuthenticationService } from '../_services';
import { Teacher } from '../_models';
import { ActivatedRoute } from '@angular/router';
import { switchMap } from 'rxjs/operators';

declare function drag(ev: any): any;

@Component({
  selector: 'app-class-page',
  templateUrl: './class-page.component.html',
  styleUrls: ['./class-page.component.css']
})
export class ClassPageComponent implements OnInit {

  public currentTeacher: Teacher;

  public classId;
  public classScheduleTable;
  public dragableLessons;
  public lists;
  public lessons;
  public filteredLessons;
  public FilterString;
  public isInEdit;
  public ctrlPressed = false;
  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService,
    private route: ActivatedRoute
    ) { }

  ngOnInit() {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
    this.classId = this.route.snapshot.paramMap.get('classId');
    this.getClassSchedule();

    this.isInEdit = false;
    //this.editSchedule();
  }




  getClassSchedule() {
    this.apiService.getControllerById("ClassScheduleTable", this.classId).subscribe(
      data => {
        this.classScheduleTable = data;
        this.fillDragableLessons(data);
      },
      err => console.error(this.classId),
      () => { console.log('done loading ClassScheduleTable'); console.log(this.classScheduleTable); }
    );

  }


  fillDragableLessons(data) {
    this.dragableLessons = {};
    this.lists = [];
    let listsCount = 0;
    for (let day of data.Days) {
      this.dragableLessons[day.Id] = {};
      for (let hour of data.HoursInDay) {
        if (!hour.IsBreak) {
          this.lists.push('cdk-drop-list-' + listsCount);
          this.dragableLessons[day.Id][hour.Id] = [];

          if (data.ClassSchedules['Day' + day.Id + '$Hour' + hour.Id]) {
            this.dragableLessons[day.Id][hour.Id].push(data.ClassSchedules['Day' + day.Id + '$Hour' + hour.Id]);


          }
          else {
            this.dragableLessons[day.Id][hour.Id].push(null);

          }
          this.dragableLessons[day.Id][hour.Id].push(day.Id);
          this.dragableLessons[day.Id][hour.Id].push(hour.Id);
          this.hasConflict(this.dragableLessons[day.Id][hour.Id]);
          listsCount += 1;
        }
      }
    }
    this.lists.push('lessonsList');
    this.lists.push('trashList');
    console.log(this.lists);
  }

  fillClassSchedule() {
    for (let day of this.classScheduleTable.Days) {

      for (let hour of this.classScheduleTable.HoursInDay) {
        if (!hour.IsBreak) {
          if (this.dragableLessons[day.Id][hour.Id].length > 0 &&
            this.dragableLessons[day.Id][hour.Id][0]) {
            this.classScheduleTable.ClassSchedules['Day' + day.Id + '$Hour' + hour.Id] =
              this.dragableLessons[day.Id][hour.Id][0];
          }
          else {
            delete this.classScheduleTable.ClassSchedules['Day' + day.Id + '$Hour' + hour.Id]
          }

        }
      }

    }
  }

  onFilterChange() {

    this.filteredLessons = this.lessons.filter(lesson => {
      return lesson.Name.includes(this.FilterString) ||
        lesson.Teacher.FirstName.includes(this.FilterString) ||
        lesson.Teacher.LastName.includes(this.FilterString) ||
        (lesson.Teacher.FirstName + " " + lesson.Teacher.LastName).includes(this.FilterString);
    })
  }

  editSchedule() {
    this.isInEdit = true;
    this.apiService.getController("Lessons").subscribe(
      data => {
        this.lessons = data;
        this.lessons = this.lessons.filter(lesson => {
          return lesson.LessonType.Name === "שיעור";
        });
        this.lessons.sort((a, b) => a.Teacher.FirstName.localeCompare(b.Teacher.FirstName));
        this.lessons.sort((a, b) => a.Name.localeCompare(b.Name));
        this.filteredLessons = this.lessons;
      },
      err => console.error(this.classId),
      () => console.log('done loading Lessons')
    );

  }
  saveSchedule() {
    this.isInEdit = false;
    this.lessons = null;

    console.log(this.dragableLessons);
    this.fillClassSchedule();
    this.apiService.saveClassSchecule(this.classScheduleTable)
      .subscribe(
        data => { this.alertService.success("מערכת נשמרה בהצלחה") },
        err => { this.alertService.error("שגיאה בשמירת מערכת") },
        () => { }
      );
  }
  cancel()
  {
    this.isInEdit = false;
    this.lessons = null;
    this.fillClassSchedule();
  }

  @HostListener('window:keyup', ['$event'])
  keyupEvent(event: KeyboardEvent) {
    if (event.keyCode == 17)
      this.ctrlPressed = false;

  }

  @HostListener('window:keydown', ['$event'])
  keydownEvent(event: KeyboardEvent) {
    if (event.keyCode == 17)
      this.ctrlPressed = true;
  }

  noMove() {
    return false;
  }

  hasConflict(classSchedule) {
    if (classSchedule[0] != null) {
      return this.apiService.HasConflict(classSchedule[1], classSchedule[2], classSchedule[0].Teacher.Id, this.classId).subscribe(
        (data) => { classSchedule[0].HasConflict = data; },
        () => { },
        () => { });
    }

    //console.log(teacherId);
  }
  drop(event: CdkDragDrop<any[]>) {

    let previousData = event.previousContainer.data;
    let nextData = event.container.data;
    if (this.ctrlPressed || event.previousContainer.id == "lessonsList") {
      let copy = Object.assign({}, previousData[event.previousIndex])
      nextData[0] = (copy);
      console.log(nextData);

      this.hasConflict(nextData);

      return;
    }
    if (event.container.id == "trashList") {
      previousData[0] = null;
      return;
    }
    if (event.container.data.length >= 1) {
      let temp = previousData[0]
      previousData[0] = event.container.data[event.currentIndex];
      nextData[0] = temp;
      console.log(nextData);

      this.hasConflict(nextData);
      return;
    }
    if (event.previousContainer === event.container) {
      //moveItemInArray(nextData, event.previousIndex, event.currentIndex);
    } else {
      transferArrayItem(previousData,
        nextData,
        event.previousIndex,
        event.currentIndex);
    }

    console.log(event);
    console.log(event.previousContainer === event.container);
  }
}
