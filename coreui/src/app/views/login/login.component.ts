import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AuthService } from '../../global/services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: 'login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  isLoading = false;

  constructor(public srvAuth: AuthService, private router: Router) {}

  onLogin(frm: NgForm) {
    this.isLoading = true;
    this.srvAuth.makeLogin(frm.value).subscribe(
      (res) => {
        if (!res['success']) {
          this.srvAuth.errorMessage = res['error'];
          this.isLoading = false;
          // this.email = frm.controls.email.
        } else {
          localStorage.setItem('access_token', res['access_token']);
          localStorage.setItem('role', res['role']);
          localStorage.setItem('active_id', res['active_id']); // center admin id from respective db

          this.router.navigate(['/dashboard']);
          // this.isLoading = false;
        }
      },
      (error) => {
        this.isLoading = false;
        // console.log(error);
        this.srvAuth.errorMessage = 'something went wrong, please try again';
      }
    );
  }
}
