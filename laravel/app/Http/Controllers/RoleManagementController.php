<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class RoleManagementController extends Controller {
    public function fetchUsers(Request $r){
        config()->set('database.connections.mysql.database', 'lab_users');
        DB::purge('mysql');
        
        $id = $r->user()->id;
        $result = DB::table("users")->where("centre_id", $id)->get();

        return $result;
    }
    public function saveUser(Request $r){
        config()->set('database.connections.mysql.database', 'lab_users');
        DB::purge('mysql');
        
        $data = $r->except('token');
        if(array_key_exists('password', $data)) $data['password'] = bcrypt($data['password']);

        $muser = $r->user();
        $data['centre_id'] = $muser->id;
        $data['center_name'] = $muser->center_name;
        $data['modules'] = $muser->modules;
        $data['center_mobile'] = $muser->center_mobile;
        $data['center_city'] = $muser->center_city;
        $data['center_address'] = $muser->center_address;
        $data['db'] = $muser->db;
        $data['centre_admin_id'] = $muser->centre_admin_id;

        DB::table("users")->where("id", $data)->update($data);

        return ['success'=>true];
    }
    public function saveNewUser(Request $r){
        config()->set('database.connections.mysql.database', 'lab_users');
        DB::purge('mysql');
        
        $data = $r->except('token');
        $data['password'] = bcrypt($data['password']);

        $muser = $r->user();
        $data['centre_id'] = $muser->id;
        $data['center_name'] = $muser->center_name;
        $data['modules'] = $muser->modules;
        $data['center_mobile'] = $muser->center_mobile;
        $data['center_city'] = $muser->center_city;
        $data['center_address'] = $muser->center_address;
        $data['db'] = $muser->db;
        $data['centre_admin_id'] = $muser->centre_admin_id;

        DB::table("users")->insertGetId($data);

        return ['success'=>true];
    }
    public function deleteUser(Request $r){
        config()->set('database.connections.mysql.database', 'lab_users');
        DB::purge('mysql');
        
        $data = $r->except('token');
        $result = DB::table("users")->where("id", $data['id'])->delete();

        return ['success'=>true];
    }
}
