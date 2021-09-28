<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/testa', function(){
    $x = base64_encode("1,33");
    echo $x."<br>";
    echo base64_decode($x);
});

Route::get('/fetch-print-bill-data', function(Request $r){
    $data = explode(",",base64_decode($r->get('data')));

    config()->set('database.connections.mysql.database', 'lab_users');
    DB::purge('mysql');

    $admin = DB::table("users")->find($data[0]);
    config()->set('database.connections.mysql.database', $admin->db);
    DB::purge('mysql');

    $patientData = DB::table("patient_billing")->find($data[1]);
    $patientInfo = DB::table("patient")->find($patientData->patient_id);



    $billId        = $data[1];
    $profile_tests = [];
    $single_tests  = [];
    $tests         = DB::table('patient_test_collection')
        ->join('test', 'patient_test_collection.test_id', 'test.id')
        ->join('test_group', 'test_group.id', 'test.group_id')
        ->where('patient_bill_id', $billId)
        ->select('test.*', 'patient_test_collection.*', 'test_group.group_name')
        ->get();


    foreach ($tests as $v) {
        $v = (array) $v;
        if ($v['test_profile'] == 'y') {
            // add profile label  into test list
            $single_tests[] = $v;
            $child_tests    = DB::table('test_profile_relation')
                ->join('test', 'test_profile_relation.test_id', 'test.id')
                ->join('test_group', 'test_group.id', 'test.group_id')
                ->where('test_profile_relation.test_profile_id', $v['test_id'])
                ->select('test.*', 'test_group.group_name')
                ->get();

            // loop through profile tests and check weather report have been saved, if yes add report_style
            foreach ($child_tests as $ch) {
                $ch           = (array) $ch;
                $report_style = null;
                $report_style = DB::table('test_report_collection_pivot as rp')
                    ->where([['test_id', $ch['id']], ['billing_id', $billId]])
                    ->select('report_style', 'id')
                    ->get();

                if (count($report_style) > 0) {
                    $ch['report_style'] = $report_style[0]->report_style;
                    $report_table       = "test_report_" . trim($ch['report_style']) . "_value";
                    $report             = DB::table($report_table)
                        ->where('test_report_pivot_id', $report_style[0]->id)
                        ->get();

                    if(trim($ch['report_style']) == 'numeric' || trim($ch['report_style']) == 'single'){
                        $interpretation = DB::table("test_report_" . trim($ch['report_style']) . "_value_interpretation")
                        ->where('test_report_pivot_id', $report_style[0]->id)
                        ->first();
                        $ch['interpretation'] = $interpretation ? $interpretation : ["value" => null];
                    }

                    $ch['report'] = $report;

                } else {
                    $ch['report_style'] = null;
                }

                $ch_test = $ch;
                if ($ch_test) {
                    $profile_tests[$v['test_id']][] = $ch_test;
                }
            }

        } else {

            // add report_style to single test
            $report_style = DB::table('test_report_collection_pivot as rp')
                ->where([['test_id', '=', $v['test_id']], ['billing_id', '=', $billId]])
                ->select('report_style', 'id')
                ->get();

            if (count($report_style) > 0) {
                $v['report_style'] = $report_style[0]->report_style;
                $report_table      = "test_report_" . trim($v['report_style']) . "_value";
                $report            = DB::table($report_table)
                    ->where('test_report_pivot_id', $report_style[0]->id)
                    ->get();


                if(trim($v['report_style']) == 'numeric' || trim($v['report_style']) == 'single'){
                    $interpretation = DB::table("test_report_" . trim($v['report_style']) . "_value_interpretation")
                    ->where('test_report_pivot_id', $report_style[0]->id)
                    ->first();
                    $v['interpretation'] = $interpretation ? $interpretation : ["value" => null];
                }

                // print_r($report);
                // print $report_style[0]->id;
                $v['report'] = isset($report) ? $report : null;

            } else {
                $v['report_style'] = null;

            }

            $test = $v;
            // print_r($test);
            if ($test) {
                $single_tests[] = $test;
            }
        }
    }


    return [
        'patientData' => $patientData,
        'patientInfo' => $patientInfo,
        'rows' => $single_tests,
        'profile_tests' => $profile_tests,
    ];

});





Route::get("/testj", function(){
    
    config()->set('database.connections.mysql.database', 'lab_demo');
    DB::purge('mysql');
    $billId        = 30;
        $profile_tests = [];
        $single_tests  = [];
        $tests         = DB::table('patient_test_collection')
            ->join('test', 'patient_test_collection.test_id', 'test.id')
            ->join('test_group', 'test_group.id', 'test.group_id')
            ->where('patient_bill_id', $billId)
            ->select('test.*', 'patient_test_collection.*', 'test_group.group_name')
            ->get();


        foreach ($tests as $v) {
            $v = (array) $v;
            if ($v['test_profile'] == 'y') {
                // add profile label  into test list
                $single_tests[] = $v;
                $child_tests    = DB::table('test_profile_relation')
                    ->join('test', 'test_profile_relation.test_id', 'test.id')
                    ->join('test_group', 'test_group.id', 'test.group_id')
                    ->where('test_profile_relation.test_profile_id', $v['test_id'])
                    ->select('test.*', 'test_group.group_name')
                    ->get();

// loop through profile tests and check weather report have been saved, if yes add report_style
                foreach ($child_tests as $ch) {
                    $ch           = (array) $ch;
                    $report_style = null;
                    $report_style = DB::table('test_report_collection_pivot as rp')
                        ->where([['test_id', $ch['id']], ['billing_id', $billId]])
                        ->select('report_style', 'id')
                        ->get();

                    if (count($report_style) > 0) {
                        $ch['report_style'] = $report_style[0]->report_style;
                        $report_table       = "test_report_" . trim($ch['report_style']) . "_value";
                        $report             = DB::table($report_table)
                            ->where('test_report_pivot_id', $report_style[0]->id)
                            ->get();

                        $ch['report'] = $report;

                    } else {
                        $ch['report_style'] = null;
                    }

                    $ch_test = $ch;
                    if ($ch_test) {
                        $profile_tests[$v['test_id']][] = $ch_test;
                    }
                }

            } else {

                // add report_style to single test
                $report_style = DB::table('test_report_collection_pivot as rp')
                    ->where([['test_id', '=', $v['test_id']], ['billing_id', '=', $billId]])
                    ->select('report_style', 'id')
                    ->get();

                if (count($report_style) > 0) {
                    $v['report_style'] = $report_style[0]->report_style;
                    $report_table      = "test_report_" . trim($v['report_style']) . "_value";
                    $report            = DB::table($report_table)
                        ->where('test_report_pivot_id', $report_style[0]->id)
                        ->get();
                    // print_r($report);
                    // print $report_style[0]->id;
                    $v['report'] = isset($report) ? $report : null;

                } else {
                    $v['report_style'] = null;

                }

                $test = $v;
                // print_r($test);
                if ($test) {
                    $single_tests[] = $test;
                }
            }
        }

        return ['success' => true, 'rows' => $single_tests, 'profile_tests' => $profile_tests];
});