<?php


/**
 * 分页头部
 */
function sys_page_header($request_array){
    $page_num = 0;  //当前页码
    $per_page = 10; //每页显示数量
    $total_num  = 0;   //总数量
    $current_page  = 1;  //当前页
    $total_page  = 1;   //总页数

    if(isset($request_array['per_page']) && !empty($request_array['per_page'])){
        $per_page = $request_array['per_page'];
    }
    if(isset($request_array['page_num']) && !empty($request_array['page_num'])){
        $current_page = $request_array['page_num'];
        $page_num = ($request_array['page_num'] - 1) * $per_page; 
    }

    
    $data = array(
        'page_num'=>$page_num,
        'per_page'=>$per_page,
        'total_num'=>$total_num,
        'current_page'=>$current_page,
        'total_page'=>$total_page, 
    );
    return $data;

}

