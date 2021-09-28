import { Component, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { ModelServiceCharge } from '../../shared/models/service-charge.model';
import {
  BsModalService,
  BsModalRef,
  ModalDirective,
} from 'ngx-bootstrap/modal';
import { DelConfirmComponent } from '../../shared/pop-modals/del-confirm/del-confirm.component';
import { SharedService } from '../../../global/services/shared.service';
import { NgForm } from '@angular/forms';
import { CommonClass } from '../../../global/common.class';
import { AlertService } from '../../../global/services/alert.service';

@Component({
  selector: 'app-service-charge',
  templateUrl: './service-charge.component.html',
  styleUrls: ['./service-charge.component.css'],
  encapsulation: ViewEncapsulation.None,
})
export class ServiceChargeComponent implements OnInit {
  title = 'Service Charges';
  localUrl = 'settings/service-charge/';
  rowsFetched: ModelServiceCharge[];
  database: ModelServiceCharge[];
  totalRecords: number;
  loading: boolean;
  loader = false;
  limit = 10;
  offset = 0;
  cols = [];
  @ViewChild('modalAddEdit') modalAddEdit: ModalDirective;
  bsModalRef: BsModalRef;
  editMode = false;
  editId: number;
  staticPaymentStyle;
  pageRange = [10, 50, 100, 500];

  constructor(
    private modalService: BsModalService,
    private srvShared: SharedService,
    private srvAlert: AlertService
  ) {
    this.limit = srvShared.limit;
    this.staticPaymentStyle = CommonClass.paymentStyle;
    this.pageRange = CommonClass.pageRange;
  }

  ngOnInit() {
    this.loader = true;
    this.cols = [
      { field: 'id', header: 'Id', filterMatchMode: '=' },
      { field: 'name', header: 'Name', filterMatchMode: 'like' },
      {
        field: 'payment_style',
        header: 'Payment Style',
        filterMatchMode: 'like',
      },
      { field: 'amount', header: 'Amount', filterMatchMode: 'lessthan' },
    ];
    // fetch table records
    this.srvShared
      .fetchRecords(`${this.localUrl}fetch`, {
        limit: this.limit,
        offset: this.offset,
      })
      .subscribe(
        (res: ModelServiceCharge[]) => {
          if (res && res['success']) {
            this.rowsFetched = res['rows'];
            this.database = this.rowsFetched.slice();
            this.totalRecords = res['totalRecords'];
          } else {
            this.loader = false;
            this.srvAlert.error({ detail: res['error'] });
          }
        },
        (error) => {
          this.loader = false;
          this.srvAlert.error();
        }
      );
  }

  openDeleteModal(id: number) {
    const initialState = {
      title: 'Delete Confirmation',
      subTitle: `Record id: ${id}`,
      body: `You are about to delete this record, Are you sure?`,
      delId: id,
      delUrl: `${this.localUrl}delete/${id}`,
    };
    this.bsModalRef = this.modalService.show(DelConfirmComponent, {
      initialState,
    });
    this.bsModalRef.content.delSubject.subscribe((res) => {
      if (res) {
        this.database = this.database.filter((arr) => {
          return +arr.id !== id;
        });
        this.totalRecords = this.database.length;
        this.srvAlert.deleteSuccess();
      } else {
        this.srvAlert.error({ detail: res['error'] });
        // error deleting record
      }
    });
  }

  loadRowsLazy(event: Event) {
    // console.log(event);
    this.loader = true;
    let sort = {
      sortBy: 'id',
      sortType: -1,
    };
    const sortConfig =
      event['multiSortMeta'] !== undefined ? event['multiSortMeta'][0] : null;
    if (sortConfig !== null) {
      sort = {
        sortBy: sortConfig.field,
        sortType: sortConfig.order,
      };
    }
    // console.log(event);
    this.srvShared
      .fetchRecords(`${this.localUrl}fetch`, {
        limit: event['rows'],
        offset: event['first'],
        sort,
        filters: event['filters'],
      })
      .subscribe(
        (res: ModelServiceCharge[]) => {
          if (res && res['success']) {
            this.rowsFetched = res['rows'];
            this.totalRecords = res['totalRecords'];
            this.database = this.rowsFetched.slice();
            this.loader = false;
          } else {
            this.loader = false;
            this.srvAlert.error({ detail: res['error'] });
          }
        },
        (error) => {
          this.loader = false;
          this.srvAlert.error();
        }
      );
  }

  updateForm(frm: NgForm, oldData: any) {
    frm.control.patchValue(oldData);
    this.editId = oldData.id;
  }

  onAddEdit(frm: NgForm) {
    this.loader = true;
    const frmData = frm.value;
    if (this.editMode) {
      this.srvShared
        .updateRecord(frmData, `${this.localUrl}update/` + this.editId)
        .subscribe(
          (res) => {
            if (res && res['success']) {
              this.database = [];
              this.rowsFetched = this.rowsFetched.filter((arr) => {
                if (+arr.id !== this.editId) {
                  this.database.push(arr);
                  return arr;
                } else {
                  const newArr = { id: arr.id, ...frmData };
                  this.database.push(newArr);
                  return newArr;
                }
              });
              frm.reset();
              this.modalAddEdit.hide();
              // update row with new db
              this.rowsFetched = this.database;
              this.srvAlert.updateSuccess();
              this.loader = false;
            } else {
              this.loader = false;
              this.srvAlert.error({ detail: res['error'] });
            }
          },
          (error) => {
            this.loader = false;
            this.srvAlert.error();
          }
        );
    } else {
      this.srvShared
        .addRecord(frmData, `${this.localUrl}add`)
        .subscribe((res) => {
          if (res && res['insertedId'] > 0) {
            this.srvAlert.updateSuccess();
            this.rowsFetched.unshift({ id: res['insertedId'], ...frmData });
            this.database = this.rowsFetched.slice();
            this.totalRecords = res['totalRecords'];
            frm.reset();
            this.modalAddEdit.hide();
            this.loader = false;
          } else {
            this.srvAlert.error({ detail: res['error'] });
            this.loader = false;
          }
        });
      // this.database.reverse();
    }
  }

  captureScreen() {
    this.srvShared.captureScreen();
  }

  exportPdf() {
    this.srvShared.exportPdf(
      this.cols,
      this.database,
      'service-charge',
      'Service Charges'
    );
  }
}
