<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/25 0025
 * Time: 16:37
 */
namespace app\manage\presenter;
class Obtain
{
    /**
     * @param $list 原始数组
     * @param $arr 查询的值
     * @param $where 条件
     * @param $table 数据表
     * @param $arra 改变的值
     */
        public static  function obtain($list,$arr,$where,$table,$arra,$condition){
            $arra_string=explode(',',$arr);
            $province=db($table)->where($where)->field($arra_string)->select();
            $array=array();
            foreach ($list as $k => $v) {
                for($i=0;$i<count($arra),$i++;){
                    $v[$arra]='未知';
                }
//                $v['province_name']='未知';
//                $v['city_name']='未知';
//                $v['qu_name']='未知';
                foreach ($province as $key => $value) {
                    if ($value['id'] == $v['province_id']) {
                        $v['province_name'] = $value['name'];
                    }
                    if ($value['id'] == $v['city_id']) {
                        $v['city_name'] = $value['name'];
                    }
                    if ($value['id'] == $v['qu_id']) {
                        $v['qu_name'] = $value['name'];
                    }
                }
                if ($v['default_status'] == 1) {
                    $v['default_status'] = '否';
                } else {
                    $v['default_status'] = '是';
                }
                $array[$k] = $v;

            }
            return $array;
        }
}