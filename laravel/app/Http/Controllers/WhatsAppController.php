<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class WhatsAppController extends Controller {
    function patientMessage(Request $r){
        $rows = managePagesClientJoins($r, 'patient')['rows'];
        $numbers = [];
        $message = urlencode($r->get('message'));

        foreach($rows as $r){
            $num = substr($r->whatsapp, -10);
            if(strlen($num) != 10 || !preg_match("/^[0-9]+$/", $num)) continue;
            $numbers[] = $num;
        }
        $numbers = array_unique($numbers);

        $ca = DB::table('centre_admin')->first();
        if($ca->sms_balance < sizeof($numbers)){
            return [
                'success' => false,
                'error' => "You don't have enough WhatsApp balance",
            ];
        }
        DB::table('centre_admin')->where('id', $ca->id)->update([
            'sms_balance' => DB::raw('sms_balance - '.sizeof($numbers))
        ]);


        foreach($numbers as $num){
            file_get_contents("http://wmsg.rpmsms.in/wapp/api/send?apikey=55bac42c66ee4bbf96f07aa6adc7972b&mobile=$num&msg=$message");
        }
        return ['success' => true, 'numbers' => $numbers, 'rows' => $rows];
    }
    function doctorMessage(Request $r){
        $rows = managePagesClientJoins($r, 'doctor')['rows'];
        $numbers = [];
        $message = urlencode($r->get('message'));

        foreach($rows as $r){
            $num = substr($r->whatsapp, -10);
            if(strlen($num) != 10 || !preg_match("/^[0-9]+$/", $num)) continue;
            $numbers[] = $num;
        }
        $numbers = array_unique($numbers);

        $ca = DB::table('centre_admin')->first();
        if($ca->sms_balance < sizeof($numbers)){
            return [
                'success' => false,
                'error' => "You don't have enough WhatsApp balance",
            ];
        }
        DB::table('centre_admin')->where('id', $ca->id)->update([
            'sms_balance' => DB::raw('sms_balance - '.sizeof($numbers))
        ]);

        foreach($numbers as $num){
            file_get_contents("http://wmsg.rpmsms.in/wapp/api/send?apikey=55bac42c66ee4bbf96f07aa6adc7972b&mobile=$num&msg=$message");
        }
        return ['success' => true, 'numbers' => $numbers, 'rows' => $rows];
    }
    function opdDoctorMessage(Request $r){
        $rows = managePagesClientJoins($r, 'opd_doctors')['rows'];
        $numbers = [];
        $message = urlencode($r->get('message'));

        foreach($rows as $r){
            $num = substr($r->whatsapp, -10);
            if(strlen($num) != 10 || !preg_match("/^[0-9]+$/", $num)) continue;
            $numbers[] = $num;
        }
        $numbers = array_unique($numbers);

        $ca = DB::table('centre_admin')->first();
        if($ca->sms_balance < sizeof($numbers)){
            return [
                'success' => false,
                'error' => "You don't have enough WhatsApp balance",
            ];
        }
        DB::table('centre_admin')->where('id', $ca->id)->update([
            'sms_balance' => DB::raw('sms_balance - '.sizeof($numbers))
        ]);



        foreach($numbers as $num){
            file_get_contents("http://wmsg.rpmsms.in/wapp/api/send?apikey=55bac42c66ee4bbf96f07aa6adc7972b&mobile=$num&msg=$message");
        }
        return ['success' => true, 'numbers' => $numbers, 'rows' => $rows];
    }
    function agentMessage(Request $r){
        $rows = managePagesClientJoins($r, 'agent')['rows'];
        $numbers = [];
        $message = urlencode($r->get('message'));

        foreach($rows as $r){
            $num = substr($r->whatsapp, -10);
            if(strlen($num) != 10 || !preg_match("/^[0-9]+$/", $num)) continue;
            $numbers[] = $num;
        }
        $numbers = array_unique($numbers);


        $ca = DB::table('centre_admin')->first();
        if($ca->sms_balance < sizeof($numbers)){
            return [
                'success' => false,
                'error' => "You don't have enough WhatsApp balance",
            ];
        }
        DB::table('centre_admin')->where('id', $ca->id)->update([
            'sms_balance' => DB::raw('sms_balance - '.sizeof($numbers))
        ]);



        foreach($numbers as $num){
            file_get_contents("http://wmsg.rpmsms.in/wapp/api/send?apikey=55bac42c66ee4bbf96f07aa6adc7972b&mobile=$num&msg=$message");
        }
        return ['success' => true, 'numbers' => $numbers, 'rows' => $rows];
    }
    function ccCustomerMessage(Request $r){
        $rows = managePagesClientJoins($r, 'credit_customers')['rows'];
        $numbers = [];
        $message = urlencode($r->get('message'));

        foreach($rows as $r){
            $num = substr($r->phone, -10);
            if(strlen($num) != 10 || !preg_match("/^[0-9]+$/", $num)) continue;
            $numbers[] = $num;
        }
        $numbers = array_unique($numbers);



        $ca = DB::table('centre_admin')->first();
        if($ca->sms_balance < sizeof($numbers)){
            return [
                'success' => false,
                'error' => "You don't have enough WhatsApp balance",
            ];
        }
        DB::table('centre_admin')->where('id', $ca->id)->update([
            'sms_balance' => DB::raw('sms_balance - '.sizeof($numbers))
        ]);



        foreach($numbers as $num){
            file_get_contents("http://wmsg.rpmsms.in/wapp/api/send?apikey=55bac42c66ee4bbf96f07aa6adc7972b&mobile=$num&msg=$message");
        }
        return ['success' => true, 'numbers' => $numbers, 'rows' => $rows];
    }
}
