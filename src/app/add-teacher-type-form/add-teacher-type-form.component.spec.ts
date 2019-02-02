import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddTeacherTypeFormComponent } from './add-teacher-type-form.component';

describe('AddTeacherTypeFormComponent', () => {
  let component: AddTeacherTypeFormComponent;
  let fixture: ComponentFixture<AddTeacherTypeFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddTeacherTypeFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddTeacherTypeFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
