<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/12/13
 * Time: 14:35
 */

namespace app\manage\controller;


class Service extends Base
{
    //维修列表
    public function service_list(){
        $list=db('change')->where('is_delete',1)->select();
        $lists=db('malfunction_order')->where('is_delete',1)->select();
        $car_id='';
        foreach($list  as $k=>$v){

            $car_id.= $v['car_id'] . ',';
        }
        $car_ids='';
        foreach($lists  as $k=>$v){

            $car_ids.= $v['car_id'] . ',';
        }
        $carId=$car_ids.$car_id;
        $car_lsit=db('car')->where(array('car_id'=>$carId))->field('car_coding,car_id')->select();
        $arra=array();
        foreach($car_lsit as $k=>$v){
            $v['service']=0;
            $v['service1']=0;
            $a=1;
            foreach($lists  as $kk=>$vv){
                if($vv['car_id']==$v['car_id']){
                    $v['service']=$a;
                    $a++;

                }

            }
            $a1=1;
            foreach($list  as $kk=>$vv){
                if($vv['car_id']==$v['car_id']){
                    $v['service1']=$a1;
                    $a1++;
                }
            }
            $arra[$k]=$v;

        }
        $this->assign('list',$arra);
        return $this->fetch('service/service_list');
    }

}