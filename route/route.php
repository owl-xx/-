<?php

use \think\facade\Config;

//定时任务
include_once("task.php");
//用户模块&商家模块
include_once("user.php");
//商品模块
include_once("goods.php");
//订单模块
include_once("order.php");
//财务模块
include_once("finance.php");
//还车点和资金管理模块
include_once("car.php");
//营销推广模块
include_once("market.php");

//全局miss路由
Route::miss('index/error/miss');

//验证码
Route::get('verify', 'manage/api/verify');


//首页
Route::get('/', 'manage/index/index')->middleware('Authlogin');

//登录
Route::get('login', 'manage/login/index');
Route::post('login_send', 'manage/login/login_send');
Route::get('logout', 'manage/login/logout');

/**
 * 后台管理
 */
Route::group('admin', function () {
    //首页
    Route::rule('index', 'manage/index/index');
    //iframe主页面
    Route::rule('main', 'manage/index/main');



    /**
     * 管理员管理 - 暂时不做
     */


    //用户列表
    Route::rule('user', 'manage/user/userList');
    //个用户修改
    Route::rule('userupdate/id/:id', 'manage/user/userupdate');
    //编辑输出
    Route::rule('userupdatea', 'manage/user/userupdatea');
    //批量用户删除
    Route::rule('userdelall', 'manage/user/userdelall');
    //用户批量禁用
    Route::rule('userupdateall', 'manage/user/userupdateall');
    //单个用户删除
    Route::rule('del/id/:id', 'manage/user/del');
    //单个用户禁用
    Route::rule('Disable/id/:id', 'manage/user/Disable');
    //批量启用
    Route::rule('Enable', 'manage/user/Enable');
    //当个启用
    Route::rule('Enablenoe/id/:id', 'manage/user/Enablenoe');
})->middleware('Authlogin');

















