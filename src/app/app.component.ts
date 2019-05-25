import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { debounceTime } from 'rxjs/operators';
import { AuthenticationService } from './_services';
import {  UserType, Teacher } from './_models';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})


export class AppComponent {

  currentTeacher: Teacher;

  title = 'ids-elementary-management-system';

  constructor(private router: Router,
    private authenticationService: AuthenticationService) {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);

  }

  ngOnInit() {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
    //this.router.navigate(["login"]);
    // this.isLoggedIn = localStorage["loggedIn"] == "true"
    //this.isLoggedIn = false
  }

  receiveLoggedIn($event) {
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
    // this.isLoggedIn = $event;
  }

  receiveLoggedOut($event) {
    this.authenticationService.logout();
    this.authenticationService.currentTeacher.subscribe(x => this.currentTeacher = x);
  }

  
  get isAdmin() {
    return this.currentTeacher && this.currentTeacher.User.UserType.Name === UserType.Admin;
  }

  logout() {
    this.authenticationService.logout();
    this.router.navigate(['login']);
    console.log("app logout");
  }

}
