export class ModelPatientBilling {
  id: number;
  bill_id: string;
  reg_id: string;
  patient_id: number;
  mobile: number;
  name_prefix;
  name: string;
  repeat_patient: string;
  ref_dr_id: number;
  ref_dr_name: string;
  commission_to: string;
  service_charge_total: number;
  discount_cause_total: number;
  flat_discount: number;
  test_total: number;
  grand_total: number;
  advance_payment: number;
  total_paid: number;
  payment_mode: string;
  dues: number;
  payment_status: string;
  bill_date: string;
  bill_due_date: string;
  delivery_date: string;
  report_status: string;
  comment: string;
}
