import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LessonEvaluationPageComponent } from './lesson-evaluation-page.component';

describe('LessonEvaluationPageComponent', () => {
  let component: LessonEvaluationPageComponent;
  let fixture: ComponentFixture<LessonEvaluationPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LessonEvaluationPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LessonEvaluationPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
