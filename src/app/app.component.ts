import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { debounceTime } from 'rxjs/operators';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})


export class AppComponent {


  title = 'ids-elementary-management-system';
  public isLoggedIn:boolean;

  constructor(private router:Router) { }
  
  ngOnInit() {
    //this.router.navigate(["login"]);
    this.isLoggedIn = localStorage["loggedIn"] =="true"
    //this.isLoggedIn = false


     
  }
 
  receiveLoggedIn($event)
  {
    this.isLoggedIn = $event;
  }


}
