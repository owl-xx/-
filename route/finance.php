<?php

use \think\facade\Config;


/**
 * 财务模块
 */
Route::group('finance', function () {
    //代理商列表->ok
    Route::rule('workbench_list', 'manage/workbench/workbench_list');
     //代理商修改
    Route::rule('workbench_edit/id/:id',            'manage/workbench/workbench_edit');
    //代理商提交
    Route::rule('workbench_commit',                 'manage/workbench/workbench_commit');
    //代理商删除
    Route::rule('workbench_del/id/:id', 'manage/workbench/workbench_del');
    //代理商详情
    Route::rule('workbench_info/id/:id', 'manage/workbench/workbench_info');
    //代理商封号
    Route::rule('workbench_freeze/id/:id', 'manage/workbench/workbench_freeze');
    //代理商解冻
    Route::rule('workbench_freeze_batch/id/:id', 'manage/workbench/workbench_freeze_batch');//
    //代办事项列表
    Route::rule('car_malfunction_list', 'manage/workbench/car_malfunction_list');
    //代办事项详情
    Route::rule('car_malfunction_list_gz/id/:id', 'manage/workbench/car_malfunction_list_gz');//
    //车子列表
    Route::rule('car_list/id/:id', 'manage/workbench/car_list');
    //车子详情
    Route::rule('car_info/id/:id', 'manage/workbench/car_info');
    //时间详情
    Route::rule('event_list', 'manage/workbench/event_list');
})->middleware('Authlogin');










