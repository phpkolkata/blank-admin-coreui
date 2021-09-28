import { INavData } from '@coreui/angular';

export const navItems: INavData[] = [
  {
    title: true,
    name: 'Module',
  },
  {
    name: 'Billing',
    url: '/billing',
    icon: 'fa fa-book',
    children: [
      {
        name: 'New',
        url: '/billing/patient',
        icon: 'icon-star',
      },
      {
        name: 'Manage',
        url: '/billing/manage',
        icon: 'icon-star',
      },
    ],
  },
  {
    name: 'Patient',
    url: '/patients',
    icon: 'icon-people',
    children: [
      {
        name: 'Manage',
        url: '/patients/patient',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Referral Doctor',
    url: '/doctors',
    icon: 'fa fa-user-md',
    children: [
      {
        name: 'Manage Doctor',
        url: '/doctors/doctor',
        icon: 'icon-star',
      },
      {
        name: 'Doc Commission',
        url: '/doctors/commission',
        icon: 'icon-star',
      },
    ],
  },
  {
    name: 'Agent',
    url: '/agents',
    icon: 'fa fa-user',
    children: [
      {
        name: 'Manage Agent',
        url: '/agents/agent',
        icon: 'icon-star',
      },
      {
        name: 'Agent Commission',
        url: '/agents/ag-commission',
        icon: 'icon-star',
      },
    ],
  },
  {
    name: 'Clinical Master',
    url: '/tests',
    icon: 'fa fa-flask',
    children: [
      {
        name: 'Manage Group',
        url: '/tests/group',
        icon: 'fa fa-medkit',
      },
      {
        name: 'Manage Tests',
        url: '/tests/test',
        icon: 'fa fa-medkit',
      },
      {
        name: 'Manage Profile/Package',
        url: '/tests/profile',
        icon: 'fa fa-medkit',
      },
    ],
  },
  {
    name: 'Lab Test Report',
    url: '/reporting',
    icon: 'fa fa-envelope-o',
    children: [
      {
        name: 'Test Units',
        url: '/reporting/test-units',
        icon: 'icon-note',
      },
      {
        name: 'Test Format',
        url: '/reporting/test-format',
        icon: 'icon-note',
      },
      {
        name: 'Test Result Entry',
        url: '/reporting/test-result-entry',
        icon: 'fa fa-plus-square',
      },
      {
        name: 'CC Test Result Entry',
        url: '/reporting/credit-test-result-entry',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Appointment',
    url: '/appointment',
    icon: 'fa fa-calendar',
    children: [
      {
        name: 'Sample Collection',
        url: '/appointment/sample-collection',
        icon: 'icon-note',
      },
      {
        name: 'Doctor Appointment',
        url: '/appointment/doctor-appointment',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'OPD',
    url: '/opd',
    icon: 'fa fa-heartbeat',
    children: [
      {
        name: 'New Billing',
        url: '/opd/new-opd-billing',
        icon: 'icon-note',
      },
      {
        name: 'Manage Billing',
        url: '/opd/manage-billing',
        icon: 'icon-note',
      },
      {
        name: 'Manage Doctor',
        url: '/opd/opd-doctor',
        icon: 'icon-note',
      },
      {
        name: 'Doctor Fees',
        url: '/opd/opd-doctor-fees',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Credit Customer',
    url: '/credit-customer',
    icon: 'fa fa-credit-card',
    children: [
      {
        name: 'New Credit Bill',
        url: '/credit-customer/new-credit-bill',
        icon: 'icon-note',
      },
      {
        name: 'Manage Credit Bill',
        url: '/credit-customer/manage-credit-billing',
        icon: 'icon-note',
      },
      {
        name: 'Manage CC',
        url: '/credit-customer/manage-credit-customer',
        icon: 'icon-note',
      },
      {
        name: 'CC Payment',
        url: '/credit-customer/credit-payment',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Reception Cash',
    url: '/accounts',
    icon: 'fa fa-inr',
    children: [
      {
        name: 'Outgoing Payments',
        url: '/accounts/account-out',
        icon: 'icon-star',
      },
      {
        name: 'Incoming Payments',
        url: '/accounts/account-in',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Marketing',
    url: '/marketing',
    icon: 'fa fa-bullhorn',
    children: [
      {
        name: 'Patient',
        url: '/marketing/patient',
        icon: 'icon-note',
      },
      {
        name: 'Reference Doctor',
        url: '/marketing/referrence-doctor',
        icon: 'icon-note',
      },
      {
        name: 'OPD Doctor',
        url: '/marketing/opd-doctor',
        icon: 'icon-note',
      },
      {
        name: 'Agent',
        url: '/marketing/agent',
        icon: 'icon-note',
      },
      {
        name: 'CC customer',
        url: '/marketing/cc-customer',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Purchase',
    url: '/purchase',
    icon: 'fa fa-cart-plus',
    children: [
      {
        name: 'Vendor Master',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'Item',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'Purchase Bill',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Stock',
    url: '/stock',
    icon: 'icon-settings',
    children: [
      {
        name: 'option one',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'option two',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'HR',
    url: '/hr',
    icon: 'fa fa-handshake-o',
    children: [
      {
        name: 'Stock Master',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'Leave',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Lab Accounts',
    url: '/lab-accounts',
    icon: 'fa fa-calculator',
    children: [
      {
        name: 'Banking',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'Expenses',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'Vendor Payment',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'Staff Payment',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
      {
        name: 'Finance',
        url: '/tests/test-fake',
        icon: 'icon-note',
      },
    ],
  },
  {
    divider: true,
  },
  {
    title: true,
    name: 'Data Analysis',
  },
  {
    name: 'Reports ',
    url: '/reports',
    icon: 'icon-graph',
    children: [
      {
        name: 'Billing',
        url: '/reports/bills',
        icon: 'icon-star',
      },
      {
        name: 'CC Billing',
        url: '/reports/credit-bills',
        icon: 'icon-star',
      },
      {
        name: 'OPD Billing',
        url: '/reports/opd-bills',
        icon: 'icon-star',
      },
      {
        name: 'Patient',
        url: '/reports/patients',
        icon: 'icon-star',
      },
      {
        name: 'Dr Referral',
        url: '/reports/doc-commissions',
        icon: 'icon-star',
      },
      {
        name: 'Agent Commission ',
        url: '/reports/agent-commissions',
        icon: 'icon-star',
      },
      {
        name: 'Test',
        url: '/reports/tests',
        icon: 'icon-star',
      },
      {
        name: 'Accounts',
        url: '/reports/accounts',
        icon: 'icon-star',
      },
    ],
  },
  {
    name: 'Graph',
    url: '/graph',
    icon: 'fa fa-line-chart',
    children: [
      {
        name: 'Patient Billing',
        url: '/graph/patient-billing',
        icon: 'icon-note',
      },
      {
        name: 'Credit Billing',
        url: '/graph/credit-billing',
        icon: 'icon-note',
      },
      {
        name: 'OPD Billing',
        url: '/graph/opd-billing',
        icon: 'icon-note',
      },
      {
        name: 'Account',
        url: '/graph/account',
        icon: 'icon-note',
      }
    ],
  },
  

  {
    divider: true,
  },
  {
    title: true,
    name: 'SETUP',
  },
  {
    name: 'Master Settings',
    url: '/settings',
    icon: 'fa fa-cogs',
    children: [
      {
        name: 'Manage Center',
        url: '/settings/center',
        icon: 'fa fa-hospital-o',
      },
      {
        name: 'User Account',
        url: '/settings/role-management',
        icon: 'fa fa-user-circle',
      },
      {
        name: 'Service Charge',
        url: '/settings/service-charge',
        icon: 'fa fa-tag',
      },
      {
        name: 'Discount Cause',
        url: '/settings/discount-cause',
        icon: 'fa fa-percent',
      },
      {
        name: 'Payment Mode',
        url: '/settings/payment-mode',
        icon: 'fa fa-paypal',
      },
      {
        name: 'Commission Group',
        url: '/settings/commission-group',
        icon: 'fa fa-money',
      },
      {
        name: 'Doctor Referral Package',
        url: '/settings/doctor-referral-package',
        icon: 'icon-note',
      },
      {
        name: 'Agent Commission Package',
        url: '/settings/ag-commission-group-master',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Logout',
    url: '/logout',
    icon: 'icon-lock'
  },
];
