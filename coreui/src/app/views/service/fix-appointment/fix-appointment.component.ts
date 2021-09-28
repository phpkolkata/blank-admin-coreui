import { SharedService } from '../../../global/services/shared.service';
import { ActivatedRoute } from '@angular/router';

import { Component } from '@angular/core';


@Component({
  selector: 'app-fix-appointment-open',
  templateUrl: 'fix-appointment.component.html',
  styleUrls: ['fix-appointment.component.scss'],
})
export class FixAppointment {
  doctors:any = [];
  constructor(private route: ActivatedRoute, private srvShared: SharedService) {
    srvShared.post('fetch-opd-doctors-open', {
      center_code: window.sessionStorage.center_code,
    }).subscribe(res=>{
      this.doctors = res;
    });
  }
  loading=false;
  submit(frm){
    if(this.loading) return;
      this.loading = true;

      let o = JSON.parse(JSON.stringify(frm.value));
      o['created_at'] = this.srvShared.dateFormat(new Date(), "yyyy-MM-dd HH:mm:ss");
      o['center_code'] = window.sessionStorage.center_code;
      this.srvShared.post('doctor-appointment-request-open', o).subscribe(res=>{
        this.loading = false;
        frm.reset();
        alert("Doctor appointment erquested successfully");
      });
  }


}
