import { AlertService } from './../../../global/services/alert.service';
import { SharedService } from './../../../global/services/shared.service';
import { ActivatedRoute, Router } from '@angular/router';

import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-select-canter-open',
  templateUrl: 'select-center.component.html',
  styleUrls: ['select-center.component.scss'],
})
export class SelectCenter implements OnInit {
    constructor(private route: ActivatedRoute, private srvShared: SharedService, private router: Router, private srvAlert: AlertService) {
    }
    code = "";
    ngOnInit() {
      let code = this.route.snapshot.params.code;
      if(code){
        this.code = code;
        setTimeout(()=>{
          document.getElementById("selectCenterSubmitBtn").click();
        },100)
      }
    }

    loading = false;
    checkCenter(frm){
      if(this.loading) return;
      this.loading = true;

      let center_code = frm.value.center_code;
      this.srvShared.post('select-center', {
        center_code,
      }).subscribe(res=>{
        this.loading = false;
        if(res['success']){
          window.sessionStorage.center_name = res['center_name'];
          window.sessionStorage.center_code = res['center_code'];
          window.sessionStorage.center_address = res['center_address'];
          window.sessionStorage.center_mobile = res['center_mobile'];
          this.router.navigateByUrl('service');
        }else{
          alert("You have entered wrong center code. Please try again.")
        }
      });
    }

}
