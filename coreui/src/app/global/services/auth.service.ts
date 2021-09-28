import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { take } from 'rxjs/operators';
import { Router } from '@angular/router';
// import jwt_decode from 'jwt-decode';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  public errorMessage: string = null;

  constructor(private http: HttpClient, private router: Router) {}
  makeLogin(frmData: { email: string; password: string }) {
    return this.http
      .post(`${environment.API_URL}auth/login`, frmData, {
        headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
      })
      .pipe(take(1));
  }

  getToken() {
    return localStorage.getItem('access_token');
  }

  parseJwt(token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(
      atob(base64)
        .split('')
        .map(function (c) {
          return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        })
        .join('')
    );
    return JSON.parse(jsonPayload);
  }
  getUser(){
    return this.parseJwt(this.getToken());
  }

  getRole() {
    // return localStorage.getItem('role');
    var decoded: { role: string } = this.parseJwt(this.getToken());
    return decoded.role.split(",");
  }
  getModules() {
    // return localStorage.getItem('role');
    var decoded: { modules: string } = this.parseJwt(this.getToken());
    return decoded.modules.split(",");
  }

  authToken() {
    const token = this.getToken();
    const data = { token: token };
    return this.http
      .post(`${environment.API_URL}auth/authenticate`, data, {
        headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
      })
      .pipe(take(1));
  }

  logout(msg?: string) {
    localStorage.removeItem('access_token');
    localStorage.removeItem('active_id');
    localStorage.removeItem('role');
    this.router.navigate(['/login']);
    this.errorMessage = 'Admin Logout Successful!';
    if (msg) {
      this.errorMessage = msg;
    }
  }
}
