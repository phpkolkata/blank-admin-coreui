import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { take } from 'rxjs/operators';
import { environment } from '../../../environments/environment';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class BillingService {
  private subjectInvoice = new Subject<any>();

  public generateBillBySubject(id: number) {
    this.subjectInvoice.next({ billId: id });
  }
  public getBillSubject() {
    return this.subjectInvoice.asObservable();
  }

  constructor(private http: HttpClient) {}
  createPatientBill(data: any, url: string) {
    return this.http.post(`${environment.API_URL}${url}`, data).pipe(take(1));
  }

  fetchBillData(url) {
    return this.http
      .get(`${environment.API_URL}${url}`, {
        headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
      })
      .pipe(take(1));
  }
}
