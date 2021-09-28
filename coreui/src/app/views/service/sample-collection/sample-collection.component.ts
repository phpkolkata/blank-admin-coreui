import { SharedService } from '../../../global/services/shared.service';
import { ActivatedRoute } from '@angular/router';

import { Component } from '@angular/core';

@Component({
  selector: 'app-sample-collection-open',
  templateUrl: 'sample-collection.component.html',
  styleUrls: ['sample-collection.component.scss'],
})
export class SampleCollection {
    file: any = null;
    constructor(private route: ActivatedRoute, private srvShared: SharedService) {
    }
    loading = false;
    submit(frm){
      if(this.loading) return;
      this.loading = true;

      let o = JSON.parse(JSON.stringify(frm.value));
      if(this.file) o.file = this.file;
      o['created_at'] = this.srvShared.dateFormat(new Date(), "yyyy-MM-dd HH:mm:ss");
      o['center_code'] = window.sessionStorage.center_code;
      
      console.log(o);
      this.srvShared.upload('request-sample-collection-open', o, (err, res)=>{
        this.loading = false;
        console.log(res);
        frm.reset();
        alert("Sample collection request submitted successfully");
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
