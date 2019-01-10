import { Component } from '@angular/core';
import {ApiService} from './api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})


export class AppComponent {
  title = 'ids-elementary-management-system';
  public foods;
 
  constructor(private apiService: ApiService) { }
  ngOnInit() {
    this.getFoods();
  }
 
  getFoods() {
    this.apiService.getFoods().subscribe(
      data => { this.foods = data},
      err => console.error(err),
      () => console.log('done loading foods')
    );
  }
}
