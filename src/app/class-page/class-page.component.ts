import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-class-page',
  templateUrl: './class-page.component.html',
  styleUrls: ['./class-page.component.css']
})
export class ClassPageComponent implements OnInit {

  public classId;
  public classScheduleTable;
  constructor(private apiService: ApiService) { }

  ngOnInit() {
    this.classId = 1;
    //this.getClassSchedule();
  }

  getClassSchedule() {
    this.apiService.getControllerById("ClassScheduleTable", this.classId).subscribe(
      data => { this.classScheduleTable = data },
      err => console.error(this.classId),
      () => console.log('done loading foods')
    );
  }

 



}
