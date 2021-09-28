import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { ModelPageConfig } from '../../front-desk-module/shared/models/page-config.model';
import { take } from 'rxjs/operators';
import { DatePipe } from '@angular/common';
// import * as jsPDF from 'jspdf';
import html2canvas from 'html2canvas';

import jsPDF from 'jspdf'
import autoTable from 'jspdf-autotable'

@Injectable({
  providedIn: 'root',
})
export class SharedService {
  public limit = 50; // Global limit for all pages
  constructor(private http: HttpClient, private datePipe: DatePipe) {}

  apiUrl(){
    return environment.API_URL;
  }
  fetchRecords(url: string, config?: ModelPageConfig) {
    if (config && config.sort === undefined) {
      const sort = { sortBy: 'id', sortType: -1 };
      config.sort = sort;
    }

    if (config && config.filters !== undefined) {
    }
    return this.http
      .post(
        `${environment.API_URL}${url}`,
        { config: config },
        { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) }
      )
      .pipe(take(1));
  }
  post(url, data){
    return this.http
      .post(
        `${environment.API_URL}${url}`,
        data,
        { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) }
      )
      .pipe(take(1));
  }
  get(url){
    return this.http
      .get(
        `${environment.API_URL}${url}`,
        { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) }
      )
      .pipe(take(1));
  }
  upload(path, data, cb, progress){
    let url = environment.API_URL+path;
    function displayProgress(event){
      var t = event.total;
      var u = event.loaded;
      var s = u/t;
      if(progress) progress(s);
    }
    if(window.XMLHttpRequestUpload && window.FormData){
      var fd = new FormData();
      for(var i in data){
        fd.append(i, data[i]);
      }
      if(progress) progress(0.01);
      var ajax = new XMLHttpRequest();
      ajax.upload.addEventListener("progress",displayProgress);
      ajax.addEventListener("progress",displayProgress);
      ajax.addEventListener("load", function(){
        if(ajax.readyState == 4 && ajax.status == 200){
          let o = ajax.responseText;
          try{
            o = JSON.parse(o);
          }catch(err){err;}
          cb(null, o);
        }else{
          cb(ajax);
        }
      });
      ajax.addEventListener("error", function(err){
        cb(err);
      });
      ajax.open("POST", url);
      ajax.setRequestHeader("Authorization", 'Bearer '+localStorage.getItem('access_token'));
      ajax.send(fd);
    }
  }
  countRecords(url: string, config) {
    return this.http
      .post(
        `${environment.API_URL}${url}`,
        { config: config },
        { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) }
      )
      .pipe(take(1));
  }

  deleteRecord(url: string) {
    return this.http.get(`${environment.API_URL}${url}`).pipe(take(1));
  }

  deleteExtraRecord(url: string, extra?: any) {
    return this.http
      .post(
        `${environment.API_URL}${url}`,
        { fields: extra },
        { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) }
      )
      .pipe(take(1));
  }

  addRecord(data, url: string) {
    return this.http.post(`${environment.API_URL}${url}`, data).pipe(take(1));
  }

  updateRecord(data: any, url: string) {
    return this.http.post(`${environment.API_URL}${url}`, data).pipe(take(1));
  }

  updateRecordByColumn(data: any, url: string) {
    return this.http.post(`${environment.API_URL}${url}`, data).pipe(take(1));
  }

  dateFormat(dt: any, format = 'dd-MM-yyyy') {
    return this.datePipe.transform(dt, format);
  }

  exportPdf(cols: any[], db: any[], filename: string, pdfTitle: string) {
    
    let heads = [];
    for(let h of cols){
      heads.push(h.header);
    }
    let rows = [];
    for(let row of db){
      let outRow = [];
      for(let item of cols){
        outRow.push(row[item.field]);
      }
      rows.push(outRow);
    }
    
    const doc = new jsPDF()
    
    doc.setFontSize(15);
    doc.setTextColor(40);
    doc.text(pdfTitle+":", 15, 10);

    autoTable(doc, {
      head: [heads],
      body: rows,
    })

    doc.setProperties({
      title: pdfTitle,
      subject: 'A Pdf Report',
    });
    const file = filename + '(' + this.dateFormat(new Date()) + ')' + '.pdf';
    doc.save(file);
    return;
    import('jspdf').then((res) => {
      import('jspdf-autotable').then((x) => {
        const doc = new res['default']();
        // const doc = new res['default'](0, 0);
        const rows = [];
        let rec = [];
        db.forEach((item) => {
          // tslint:disable-next-line: forin
          // for (const k in item) {
          //   rec.push(item[k]);
          // }
          cols.forEach((key) => {
            const k = key.field;
            rec.push(item[k]);
          });
          rows.push(rec);
          rec = [];
        });
        doc.setProperties({
          title: pdfTitle,
          subject: 'A Pdf Report',
        });
        // doc.autoTable(cols, rows, {
        //   theme: 'grid',
        //   // showHead: 'singlePage',
        //   // showFoot: 'everyPage',
        //   didDrawPage: (HookData) => {
        //     HookData.doc.text(pdfTitle, 15, 8);
        //   },
        // });
        const file =
          filename + '(' + this.dateFormat(new Date()) + ')' + '.pdf';

        doc.save(file);
      });
    });
  }

  captureScreen() {
    const data = document.body;
    html2canvas(data).then((canvas) => {
      // Few necessary setting options
      const imgWidth = 208;
      const pageHeight = 295;
      const imgHeight = (canvas.height * imgWidth) / canvas.width;
      const heightLeft = imgHeight;

      const contentDataURL = canvas.toDataURL('image/png');
      const pdf = new jsPDF('p', 'mm', 'a4'); // A4 size page of PDF
      const position = 0;
      pdf.addImage(contentDataURL, 'PNG', 0, position, imgWidth, imgHeight);
      const img = 'screen-capture' + this.dateFormat(new Date());
      pdf.save(img); // Generated PDF
    });
  }

  captureScreenById(elementId, filename) {
    const data = document.getElementById(elementId);
    html2canvas(data).then((canvas) => {
      // Few necessary setting options
      const imgWidth = 208;
      const pageHeight = 295;
      const imgHeight = (canvas.height * imgWidth) / canvas.width;
      const heightLeft = imgHeight;

      const contentDataURL = canvas.toDataURL('image/png');
      const pdf = new jsPDF('p', 'mm', 'a4'); // A4 size page of PDF
      const position = 0;
      pdf.addImage(contentDataURL, 'PNG', 0, position, imgWidth, imgHeight);
      // const img = 'invoice- ' + this.dateFormat(new Date());
      pdf.save(filename); // Generated PDF
    });
  }
}
