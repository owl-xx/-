<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-01
 * Time: 17:39
 */

namespace app\manage\controller;


use think\facade\Request;
use app\manage\validate\Activity as ActivityValidate;
use app\manage\model\Validationmap;
use think\Db;
class Promotions extends Base
{
    //哈麻皮老温活动
    public function promotions_list(){
        $list = db('promotions')->paginate(20);
        $page = $list->render();
        $arr = '';//店铺
        foreach ($list as $k => $v) {
            if (!empty($v['store_id'])) {
                $arr .= $v['store_id'] . ',';
            }

        }
        $user_store = db('proxy')->where('id', 'in', $arr)->field('id,name')->select();
        $arra = array();
        foreach ($list as $k => $v) {
            $v['store_name'] = '暂无';
            if (!empty($v['store_id'])) {
                foreach ($user_store as $kk => $vv) {
                    if ($v['store_id'] == $vv['id']) {
                        $v['store_name'] = $vv['name'];
                    }
                }

            }
            $arra[$k] = $v;
        }
        // 模板变量赋值
        $this->assign('list', $arra);
        $this->assign('page', $page);

        return $this->fetch('promotions/promotions_list');

    }
    //代理商冻结
    public function promotions_freeze()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('promotions')->where(array('id' => $id))->update(array('state' =>2));
            if ($list) {
                return alert_success('已关闭', '/car/promotions_list');
            } else {
                return alert_error('关闭失败');
            }

        }
    }

    //代理商解冻
    public function promotions_freeze_batch()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('promotions')->where(array('id' => $id))->update(array('state' =>1));
            if ($list) {
                return alert_success('已开启', '/car/promotions_list');
            } else {
                return alert_error('开启失败');
            }

        }
    }
    //代理商删除
    public function  promotions_del()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');

            if (empty($id)) {
                return alert_error('参数错误');
            }

            // 启动事务
            $list = db('promotions')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/car/promotions_list');
            } else {
                return alert_error('删除失败');
            }

        }
    }
    public function promotions_add()
    {
        $store_id = session('store_id');
        if(empty($store_id)){
            $user_store = db('proxy')->field('id,name')->select();
        }else{
            $user_store = db('proxy')->where('id',$store_id)->field('id,name')->select();
        }

        $this->assign('list', $user_store);
        return $this->fetch('promotions/promotions_add');
    }
    public function promotions_add_batch(){
        $data=Request::param();
        $user_validata = new ActivityValidate;
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        $arr=array(
            'theme'=>$data['theme'],
            'content'=>$data['content'],
            'url'=>$data['url'],
            'start_time'=>strtotime($data['start_time']),
            'end_time'=>strtotime($data['end_time']),
            'store_id'=>$data['store_id'],
            'state'=>$data['state'],
        );
        $add=db('promotions')->insert($arr);
        if ($add) {
            return alert_success_parent('添加成功');
        } else {
            return alert_error('添加失败');
        }

    }
    //超出区域车辆
    public  function malfunction(){
        $store_id = session('store_id');
        if(empty($store_id)){
            $list_car=Db::table('d_car')->paginate(20);
        }else{
            $list_car=Db::table('d_car')->where('store_id',$store_id)->paginate(20);
        }


        $arr=array();
//        halt($list_car);
        $arra=array();
        $array_a=array();
            foreach($list_car as $k=>$v){
//                $i=0;
//                if(!empty($v['offline_location'])){
//                    $arr[$i++]=json_decode($v['location1'],true);
//                    $arr[$i++]=json_decode($v['location2'],true);
//                    $arr[$i++]=json_decode($v['location3'],true);
//                    $arr[$i++]=json_decode($v['location4'],true);
//                    $array=json_decode($v['offline_location'],true);
//                    validationMap::setCoordArray($arr);
//                    $false=validationMap::isCityCenter($array);
////                    dump($array);
//                    if($false){
//                        //在范围内
//                        $arra[$k]=$v;
//                    }else{
//                        //在范围外
//                        $array_a[$k]=$v;
//                    }
//                }
            if($v['is_beyond']==2){
                $array_a[$k]=$v;
            }else{
                $arra[$k]=$v;
            }
            }

        $a_car_list='';
            foreach($array_a as $k=>$v){
                $a_car_list.= $v['store_id'] . ',';
            }

        $proxy_list=db('proxy')->where('id', 'in', $a_car_list)->field('id,name')->select();

        $arra_cvarlist = array();
        foreach ($array_a as $k => $v) {
            $v['store_name'] = '暂无';
            if (!empty($v['store_id'])) {
                foreach ($proxy_list as $kk => $vv) {
                    if ($v['store_id'] == $vv['id']) {
                        $v['store_name'] = $vv['name'];
                    }
                }
            }
            $arra_cvarlist[$k] = $v;
        }

        $page = $list_car->render();
        $this->assign('list', array_values($arra_cvarlist));
        $this->assign('page', $page);
        return $this->fetch('promotions/malfunction_list');
    }
    //还车失败
    public function car_failure(){
        //开始查询订单还车失败的订单
        $list=db('return_car')->where(array('is_failure'=>2))->order('start_time desc')->paginate(20);
        $uid='';
        $car_id='';
        $store_id='';
        $order_id='';
        foreach($list as $k=>$v){
            $uid.= $v['uid'] . ',';
            $car_id.= $v['car_id'] . ',';
            $store_id.= $v['store_id'] . ',';
            $order_id.= $v['order_id'] . ',';
        }
        $order_id=db('order')->where('id','in',$order_id)->select();
        $user_id=db('user')->where('id','in',$uid)->select();
        $car_list=db('car')->where('car_id','in',$car_id)->select();
        $store_list=db('proxy')->where('id','in',$store_id)->select();
        $array=array();
        foreach($list as $k=>$v){
            $v['IMEI']='未知';
            $v['sver']='未知';
            $v['hver']='未知';
            $v['city']='未知';
            $v['iccid']='未知';
            $v['user_name']='未知';
            $v['store_name']='未知';
            $v['order_no']='未知';
            foreach($user_id as $kk=>$vv){
                    if($vv['id']==$v['uid']){
                        $v['user_name']=$vv['nickname'];
                    }
            }
            foreach($order_id as $kk=>$vv){
                if($vv['id']==$v['order_id']){
                    $v['order_no']=$vv['order_no'];
                }
            }
            foreach($car_list as $kk=>$vv){
                if($vv['car_id']==$v['car_id']){
                    $v['iccid']=$vv['iccid'];
                    $v['IMEI']=$vv['IMEI'];
                    $v['sver']=$vv['sver'];
                    $v['hver']=$vv['hver'];
                    $v['city']=$vv['city'];
                }
            }
            foreach($store_list as $kk=>$vv){
                if($vv['id']==$v['store_id']){
                    $v['store_name']=$vv['name'];
                }
            }
            $array[$k]=$v;
        }
        $page = $list->render();
        $this->assign('list', $array);
        $this->assign('page', $page);
        return $this->fetch('promotions/car_failure_list');
    }

    //删除
    public function car_failure_del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('return_car')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/car/car_failure');
            } else {
                return alert_error('删除失败');
            }

        }


    }


}