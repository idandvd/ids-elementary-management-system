import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';  // replaces previous Http service
import { ApiService } from './api.service';   // our custom service, see below
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { DragDropModule } from '@angular/cdk/drag-drop';
import {
  MatIconModule
} from '@angular/material';

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
import { ManageClassesComponent } from './manage-classes/manage-classes.component';
import { ManageTeachersComponent } from './manage-teachers/manage-teachers.component';
import { ManageLessonsComponent } from './manage-lessons/manage-lessons.component'; 
import { JwtInterceptor, ErrorInterceptor } from './_helpers';
import { TeacherScheduleComponent } from './teacher-schedule/teacher-schedule.component';
import { ClassesPageComponent } from './classes-page/classes-page.component';
import { ManageStudentsComponent } from './manage-students/manage-students.component';
import { StudentsPageComponent } from './students-page/students-page.component';
import { StudentPageComponent } from './student-page/student-page.component';
import { GroupsPageComponent } from './groups-page/groups-page.component';
import { AddGroupPageComponent } from './add-group-page/add-group-page.component';
import { TeacherLessonsPageComponent } from './teacher-lessons-page/teacher-lessons-page.component';
import { LessonEvaluationPageComponent } from './lesson-evaluation-page/lesson-evaluation-page.component';



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
    ManageClassesComponent,
    ManageTeachersComponent,
    ManageLessonsComponent,
    TeacherScheduleComponent,
    ClassesPageComponent,
    ManageStudentsComponent,
    StudentsPageComponent,
    StudentPageComponent,
    GroupsPageComponent,
    AddGroupPageComponent,
    TeacherLessonsPageComponent,
    LessonEvaluationPageComponent,
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
    MatIconModule,
    // MatSelectModule,
    BrowserAnimationsModule,
    // MatAutocompleteModule
  ],
  providers: [ApiService,AlertService,
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },],
  bootstrap: [AppComponent]
})
export class AppModule { }
