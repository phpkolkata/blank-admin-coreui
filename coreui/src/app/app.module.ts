import { LogoutComponent } from './views/logout/logout.component';
import { GlobalModule } from './global/global.module';
import { SelectReport } from './views/service/select-report/select-report.component';
import { PrintReport } from './views/service/print-report/print-report.component';
import { ServiceOpen } from './views/service/service-open/service-open.component';
import { SampleCollection } from './views/service/sample-collection/sample-collection.component';
import { FixAppointment } from './views/service/fix-appointment/fix-appointment.component';
import { SelectCenter } from './views/service/select-center/select-center.component';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { LocationStrategy, HashLocationStrategy, DatePipe, CommonModule } from '@angular/common';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar';
import { PerfectScrollbarConfigInterface } from 'ngx-perfect-scrollbar';

import { IconModule, IconSetModule, IconSetService } from '@coreui/icons-angular';

const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
  suppressScrollX: true
};

import { AppComponent } from './app.component';

// Import containers
import { DefaultLayoutComponent } from './containers';

import { P404Component } from './views/error/404.component';
import { P500Component } from './views/error/500.component';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';

import {CalendarModule} from 'primeng/calendar';

const APP_CONTAINERS = [
  DefaultLayoutComponent
];

import {
  AppAsideModule,
  AppBreadcrumbModule,
  AppHeaderModule,
  AppFooterModule,
  AppSidebarModule,
} from '@coreui/angular';

// Import routing module
import { AppRoutingModule } from './app.routing';

// Import 3rd party components
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ChartsModule } from 'ng2-charts';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { MessageService } from 'primeng/api';
import { AuthInterceptorService } from './global/services/auth-interceptor.service';
import { TableModule } from 'primeng/table';
import { ModalModule } from 'ngx-bootstrap/modal';

@NgModule({
  imports: [
    GlobalModule,
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    AppAsideModule,
    AppBreadcrumbModule.forRoot(),
    AppFooterModule,
    AppHeaderModule,
    AppSidebarModule,
    PerfectScrollbarModule,
    BsDropdownModule.forRoot(),
    TabsModule.forRoot(),
    ChartsModule,
    IconModule,
    IconSetModule.forRoot(),
    HttpClientModule,
    FormsModule,
    TableModule,
    ModalModule.forRoot(),
    CalendarModule,
    CommonModule
  ],
  declarations: [
    AppComponent,
    ...APP_CONTAINERS,
    P404Component,
    P500Component,
    LoginComponent,
    LogoutComponent,
    RegisterComponent,
    PrintReport,
    SelectReport,
    SelectCenter,
    FixAppointment,
    SampleCollection,
    ServiceOpen,
  ],
  providers: [
    {
      provide: LocationStrategy,
      useClass: HashLocationStrategy
    },
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptorService,
      multi: true,
    },
    IconSetService,
    DatePipe,
    MessageService
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
