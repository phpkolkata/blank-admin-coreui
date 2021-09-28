import { LogoutComponent } from './views/logout/logout.component';
import { SelectReport } from './views/service/select-report/select-report.component';
import { PrintReport } from './views/service/print-report/print-report.component';
import { ServiceOpen } from './views/service/service-open/service-open.component';
import { SampleCollection } from './views/service/sample-collection/sample-collection.component';
import { FixAppointment } from './views/service/fix-appointment/fix-appointment.component';
import { SelectCenter } from './views/service/select-center/select-center.component';
import { FrontdeskGuard } from './global/guards/frontdesk.guard';
import { OPDModuleGuard } from './global/guards/modules/opd.guard';
import { BillingModuleGuard } from './global/guards/modules/billing.guard';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Import Containers
import { DefaultLayoutComponent } from './containers';

import { P404Component } from './views/error/404.component';
import { P500Component } from './views/error/500.component';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';
import { AuthGuard } from './global/guards/auth.guard';
import { ReportGuard } from './global/guards/report.guard';
import { ReportingModuleGuard } from './global/guards/modules/reporting.guard';



export const routes: Routes = [
  {
    path: '',
    redirectTo: 'dashboard',
    pathMatch: 'full',
  },
  {
    path: '404',
    component: P404Component,
    data: {
      title: 'Page 404'
    }
  },
  {
    path: '500',
    component: P500Component,
    data: {
      title: 'Page 500'
    }
  },
  {
    path: 'login',
    component: LoginComponent,
    data: {
      title: 'Login Page'
    }
  },
  {
    path: 'logout',
    component: LogoutComponent,
  },
  {
    path: 'register',
    component: RegisterComponent,
    data: {
      title: 'Register Page'
    }
  },
  {
    path: 'select-report',
    component: SelectReport,
  },
  {
    path: 'print-report/:data',
    component: PrintReport,
  },
  {
    path: 'select-center',
    component: SelectCenter,
  },
  {
    path: 'select-center/:code',
    component: SelectCenter,
  },
  {
    path: 'fix-appointment',
    component: FixAppointment,
  },
  {
    path: 'sample-collection',
    component: SampleCollection,
  },
  {
    path: 'service',
    component: ServiceOpen,
  },
  // default theme and childrens
  {
    path: '',
    component: DefaultLayoutComponent,
    canActivate: [AuthGuard],
    data: {
      title: 'Home',
    },
    children: [
      {
        path: 'base',
        loadChildren: () => import('./views/base/base.module').then(m => m.BaseModule)
      },
      {
        path: 'dashboard',
        loadChildren: () =>
          import('./views/dashboard/dashboard.module').then(
            (m) => m.DashboardModule
          ),
      },
      {
        path: 'settings',
        loadChildren: () =>
          import('./front-desk-module/settings/settings.module').then(
            (m) => m.SettingsModule
          ),
      },
      
      // {
      //   path: 'base',
      //   loadChildren: () =>
      //     import('./views/base/base.module').then(m => m.BaseModule)
      // },
      // {
      //   path: 'buttons',
      //   loadChildren: () =>
      //     import('./views/buttons/buttons.module').then(m => m.ButtonsModule)
      // },
      // {
      //   path: 'charts',
      //   loadChildren: () =>
      //     import('./views/chartjs/chartjs.module').then(m => m.ChartJSModule)
      // },

      // {
      //   path: 'icons',
      //   loadChildren: () =>
      //     import('./views/icons/icons.module').then((m) => m.IconsModule),
      // },
      // {
      //   path: 'notifications',
      //   loadChildren: () =>
      //     import('./views/notifications/notifications.module').then(
      //       m => m.NotificationsModule
      //     )
      // },
      // {
      //   path: 'theme',
      //   loadChildren: () =>
      //     import('./views/theme/theme.module').then(m => m.ThemeModule)
      // },
      // {
      //   path: 'widgets',
      //   loadChildren: () =>
      //     import('./views/widgets/widgets.module').then(m => m.WidgetsModule)
      // }
    ],
  },
  { path: '**', component: P404Component }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' }) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
