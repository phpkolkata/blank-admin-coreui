import { ActivatedRoute } from '@angular/router';
import { SharedService } from '../../../global/services/shared.service';
import { ChangeDetectorRef, Component } from '@angular/core';


@Component({
  selector: 'app-print-report-open',
  templateUrl: 'print-report.component.html',
  styleUrls: ['print-report.component.scss'],
})
export class PrintReport {
  patientData;
  patientInfo = null;
  printableTestArray = [];
  reportStyle = null;
  testsByGroup = {};
  testItems = [];
  sl = 0;
  header = true;
  isDescriptive = false;

  selectedTests = [];
  selectedProfileTests = [];
  testArray = [];
  testObj = {};
  profileReportReady = {};
  printTestArray = {};
  loaded = false;
  hasSingle = false;
  hasDesctiptive = false;
  now = new Date();
  upIcon = 'fa fa-arrow-up';
  downIcon = 'fa fa-arrow-down';
  loader = false;

  constructor(
    private route: ActivatedRoute, 
    private srvShared: SharedService,
    private cdRef:ChangeDetectorRef) {
    srvShared.get("../fetch-print-bill-data?data="+this.route.snapshot.params.data).subscribe(
      (res) => {
        this.patientData = res['patientData'];
        this.patientInfo = res['patientInfo'];
        // this.selectedTests = res['rows'];
        this.selectedProfileTests = res['profile_tests'];

        this.selectedTests = res['rows'].filter(e=>e.test_profile != 'y');
        for(let i in res['profile_tests']){
          for(let j in res['profile_tests'][i]){
            this.selectedTests.push(res['profile_tests'][i][j]);
          }
        }


        this.loaded = true;
        // testsByGroup

        for(let i of this.selectedTests){
          if(i.report_style == 'numeric' || i.report_style == 'single' || i.test_profile == 'y'){
            this.hasSingle = true;
          }else{
            this.hasDesctiptive = true;
          }
        }
      },
      (error) => {
      }
    );
  }

  printReport(isDescriptive){
    this.isDescriptive = isDescriptive;
    this.initTestMenu();

    this.testItems.forEach(item=>{
      this.logTest(item);
    });
    setTimeout(()=>{
      let oldTitle = document.title;
      document.title = 'Report '+(isDescriptive?'Two':'One');
      window.print();
      document.title = oldTitle;
    },0);
  }

  initTestMenu() {
    this.testItems = [];
    this.selectedTests.forEach((item, index) => {
      this.testItems.push({
        label: item.name,
        icon:
          item.test_profile !== 'y'
            ? item.report_style
              ? 'fa fa-check-circle'
              : 'fa fa-circle'
            : null,
        items: item.test_profile === 'y' ? [] : null,
        queryParams: {
          id: item.test_id ? item.test_id : item.id,
          isChecked: false,
          name: item.name,
          test_group_id: item.group_id,
          test_group_name: item.group_name,
          isProfile: item.test_profile,
          profileName: item.name,
          profileId: item.test_id ? item.test_id : item.id,
          billing_id: item.patient_bill_id,
          reportStyle: item.report_style,
          interpretation: item.interpretation ? item.interpretation.value : null,
          isReportReady:
            item.test_profile !== 'y'
              ? item.report_style
                ? true
                : false
              : null,
          report: item.report,
        },
      });
      // if test is profile test
      if (item.test_profile === 'y') {
        // init default value true for profile test created
        this.profileReportReady = { [item.test_id]: true };
        this.selectedProfileTests[item.test_id].map((test) => {
          // set profile report ready false, if any single test incomplete
          if (!test.report_style) {
            this.profileReportReady[item.test_id] = false;
          }
          // set test icon circle
          const profileTest = {
            label: test.name,
            icon: test.report_style ? 'fa fa-check-circle' : 'fa fa-circle',
            queryParams: {
              id: test.id,
              isChecked: false,
              name: test.name,
              test_group_id: test.group_id,
              test_group_name: item.group_name,
              isProfile: 'y',
              profileName: item.name,
              profileId: item.test_id,
              reportStyle: test.report_style,
              isReportReady: null, // decide later in code
              report: test.report,
            },
          };
          (this.testItems[index].items as Array<any>).push(profileTest);
          // set profile icon checked if all test report created
          this.testItems[index].icon = this.profileReportReady[item.test_id]
            ? 'fa fa-check-circle'
            : 'fa fa-circle';
          this.testItems[index].queryParams.isReportReady = this
            .profileReportReady[item.test_id]
            ? true
            : false;
          profileTest.icon = this.profileReportReady[item.test_id]
            ? 'fa fa-check-circle'
            : 'fa fa-circle';
          profileTest.queryParams.isReportReady = this
            .profileReportReady[item.test_id]
            ? true
            : false;
        });
      }
    });

    // blank child cmp pritable test varibale
    this.printableTestArray = [];
    this.testsByGroup = {};
    this.reportStyle = null;
    this.patientData = this.patientData;
  }

  logTest(item) {
    this.showHeader();
    // init report style name
    if (this.reportStyle === null) {
      if (item.queryParams.isProfile === 'y') {
        item.items.map((i) => {
          this.reportStyle = i.queryParams.reportStyle;
        });
      } else {
        this.reportStyle = item.queryParams.reportStyle;
      }
    }

    // filter array as per checked value
    this.printableTestArray = this.testItems.filter(
      (itm, index) => {
        return (itm.queryParams.isProfile == 'y' && !this.isDescriptive) || ((itm.queryParams.reportStyle == 'single' || itm.queryParams.reportStyle == 'numeric') && !this.isDescriptive) || (itm.queryParams.reportStyle == 'descriptive' && this.isDescriptive);
      }
    );

    // map the testArray as per group
    this.testObj = {};
    this.testArray = [];
    this.initGroupByTest();
    this.printableTestArray.map((itm) => {
      this.testObj[itm.queryParams.test_group_name].push(itm);
    });
    this.testsByGroup = this.testObj;
    // reset report style in child cmp
    if (this.printableTestArray.length <= 0) {
      this.reportStyle = null;
    }

    this.cdRef.detectChanges();
  }
  initGroupByTest() {
    this.printableTestArray.map((itm) => {
      this.testObj[itm.queryParams.test_group_name] = [];
    });
  }

  hideHeader() {
    this.header = false;
  }

  showHeader() {
    this.header = true;
  }
  print() {
    window.print();
  }

}
