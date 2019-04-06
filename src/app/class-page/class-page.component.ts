import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { CdkDragDrop, moveItemInArray, transferArrayItem } from '@angular/cdk/drag-drop';

declare function drag(ev:any):any;

@Component({
  selector: 'app-class-page',
  templateUrl: './class-page.component.html',
  styleUrls: ['./class-page.component.css']
})
export class ClassPageComponent implements OnInit {

  public classId;
  public classScheduleTable;
  public lessons;
  public lessons2;
  public lessons3;
  public isInEdit;
  constructor(private apiService: ApiService) { }

  ngOnInit() {
    this.classId = 1;
    this.isInEdit = false;
    this.getClassSchedule();
    this.editSchedule();
  }

  getClassSchedule() {
    this.apiService.getControllerById("ClassScheduleTable", this.classId).subscribe(
      data => { this.classScheduleTable = data; },
      err => console.error(this.classId),
      () => {console.log('done loading ClassScheduleTable');console.log(this.classScheduleTable) ;}
    );
  }
  editSchedule(){
    this.isInEdit = true;
    this.apiService.getController("Lessons").subscribe(
      data => { this.lessons = data },
      err => console.error(this.classId),
      () => console.log('done loading Lessons')
    );
    this.lessons2=[];
    this.lessons3=[];
    // this.apiService.getController("Lessons").subscribe(
    //   data => { this.lessons2 = data },
    //   err => console.error(this.classId),
    //   () => console.log('done loading Lessons')
    // );
  }
  saveSchedule(){
    this.isInEdit = false;
    this.lessons = null;
  }
  drop(event: CdkDragDrop<any[]>) {
    if (event.previousContainer === event.container) {
      moveItemInArray(event.container.data, event.previousIndex, event.currentIndex);
    } else {
      transferArrayItem(event.previousContainer.data,
                        event.container.data,
                        event.previousIndex,
                        event.currentIndex);
    }
  }
 



}
