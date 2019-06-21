import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { AlertService } from '../_services';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-groups-page',
  templateUrl: './groups-page.component.html',
  styleUrls: ['./groups-page.component.css']
})
export class GroupsPageComponent implements OnInit {

  public classId;
  public dayId;
  public hourId;
  public groups;

  constructor(private apiService: ApiService,
    private alertService: AlertService,
    private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.params.subscribe(routeParams => {
      this.classId = routeParams.classId;
      this.dayId = routeParams.dayId;
      this.hourId = routeParams.hourId;
      this.getGroups();
    });
  }

  getGroups() {
    this.apiService.GetGroups(this.classId, this.dayId, this.hourId).subscribe(
      data => { this.groups = data; },
      err => { console.error("Error loading Groups"); },
      () => { console.log("Done loading Groups");console.log(this.groups);  }
    )
  }

  deleteGroup(group)
  {
    if (confirm("מחיקת קבוצה תמחק את כל הנתונים הקשורים לאותו קבוצה.\n האם את/ה בטוח/ה שברצונך למחוק?")) {
      this.apiService.deleteModel(group,"Groups").subscribe(
        ()=>{},
        ()=>{console.error("Error deleting Group");},
        ()=>{this.alertService.success("קבוצה נמחקה בהצלחה"); this.groups.splice(this.groups.indexOf(group),1)}
      )
    }
  }

}
