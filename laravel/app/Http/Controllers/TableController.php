<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

class TableController extends Controller
{
    //
    private $table = "table not found";
    public function __construct(Request $r)
    {
        $this->table = setTable($r); //helper function
    }

    public function deleteTable(Request $r, $id)
    {
        $res = DB::table($this->table)->where('id', '=', $id)->delete();
        if ($res) {
            return response()->json(['message' => 'Record deleted successfully !', 'success' => true]);
        } else {
            return response()->json(['message' => 'Record not deleted, some issue.', 'success' => false]);
        }
    }

    public function deleteExtraTable(Request $r)
    {

        foreach ($r->get('fields') as $k => $v) {

            $test_id = $v['test_id']['value'];

            // print_r($v);
            $res = DB::table('test')
                ->where('id', $test_id)
                ->update(['commission_group_id' => 0]);
        }

        return response()->json(['message' => 'Record deleted successfully !', 'success' => true]);
    }

    public function fetchTable(Request $r)
    {

        // return JWTAuth::parseToken()->toUser();exit;
        $res = managePages($r, $this->table); //helper funcion

        return response()->json(['rows' => $res['rows'], 'totalRecords' => $res['total'], 'message' => 'Record fetched successfully !', 'success' => true]);
    }
    public function fetchTableClientJoins(Request $r)
    {
        $res = managePagesClientJoins($r, $this->table); //helper funcion
        if(!$res) return response()->json(['success' => false]);
        $out  = ['rows' => $res['rows'], 'totalRecords' => $res['total'], 'message' => 'Record fetched successfully !', 'success' => true];
        if(array_key_exists('aggregates', $res)){
            $out['aggregates'] = $res['aggregates'];
        }
        return response()->json($out);
    }

    public function countTableByDate(Request $r)
    {
        // echo $this->table;
        // return;
        $dt_col     = $r->input('config.date_column');
        $match_dt   = $r->input('config.match_date');
        $match_mode = $r->input('config.match_mode');

        if ($match_dt) {
            $tot = DB::table($this->table)->whereDate($dt_col, $match_mode, $match_dt)->count();
        } else {
            $tot = DB::table($this->table)->count();
        }

        return response()->json(['total' => $tot, 'message' => 'Record counted successfully !', 'success' => true]);
    }

    public function addTable(Request $r)
    {
        // return "test";
        $id  = DB::table($this->table)->insertGetId($r->except('token'));
        $tot = DB::table($this->table)->count();
        return response()->json(['insertedId' => $id, 'totalRecords' => $tot, 'success' => true]);
    }

    public function updateTable(Request $r, $id)
    {
        // return $id;
        $res = DB::table($this->table)
            ->where('id', $id)
            ->update($r->except('token'));
        if ($res) {
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false, 'error' => 'No Record Updated, please try again.']);
        }

    }

    public function updateTableByColumn(Request $r)
    {
        // return $id;
        $col    = $r->input('column');
        $update = $r->input('update');
        $res    = DB::table($this->table)
            ->where($col['name'], $col['value'])
            ->update($update);
        if ($res) {
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false, 'error' => 'No Record Updated, please try again.']);
        }

    }
// ---------------------

}
