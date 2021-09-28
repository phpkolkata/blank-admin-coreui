import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ModalDirective, BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ConfirmationService } from 'primeng/api';
import { Table } from 'primeng/table';
import { map } from 'rxjs/operators';
import { CommonClass } from '../../../global/common.class';
import { AlertService } from '../../../global/services/alert.service';
import { SharedService } from '../../../global/services/shared.service';
import { ModelCommissionGroupMaster } from '../../shared/models/commission-group-master.model';
import { ModelCommissionGroup } from '../../shared/models/commission-group.model';
import { ModelPageConfig } from '../../shared/models/page-config.model';
import { ModelTestGroup } from '../../shared/models/test-group.model';
import { DelConfirmComponent } from '../../shared/pop-modals/del-confirm/del-confirm.component';

@Component({
  selector: 'app-ag-commission-group-master',
  templateUrl: './ag-commission-group-master.component.html',
  styleUrls: ['./ag-commission-group-master.component.scss'],
})
export class AgCommissionGroupMasterComponent implements OnInit {
  title = 'Agent Commission Package';
  localUrl = 'agents/commission-group-master/';
  rowsFetched: ModelCommissionGroup[];
  database: ModelCommissionGroup[];
  totalRecords: number;
  loading: boolean;
  loader = false;
  limit = 10;
  offset = 0;
  cols = [];
  @ViewChild('modalAddEdit') modalAddEdit: ModalDirective;
  @ViewChild('modalAddGroup') modalAddGroup: ModalDirective;
  @ViewChild('dt') dt: Table;
  bsModalRef: BsModalRef;
  editMode = false;
  editId: number;
  dbGroups = [];
  selectedGroup = null;
  groupMasterName: string;
  groupPayStyle;
  groupAmount;
  selectedGroupId = 0;
  selectedGroupPivotId = 0;
  selectedGroupEditMode = false;
  staticPaymentStyle;

  pageRange = [10, 50, 100, 500];

  constructor(
    private modalService: BsModalService,
    private srvShared: SharedService,
    private srvAlert: AlertService,
    private confirmationService: ConfirmationService
  ) {
    this.limit = srvShared.limit;
    this.staticPaymentStyle = CommonClass.paymentStyle;
    this.pageRange = CommonClass.pageRange;
  }

  ngOnInit() {
    this.loader = true;
    this.cols = [
      { field: 'id', header: 'Id', filterMatchMode: '=' },
      {
        field: 'name',
        header: 'Group Master Name',
        filterMatchMode: 'like',
      },
    ];
    // fetch table records
    this.srvShared
      .fetchRecords(`${this.localUrl}fetch`, {
        limit: this.limit,
        offset: this.offset,
      })
      .subscribe(
        (res: ModelCommissionGroupMaster[]) => {
          if (res && res['success']) {
            this.rowsFetched = res['rows'];
            this.database = this.rowsFetched.slice();
            this.totalRecords = res['totalRecords'];
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

    // fetch groups
    this.fetchGroup();
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
    this.bsModalRef.content.delSubject.subscribe(
      (res) => {
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
      },
      (error) => {
        this.srvAlert.error();
      }
    );
  }

  loadRowsLazy(event: Event) {
    // tslint:disable-next-line: curly
    if (!event) return;
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
        (res: ModelTestGroup[]) => {
          if (res && res['success']) {
            this.rowsFetched = res['rows'];
            this.database = this.rowsFetched.slice();
            this.totalRecords = res['totalRecords'];
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
              this.srvAlert.error({ detail: res['error'] });
              this.loader = false;
            }
          },
          (error) => {
            this.srvAlert.error();
          }
        );
    } else {
      this.srvShared.addRecord(frmData, `${this.localUrl}add`).subscribe(
        (res) => {
          if (res && res['insertedId'] > 0) {
            this.rowsFetched.unshift({ id: res['insertedId'], ...frmData });
            this.database = this.rowsFetched.slice();
            this.totalRecords = res['totalRecords'];
            frm.reset();
            this.modalAddEdit.hide();
            this.loader = false;
            this.srvAlert.addSuccess();
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
      // this.database.reverse();
    }
  }

  onSaveGroup(frm: NgForm) {
    const paystyle = frm.controls['payment_style'].value;
    const amount = frm.controls['amount'].value;
    const data = {
      group_id: this.selectedGroupId,
      group_master_id: this.editId,
      payment_style: paystyle,
      amount: amount,
    };

    if (this.selectedGroupEditMode) {
      this.srvShared
        .updateRecord(
          data,
          `agents/master-group/update/${this.selectedGroupPivotId}`
        )
        .subscribe(
          (res) => {
            if (res && res['success']) {
              this.srvAlert.updateSuccess();
            } else {
              this.srvAlert.error({ detail: res['error'] });
            }
          },
          (error) => {
            this.srvAlert.error();
          }
        );
    } else {
      this.srvShared.addRecord(data, 'agents/master-group/add').subscribe(
        (res) => {
          if (res && res['success']) {
            this.srvAlert.updateSuccess();
          } else {
            this.srvAlert.error({ detail: res['error'] });
          }
        },
        (error) => {
          this.srvAlert.error();
        }
      );
    }
  }

  fetchGroup() {
    this.srvShared
      .fetchRecords('agents/commission-group/fetch', {})
      .pipe(
        map((res) => {
          if (res) {
            const rows = res['rows'];
            return rows;
          }
        })
      )
      .subscribe(
        (res) => {
          this.dbGroups = res;
        },
        (error) => {
          this.srvAlert.error();
        }
      );
  }

  onGroupClick(frm: NgForm) {
    this.selectedGroupId = this.selectedGroup['id'];
    const groupMasterId = this.editId;
    const config: ModelPageConfig = {
      filters: {
        group_master_id: {
          value: groupMasterId,
          matchMode: '=',
        },
        group_id: {
          value: this.selectedGroupId,
          matchMode: '=',
        },
      },
    };
    this.srvShared.fetchRecords('agents/master-group/fetch', config).subscribe(
      (res) => {
        if (res && res['success']) {
          if (res['rows'][0]) {
            this.selectedGroupEditMode = true;
            const row = res['rows'][0];
            frm.controls['payment_style'].setValue(row['payment_style']);
            frm.controls['amount'].setValue(row['amount']);
            this.selectedGroupPivotId = row['id'];
          } else {
            this.selectedGroupEditMode = false;
            frm.controls['payment_style'].setValue('');
            frm.controls['amount'].setValue('');
            this.selectedGroupPivotId = 0;
          }
        } else {
          this.srvAlert.error({ detail: res['error'] });
        }
        this.loader = false;
      },
      (error) => {
        this.loader = false;
        this.srvAlert.error();
      }
    );
  }

  captureScreen() {
    this.srvShared.captureScreen();
  }

  exportPdf() {
    this.srvShared.exportPdf(
      this.cols,
      this.database,
      'commission-group-master',
      'Commission Group Master'
    );
  }
}
