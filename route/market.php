<?php

use \think\facade\Config;


/**
 * 营销推广模块
 */
Route::group('market', function () {

})->middleware('Authlogin');



/**
 * 营销推广模块 - 优惠卷
 */
Route::group('car', function () {
    //车辆列表
    Route::rule('car_list', 'manage/car/device_list');

    //kaiche
    Route::rule('car_start/id/:id', 'manage/car/car_start');

    Route::rule('endCar/id/:id', 'manage/car/endCar');

    Route::rule('carOpen/id/:id', 'manage/car/carOpen');

    Route::rule('speak/id/:id', 'manage/car/speak');


    //车辆列表
    Route::rule('car_del/id/:id', 'manage/car/car_del');
    //车辆上线
    Route::rule('car_online/id/:id', 'manage/car/car_online');
    //车辆下线
    Route::rule('car_online_no/id/:id', 'manage/car/car_online_no');
    //故障列表
    Route::rule('report_list', 'manage/car/report_list');
    //故障处理
    Route::rule('report_update/id/:id', 'manage/car/report_update');
    //故障处理
    Route::rule('report_update_batch/id/:id', 'manage/car/report_update_batch');
    //活动
    Route::rule('promotions_list', 'manage/Promotions/promotions_list');

    //活动
    Route::rule('promotions_freeze/id/:id', 'manage/Promotions/promotions_freeze');
    //活动
    Route::rule('promotions_freeze_batch/id/:id', 'manage/Promotions/promotions_freeze_batch');
    //活动
    Route::rule('promotions_del/id/:id', 'manage/Promotions/promotions_del');
    Route::rule('promotions_add', 'manage/Promotions/promotions_add');
    Route::rule('promotions_add_batch', 'manage/Promotions/promotions_add_batch');
    //换车点
    Route::rule('malfunction', 'manage/Promotions/malfunction');//
    Route::rule('car_failure', 'manage/Promotions/car_failure');
    Route::rule('car_failure_del/id/:id', 'manage/Promotions/car_failure_del');
     Route::rule('car_order_list/id/:id', 'manage/car/car_order_list');
    Route::rule('car_add', 'manage/car/car_add');
})->middleware('Authlogin');

  








