import { INavData } from '@coreui/angular';

export const navItems: INavData[] = [
  // {
  //   name: 'Dashboard',
  //   url: '/dashboard',
  //   icon: 'icon-speedometer',
  //   badge: {
  //     variant: 'info',
  //     text: 'Home',
  //   },
  // },

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
      // {
      //   name: 'Test Collection',
      //   url: '/billing/test-collection',
      //   icon: 'icon-star'
      // },
      // {
      //   name: 'Sample Collection',
      //   url: '/billing/sample-collection',
      //   icon: 'icon-star'
      // }
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
      {
        name: 'Commission Group',
        url: '/doctors/commission-group',
        icon: 'icon-note',
      },
      {
        name: 'Commission Master',
        url: '/doctors/commission-group-master',
        icon: 'icon-note',
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
      // {
      //   name: 'Commission Group',
      //   url: '/agents/ag-commission-group',
      //   icon: 'icon-note',
      // },
      {
        name: 'Commission Master',
        url: '/agents/ag-commission-group-master',
        icon: 'icon-note',
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
        icon: 'icon-note',
      },
      {
        name: 'Manage Tests',
        url: '/tests/test',
        icon: 'icon-note',
      },
      {
        name: 'Manage Profile',
        url: '/tests/profile',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Lab Test Report',
    url: '/reporting',
    icon: 'fa fa-list',
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
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Appointment',
    url: '/appointment',
    icon: 'fa fa-list',
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
    url: '/settings',
    icon: 'icon-settings',
    children: [
      {
        name: 'Collection Centre master',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'Test Price',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Reception Accounts',
    url: '/accounts',
    icon: 'fa fa-briefcase',
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
      // {
      //   name: 'Due Payments',
      //   url: '/accounts/account-due',
      //   icon: 'icon-note'
      // }
    ],
  },
  {
    name: 'Marketing',
    url: '/settings',
    icon: 'icon-settings',
    children: [
      {
        name: 'SMS template create',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'Patient type selection',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Dr. type selection as per commission group',
        url: '/settings/payment-mode',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Purchase',
    url: '/settings',
    icon: 'icon-settings',
    children: [
      {
        name: 'Vendor Master',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'Item',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Purchase Bill',
        url: '/settings/payment-mode',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Stock',
    url: '/settings',
    icon: 'icon-settings',
    children: [
      {
        name: 'option one',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'option two',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'HR',
    url: '/settings',
    icon: 'icon-settings',
    children: [
      {
        name: 'Stock Master',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'Leave',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
    ],
  },
  {
    name: 'Lab Accounts',
    url: '/settings',
    icon: 'icon-settings',
    children: [
      {
        name: 'Banking',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'Expenses',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Vendor Payment',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Staff Payment',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Finance',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
    ],
  },
  // {
  //   name: 'Demo',
  //   url: '',
  //   icon: 'icon-star',
  //   children: [
  //     {
  //       name: 'Alerts',
  //       url: '/notifications/alerts',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Badges',
  //       url: '/notifications/badges',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Modals',
  //       url: '/notifications/modals',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Cards',
  //       url: '/base/cards',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Carousels',
  //       url: '/base/carousels',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Collapses',
  //       url: '/base/collapses',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Forms',
  //       url: '/base/forms',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Pagination',
  //       url: '/base/paginations',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Popovers',
  //       url: '/base/popovers',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Progress',
  //       url: '/base/progress',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Switches',
  //       url: '/base/switches',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Tables',
  //       url: '/base/tables',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Tabs',
  //       url: '/base/tabs',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Tooltips',
  //       url: '/base/tooltips',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Buttons',
  //       url: '/buttons/buttons',
  //       icon: 'icon-cursor'
  //     },
  //     {
  //       name: 'Dropdowns',
  //       url: '/buttons/dropdowns',
  //       icon: 'icon-cursor'
  //     },
  //     {
  //       name: 'Brand Buttons',
  //       url: '/buttons/brand-buttons',
  //       icon: 'icon-cursor'
  //     },
  //     {
  //       name: 'Alerts',
  //       url: '/notifications/alerts',
  //       icon: 'icon-bell'
  //     },
  //     {
  //       name: 'Badges',
  //       url: '/notifications/badges',
  //       icon: 'icon-bell'
  //     },
  //     {
  //       name: 'CoreUI Icons',
  //       url: '/icons/coreui-icons',
  //       icon: 'icon-star',
  //       badge: {
  //         variant: 'success',
  //         text: 'NEW'
  //       }
  //     },
  //     {
  //       name: 'Flags',
  //       url: '/icons/flags',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Font Awesome',
  //       url: '/icons/font-awesome',
  //       icon: 'icon-star',
  //       badge: {
  //         variant: 'secondary',
  //         text: '4.7'
  //       }
  //     },
  //     {
  //       name: 'Simple Line Icons',
  //       url: '/icons/simple-line-icons',
  //       icon: 'icon-star'
  //     }
  //   ]
  // },
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
        name: 'Credit Customer',
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
    url: '/settings',
    icon: 'icon-settings',
    children: [
      {
        name: 'Sales Graph',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'Payment & Received Graph',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Test wise sales graph',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Referral Patient graph',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      }
    ],
  },
  
  // {
  //   name: 'Business Intelligent',
  //   url: '/settings',
  //   icon: 'icon-settings',
  //   children: [
  //     {
  //       name: 'Staff with leave',
  //       url: '/settings/service-charge',
  //       icon: 'icon-note',
  //     },
  //     {
  //       name: 'Vendor',
  //       url: '/settings/discount-cause',
  //       icon: 'icon-note',
  //     },
  //     {
  //       name: 'Purchase',
  //       url: '/settings/payment-mode',
  //       icon: 'icon-note',
  //     },
  //     {
  //       name: 'Stock',
  //       url: '/settings/payment-mode',
  //       icon: 'icon-note',
  //     },
  //   ],
  // },

  // {
  //   name: 'Accounting',
  //   url: '/settings',
  //   icon: 'icon-settings',
  //   children: [
  //     {
  //       name: 'Banking',
  //       url: '/settings/service-charge',
  //       icon: 'icon-note',
  //     },
  //     {
  //       name: 'Profit & loss a/c',
  //       url: '/settings/discount-cause',
  //       icon: 'icon-note',
  //     }
  //   ],
  // },



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
    icon: 'icon-settings',
    children: [
      {
        name: 'Service Charge',
        url: '/settings/service-charge',
        icon: 'icon-note',
      },
      {
        name: 'Discount Cause',
        url: '/settings/discount-cause',
        icon: 'icon-note',
      },
      {
        name: 'Payment Mode',
        url: '/settings/payment-mode',
        icon: 'icon-note',
      },
    ],
  },
  //........................................................
  // {
  //   name: 'Dashboard',
  //   url: '/dashboard',
  //   icon: 'icon-speedometer',
  //   badge: {
  //     variant: 'info',
  //     text: 'NEW'
  //   }
  // },
  // {
  //   title: true,
  //   name: 'Theme'
  // },
  // {
  //   name: 'Colors',
  //   url: '/theme/colors',
  //   icon: 'icon-drop'
  // },
  // {
  //   name: 'Typography',
  //   url: '/theme/typography',
  //   icon: 'icon-pencil'
  // },
  // {
  //   title: true,
  //   name: 'Components'
  // },
  // {
  //   name: 'Base',
  //   url: '/base',
  //   icon: 'icon-puzzle',
  //   children: [
  //     {
  //       name: 'Cards',
  //       url: '/base/cards',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Carousels',
  //       url: '/base/carousels',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Collapses',
  //       url: '/base/collapses',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Forms',
  //       url: '/base/forms',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Navbars',
  //       url: '/base/navbars',
  //       icon: 'icon-puzzle'

  //     },
  //     {
  //       name: 'Pagination',
  //       url: '/base/paginations',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Popovers',
  //       url: '/base/popovers',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Progress',
  //       url: '/base/progress',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Switches',
  //       url: '/base/switches',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Tables',
  //       url: '/base/tables',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Tabs',
  //       url: '/base/tabs',
  //       icon: 'icon-puzzle'
  //     },
  //     {
  //       name: 'Tooltips',
  //       url: '/base/tooltips',
  //       icon: 'icon-puzzle'
  //     }
  //   ]
  // },
  // {
  //   name: 'Buttons',
  //   url: '/buttons',
  //   icon: 'icon-cursor',
  //   children: [
  //     {
  //       name: 'Buttons',
  //       url: '/buttons/buttons',
  //       icon: 'icon-cursor'
  //     },
  //     {
  //       name: 'Dropdowns',
  //       url: '/buttons/dropdowns',
  //       icon: 'icon-cursor'
  //     },
  //     {
  //       name: 'Brand Buttons',
  //       url: '/buttons/brand-buttons',
  //       icon: 'icon-cursor'
  //     }
  //   ]
  // },
  // {
  //   name: 'Charts',
  //   url: '/charts',
  //   icon: 'icon-pie-chart'
  // },
  // {
  //   name: 'Icons',
  //   url: '/icons',
  //   icon: 'icon-star',
  //   children: [
  //     {
  //       name: 'CoreUI Icons',
  //       url: '/icons/coreui-icons',
  //       icon: 'icon-star',
  //       badge: {
  //         variant: 'success',
  //         text: 'NEW'
  //       }
  //     },
  //     {
  //       name: 'Flags',
  //       url: '/icons/flags',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Font Awesome',
  //       url: '/icons/font-awesome',
  //       icon: 'icon-star',
  //       badge: {
  //         variant: 'secondary',
  //         text: '4.7'
  //       }
  //     },
  //     {
  //       name: 'Simple Line Icons',
  //       url: '/icons/simple-line-icons',
  //       icon: 'icon-star'
  //     }
  //   ]
  // },
  // {
  //   name: 'Notifications',
  //   url: '/notifications',
  //   icon: 'icon-bell',
  //   children: [
  //     {
  //       name: 'Alerts',
  //       url: '/notifications/alerts',
  //       icon: 'icon-bell'
  //     },
  //     {
  //       name: 'Badges',
  //       url: '/notifications/badges',
  //       icon: 'icon-bell'
  //     },
  //     {
  //       name: 'Modals',
  //       url: '/notifications/modals',
  //       icon: 'icon-bell'
  //     }
  //   ]
  // },
  // {
  //   name: 'Widgets',
  //   url: '/widgets',
  //   icon: 'icon-calculator',
  //   badge: {
  //     variant: 'info',
  //     text: 'NEW'
  //   }
  // },
  // {
  //   divider: true
  // },
  // {
  //   title: true,
  //   name: 'Extras',
  // },
  // {
  //   name: 'Pages',
  //   url: '/pages',
  //   icon: 'icon-star',
  //   children: [
  //     {
  //       name: 'Login',
  //       url: '/login',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Register',
  //       url: '/register',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Error 404',
  //       url: '/404',
  //       icon: 'icon-star'
  //     },
  //     {
  //       name: 'Error 500',
  //       url: '/500',
  //       icon: 'icon-star'
  //     }
  //   ]
  // },
  // {
  //   name: 'Disabled',
  //   url: '/dashboard',
  //   icon: 'icon-ban',
  //   badge: {
  //     variant: 'secondary',
  //     text: 'NEW'
  //   },
  //   attributes: { disabled: true },
  // },
  // {
  //   name: 'Download CoreUI',
  //   url: 'http://coreui.io/angular/',
  //   icon: 'icon-cloud-download',
  //   class: 'mt-auto',
  //   variant: 'success',
  //   attributes: { target: '_blank', rel: 'noopener' }
  // },
  // {
  //   name: 'Try CoreUI PRO',
  //   url: 'http://coreui.io/pro/angular/',
  //   icon: 'icon-layers',
  //   variant: 'danger',
  //   attributes: { target: '_blank', rel: 'noopener' }
  // }
];
