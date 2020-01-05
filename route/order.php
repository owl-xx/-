<?php

use \think\facade\Config;


/**
 * 订单模块
 */
Route::group('order', function () {
    //订单列表->ok
    Route::rule('record_list', 'manage/order/record');
    Route::rule('sms', 'manage/order/sms');
    Route::rule('record_del/id/:id', 'manage/order/record_del');
    Route::rule('sms_del/id/:id', 'manage/order/sms_del');
   //    Route::rule('rental', 'manage/order/rental');
    Route::rule('real','manage/order/real');//免押金卡
    Route::rule('real_edit/id/:id','manage/order/real_edit');//免押金卡编辑
    Route::rule('real_edit_bath','manage/order/real_edit_bath');//免押金 卡提交
    Route::rule('order_list', 'manage/order/order_list');
     Route::rule('order_del_s/id/:id', 'manage/order/order_del_s');
    //充值
//     Route::rule('recharge_list', 'manage/recharge/recharge_list');

})->middleware('Authlogin');

Route::group('announcement', function () {
    //公告列表->ok
    Route::rule('announcement_list', 'manage/announcement/announcement_list');
    Route::rule('announcement_add', 'manage/announcement/announcement_add');
    Route::rule('announcement_add_batech', 'manage/announcement/announcement_add_batech');

    Route::rule('announcement_update/id/:id', 'manage/announcement/announcement_update');
    Route::rule('announcement_update_batch/id/:id', 'manage/announcement/announcement_update_batch');
    Route::rule('announcement_del/id/:id', 'manage/announcement/announcement_del');
    //发送短信
    Route::rule('code_send', 'manage/announcement/code_send');
    Route::rule('code_add', 'manage/announcement/code_add');
    Route::rule('code_del/id/:id', 'manage/announcement/code_del');
    Route::rule('code_send_batch/id/:id', 'manage/announcement/code_send_batch');
})->middleware('Authlogin');





