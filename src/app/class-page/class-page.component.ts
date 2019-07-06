import { Component, OnInit, HostListener } from '@angular/core';
import { ApiService } from '../api.service';
import { CdkDragDrop, CdkDropList, CdkDrag, moveItemInArray, transferArrayItem, } from '@angular/cdk/drag-drop';
import { ConnectedOverlayPositionChange } from '@angular/cdk/overlay';
import { AlertService, AuthenticationService } from '../_services';
import { Teacher } from '../_models';
import { ActivatedRoute, Router } from '@angular/router';
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
  public viewType = "limited";
  public groups;

  public listsCount = 0;

  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private authenticationService: AuthenticationService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  ngOnInit() {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
    this.classId = this.route.snapshot.paramMap.get('classId');
    this.getClassSchedule();

    this.isInEdit = false;

    //this.editSchedule();
  }

  gotoGroup(dayId, hourId) {
    if (!this.isInEdit) {
      let classId = this.classId;
      this.router.navigate(['/GroupsPage/', { classId, dayId, hourId }]);
    }
  }

  getClassSchedule() {
    this.apiService.getControllerById("ClassScheduleTable", this.classId).subscribe(
      data => {
        this.classScheduleTable = data;
        // this.classScheduleTable.HoursInDay
        
        this.getGroups();

      },
      err => console.error(this.classId),
      () => { console.log('done loading ClassScheduleTable'); console.log(this.classScheduleTable); }
    );
  }

  getGroups() {
    this.apiService.GetGroupsByClass(this.classId).subscribe(
      data => {
        this.groups = data;
        this.fillDragableLessons(this.classScheduleTable);
      },
      err => { console.error("Error loading Groups"); },
      () => { console.log("Done loading Groups");  }
    )
  }


  fillDragableLessons(data) {
    this.dragableLessons = {};
    this.lists = [];
    for (let day of data.Days) {
      this.dragableLessons[day.Id] = {};
      for (let hour of data.HoursInDay) {
        if (!hour.IsBreak) {
          this.lists.push('cdk-drop-list-' + this.listsCount);
          this.dragableLessons[day.Id][hour.Id] = [];

          if (data.ClassSchedule['Day' + day.Id + '$Hour' + hour.Id]) {
            this.dragableLessons[day.Id][hour.Id].push(data.ClassSchedule['Day' + day.Id + '$Hour' + hour.Id]);


          }
          else {
            this.dragableLessons[day.Id][hour.Id].push(null);

          }
          this.dragableLessons[day.Id][hour.Id].push(day.Id);
          this.dragableLessons[day.Id][hour.Id].push(hour.Id);
          this.hasConflict(this.dragableLessons[day.Id][hour.Id]);
          this.listsCount += 1;
        }
      }
    }
    this.lists.push('lessonsList');
    this.lists.push('trashList');
    this.listsCount += 2;


    for (let group of this.groups) {
      console.log(group);

      this.dragableLessons[group.Day.Id][group.Hour.Id].push(group);
    }

    console.log(this.lists);
  }

  fillClassSchedule() {
    for (let day of this.classScheduleTable.Days) {

      for (let hour of this.classScheduleTable.HoursInDay) {
        if (!hour.IsBreak) {
          if (this.dragableLessons[day.Id][hour.Id].length > 0 &&
            this.dragableLessons[day.Id][hour.Id][0]) {
            this.classScheduleTable.ClassSchedule['Day' + day.Id + '$Hour' + hour.Id] =
              this.dragableLessons[day.Id][hour.Id][0];
          }
          else {
            delete this.classScheduleTable.ClassSchedule['Day' + day.Id + '$Hour' + hour.Id]
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
    this.viewType = "limited";
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

  cancelEdit() {
    this.isInEdit = false;
    this.lessons = null;
    this.getClassSchedule();
    //this.fillClassSchedule();
  }

  saveSchedule() {
    this.isInEdit = false;
    this.lessons = null;

    console.log(this.dragableLessons);
    this.fillClassSchedule();
    this.apiService.saveClassSchecule(this.classScheduleTable)
      .subscribe(
        data => { },
        err => { this.alertService.error("שגיאה בשמירת מערכת") },
        () => {
          this.alertService.success("מערכת נשמרה בהצלחה");
        }
      );
    this.listsCount += 2;

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
      previousData[0] = event.container.data[0];
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
