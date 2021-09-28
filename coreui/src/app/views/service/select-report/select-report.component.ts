import { SharedService } from '../../../global/services/shared.service';
import { ActivatedRoute, Router } from '@angular/router';

import { Component } from '@angular/core';

@Component({
  selector: 'app-select-report-open',
  templateUrl: 'select-report.component.html',
  styleUrls: ['select-report.component.scss'],
})
export class SelectReport {
    file: any = null;
    constructor(private route: ActivatedRoute, private srvShared: SharedService, private router: Router) {
    }
    loading = false;
    submit(frm){
      if(this.loading) return;
      this.loading = true;

      let o = JSON.parse(JSON.stringify(frm.value));
      if(this.file) o.file = this.file;
      o['center_code'] = window.sessionStorage.center_code;
      
      this.srvShared.upload('fetch-patient-bill-by-number-open', o, (err, res)=>{
        this.loading = false;
        frm.reset();
        if(res.success){
          this.router.navigateByUrl('print-report/'+res.data);
        }
      }, f=>{

      });
    }
    onFileChange(event){
      let files = event.target.files;
      this.file = null;
      if(files.length){
        this.file = files[0];
      }
    }


}
