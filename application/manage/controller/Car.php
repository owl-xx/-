<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-10-28
 * Time: 15:14
 */

namespace app\manage\controller;


use think\facade\Config;
use think\facade\Request;
use app\manage\validate\Carvalidate;
class Car extends Base
{
    public  function  device_list(){
        $IMEI = Request::param('IMEI');
        $car_coding = Request::param('car_coding');
        $type = Request::param('type');
        $warn = Request::param('warn');
        $chuku = Request::param('chuku');
        $arra=array();
        if(!empty($IMEI)){
            $arra['IMEI']=$IMEI;
        }
         
        if(!empty($car_coding)){
            $arra['car_coding']=$car_coding;
        }
        if(!empty($type)){
            $arra['type']=$type;
        }
        if(!empty($warn)){
            $arra['warn']=$warn;
        }
        // echo $chuku;
        $store_id = session('store_id');
        if(empty($store_id)){
            if($chuku!=2){
                if(!empty($arra)){
                    $list = db('car')->where($arra)->order('addtime  desc')->paginate(20);
                }else{
                    $list = db('car')->order('addtime desc')->paginate(20);
                }
            }else{
                if(!empty($arra)){
                    $list = db('car')->where($arra)->order('addtime  desc')->paginate(20);
                }else{
                    $list = db('car')->order('addtime desc')->paginate(20);
                }
            }
        }else{
            if($chuku!=2){
                if(!empty($arra)){
                    $list = db('car')->where('store_id',$store_id)->where($arra)->order('addtime  desc')->where('is_login','in','1,3')->paginate(20);
                }else{
                    $list = db('car')->where('store_id',$store_id)->order('addtime desc')->where('is_login','in','1,3')->paginate(20);
                }
            }else{
                if(!empty($arra)){
                    $list = db('car')->where('store_id',$store_id)->where($arra)->order('addtime  desc')->where('is_login','in','2')->paginate(20);
                }else{
                    $list = db('car')->where('store_id',$store_id)->order('addtime desc')->where('is_login','in','2')->paginate(20);
                }
            }
        }

        

        $page = $list->render();
        // 模板变量赋值
   
        $this->assign('chuku', $chuku);
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('IMEI', $IMEI);
        $this->assign('car_coding', $car_coding);
        $this->assign('type', $type);
        $this->assign('warn', $warn);
        return $this->fetch('device/device_list');

    }
    //车辆删除
    public function car_del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('car')->where(array('car_id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/car/car_list');
            } else {
                return alert_error('删除失败');
            }

        }

    }
    //车辆上线
    public function car_online(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('car')->where(array('car_id' => $id))->update(array('is_login'=>1));
            if ($list) {
                return alert_success('上线成功', '/car/car_list');
            } else {
                return alert_error('上线失败');
            }

        }
    }
    //车辆下线
    public function car_online_no(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('car')->where(array('car_id' => $id))->update(array('is_login'=>3));
            if ($list) {
                return alert_success('下线成功', '/car/car_list');
            } else {
                return alert_error('下线失败');
            }

        }
    }
    //故障上报
    public  function report_list(){

        $id = Request::param('id');
        $time= Request::param('time');//(
        $ids=$id;
        $arr_whe=array();
        if(!empty($time)){
            $a_time=strtotime(date('Y-m-d 00:00:00',strtotime($time)));
            $a_time_1=strtotime(date('Y-m-d 23:59:59',strtotime($time)));

//            $arr_whe['addtime'] =['between',$a_time,$a_time_1];
        }
        if (!empty($ids)) {
            $arr_whe['state']=$id;
        }
        if(empty($arr_whe)){
            $list = db('malfunction')->order('addtime desc')->paginate(20);
        }else{

            $list = db('malfunction')->where($arr_whe)->order('addtime desc')->paginate(20);
        }
//        dump($arr_whe);die;
        $arr = '';//人
        $array='';//故障类型
        foreach ($list as $k => $v) {
            $arr .= $v['uid'] . ',';
            $array .= $v['car_state_id'] . ',';
        }
        $arr_user=db('user')->where('id','in',$arr)->select();
        $arr_list=db('malfunction_list')->where('id','in',$array)->select();
        $arra_list=array();
        foreach ($list as $k => $v) {
            $v['userName']='未知';
            $v['car_state_name']='未知';
            foreach ($arr_user as $kk => $vv) {
               if($v['uid']==$vv['id']){
                    $v['userName']=$vv['nickname'];
               }
            }
            foreach ($arr_list as $ka => $va) {
                if($v['car_state_id']==$va['id']){
                    $v['car_state_name']=$va['name'];
                }
            }
            $arra_list[$k]=$v;
        }
//        dump($arra_list);die;
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $arra_list);
        $this->assign('time', $time);
        $this->assign('id', $id);
        $this->assign('page', $page);

        return $this->fetch('report/report_list');

    }
    //处理故障车辆
    public function report_update(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('malfunction')->where(array('id' => $id))->update(array('state'=>1));
            if ($list) {
                return alert_success('处理成功', '/car/report_list');
            } else {
                return alert_error('处理失败');
            }
        }


    }
    //已处理故障车辆
    public function report_update_batch(){

                return alert_success('请不要重复处理哦', '/car/report_list');
    }
    //删除
    public function report_del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('malfunction')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/car/report_list');
            } else {
                return alert_error('删除失败');
            }
        }

    }
    //添加车辆
    public function car_add(){
        $store_id = session('store_id');
        if(empty($store_id)){
            $lista = db('proxy')->where('is_delete', 2)->select();
        }else{
            $lista = db('proxy')->where('id',$store_id)->where('is_delete', 2)->select();
        }

        $price=db('car_price')->select();
        if(Request::instance()->isPost()){
            $data=Request::param();
            $user_validata = new Carvalidate;

            $result   = $user_validata->batch()->check($data);
            if ($result !== true) {
               // return alert_error('参数错误！');
            }
            /*if(empty($data['store_id'])){
                return alert_error('参数错误！');
            }*/
            /*if($_FILES['img']['error']==0){
                $file=$this->file_upload('img','car');
                $image=$file['file_path'];
            }else{
                return alert_error('参数错误！');
            }*/
            $arr['car_frame']=$data['car_frame'];
            $arr['car_model']=$data['car_model'];
            $arr['car_coding']=$data['car_coding'];
            $arr['iccid']=$data['iccid'];
            $arr['IMEI']=$data['IMEI'];
            /*$arr['sver']=$data['sver'];
            $arr['hver']=$data['hver'];*/
            $arr['city']=$data['city'];
            $arr['distance']=$data['distance'];
            $arr['mileage']=$data['mileage'];
            $arr['billing']="分钟";
            $arr['address']=$data['address'];
            // $arr['landmark']=$data['landmark'];
            $arr['store_id']=$data['store_id'];
            $arr['car_type']=$data['car_type'];
            $arr['addtime']=time();
            //$arr['img']=$image;
//            dump($arr);die;
            $add=db('car')->insert($arr);
            if ($add) {
                return alert_success_parent('添加成功');
            } else {
                return alert_error('添加失败');
            }
        }
        $this->assign('list',$lista);
            $this->assign('price',$price);
        return $this->fetch('device/car_add');
    }
    //车辆开锁
    public function car_start(){
        $id=Request::param('id');
        $url=Config::get('config_set.http').'/start?carId='.$id;
        $list=json_decode(http_get($url,true),true);
//        dump($list);die;
//        $msg=isset($list['msg'])??'车子状态异常，请检查行车';
        if ($list['code']=='200') {
            return alert_success($list['data'], '/car/car_list');
        } else {
            return alert_error($list['msg']);
        }

    }
    /**
     *	车子关闭 上锁
     **/
    public function endCar(){
        $id=Request::param('id');
        $url=Config::get('config_set.http').'/endCar?carId='.$id;
        $list=json_decode(http_get($url,true),true);
//        $msg=isset($list['msg'])??'车子状态异常，请检查行车';
        if ($list['code']=='200') {
            return alert_success($list['data'], '/car/car_list');
        } else {
            return alert_error($list['msg']);
        }

    }
    /**
     *	车子开坐垫锁
     **/
    public function carOpen(){
        $id=Request::param('id');
        $url=Config::get('config_set.http').'/carOpen?carId='.$id;
        $list=json_decode(http_get($url,true),true);
//        $msg=isset($list['msg'])??'车子状态异常，请检查行车';
        if ($list['code']=='200') {
            return alert_success($list['data'], '/car/car_list');
        } else {
            return alert_error($list['msg']);
        }

    }
    /**
     * 寻找车子  车子鸣笛
     *	carId  车子ID 必须
     **/
    public function speak(){
        $id=Request::param('id');
        $url=Config::get('config_set.http').'/speak?carId='.$id;
        $list=json_decode(http_get($url,true),true);
//        $msg=isset($list['msg'])??'车子状态异常，请检查行车';
        if ($list['code']=='200') {
            return alert_success($list['data'], '/car/car_list');
        } else {
            return alert_error($list['msg']);
        }
    }
    public  function car_order_list(){
        $car_id = Request::param('id');
        if(empty($car_id)){
        return alert_error('参数错误！');
        }
                $map=array('car_id'=>$car_id);
            $list=db('order')->where(array('is_delete'=>1))->where($map)->order('start_time desc')->paginate(20);
                $sum=db('order')->where(array('is_delete'=>1))->where($map)->sum('pay_price');

        $uid='';
        $car_id='';
        $store_id='';
        foreach($list as $k=>$v){
            $uid.= $v['uid'] . ',';
            $car_id.= $v['car_id'] . ',';
            $store_id.= $v['store_id'] . ',';
        }
        $user_id=db('user')->where('id','in',$uid)->select();
        $car_list=db('car')->where('car_id','in',$car_id)->select();
        $store_list=db('proxy')->where('id','in',$store_id)->select();
        $array=array();
        foreach($list as $k=>$v){
            $v['IMEI']='未知';
            $v['phone']='没有进行实名认证';
            $v['car_coding']='未知';
            $v['sver']='未知';
            $v['hver']='未知';
            $v['city']='未知';
            $v['iccid']='未知';
            $v['user_name']='未知';
            $v['store_name']='未知';
            $v['car_id']=0;
            foreach($user_id as $kk=>$vv){
                if($vv['id']==$v['uid']){
                    $v['user_name']=$vv['nickname'];
                     $v['phone']=$vv['phone'];
                }
            }
            foreach($car_list as $kk=>$vv){
                if($vv['car_id']==$v['car_id']){
                    $v['iccid']=$vv['iccid'];
                    $v['IMEI']=$vv['IMEI'];
                    $v['sver']=$vv['sver'];
                    $v['hver']=$vv['hver'];
                    $v['city']=$vv['city'];
                    $v['car_id']=$vv['car_id'];
                    $v['car_coding']=$vv['car_coding'];
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
//        dump($array);die;
       
        $this->assign('list', $array);
        $this->assign('sum', $sum);
        $this->assign('page', $page);

        return $this->fetch('device/order_list');
    }
}