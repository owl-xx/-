<?php
use \think\facade\Config;

Route::group('returncar', function () {
    //还车点->ok
    Route::rule('returncar_car', 'manage/returncar/returncar_car');
    Route::rule('returncar_info/id/:id', 'manage/returncar/returncar_info');
    Route::rule('returncar_add', 'manage/returncar/returncar_add');
    Route::rule('returncar_add_batch', 'manage/returncar/returncar_add_batch');
    Route::rule('returncar_delete/id/:id', 'manage/returncar/returncar_delete');
     Route::rule('returncar_info_delete/id/:id', 'manage/returncar/returncar_info_delete');

    Route::rule('returncar_updele/id/:id', 'manage/returncar/returncar_updele');
    Route::rule('returncar_updele_batch', 'manage/returncar/returncar_updele_batch');
     Route::rule('return_info_list', 'manage/returncar/return_info_list');
     //电子围栏编辑
    Route::rule('return_info_edit/id/:id','manage/returncar/return_info_edit');
    //电子围栏编辑提交
    Route::rule('returncar_info_commit','manage/returncar/returncar_info_commit');
         Route::rule('returncar_info_add', 'manage/returncar/returncar_info_add');
})->middleware('Authlogin');

Route::group('recharge', function () {
    //资金管理->ok
    //充值设置
    Route::rule('card_list', 'manage/recharge/card_list');
    Route::rule('card_add', 'manage/recharge/card_add');
    Route::rule('card_add_batch', 'manage/recharge/card_add_batch');
    Route::rule('card_updele/id/:id', 'manage/recharge/card_updele');
    Route::rule('card_updele_batch', 'manage/recharge/card_updele_batch');
    Route::rule('card_delete/id/:id', 'manage/recharge/card_delete');
    //骑行卡设置
    Route::rule('recharge_list', 'manage/recharge/recharge_list');
    Route::rule('recharge_add', 'manage/recharge/recharge_add');
    Route::rule('recharge_add_batch', 'manage/recharge/recharge_add_batch');
    Route::rule('recharge_updele/id/:id', 'manage/recharge/recharge_updele');
    Route::rule('recharge_updele_batch', 'manage/recharge/recharge_updele_batch');
    Route::rule('recharge_delete/id/:id', 'manage/recharge/recharge_delete');
     Route::rule('car_price_add', 'manage/recharge/car_price_add');
    Route::rule('car_price_update/id/:id', 'manage/recharge/car_price_update');
      Route::rule('car_price_del/id/:id', 'manage/recharge/car_price_del');
    Route::rule('car_price_update_batch', 'manage/recharge/car_price_update_batch');
    //充值明细
    Route::rule('recharge', 'manage/recharge/recharge');
    //骑行收费
    Route::rule('car_price', 'manage/recharge/car_price');
    //骑行卡明细
    Route::rule('recharge', 'manage/recharge/recharge');
    //收费明细
    Route::rule('detail', 'manage/recharge/detail');
    //罚款规则
    Route::rule('setting', 'manage/recharge/setting');
    Route::rule('setting_add', 'manage/recharge/setting_add');
    Route::rule('setting_add_batch', 'manage/recharge/setting_add_batch');
    Route::rule('setting_updele/id/:id', 'manage/recharge/setting_updele');
    Route::rule('setting_updele_batch', 'manage/recharge/setting_updele_batch');
    Route::rule('setting_delete/id/:id', 'manage/recharge/setting_delete');
    //罚款明细
    Route::rule('setting_list', 'manage/recharge/setting_list');

    //代理商添加
    Route::rule('workbench_add', 'manage/workbench/workbench_add');
    //维修进度
    Route::rule('service_list', 'manage/service/service_list');

})->middleware('Authlogin');