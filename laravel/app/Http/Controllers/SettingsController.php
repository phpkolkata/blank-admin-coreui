<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class SettingsController extends Controller {
    public function updateCenter(Request $r, $id){

        $res = DB::table('centre_admin')
            ->where('id', $id)
            ->update($r->except(['token', 'sms_balance']));
        if ($res) {
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false, 'error' => 'No Record Updated, please try again.']);
        }
    }
}