import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowEntireDataBaseComponent } from './show-entire-data-base.component';

describe('ShowEntireDataBaseComponent', () => {
  let component: ShowEntireDataBaseComponent;
  let fixture: ComponentFixture<ShowEntireDataBaseComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ShowEntireDataBaseComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ShowEntireDataBaseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
