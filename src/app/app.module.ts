import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';  // replaces previous Http service
import { ApiService } from './api.service';   // our custom service, see below
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { AddTeacherTypeFormComponent } from './add-teacher-type-form/add-teacher-type-form.component';
import { ShowEntireDataBaseComponent } from './show-entire-data-base/show-entire-data-base.component';

@NgModule({
  declarations: [
    AppComponent,
    AddTeacherTypeFormComponent,
    ShowEntireDataBaseComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [ApiService], 
  bootstrap: [AppComponent]
})
export class AppModule { }
