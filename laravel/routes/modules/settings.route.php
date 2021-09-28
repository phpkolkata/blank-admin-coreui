<?php
// =========Discount Cause=============
Route::post('settings/discount-cause/fetch', 'TableController@fetchTable');
Route::post('settings/discount-cause/add', 'TableController@addTable');
Route::post('settings/discount-cause/update/{id}', 'TableController@updateTable');
Route::get('settings/discount-cause/delete/{id}', 'TableController@deleteTable');

// ===========Service Charge=============
Route::post('settings/service-charge/fetch', 'TableController@fetchTable');
Route::post('settings/service-charge/add', 'TableController@addTable');
Route::post('settings/service-charge/update/{id}', 'TableController@updateTable');
Route::get('settings/service-charge/delete/{id}', 'TableController@deleteTable');

//===============Payment Mode============
Route::post('settings/payment-mode/fetch', 'TableController@fetchTable');
Route::post('settings/payment-mode/add', 'TableController@addTable');
Route::post('settings/payment-mode/update/{id}', 'TableController@updateTable');
Route::get('settings/payment-mode/delete/{id}', 'TableController@deleteTable');

//===============Test Units============
Route::post('settings/test-units/fetch', 'TableController@fetchTable');
Route::post('settings/test-units/add', 'TableController@addTable');
Route::post('settings/test-units/update/{id}', 'TableController@updateTable');
Route::get('settings/test-units/delete/{id}', 'TableController@deleteTable');

// ======================Manage Center====================
Route::post('settings/center/fetch', 'TableController@fetchTable');
Route::post('settings/center/update/{id}', 'SettingsController@updateCenter');


// ======================Role Management====================

Route::post('settings/role-management/fetch-users', 'RoleManagementController@fetchUsers');
Route::post('settings/role-management/save-user', 'RoleManagementController@saveUser');
Route::post('settings/role-management/save-new-user', 'RoleManagementController@saveNewUser');
Route::post('settings/role-management/delete-user', 'RoleManagementController@deleteUser');