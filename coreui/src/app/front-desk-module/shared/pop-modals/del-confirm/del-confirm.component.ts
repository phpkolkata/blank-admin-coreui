import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { SharedService } from '../../../../global/services/shared.service';
import { Subject } from 'rxjs';
import { take } from 'rxjs/operators';

@Component({
  selector: 'app-del-confirm',
  templateUrl: './del-confirm.component.html',
  styleUrls: ['./del-confirm.component.css'],
})
export class DelConfirmComponent {
  title: string;
  subTitle: string;
  body: string;
  delId: number;
  delUrl: string;

  public delSubject: Subject<boolean> = new Subject<boolean>();

  constructor(
    public bsModalRef: BsModalRef,
    private srvShared: SharedService
  ) {}
  onConfirm() {
    this.srvShared
      .deleteRecord(this.delUrl)
      .pipe(take(1))
      .subscribe((res) => {
        if (res['success']) {
          this.delSubject.next(true);
        } else {
          this.delSubject.next(false);
        }
      });
  }
}
