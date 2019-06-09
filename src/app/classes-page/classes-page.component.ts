import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../_services';
import { Router } from '@angular/router';
import { ApiService } from '../api.service';
import { Teacher } from '../_models';

@Component({
  selector: 'app-classes-page',
  templateUrl: './classes-page.component.html',
  styleUrls: ['./classes-page.component.css']
})
export class ClassesPageComponent implements OnInit {
  public currentTeacher: Teacher;
  public classes;

  constructor(private router: Router,
    private apiService: ApiService,
    private authenticationService: AuthenticationService) {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
    this.getTeacherClasses();

  }

  ngOnInit() {
  }

  getTeacherClasses() {
    this.apiService.getControllerByActionAndId("Teachers", "Class", this.currentTeacher.Id).subscribe(
      data => {
        this.classes = data;
        this.classes.sort((a, b) => a.Number - b.Number);
        this.classes.sort((a, b) => a.Grade.Number - b.Grade.Number);

        console.log(data)
      },
      err => console.error(this.classes),
      () => { console.log('done loading Teachers Classes'); }
    );
  }
}
