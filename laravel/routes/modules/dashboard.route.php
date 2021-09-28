<?php

Route::post('dashboard/count-male-patient-by-date', 'DashboardController@countMalePatient');
Route::post('dashboard/count-female-patient-by-date', 'DashboardController@countFemalePatient');
Route::post('dashboard/count-discount-bill-by-date', 'DashboardController@countDiscountBill');
Route::post('dashboard/count-dues-bill-by-date', 'DashboardController@countDuesBill');

Route::post('dashboard/reset-password', 'DashboardController@resetPassword');


Route::post('dashboard/todolist/add', 'DashboardController@addTodoList');
Route::post('dashboard/todolist/delete', 'DashboardController@deleteTodoList');
Route::post('dashboard/todolist/fetch', 'DashboardController@fetchTodoList');
Route::post('dashboard/fetch-center', 'DashboardController@fetchCenter');


Route::post('dashboard/fetch-patient-billing-graph-data', 'DashboardController@fetchPatientBillingGraphData');
Route::post('dashboard/fetch-credit-billing-graph-data', 'DashboardController@fetchCreditBillingGraphData');
Route::post('dashboard/fetch-opd-billing-graph-data', 'DashboardController@fetchOPDBillingGraphData');
Route::post('dashboard/fetch-account-graph-data', 'DashboardController@fetchAccountGraphData');

