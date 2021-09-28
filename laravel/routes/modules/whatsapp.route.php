<?php

Route::post('marketing/patient-message', 'WhatsAppController@patientMessage');
Route::post('marketing/doctor-message', 'WhatsAppController@doctorMessage');
Route::post('marketing/opd-doctor-message', 'WhatsAppController@opdDoctorMessage');
Route::post('marketing/agent-message', 'WhatsAppController@agentMessage');
Route::post('marketing/cc-customer-message', 'WhatsAppController@ccCustomerMessage');
