import { SingleValueTemplateComponent } from './../tests/test/templates/single-value-template/single-value-template.component';
import { NumericeValueTemplateComponent } from './../tests/test/templates/numerice-value-template/numerice-value-template.component';
import { DescriptiveValueTemplateComponent } from './../tests/test/templates/descriptive-value-template/descriptive-value-template.component';
import { ConfirmationService } from 'primeng/api';
import { CheckboxModule } from 'primeng/checkbox';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { ProgressSpinnerModule } from 'primeng/progressspinner';
import { CKEditorModule } from 'ckeditor4-angular';
import { TabViewModule } from 'primeng/tabview';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { KeyFilterModule } from 'primeng/keyfilter';
import { InputTextModule } from 'primeng/inputtext';
import { ModalModule } from 'ngx-bootstrap/modal';
import { PanelMenuModule } from 'primeng/panelmenu';
import { SidebarModule } from 'primeng/sidebar';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { MultiSelectModule } from 'primeng/multiselect';
import { CalendarModule } from 'primeng/calendar';
import { PickListModule } from 'primeng/picklist';
import { GlobalModule } from './../../global/global.module';
import { TestSampleComponent } from './../billings/manage-billing/popups/test-sample/test-sample.component';
import { SingleNumericTplComponent } from './../billings/manage-billing/popups/test-print/printTemplates/single-numeric-tpl/single-numeric-tpl.component';
import { TestPrintComponent } from './../billings/manage-billing/popups/test-print/test-print.component';
import { DescriptiveTemplateComponent } from './../billings/manage-billing/popups/test-report/reportTemplates/descriptive-template/descriptive-template.component';
import { NumericTemplateComponent } from './../billings/manage-billing/popups/test-report/reportTemplates/numeric-template/numeric-template.component';
import { SingleTemplateComponent } from './../billings/manage-billing/popups/test-report/reportTemplates/single-template/single-template.component';
import { ReportPrintComponent } from './../billings/report-print/report-print.component';
import { TestReportComponent } from './../billings/manage-billing/popups/test-report/test-report.component';

import { NgModule } from '@angular/core';


@NgModule({
imports: [
    GlobalModule,
    PickListModule,
    CalendarModule,
    MultiSelectModule,
    AutoCompleteModule,
    SidebarModule,
    PanelMenuModule,
    ModalModule.forRoot(),
    InputTextModule,
    KeyFilterModule,
    FormsModule,
    ReactiveFormsModule,
    BsDropdownModule.forRoot(),
    TabViewModule,
    CKEditorModule,
    ProgressSpinnerModule,
    ConfirmDialogModule,
    CheckboxModule,
],
declarations: [
    TestReportComponent,
    ReportPrintComponent,
    SingleTemplateComponent,
    NumericTemplateComponent,
    DescriptiveTemplateComponent,
    TestPrintComponent,
    SingleNumericTplComponent,
    TestSampleComponent,
    DescriptiveValueTemplateComponent,
    NumericeValueTemplateComponent,
    SingleValueTemplateComponent,
],
exports: [
    TestReportComponent,
    ReportPrintComponent,
    SingleTemplateComponent,
    NumericTemplateComponent,
    DescriptiveTemplateComponent,
    TestPrintComponent,
    SingleNumericTplComponent,
    TestSampleComponent,
    DescriptiveValueTemplateComponent,
    NumericeValueTemplateComponent,
    SingleValueTemplateComponent,
    
    
    GlobalModule,
    PickListModule,
    CalendarModule,
    MultiSelectModule,
    AutoCompleteModule,
    SidebarModule,
    PanelMenuModule,
    ModalModule,
    InputTextModule,
    KeyFilterModule,
    FormsModule,
    ReactiveFormsModule,
    BsDropdownModule,
    TabViewModule,
    CKEditorModule,
    ProgressSpinnerModule,
    ConfirmDialogModule,
    CheckboxModule,
],
providers: [ConfirmationService],
})
export class SharedComponentsModule { }