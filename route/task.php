<?php

//首页
Route::rule('/','index/index/index');
/**
 * 后台管理 - 网站设置
 */

Route::group('website', function () {
    /**
     * banner
     */
    //banner 列表del
    Route::rule('athou', 'manage/Athou/athou_list');
    Route::rule('athou_add', 'manage/Athou/athou_update');
    Route::rule('athou_update_batch', 'manage/Athou/athou_update_batch');
    Route::rule('del/id/:id', 'manage/Athou/del');
})->middleware('Authlogin');
?>