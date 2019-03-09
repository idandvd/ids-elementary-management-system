import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginFormComponent } from './login-form/login-form.component';
import { ShowEntireDataBaseComponent } from './show-entire-data-base/show-entire-data-base.component';
import { ClassPageComponent } from './class-page/class-page.component';
import { AddLessonFormComponent } from './add-lesson-form/add-lesson-form.component';
import { AddTeacherTypeFormComponent } from './add-teacher-type-form/add-teacher-type-form.component';

const routes: Routes = [
  { path: 'login', component: LoginFormComponent },
  { path: 'main', component: ShowEntireDataBaseComponent },
  { path: 'ClassPage', component: ClassPageComponent },
  { path: 'AddLesson', component: AddLessonFormComponent },
  { path: 'AddTeacherType', component: AddTeacherTypeFormComponent },
  
];

@NgModule({
  exports: [ RouterModule ],
  imports: [ RouterModule.forRoot(routes) ],
})
export class AppRoutingModule {}


export const routingComponents = [LoginFormComponent,
  ShowEntireDataBaseComponent]