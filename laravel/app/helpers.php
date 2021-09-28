<?php

function setTable($r)
{
    $table = "selecting table";

    $url_setting               = 'api/settings/';
    $url_test                  = 'api/tests/';
    $url_test_single_template  = 'api/test-template/single-value/';
    $url_test_numeric_template = 'api/test-template/numeric-value/';
    $url_doc                   = 'api/doctors/';
    $url_opd                   = 'api/opd/';
    $url_agent                 = 'api/agents/';
    $url_patient               = 'api/patients/';
    $url_account               = 'api/accounts/';
    $url_billing               = 'api/billings/';
    $url_appointment           = 'api/appointment/';
    $url_credit_customer       = 'api/credit-customer/';



    if ($r->is($url_setting . 'discount-cause/*')) {
        $table = 'discount_cause';
    } elseif ($r->is($url_setting . 'service-charge/*')) {
        $table = 'service_charge';
    } elseif ($r->is($url_setting . 'payment-mode/*')) {
        $table = 'payment_mode';
    } elseif ($r->is($url_setting . 'test-units/*')) {
        $table = 'units_static';
    } elseif ($r->is($url_setting . 'center/*')) {
        $table = 'centre_admin';
    } elseif ($r->is($url_test . 'group/*')) {
        $table = 'test_group';
    } elseif ($r->is($url_test . 'test/*')) {
        $table = 'test';
    } elseif ($r->is($url_test . 'profile-test/*')) {
        $table = 'test_profile_relation';
    } elseif ($r->is($url_test_single_template . 'sub-title/*')) {
        $table = 'test_single_value_tpl_subtitle';
    } elseif ($r->is($url_test_numeric_template . 'sub-title/*')) {
        $table = 'test_numeric_value_tpl_subtitle';
    } elseif ($r->is($url_doc . 'commission-group/*')) {
        $table = 'commission_group';
    } elseif ($r->is($url_doc . 'group-test/*')) {
        $table = 'commission_group_test_relation';
    } elseif ($r->is($url_doc . 'commission-group-master/*')) {
        $table = 'commission_group_master';
    } elseif ($r->is($url_doc . 'master-group/*')) {
        $table = 'commission_group_master_relation';
    } elseif ($r->is($url_doc . 'commission/*')) {
        $table = 'doctor_commission';
    } elseif ($r->is($url_doc . 'doctor/*')) {
        $table = 'doctor';
    } elseif ($r->is($url_agent . 'commission-group/*')) {
        $table = 'commission_group';
    } elseif ($r->is($url_opd . 'doctor/*')) {
        $table = 'opd_doctors';
    } elseif ($r->is($url_opd . 'billing/*')) {
        $table = 'opd_billing';
    } elseif ($r->is($url_opd . 'doctor_fees/*')) {
        $table = 'opd_doctor_fees';
    } elseif ($r->is($url_agent . 'group-test/*')) {
        $table = 'agent_commission_group_test_relation';
    } elseif ($r->is($url_agent . 'commission-group-master/*')) {
        $table = 'agent_commission_group_master';
    } elseif ($r->is($url_agent . 'master-group/*')) {
        $table = 'agent_commission_group_master_relation';
    } elseif ($r->is($url_agent . 'commission/*')) {
        $table = 'agent_commission';
    } elseif ($r->is($url_agent . 'agent/*')) {
        $table = 'agent';
    } elseif ($r->is($url_patient . 'tests/*')) {
        $table = 'patient_test_collection';
    } elseif ($r->is($url_patient . 'patient/*')) {
        $table = 'patient';
    } elseif ($r->is($url_account . 'outgoing/*')) {
        $table = 'accounts';
    } elseif ($r->is($url_account . 'incoming/*')) {
        $table = 'accounts';
    } elseif ($r->is($url_billing . 'tests/*')) {
        $table = 'patient_test_collection';
    } elseif ($r->is($url_billing . 'billing/*')) {
        $table = 'patient_billing';
    } elseif ($r->is($url_appointment . 'sample-collection/*')) {
        $table = 'sample_collection_requests';
    } elseif ($r->is($url_appointment . 'doctor-appointment/*')) {
        $table = 'doctor_appointment_requests';
    } else if($r->is($url_credit_customer . 'manage-credit-customer/*')){
        $table = 'credit_customers';
    } else if($r->is($url_credit_customer . 'test-price/*')){
        $table = 'test';
    } elseif ($r->is($url_credit_customer . 'billing/*')) {
        $table = 'credit_billing';
    } elseif ($r->is($url_credit_customer . 'tests/*')) {
        $table = 'credit_test_collection';
    } elseif ($r->is($url_credit_customer . 'payment/*')) {
        $table = 'credit_billing';
    }
    

    return $table;
}
function managePagesClientJoins($r, $table, $join = null)
{

    $skip  = 0;
    $limit = $r->input('config.limit') ? $r->input('config.limit') : null;

    $skip = $r->input('config.offset') ? $r->input('config.offset') : null;

    $sortBy = $r->input('config.sort.sortBy') ? $r->input('config.sort.sortBy') : 'id';

    $sortType = ($r->input('config.sort.sortType') == 1) ? 'asc' : 'desc';

    // extract filters
    $filters = $r->input('config.filters');
    // print_r($config);
    // return;
    $filter_query = null;
    if ($filters) {
        $filters = json_encode($filters);
        $filters = json_decode($filters, true);
        foreach ($filters as $col => $obj) {
            $wCard = ($obj['matchMode'] == "like") ? "%" : "";
            if (is_array($obj['value'])) {
                $filters_query[] = [
                    $col,
                    $obj['matchMode'],
                    $obj['value'],
                ];
            } else {
                $filters_query[] = [$col, $obj['matchMode'], $wCard . $obj['value'] . $wCard];
            }

        }
        // return $filters_query;
    }

    $groupBy = $r->input('config.groupBy');

    // Now create query according to received configration
    $rows = DB::table($table);
    if ($filters) {
        foreach ($filters_query as $v) {
            $_table = $table;
            if($r->has('config.joins')){
                $joins = $r->input('config.joins');
                foreach($joins as $_join){
                    $fField = $_join['fField'];
                    foreach($fField as $field){
                        if( (is_array($field) && $v[0] == $field[1]) || $v[0] ==  $field ){
                            $_table = is_array($_join['fTable']) ? $_join['fTable'][1] : $_join['fTable'];
                            if(is_array($field)) $v[0] = $field[0];
                            break;
                        }
                    }
                }
            }

            if (is_array($v[2]) && $v[1] == "in") {
                $rows = $rows->whereIn($v[0], $v[2]);
            } elseif ($v[1] == "between") {
                $rows = $rows->whereBetween($_table . '.' . $v[0], $v[2]);
            } elseif ($v[1] == "lessthan") {
                $rows = $rows->where($_table . '.' . $v[0], '<', $v[2]);
            } else {
                $rows = $rows->where($_table . '.' . $v[0], $v[1], $v[2]);
            }
        }
    }

    if ($groupBy) {
        $rows = $rows->groupBy($groupBy);
    }

    if ($limit) {
        $rows = $rows->take($limit);
    }

    if ($skip) {
        $rows = $rows->skip($skip);
    }

    $rows = $rows->orderBy($sortBy, $sortType);

    //jaman
    if($r->has("config.joins")){
        $joins = $r->input("config.joins");
        $rows->select($table . '.*');
        foreach($joins as $_join){
            
            if(is_array($_join['fTable'])){
                $fTable1 = $_join['fTable'][0];
                $fTable2 = $_join['fTable'][1];
            }else{
                $fTable1 = $table;
                $fTable2 = $_join['fTable'];
            }
            // if(is_array($_join['fKey'])){
            //     $fKey1   = $_join['fKey'][0];
            //     $fKey2   = $_join['fKey'][1];
            // }else{
            //     $fKey1   = $_join['fKey'];
            //     $fKey2   = "id";
            // }
            $fField = $_join['fField'];

            // $rows = $rows->leftJoin($fTable2, $fTable1 . '.' . $fKey1, '=', $fTable2 . '.'.$fKey2);

            $rows = $rows->leftJoin($fTable2, function($join) use (&$_join, &$fTable1, &$fTable2){
                if(is_array($_join['fKey'])){
                    if(is_array($_join['fKey'][0])){
                        foreach($_join['fKey'] as $__join){
                            $fKey1   = is_array($__join[0]) ? DB::raw($__join[0][0]) : $fTable1 . '.' . $__join[0];
                            $fKey2   = is_array($__join[1]) ? DB::raw($__join[1][0]) : $fTable2 . '.' . $__join[1];
                            
                            $join->on($fKey1, '=', $fKey2);
                        }
                    }else{
                        $fKey1   = $_join['fKey'][0];
                        $fKey2   = $_join['fKey'][1];
                        $join->on($fTable1 . '.' . $fKey1, '=', $fTable2 . '.'.$fKey2);
                    }
                }else{
                    $fKey1   = $_join['fKey'];
                    $fKey2   = "id";
                    $join->on($fTable1 . '.' . $fKey1, '=', $fTable2 . '.'.$fKey2);
                }
            });
            foreach ($fField as $v) {
                if(is_array($v)){
                    $rows = $rows->selectRaw("`".$fTable2 . '`.`' . $v[0]."` AS `".$v[1]."`");
                }else{
                    $rows = $rows->addSelect($fTable2 . '.' . $v);
                }
            }
        }
    }
    if ($join) {
        $fTable = $join['fTable'];
        $fKey   = $join['fKey'];
        $fField = isset($join['fField']) ? $join['fField'] : null;

        // $pKey = ($join['pKey']) ? $join['pKey'] : 'id';

        // fetch multiple field from fTable
        if (is_array($fField)) {
            $rows = $rows->leftJoin($fTable, $table . '.' . $fKey, '=', $fTable . '.id')
                ->select($table . '.*');
            foreach ($fField as $v) {
                $rows = $rows->addSelect($fTable . '.' . $v);
            }
        } else {
            $rows = $rows->leftJoin($fTable, $table . '.' . $fKey, '=', $fTable . '.id')
                ->select($table . '.*', $fTable . '.' . $fField);
        }
    }
    $rows = $rows->get();

    $tot = DB::table($table);
    if($r->has("config.joins")){
        $joins = $r->input("config.joins");
        foreach($joins as $_join){
            if(is_array($_join['fTable'])){
                $fTable1 = $_join['fTable'][0];
                $fTable2 = $_join['fTable'][1];
            }else{
                $fTable1 = $table;
                $fTable2 = $_join['fTable'];
            }
            // if(is_array($_join['fKey'])){
            //     $fKey1   = $_join['fKey'][0];
            //     $fKey2   = $_join['fKey'][1];
            // }else{
            //     $fKey1   = $_join['fKey'];
            //     $fKey2   = "id";
            // }
            // $tot = $tot->leftJoin($fTable2, $fTable1 . '.' . $fKey1, '=', $fTable2 . '.'.$fKey2);
            $tot = $tot->leftJoin($fTable2, function($join) use (&$_join, &$fTable1, &$fTable2){
                if(is_array($_join['fKey'])){
                    if(is_array($_join['fKey'][0])){
                        foreach($_join['fKey'] as $__join){
                            $fKey1   = is_array($__join[0]) ? DB::raw($__join[0][0]) : $fTable1 . '.' . $__join[0];
                            $fKey2   = is_array($__join[1]) ? DB::raw($__join[1][0]) : $fTable2 . '.' . $__join[1];
                            
                            $join->on($fKey1, '=', $fKey2);
                        }
                    }else{
                        $fKey1   = $_join['fKey'][0];
                        $fKey2   = $_join['fKey'][1];
                        $join->on($fTable1 . '.' . $fKey1, '=', $fTable2 . '.'.$fKey2);
                    }
                }else{
                    $fKey1   = $_join['fKey'];
                    $fKey2   = "id";
                    $join->on($fTable1 . '.' . $fKey1, '=', $fTable2 . '.'.$fKey2);
                }
            });
        }
    }
    if ($filters) {
        foreach ($filters_query as $v) {
            $_table = $table;
            if($r->has('config.joins')){
                $joins = $r->input('config.joins');
                foreach($joins as $_join){
                    $fField = $_join['fField'];
                    foreach($fField as $field){
                        if( (is_array($field) && $v[0] == $field[1]) || $v[0] ==  $field ){
                            $_table = is_array($_join['fTable']) ? $_join['fTable'][1] : $_join['fTable'];
                            if(is_array($field)) $v[0] = $field[0];
                            break;
                        }
                    }
                }
            }
            if (is_array($v[2]) && $v[1] == "in") {
                $tot = $tot->whereIn($v[0], $v[2]);
            } elseif ($v[1] == "between") {
                $tot = $tot->whereBetween($_table . '.' . $v[0], $v[2]);
            } elseif ($v[1] == "lessthan") {
                $tot = $tot->where($_table . '.' . $v[0], '<=', $v[2]);
            } else {
                $tot = $tot->where($_table . '.' . $v[0], $v[1], $v[2]);
            }
        }
    }
    $total = $tot->count();

    $out = ["rows" => $rows, "total" => $total];
    if($r->has("config.aggregates")){
        $inAggregates = $r->input("config.aggregates");
        $outAggregates = [];

        foreach($inAggregates as $v){
            $a=0;
            if($v[0] == 'sum'){
                $a = $tot->sum($v[1]);
            }else{
                continue;
            }
            if(array_key_exists('2', $v)){
                $outAggregates[$v[2]] = $a;
            }else{
                $outAggregates[$v[1]] = $a;
            }
        }

        $out['aggregates'] = $outAggregates;
    }

    return $out;
}
function managePages($r, $table, $join = null)
{

    $skip  = 0;
    $limit = $r->input('config.limit') ? $r->input('config.limit') : null;

    $skip = $r->input('config.offset') ? $r->input('config.offset') : null;

    $sortBy = $r->input('config.sort.sortBy') ? $r->input('config.sort.sortBy') : 'id';

    $sortType = ($r->input('config.sort.sortType') == 1) ? 'asc' : 'desc';

    // extract filters
    $filters      = $r->input('config.filters');
    $filter_query = null;
    if ($filters) {
        $filters = json_encode($filters);
        $filters = json_decode($filters, true);
        foreach ($filters as $col => $obj) {
            $wCard = ($obj['matchMode'] == "like") ? "%" : "";
            if (is_array($obj['value'])) {
                $filters_query[] = [
                    $col,
                    $obj['matchMode'],
                    $obj['value'],
                ];
            } else {
                $filters_query[] = [$col, $obj['matchMode'], $wCard . $obj['value'] . $wCard];
            }

        }
        // return $filters_query;
    }

    $groupBy = $r->input('config.groupBy');

// Now create query according to received configration
    $rows = DB::table($table);
    if ($filters) {
        foreach ($filters_query as $v) {

            if (is_array($v[2]) && $v[1] == "in") {
                $rows = $rows->whereIn($v[0], $v[2]);
            } elseif ($v[1] == "between") {
                $rows = $rows->whereBetween($table . '.' . $v[0], $v[2]);
            } elseif ($v[1] == "lessthan") {
                $rows = $rows->where($table . '.' . $v[0], '<', $v[2]);
            } else {
                $rows = $rows->where($table . '.' . $v[0], $v[1], $v[2]);
            }
        }
    }

    if ($groupBy) {
        $rows = $rows->groupBy($groupBy);
    }

    if ($limit) {
        $rows = $rows->take($limit);
    }

    if ($skip) {
        $rows = $rows->skip($skip);
    }

    $rows = $rows->orderBy($sortBy, $sortType);

    if ($join) {
        $fTable = $join['fTable'];
        $fKey   = $join['fKey'];
        $fField = $join['fField'];

        // $pKey = ($join['pKey']) ? $join['pKey'] : 'id';

        // fetch multiple field from fTable
        if (is_array($fField)) {
            $rows = $rows->leftJoin($fTable, $table . '.' . $fKey, '=', $fTable . '.id')
                ->select($table . '.*');
            foreach ($fField as $v) {
                $rows = $rows->addSelect($fTable . '.' . $v);
            }
        } else {
            $rows = $rows->leftJoin($fTable, $table . '.' . $fKey, '=', $fTable . '.id')
                ->select($table . '.*', $fTable . '.' . $fField);
        }
    }
    $rows = $rows->get();
    $tot  = DB::table($table);
    if ($filters) {
        foreach ($filters_query as $v) {
            if (is_array($v[2]) && $v[1] == "in") {
                $tot = $tot->whereIn($v[0], $v[2]);
            } elseif ($v[1] == "between") {
                $tot = $tot->whereBetween($table . '.' . $v[0], $v[2]);
            } elseif ($v[1] == "lessthan") {
                $tot = $tot->where($table . '.' . $v[0], '<=', $v[2]);
            } else {
                $tot = $tot->where($table . '.' . $v[0], $v[1], $v[2]);
            }
        }
    }
    $tot = $tot->orderBy($sortBy, $sortType)
        ->count();

    return ["rows" => $rows, "total" => $tot];

}

function filter($val)
{
    if ($val) {
        return $val;
    }

}
