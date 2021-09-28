import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AuthService } from '../../global/services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-logout',
  templateUrl: 'logout.component.html',
})
export class LogoutComponent implements OnInit {
  isLoading = false;

  constructor(public srvAuth: AuthService, private router: Router) {

  }

  ngOnInit() {
    this.srvAuth.logout();
  }
}
