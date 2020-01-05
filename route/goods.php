<?php

use \think\facade\Config;


/**
 * 商品模块
 */
Route::group('goods', function () {
    //商品分类列表->ok
    Route::rule('cate_list', 'manage/goods/cate_list');
    //修改分类显示->ok
    Route::rule('cate_is_show', 'manage/goods/cate_is_show');
    //修改分类名称->ok
    Route::rule('cate_update_batch', 'manage/goods/cate_update_batch');
    //商品分类添加->ok
    Route::rule('cate_add', 'manage/goods/cate_add');
//    //商品分类添加提交
//    Route::rule('cate_add_send', 'manage/goods/cate_add_send');
//    //商品分类修改
//    Route::rule('cate_edite', 'manage/goods/cate_edite');
//    //商品分类修改提交
//    Route::rule('cate_edite_send', 'manage/goods/cate_edite_send');
    //商品分类删除->ok
    Route::rule('cate_del', 'manage/goods/cate_del');
    //商品列表->ok
    Route::rule('goods_list', 'manage/goods/goods_list');
    //商品详情->ok
    Route::rule('goods_info/id/:id', 'manage/goods/goods_info');
    //商品添加->ok
    Route::rule('goods_add', 'manage/goods/goods_add');
    //分类联动->ok
    Route::rule('cate_tow', 'manage/goods/cate_tow');
    //课程联动->ok
    Route::rule('goods_type', 'manage/goods/goods_type');
    //商品添加提交->ok
    Route::rule('goods_add_batch', 'manage/goods/goods_add_batch');
    //商品修改页面->ok
    Route::rule('goods_update/id/:id', 'manage/goods/goods_update');
    //商品页面修改提交->ok
    Route::rule('goods_update_batch', 'manage/goods/goods_update_batch');
    //用户删除->ok
    Route::rule('goods_del', 'manage/goods/goods_del');
    //用户批量删除->ok
    Route::rule('goods_del_batch', 'manage/goods/goods_del_batch');
})->middleware('Authlogin');










