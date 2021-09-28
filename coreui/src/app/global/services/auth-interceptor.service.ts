import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';
import {
  HttpInterceptor,
  HttpRequest,
  HttpHandler,
  HttpParams,
} from '@angular/common/http';

@Injectable()
export class AuthInterceptorService implements HttpInterceptor {
  constructor(private authService: AuthService) {}
  intercept(req: HttpRequest<any>, next: HttpHandler) {
    const token = this.authService.getToken();
    const modifiedReq = req.clone({
      params: new HttpParams().set('token', token),
    });
    return next.handle(modifiedReq);
  }
}
