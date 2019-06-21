import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Router } from '@angular/router';
import { Teacher, UserType } from '../_models';
import { AuthenticationService } from '../_services';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-navigation-bar',
  templateUrl: './navigation-bar.component.html',
  styleUrls: ['./navigation-bar.component.css']
})
export class NavigationBarComponent implements OnInit {
  UserType = UserType;
  @Output() loggedOutEvent = new EventEmitter<Boolean>();
  currentTeacher: Teacher;
  public classes;

  constructor(private router: Router,
    private apiService: ApiService,
    private authenticationService: AuthenticationService) {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
    // console.log(this.currentTeacher);
    this.getTeacherClasses();
  }

  getTeacherClasses() {
    this.apiService.getControllerByActionAndId("Teachers", "Class", this.currentTeacher.Id).subscribe(
      data => { this.classes = data;
        //  console.log(data) 
        },
      err => console.error(this.classes),
      () => { 
        // console.log('done loading Teachers Classes'); 
      }
    );
  }
  ngOnInit() {
  }

  logout() {
    console.log("nav logout before");
    localStorage.removeItem("currentUser")
    this.loggedOutEvent.emit(true);


    console.log("nav logout after");

  }

}
