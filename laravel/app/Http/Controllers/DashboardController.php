<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

class DashboardController extends Controller {
    public function countMalePatient(Request $r){
        $dt_col     = $r->input('config.date_column');
        $match_dt   = $r->input('config.match_date');
        $match_mode = $r->input('config.match_mode');

        if ($match_dt) {
            $tot = DB::table('patient')->where("gender", "male")->whereDate($dt_col, $match_mode, $match_dt)->count();
        } else {
            $tot = DB::table('patient')->where("gender", "male")->count();
        }

        return response()->json(['total' => $tot, 'message' => 'Record counted successfully !', 'success' => true]);
    }
    public function countFemalePatient(Request $r){
        $dt_col     = $r->input('config.date_column');
        $match_dt   = $r->input('config.match_date');
        $match_mode = $r->input('config.match_mode');

        if ($match_dt) {
            $tot = DB::table('patient')->where("gender", "female")->whereDate($dt_col, $match_mode, $match_dt)->count();
        } else {
            $tot = DB::table('patient')->where("gender", "female")->count();
        }

        return response()->json(['total' => $tot, 'message' => 'Record counted successfully !', 'success' => true]);
    }
    public function countDiscountBill(Request $r){
        $dt_col     = $r->input('config.date_column');
        $match_dt   = $r->input('config.match_date');
        $match_mode = $r->input('config.match_mode');

        if ($match_dt) {
            $tot = DB::table("patient_billing")->whereRaw("discount_cause_total != 0 OR flat_discount != 0")->whereDate($dt_col, $match_mode, $match_dt)->count();
        } else {
            $tot = DB::table("patient_billing")->whereRaw("discount_cause_total != 0 OR flat_discount != 0")->count();
        }

        return response()->json(['total' => $tot, 'message' => 'Record counted successfully !', 'success' => true]);
    }
    public function countDuesBill(Request $r){
        $dt_col     = $r->input('config.date_column');
        $match_dt   = $r->input('config.match_date');
        $match_mode = $r->input('config.match_mode');

        if ($match_dt) {
            $tot = DB::table("patient_billing")->where("payment_status", "due")->whereDate($dt_col, $match_mode, $match_dt)->count();
        } else {
            $tot = DB::table("patient_billing")->where("payment_status", "due")->count();
        }

        return response()->json(['total' => $tot, 'message' => 'Record counted successfully !', 'success' => true]);
    }

    public function resetPassword(Request $r){
        config()->set('database.connections.mysql.database', 'lab_users');
        DB::purge('mysql');
        
        $id = $r->user()->id;
        $row = DB::table("users")->where("id", $id)->first();

        $password = bcrypt($r->get('new_password'));
        if(\Hash::check($r->get('current_password'), $row->password)){
            DB::table("users")->where("id", $id)->update([
                'password' => $password,
            ]);
            return ["success" => true];
        }else{
            return ["success" => false];
        }
    }

    public function addTodoList(Request $r){
        DB::table("todolist")->insertGetId($r->except(['token']));
        return ['success' => true];
    }
    public function deleteTodoList(Request $r){
        DB::table("todolist")->where('id', $r->input('id'))->delete();
        return ['success'=>true];
    }
    public function fetchTodoList(Request $r){
        return DB::table("todolist")->orderBy('time')->get();
    }
    public function fetchCenter(Request $r){
        $row = DB::table("centre_admin")->first();
        return ['success'=>true, "row" => $row];
    }




    function fetchPatientBillingGraphData(Request $r){
        $dates = $r->get('dates');
        $total = [];
        $paid = [];
        $due = [];

        foreach($dates as $k => $date){
            $total[$k] = (int)DB::table("patient_billing")->where("bill_date", $date)->sum('grand_total');
            $paid[$k] = (int)DB::table("patient_billing")->where("bill_date", $date)->sum('total_paid');
            $due[$k] = (int)DB::table("patient_billing")->where("bill_date", $date)->sum('dues');
        }
        return [
            'total' => $total,
            'paid' => $paid,
            'due' => $due,
        ];
    }
    function fetchCreditBillingGraphData(Request $r){
        $dates = $r->get('dates');
        $total = [];
        $paid = [];
        $due = [];

        foreach($dates as $k => $date){
            $total[$k] = (int)DB::table("credit_billing")->where("bill_date", $date)->sum('grand_total');
            $paid[$k] = (int)DB::table("credit_billing")->where("bill_date", $date)->sum('total_paid');
            $due[$k] = (int)DB::table("credit_billing")->where("bill_date", $date)->sum('dues');
        }
        return [
            'total' => $total,
            'paid' => $paid,
            'due' => $due,
        ];
    }
    function fetchOPDBillingGraphData(Request $r){
        $dates = $r->get('dates');
        $total = [];
        $paid = [];
        $due = [];

        foreach($dates as $k => $date){
            $total[$k] = (int)DB::table("opd_billing")->where("bill_date", $date)->sum('grand_total');
            $paid[$k] = (int)DB::table("opd_billing")->where("bill_date", $date)->sum('total_paid');
            $due[$k] = (int)DB::table("opd_billing")->where("bill_date", $date)->sum('dues');
        }
        return [
            'total' => $total,
            'paid' => $paid,
            'due' => $due,
        ];
    }
    function fetchAccountGraphData(Request $r){
        $dates = $r->get('dates');
        $collection = [];
        $payment = [];

        foreach($dates as $k => $date){
            $collection[$k] = (int)DB::table("accounts")->where("pay_type", "in")->where("payment_date", $date)->sum('amount');
            $payment[$k] = (int)DB::table("accounts")->where("pay_type", "out")->where("payment_date", $date)->sum('amount');
        }
        return [
            'collection' => $collection,
            'payment' => $payment,
        ];
    }



}