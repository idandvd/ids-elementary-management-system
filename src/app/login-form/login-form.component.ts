import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { ApiService } from '../api.service';
import { Router, ActivatedRoute } from '@angular/router';
import { AuthenticationService, AlertService } from '../_services';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.css']
})
export class LoginFormComponent implements OnInit {

  public username;
  public password;
  public isLoggedIn: boolean;
  returnUrl: string;


  @Output() loggedInEvent = new EventEmitter<boolean>();

  constructor(private apiService: ApiService,
    private route: ActivatedRoute,
    private alertService: AlertService,

    private router: Router,
    private authenticationService: AuthenticationService) { }

  ngOnInit() {
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';

  }

  login() {
    this.authenticationService.login(this.username, this.password)
      .pipe(first())
      .subscribe(
        data => {
          console.log(this.returnUrl); console.log(data);
          this.router.navigate([this.returnUrl]);
        },
        error => {
          console.log("wrong login");
          this.alertService.error("שגיאה בכניסה");
        },
        () => {
          this.loggedInEvent.emit(true);
        }
      );

    return;
    this.apiService.CheckUserExists(this.username, this.password).subscribe(
      data => { },
      err => { console.log("err") },
      () => {
        this.loggedInEvent.emit(true);
        localStorage["loggedIn"] = true;
        this.router.navigate(["main"]);
      }
    );
  }
}
