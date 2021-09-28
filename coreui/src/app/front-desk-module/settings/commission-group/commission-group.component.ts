import { Component, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { ModelCommissionGroup } from '../../shared/models/commission-group.model';
import { ModalDirective, BsModalRef } from 'ngx-bootstrap/modal';
import { Table } from 'primeng/table';
import { SharedService } from '../../../global/services/shared.service';
import { AlertService } from '../../../global/services/alert.service';
import { ConfirmationService } from 'primeng/api';
import { CommonClass } from '../../../global/common.class';
import { ModelTestGroup } from '../../shared/models/test-group.model';
import { NgForm } from '@angular/forms';
import { ModelPageConfig } from '../../shared/models/page-config.model';

@Component({
  selector: 'app-commission-group',
  templateUrl: './commission-group.component.html',
  styleUrls: ['./commission-group.component.css'],
  encapsulation: ViewEncapsulation.None,
})
export class CommissionGroupComponent implements OnInit {
  title = 'Commission Group';
  localUrl = 'doctors/commission-group/';
  rowsFetched: ModelCommissionGroup[];
  database: ModelCommissionGroup[];
  totalRecords: number;
  loading: boolean;
  loader = false;
  limit = 10;
  offset = 0;
  cols = [];
  @ViewChild('modalAddEdit') modalAddEdit: ModalDirective;
  @ViewChild('modalAddTest') modalAddTest: ModalDirective;
  @ViewChild('dt') dt: Table;
  bsModalRef: BsModalRef;
  editMode = false;
  editId: number;
  tests: string[];
  results: string[] = [];
  groupName: string;
  rowsGroupTests: [] = [];
  staticPaymentStyle;
  dbTests;
  selectedTests = [];
  newSelectedTests = [];
  pageRange = [10, 50, 100, 500];

  constructor(
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
        header: 'Group Name',
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

  comparer(otherArray) {
    return function (current) {
      return (
        otherArray.filter(function (other) {
          return other['test_id'] === current['id'];
        }).length === 0
      );
    };
  }

  fetchTestRecords() {
    this.srvShared
      .fetchRecords(`tests/test/fetch`, {
        filters: { commission_group_id: { matchMode: '=', value: '0' } },
      })
      .subscribe(
        (res) => {
          if (res && res['success']) {
            this.dbTests = res['rows'].filter(
              this.comparer(this.selectedTests)
            ); // compare and filter from selected test
            // this.totalRecords = res['totalRecords'];
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

  moveTestToSource(event: Event) {
    this.loader = true;
    const delIds = [];
    event['items'].filter((item) => {
      const fld = {
        test_id: { value: item['id'], matchMode: '=' },
      };
      delIds.push(fld);
    });

    this.srvShared
      .deleteExtraRecord(`doctors/group-test/delete-extra`, delIds)
      .subscribe(
        (res) => {
          if (res['success']) {
            this.srvAlert.deleteSuccess();
            this.loader = false;
            // this.fetchTestRecords();
            this.loadTestByGroup();
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

  moveTestToTarget(event: Event) {
    this.loader = true;
    event['items'].filter((item) => {
      item['test_id'] = item['id']; // adding test id property to store test id into
      item['group_id'] = this.editId; // current record id as groupid
      this.newSelectedTests.push(item);
      // this.selectedTests.push(item);
    });

    this.onAddTest(this.editId);
  }

  confirmDelete(delId: number) {
    this.confirmationService.confirm({
      message: 'Are you sure that you want to delete?',
      accept: () => {
        console.log('working');
        this.deleteGroup(delId);
      },
    });
  }

  deleteGroup(delId: number) {
    this.srvShared.deleteRecord(`doctors/group-test/delete/${delId}`).subscribe(
      (res) => {
        if (res['success']) {
          this.database = res['rows'];
          this.srvAlert.deleteSuccess();
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
        .subscribe((res) => {
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
        });
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

  onAddTest(groupId: number) {
    const testToAdd = [];
    this.newSelectedTests.filter((arr) => {
      testToAdd.push({ group_id: groupId, test_id: arr['id'] });
    });
    this.srvShared
      .addRecord(testToAdd, 'doctors/group-test/add/bulk')
      .subscribe(
        (res) => {
          if (res && res['success']) {
            this.newSelectedTests = []; // blank the test selection
            this.srvAlert.updateSuccess();
            // reload test box
            // this.loadTestByGroup();
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

  loadTestByGroup() {
    this.loader = true;
    const groupId = this.editId;
    const config: ModelPageConfig = {
      filters: {
        commission_group_id: {
          value: groupId,
          matchMode: '=',
        },
      },
    };
    this.srvShared.fetchRecords('doctors/group-test/fetch', config).subscribe(
      (res) => {
        if (res && res['success']) {
          this.selectedTests = res['rows'];
        } else {
          this.srvAlert.error({ detail: res['error'] });
        }
        // this.loader = false;
      },
      (error) => {
        this.loader = false;
        this.srvAlert.error();
      }
    );

    // fetch All test from db
    this.fetchTestRecords();
  }

  captureScreen() {
    this.srvShared.captureScreen();
  }

  exportPdf() {
    this.srvShared.exportPdf(
      this.cols,
      this.database,
      'commission-group',
      'Commission Group'
    );
  }
}
