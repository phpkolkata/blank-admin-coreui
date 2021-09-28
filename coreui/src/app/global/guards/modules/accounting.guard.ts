import { Injectable } from '@angular/core';
import {
  CanActivate,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  UrlTree,
} from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../../services/auth.service';
import { map } from 'rxjs/operators';
import { CommonClass } from '../../common.class';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class AccountingModuleGuard implements CanActivate {
  constructor(private srvAuth: AuthService, private router: Router) {}

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ):
    | Observable<boolean | UrlTree>
    | Promise<boolean | UrlTree>
    | boolean
    | UrlTree {
    if (
      this.srvAuth.getModules().includes('accounting')
    ) {
      return true;
    } else {
      alert("Sorry, you haven't purchased this module. Please contact admin to purchase.");
      return false;
    }
  }
}
