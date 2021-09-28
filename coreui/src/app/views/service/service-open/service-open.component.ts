import { SharedService } from '../../../global/services/shared.service';
import { ActivatedRoute, Router } from '@angular/router';

import { Component } from '@angular/core';


@Component({
  selector: 'app-service-open',
  templateUrl: 'service-open.component.html',
  styleUrls: ['service-open.component.scss'],
})
export class ServiceOpen {
    centerName = '';
    centerAddress = '';
    centerMobile = '';
    constructor(private route: ActivatedRoute, private srvShared: SharedService, private router: Router) {
      if(!window.sessionStorage.center_code){
        this.router.navigateByUrl('select-center');
      }
      this.centerName = window.sessionStorage.center_name;
      this.centerAddress = window.sessionStorage.center_address;
      this.centerMobile = window.sessionStorage.center_mobile;
    }


}
