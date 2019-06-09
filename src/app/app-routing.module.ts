import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginFormComponent } from './login-form/login-form.component';
import { ShowEntireDataBaseComponent } from './show-entire-data-base/show-entire-data-base.component';
import { ClassPageComponent } from './class-page/class-page.component';
import { AddLessonFormComponent } from './add-lesson-form/add-lesson-form.component';
import { AddTeacherTypeFormComponent } from './add-teacher-type-form/add-teacher-type-form.component';
import { AddStudentFormComponent } from './add-student-form/add-student-form.component';
import { EditStudentFormComponent } from './edit-student-form/edit-student-form.component';
import { ManageClassesComponent } from './manage-classes/manage-classes.component';
import { ManageTeachersComponent } from './manage-teachers/manage-teachers.component';
import { ManageLessonsComponent } from './manage-lessons/manage-lessons.component';
import { AuthGuard } from './_guards';
import { UserType } from './_models';
import { TeacherScheduleComponent } from './teacher-schedule/teacher-schedule.component';
import { ClassesPageComponent } from './classes-page/classes-page.component';
import { ManageStudentsComponent } from './manage-students/manage-students.component';

const routes: Routes = [
  //{ path: 'login', component: LoginFormComponent },
  { path: '', component: TeacherScheduleComponent},
  { path: 'main', component: ShowEntireDataBaseComponent },
  { path: 'ClassPage/:classId', component: ClassPageComponent, canActivate: [AuthGuard], data: { userType: [UserType.User,UserType.Admin] } },
  { path: 'ClassesPage', component: ClassesPageComponent, canActivate: [AuthGuard], data: { userType: [UserType.User,UserType.Admin] } },
  { path: 'AddLesson', component: AddLessonFormComponent },
  { path: 'AddTeacherType', component: AddTeacherTypeFormComponent },
  { path: 'AddStudent', component: AddStudentFormComponent },
  { path: 'EditStudent', component: EditStudentFormComponent },
  { path: 'ManageClasses', component: ManageClassesComponent, canActivate: [AuthGuard], data: { userType: [UserType.Admin] } },
  { path: 'ManageTeachers', component: ManageTeachersComponent, canActivate: [AuthGuard], data: { userType: [UserType.Admin] } },
  { path: 'ManageLessons', component: ManageLessonsComponent, canActivate: [AuthGuard], data: { userType: [UserType.Admin] } },
  { path: 'TeacherSchedule', component: TeacherScheduleComponent, canActivate: [AuthGuard] },
  { path: 'ManageStudents/:classId', component: ManageStudentsComponent, canActivate: [AuthGuard] },
  { path: '**', redirectTo: '' }
];

@NgModule({
  exports: [RouterModule],
  imports: [RouterModule.forRoot(routes)],
})
export class AppRoutingModule { }


export const routingComponents = [
  LoginFormComponent,
  ShowEntireDataBaseComponent,
  ClassPageComponent,
  AddLessonFormComponent,
  AddTeacherTypeFormComponent,
  AddStudentFormComponent,
  EditStudentFormComponent,
  ManageClassesComponent,
  ManageTeachersComponent,
  ManageLessonsComponent,

]