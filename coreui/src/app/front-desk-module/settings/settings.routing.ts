import { AgCommissionGroupMasterComponent } from './ag-commission-group-master/ag-commission-group-master.component';
import { DoctorReferralPackageComponent } from './doctor-referral-package/commission-group-master.component';
import { CommissionGroupComponent } from './commission-group/commission-group.component';
import { RoleManagementComponent } from './role-management/role-management.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DiscountCauseComponent } from './discount-cause/discount-cause.component';
import { PaymentModeComponent } from './payment-mode/payment-mode.component';
import { ServiceChargeComponent } from './service-charge/service-charge.component';
import { ManageCenterComponent } from './manage-center/manage-center.component';

const routes: Routes = [
  {
    path: '',
    data: { title: 'Settings' },
    children: [
      {
        path: '',
        redirectTo: 'discount-cause',
      },
      {
        path: 'discount-cause',
        component: DiscountCauseComponent,
        data: {
          title: 'Manage Discount Cause',
        },
      },
      {
        path: 'payment-mode',
        component: PaymentModeComponent,
        data: {
          title: 'Manage Payment Mode',
        },
      },
      {
        path: 'service-charge',
        component: ServiceChargeComponent,
        data: {
          title: 'Manage Service Charge',
        },
      },
      {
        path: 'center',
        component: ManageCenterComponent,
        data: {
          title: 'Manage Center',
        },
      },
      {
        path: 'role-management',
        component: RoleManagementComponent,
        data: {
          title: 'Manage Center',
        },
      },
      {
        path: 'commission-group',
        component: CommissionGroupComponent,
        data: {
          title: 'Manage Commission Group',
        },
      },
      {
        path: 'doctor-referral-package',
        component: DoctorReferralPackageComponent,
        data: {
          title: 'Manage Commission Group Master',
        },
      },
      {
        path: 'ag-commission-group-master',
        component: AgCommissionGroupMasterComponent,
        data: {
          title: 'Manage Commission Group Master',
        },
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SettingsRouting {}
