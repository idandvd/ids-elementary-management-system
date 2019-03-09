import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';


@Component({
  selector: 'app-show-entire-data-base',
  templateUrl: './show-entire-data-base.component.html',
  styleUrls: ['./show-entire-data-base.component.css']
})
export class ShowEntireDataBaseComponent implements OnInit {

  title = 'ids-elementary-management-system';
  public controllersNames;
  public tables:any = {};
 
  constructor(private apiService: ApiService) { }
  ngOnInit() {
    this.getControllers();
  }
 
  getControllers() {
    this.apiService.getControllers().subscribe(
      data => { this.controllersNames = data},
      err => console.error(err),
      () => {this.fillControllers();console.log('done loading foods');}
    );
  }

  fillControllers()
  {
    for(let controller of this.controllersNames)
    {
      this.apiService.getController(controller.Name).subscribe(
        data => { this.tables[controller.Name] = data},
        err => console.error(controller.Name ),
        () => console.log('done loading foods')
      );
    }
  }

  genHTML(controllersName)
  {
    

    return "";

  }

}
