import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';  // replaces previous Http service
import { ApiService } from './api.service';   // our custom service, see below
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import {MatSelectModule} from '@angular/material/select';



import { AppComponent } from './app.component';
import { AddTeacherTypeFormComponent } from './add-teacher-type-form/add-teacher-type-form.component';
import { AppRoutingModule, routingComponents } from './app-routing.module';
import { NavigationBarComponent } from './navigation-bar/navigation-bar.component';
import { ClassPageComponent } from './class-page/class-page.component';
import { AddLessonFormComponent } from './add-lesson-form/add-lesson-form.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'; 



@NgModule({
  declarations: [
    AppComponent,
    AddTeacherTypeFormComponent,
    routingComponents,
    NavigationBarComponent,
    ClassPageComponent,
    AddLessonFormComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    NgbModule,
    AppRoutingModule,
    MatSelectModule,
    BrowserAnimationsModule,
  ],
  providers: [ApiService],
  bootstrap: [AppComponent]
})
export class AppModule { }
