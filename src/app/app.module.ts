import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';  // replaces previous Http service
import { ApiService } from './api.service';   // our custom service, see below
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { DragDropModule } from '@angular/cdk/drag-drop';

// import {MatSelectModule} from '@angular/material/select';
// import {MatAutocompleteModule} from '@angular/material/autocomplete';
import {AutocompleteLibModule} from 'angular-ng-autocomplete';
import {MatAutocompleteModule,MatInputModule} from '@angular/material';

import { AlertComponent } from './_directives/index';
import { AlertService } from './_services/index';

import { AppComponent } from './app.component';
import { AddTeacherTypeFormComponent } from './add-teacher-type-form/add-teacher-type-form.component';
import { AppRoutingModule, routingComponents } from './app-routing.module';
import { NavigationBarComponent } from './navigation-bar/navigation-bar.component';
import { ClassPageComponent } from './class-page/class-page.component';
import { AddLessonFormComponent } from './add-lesson-form/add-lesson-form.component';
import { AddStudentFormComponent } from './add-student-form/add-student-form.component';
import { EditStudentFormComponent } from './edit-student-form/edit-student-form.component'; 



@NgModule({
  declarations: [
    AppComponent,
    AddTeacherTypeFormComponent,
    routingComponents,
    NavigationBarComponent,
    ClassPageComponent,
    AddLessonFormComponent,
    AddStudentFormComponent,
    EditStudentFormComponent,
    AlertComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    AutocompleteLibModule,
    MatAutocompleteModule,
    MatInputModule,
    NgbModule,
    AppRoutingModule,
    DragDropModule,
    // MatSelectModule,
    BrowserAnimationsModule,
    // MatAutocompleteModule
  ],
  providers: [ApiService,AlertService],
  bootstrap: [AppComponent]
})
export class AppModule { }
