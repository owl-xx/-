<?php

use \think\facade\Config;


/**
 * 后台管理 - 用户模块
 */

Route::group('user', function () {
    /**
     * 用户管理
     */
    //用户列表
    //send_info

    Route::rule('send_info/id/:id', 'manage/Announcement/send_info');
    Route::rule('user_list', 'manage/user/user_list');
    //用户详情
    Route::rule('user_info/id/:id', 'manage/user/user_info');//
    //用户实名认证
    Route::rule('user_real', 'manage/user/user_real');
    //用户修改->ok
    Route::rule('user_update/id/:id', 'manage/user/user_update');
    //用户修改提交->ok
    Route::rule('user_update_send', 'manage/user/user_update_send');
    //批量用户删除->ok
    Route::rule('user_del_batch', 'manage/user/user_del_batch');
    //单个用户删除->ok
    Route::rule('user_del/id/:id', 'manage/user/user_del');
    //用户批量禁用->ok
    Route::rule('user_disable_batch', 'manage/user/user_disable_batch');
    //单个用户禁用->ok
    Route::rule('user_disable/id/:id', 'manage/user/user_disable');
    //批量启用->ok
    Route::rule('user_enable_batch', 'manage/user/user_enable_batch');
    //单个启用->ok
    Route::rule('user_enable/id/:id', 'manage/user/user_enable');

    //用户关注店铺->ok
    Route::rule('follow_list', 'manage/user/follow_list');
    //用户评论商品列表->ok
    Route::rule('comment_list', 'manage/user/comment_list');

    //收货地址列表->ok
    Route::rule('address_list', 'manage/uaddress/address_list');
    //收货地址列表修改输出->ok
    Route::rule('address_update/id/:id', 'manage/uaddress/address_update');
    //收货地址详情输出->ok
    Route::rule('address_info/id/:id', 'manage/uaddress/address_info');
    //省份联动->ok
    Route::rule('address_linkage_noe', 'manage/uaddress/address_linkage_noe');
    //收货地址修改->ok
    Route::rule('address_update_send', 'manage/uaddress/address_update_send');
    //收货地址删除->ok
    Route::rule('address_del/id/:id', 'manage/uaddress/address_del');
    //收货地址批量删除->ok
     Route::rule('address_del_batch', 'manage/uaddress/address_del_batch');

    //用户购买的课程列表->
    Route::rule('course_list', 'manage/course/course_list');
    //户购买的课程详情->ok
    Route::rule('order_info/id/:id', 'manage/course/order_info');
    //户购买的课程单个删除->ok
    Route::rule('course_del/id/:id', 'manage/course/course_del');
    //户购买的课程批量删除->ok
    Route::rule('course_del_batch', 'manage/course/course_del_batch');

//维修人员列表
    Route::rule('personnel_list', 'manage/personnel/personnel_list');
    Route::rule('personnel_add', 'manage/personnel/personnel_add');
    //
    Route::rule('del/id/:id', 'manage/personnel/del');
   Route::rule('rabsa/id/:id', 'manage/personnel/rabsa');
    Route::rule('rabs/id/:id', 'manage/personnel/rabs');
     Route::rule('admin_user_update', 'manage/user/admin_user_update');
      Route::rule('user_che', 'manage/user/user_che');
})->middleware('Authlogin');







/**
 * 后台管理 - 商家模块
 */

Route::group('store', function () {
    //商家入驻申请列表->ok
    Route::rule('apply_list', 'manage/store/apply_list');
    //商家入驻申请： 同意->ok
    Route::rule('apply_agree', 'manage/store/apply_agree');
    //商家入驻申请： 拒绝->ok
    Route::rule('apply_refuse', 'manage/store/apply_refuse');
    //商家入驻申请： 同意批量->ok
    Route::rule('rapply_agree_batch', 'manage/store/rapply_agree_batch');
    //商家入驻申请： 拒绝批量->ok
    Route::rule('apply_refuse_batch', 'manage/store/apply_refuse_batch');
    //店铺列表->ok
    Route::rule('store_list', 'manage/store/store_list');
    //店铺详情 ->ok
    Route::rule('store_list_batch/id/:id', 'manage/store/store_list_batch');
    //老师列表->ok
    Route::rule('teacher_list', 'manage/store/teacher_list');
    //店铺行业列表(一级级分类)->ok
    Route::rule('trade_list', 'manage/store/trade_list');
    //店铺一级行业修改->ok
    Route::rule('trade_update', 'manage/store/trade_update');
   //店铺一级行业删除->ok
    Route::rule('trade_del_noe', 'manage/store/trade_del_noe');
    //店铺一级行业增加->ok
    Route::rule('trade_add_noe', 'manage/store/trade_add_noe');
    //店铺行业列表(二级级分类)->ok
    Route::rule('trade_list_batch/id/:id', 'manage/store/trade_list_batch');
    //
    //店铺行业列表(二级级分类)->ok
    Route::rule('apply_info/id/:id', 'manage/store/apply_info');
    //
    Route::rule('store_update/id/:id', 'manage/store/store_update');
    //修改提交
    Route::rule('store_update_tch', 'manage/store/store_update_tch');
    //老师列表显示
    Route::rule('teacher_update/id/:id', 'manage/store/teacher_update');
    //老师列表提交
    Route::rule('teacher_update_send', 'manage/store/teacher_update_send');
//    //行业添加
//    Route::rule('trade_add', 'manage/store/trade_add');
//    //行业添加提交
//    Route::rule('trade_add_send', 'manage/store/trade_add_send');
//    //行业修改
//    Route::rule('trade_edite', 'manage/store/trade_edite');
//    //行业修改提交
//    Route::rule('trade_edite_send', 'manage/store/trade_edite_send');
//    //行业删除
//    Route::rule('trade_del', 'manage/store/trade_del');

})->middleware('Authlogin');


/**
 * 后台管理 - 商家模块
 */

Route::group('bank', function () {
    //商家入驻申请列表->ok
    Route::rule('bank_car_list', 'manage/bank/bank_car_list');
    Route::rule('bank_car_add', 'manage/bank/bank_car_add');
    Route::rule('bank_car_add_send', 'manage/bank/bank_car_add_send');
    Route::rule('bank_car_update/id/:id', 'manage/bank/bank_car_update');
    Route::rule('bank_car_update_send', 'manage/bank/bank_car_update_send');
    Route::rule('bank_car_del/id/:id', 'manage/bank/bank_car_del');
})->middleware('Authlogin');


















