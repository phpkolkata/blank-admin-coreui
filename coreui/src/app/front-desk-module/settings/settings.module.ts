import { ListboxModule } from 'primeng/listbox';
import { PickListModule } from 'primeng/picklist';
import { ConfirmationService } from 'primeng/api';
import { AgCommissionGroupMasterComponent } from './ag-commission-group-master/ag-commission-group-master.component';
import { DoctorReferralPackageComponent } from './doctor-referral-package/commission-group-master.component';
import { CommissionGroupComponent } from './commission-group/commission-group.component';
import { RoleManagementComponent } from './role-management/role-management.component';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { SettingsRouting } from './settings.routing';
import { CommonModule } from '@angular/common';
import { TableModule } from 'primeng/table';
import { DropdownModule } from 'primeng/dropdown';
import { ProgressBarModule } from 'primeng/progressbar';
import { TooltipModule } from 'primeng/tooltip';
import { ToastModule } from 'primeng/toast';

import { ModalModule } from 'ngx-bootstrap/modal';

import { ServiceChargeComponent } from './service-charge/service-charge.component';
import { DiscountCauseComponent } from './discount-cause/discount-cause.component';
import { PaymentModeComponent } from './payment-mode/payment-mode.component';
import { ManageCenterComponent } from './manage-center/manage-center.component';
import { GlobalModule } from '../../global/global.module';
// import { ManageUnitsComponent } from './manage-units/manage-units.component';

@NgModule({
  declarations: [
    ServiceChargeComponent,
    DiscountCauseComponent,
    PaymentModeComponent,
    ManageCenterComponent,
    // ManageUnitsComponent,
    RoleManagementComponent,
    CommissionGroupComponent,
    DoctorReferralPackageComponent,
    AgCommissionGroupMasterComponent,
  ],
  imports: [
    GlobalModule, 
    SettingsRouting, 
    ModalModule.forRoot(),
    PickListModule,
    ListboxModule
  ],
  exports: [],
  providers: [ConfirmationService],
})
export class SettingsModule {}
