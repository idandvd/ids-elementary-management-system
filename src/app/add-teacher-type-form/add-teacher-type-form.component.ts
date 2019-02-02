import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';


@Component({
  selector: 'app-add-teacher-type-form',
  templateUrl: './add-teacher-type-form.component.html',
  styleUrls: ['./add-teacher-type-form.component.css']
})
export class AddTeacherTypeFormComponent implements OnInit {

  public teacherTypeName;
  constructor(private apiService: ApiService) { }

  ngOnInit() {
  }

  addTeacher()
  {
    this.apiService.addTeacherType(this.teacherTypeName).subscribe(
      data => { },
      err => console.error(this.teacherTypeName),
      () => console.log('done loading foods')
    );
    
  }

}
