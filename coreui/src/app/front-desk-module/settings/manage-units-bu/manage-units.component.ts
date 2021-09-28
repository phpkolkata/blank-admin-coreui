import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ModalDirective, BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { SharedService } from '../../../global/services/shared.service';
import { AlertService } from '../../../global/services/alert.service';
import { CommonClass } from '../../../global/common.class';
import { DelConfirmComponent } from '../../shared/pop-modals/del-confirm/del-confirm.component';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-units',
  templateUrl: './manage-units.component.html',
  styleUrls: ['./manage-units.component.scss'],
})
export class ManageUnitsComponent implements OnInit {
  payment_style = 'percent';
  title = 'Test Units';
  localUrl = 'settings/test-units/';
  rowsFetched = [];
  database = [];
  totalRecords: number;
  loading: boolean;
  loader = false;
  limit = 10;
  offset = 0;
  cols = [];
  @ViewChild('modalAddEdit', { static: false }) modalAddEdit: ModalDirective;
  @ViewChild('pdfCdtontent', { static: false }) pdfContent: ElementRef;
  bsModalRef: BsModalRef;
  editMode = false;
  editId: number;
  pageRange = [10, 50, 100, 500];

  constructor(
    private modalService: BsModalService,
    private srvShared: SharedService,
    private srvAlert: AlertService
  ) {
    this.limit = srvShared.limit;
    this.pageRange = CommonClass.pageRange;
  }

  ngOnInit() {
    this.loader = true;
    this.cols = [
      { field: 'id', header: 'Id', filterMatchMode: '=' },
      { field: 'name', header: 'Unit Name', filterMatchMode: 'like' },
    ];
    // fetch table records
    this.srvShared
      .fetchRecords(`${this.localUrl}fetch`, {
        limit: this.limit,
        offset: this.offset,
      })
      .subscribe(
        (res) => {
          if (res && res['success']) {
            this.rowsFetched = res['rows'];
            this.database = this.rowsFetched.slice();
            this.totalRecords = res['totalRecords'];
            this.loader = false;
          } else {
            this.srvAlert.error({ detail: res['error'] });
            this.loader = false;
          }
        },
        (error) => {
          this.srvAlert.error();
          this.loader = false;
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
        this.loader = false;
      } else {
        this.srvAlert.error({ detail: res['error'] });
        this.loader = false;
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
        (res) => {
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
            if (res['success']) {
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
              this.srvAlert.error({ detail: res['error'] });
              this.loader = false;
            }
          },
          (error) => {
            this.srvAlert.error();
            this.loader = false;
          }
        );
    } else {
      this.srvShared
        .addRecord(frmData, `${this.localUrl}add`)
        .subscribe((res) => {
          if (res && res['insertedId'] > 0) {
            this.rowsFetched.unshift({ id: res['insertedId'], ...frmData });
            this.database = this.rowsFetched.slice();
            this.totalRecords = res['totalRecords'];
            this.srvAlert.addSuccess();
            this.loader = false;
            frm.reset();
            this.modalAddEdit.hide();
          } else {
            this.srvAlert.error({ detail: res['error'] });
            this.loader = false;
          }
        });
      this.database.reverse();
    }
  }

  captureScreen() {
    this.srvShared.captureScreen();
  }

  exportPdf() {
    this.srvShared.exportPdf(
      this.cols,
      this.database,
      'pay-mode',
      'Payment Modes'
    );
  }
}
