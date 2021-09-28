import { Injectable } from '@angular/core';
import { MessageService } from 'primeng/api';

@Injectable({
  providedIn: 'root'
})
export class AlertService {
  constructor(private srvMessage: MessageService) {}

  error(msg?: { summary?: string; detail?: string }) {
    this.srvMessage.add({
      severity: 'error',
      life: 2000,
      summary: msg && msg.summary ? msg.summary : 'Something went wrong',
      detail:
        msg && msg.detail
          ? msg.detail
          : 'please refresh the page, or try again later!'
    });
  }

  deleteSuccess() {
    this.srvMessage.add({
      severity: 'success',
      life: 1000,
      summary: 'Record Deleted!',
      detail: 'The record has been deleted successfully!'
    });
  }

  updateSuccess() {
    this.srvMessage.add({
      severity: 'success',
      life: 1000,
      summary: 'Record Updated!',
      detail: 'The record has been updated successfully!'
    });
  }

  addSuccess() {
    this.srvMessage.add({
      severity: 'success',
      life: 1000,
      summary: 'Record Added!',
      detail: 'The record has been added successfully!'
    });
  }

  customeAlert(severity: string, summary: string, detail: string) {
    this.srvMessage.add({
      severity: severity,
      life: 3000,
      summary: summary,
      detail: detail
    });
  }
}
