import { Component, OnInit,Output,EventEmitter } from '@angular/core';
import { ApiService } from '../api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.css']
})
export class LoginFormComponent implements OnInit {

  public username;
  public password;
  public isLoggedIn:boolean;


  @Output() loggedInEvent = new EventEmitter<boolean>();

  constructor(private apiService: ApiService,
              private router: Router,) { }

  ngOnInit() {
    this.isLoggedIn = false;
  }

  login()
  {
    this.apiService.CheckUserExists(this.username,this.password).subscribe(
      data => { },
      err =>{console.log("err")},
      () => {this.loggedInEvent.emit(true);
             localStorage["loggedIn"] = true;
              this.router.navigate(["main"]);
      }
    );
  }
}
