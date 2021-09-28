import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective, BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { SharedService } from '../../../global/services/shared.service';
import { AlertService } from '../../../global/services/alert.service';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-center',
  templateUrl: './manage-center.component.html',
  styleUrls: ['./manage-center.component.scss'],
})
export class ManageCenterComponent implements OnInit {
  title = 'Manage Center';
  localUrl = 'settings/center/';
  rowsFetched;
  loading: boolean;
  loader = false;
  offset = 0;
  cols = [];
  @ViewChild('modalAddEdit') modalAddEdit: ModalDirective;
  editId: number;
  email;
  name;
  center_name;
  center_city;
  center_mobile;
  center_address;
  billing_notes;
  welcome_message;
  sms_balance;
  send_welcome_message;
  send_bill_summary;

  password_reset_error = '';


  constructor(
    private srvShared: SharedService,
    private srvAlert: AlertService
  ) {}

  ngOnInit() {
    this.loader = true;
    this.editId = +localStorage.getItem('active_id');
    // fetch table records
    this.srvShared
      .fetchRecords(`${this.localUrl}fetch`, {
        offset: this.offset,
        filters: {
          id: { value: this.editId, matchMode: '=' },
        },
      })
      .subscribe(
        (res) => {
          if (res && res['success']) {
            this.rowsFetched = res['rows'][0];
            this.name = this.rowsFetched.name;
            this.email = this.rowsFetched.email;
            this.center_name = this.rowsFetched.center_name;
            this.center_city = this.rowsFetched.center_city;
            this.center_mobile = this.rowsFetched.center_mobile;
            this.center_address = this.rowsFetched.center_address;
            this.billing_notes = this.rowsFetched.billing_notes;
            this.welcome_message = this.rowsFetched.welcome_message;
            this.sms_balance = this.rowsFetched.sms_balance;
            this.send_welcome_message = this.rowsFetched.send_welcome_message == 'y'
            this.send_bill_summary = this.rowsFetched.send_bill_summary == 'y'
            

            this.loader = false;
          } else {
            this.loader = false;
          }
        },
        (error) => {
          this.loader = false;
          this.srvAlert.error();
        }
      );
  }
  resetPassword(frm: NgForm){
    if(this.loader) return;

    this.password_reset_error = ''
    let d = frm.value;
    if(d.new_password != d.retype_new_password){
      this.password_reset_error = "Retype password doesn't match new password";
      return;
    }

    this.loader = true;
    this.srvShared.post('dashboard/reset-password', d).subscribe((res) => {
      this.loader = false;
      if(res['success']){
        this.srvAlert.updateSuccess();
        frm.reset();
      }else{
        this.password_reset_error = 'Wrong current password';
      }
    });


  }
  onUpdate(frm: NgForm) {
    this.loader = true;
    const frmData = frm.value;
    frmData.send_welcome_message = this.send_welcome_message ? 'y' : 'n';
    frmData.send_bill_summary = this.send_bill_summary ? 'y' : 'n';
    this.srvShared
      .updateRecord(frmData, `${this.localUrl}update/` + this.editId)
      .subscribe((res) => {
        if (res && res['success']) {
          // update row with new db
          this.srvAlert.updateSuccess();
          this.loader = false;
        } else {
          this.srvAlert.error({ detail: res['error'] });
          this.loader = false;
        }
      });
  }
}
