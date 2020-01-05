<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-08
 * Time: 11:38
 */

namespace app\manage\controller;


use think\facade\Request;

class Order extends Base
{
    //消费记录
    public function record(){

        $user_name = Request::param('user_name');
        $store_name = Request::param('store_name');
        $star_time = Request::param('star_time');;
        $end_time = Request::param('end_time');;
        $type = Request::param('type')??0;;
        $stars_time= strtotime(date("Y-m-d 00:00:00",strtotime($star_time)));
        $ends_time=strtotime(date("Y-m-d 23:59:59",strtotime($end_time)));
        if(!empty($user_name)){
            $user=db('user')->where('nickname',$user_name)->find();
            $map['uid']=$user['id'];
        }
        if(!empty($store_name)){
            $store=db('proxy')->where('name',$store_name)->find();
            $map['store_id']=$store['id'];
        }
        if(!empty($map)){
            $lsit_order=db('recharge')->where(array('is_success'=>1))->where($map)->order('time desc')->paginate(20);
            switch($type){
                case 1:
                    $sum=db('recharge')->where(array('is_success'=>1))->where($map)->sum('price');
                    break;

                case 2:

                      $sum=db('recharge')->where(array('is_success'=>1))->where($map)->sum('discount');
                    break;
                case 3:

                    $sum=db('recharge')->where(array('is_success'=>1))->where($map)->sum('gift_money');
                    break;
                case 4:
                    $sum=db('recharge')->where(array('is_success'=>1))->where($map)->sum('pay_price');
                    break;
                default:
                    $sum=db('recharge')->where(array('is_success'=>1))->where($map)->sum('pay_price');
                    break;

            }

            if(!empty($star_time)){
                $wher[] = ['time', 'between', [$stars_time, $ends_time]];
                $lsit_order=db('recharge')->where(array('is_success'=>1))->where($map)->where($wher)->order('time desc')->paginate(20);
                switch($type){
                    case 1:
                        $sum=db('recharge')->where(array('is_success'=>1))->where($map)->sum('price');
                        break;

                    case 2:

                        $sum=db('recharge')->where(array('is_success'=>1))->where($map)->where($wher)->sum('discount');
                        break;
                    case 3:

                        $sum=db('recharge')->where(array('is_success'=>1))->where($map)->where($wher)->sum('gift_money');
                        break;
                    case 4:
                        $sum=db('recharge')->where(array('is_success'=>1))->where($map)->where($wher)->sum('pay_price');
                        break;
                    default:
                        $sum=db('recharge')->where(array('is_success'=>1))->where($map)->where($wher)->sum('pay_price');
                        break;

                }
//                $sum=db('recharge')->where(array('is_success'=>1))->where($map)->where($wher)->sum('pay_price');
            }
        }else{

            $lsit_order=db('recharge')->where(array('is_success'=>1))->order('time desc')->paginate(20);
//            dump($lsit_order);die;
            switch($type){
                case 1:
                    $sum=db('recharge')->where(array('is_success'=>1))->sum('price');
                    break;

                case 2:

                    $sum=db('recharge')->where(array('is_success'=>1))->sum('discount');
                    break;
                case 3:

                    $sum=db('recharge')->where(array('is_success'=>1))->sum('gift_money');
                    break;
                case 4:
                    $sum=db('recharge')->where(array('is_success'=>1))->sum('pay_price');
                    break;
                default:
                    $sum=db('recharge')->where(array('is_success'=>1))->sum('pay_price');
                    break;

            }
//            $sum=db('recharge')->where(array('is_success'=>1))->sum('pay_price');
            if(!empty($star_time)){
                $wher[] = ['time', 'between', [$stars_time, $ends_time]];
                $lsit_order=db('recharge')->where(array('is_success'=>1))->where($wher)->order('time desc')->paginate(20);
                switch($type){
                    case 1:
                        $sum=db('recharge')->where(array('is_success'=>1))->where($wher)->sum('price');
                        break;

                    case 2:

                        $sum=db('recharge')->where(array('is_success'=>1))->where($wher)->sum('discount');
                        break;
                    case 3:

                        $sum=db('recharge')->where(array('is_success'=>1))->where($wher)->sum('gift_money');
                        break;
                    case 4:
                        $sum=db('recharge')->where(array('is_success'=>1))->where($wher)->sum('pay_price');
                        break;
                    default:
                        $sum=db('recharge')->where(array('is_success'=>1))->where($wher)->sum('pay_price');
                        break;

                }
//                $sum=db('recharge')->where(array('is_success'=>1))->where($wher)->sum('pay_price');
            }
        }
        $arr_type=array(
            '0'=>'实际充值金额',
            '1'=>'充值金额',
            '2'=>'折扣金额',
            '3'=>'赠送金额',
            '4'=>'实际充值金额',
        );
        $uid='';
        $store_id='';
        foreach($lsit_order as $k=>$v){
            $uid.= $v['uid'] . ',';
            $store_id.= $v['store_id'] . ',';
        }
        $user_id=db('user')->where('id','in',$uid)->select();
        $store_list=db('proxy')->where('id','in',$store_id)->select();
        $array=array();
        foreach($lsit_order as $k=>$v){
            $v['user_name']='未知';
            $v['store_name']='未知';
            foreach($user_id as $kk=>$vv){
                if($vv['id']==$v['uid']){
                    $v['user_name']=$vv['nickname'];
                }
            }
            foreach($store_list as $kk=>$vv){
                if($vv['id']==$v['store_id']){
                    $v['store_name']=$vv['name'];
                }
            }
            $array[$k]=$v;
        }
        $page = $lsit_order->render();

        $this->assign('list', $array);
        $this->assign('arr_type',$arr_type);
        $this->assign('type', $type);
        $this->assign('sum', $sum);
        $this->assign('star_time', $star_time);
        $this->assign('end_time', $end_time);
        $this->assign('page', $page);
        return $this->fetch('order/record_list');
    }
    //代理商删除
    public function  record_del()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('recharge')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/order/record_list');
            } else {
                return alert_error('删除失败');
            }

        }
    }
    //短信统计
    public function sms(){
        $lsit_order=db('verification')->paginate(20);
        $uid='';
        foreach($lsit_order as $k=>$v){
            $uid.= $v['uid'] . ',';
        }
        $user_id=db('user')->where('id','in',$uid)->select();
        $array=array();
        foreach($lsit_order as $k=>$v){
            $v['user_name']='未知';
            foreach($user_id as $kk=>$vv){
                if($vv['id']==$v['uid']){
                    $v['user_name']=$vv['nickname'];
                }
            }
            $array[$k]=$v;
        }
        $arra=array(
            '1'=>'验证码',
            '2'=>'找回密码',
            '3'=>'更换手机',
            '4'=>'认证',
        );
        $page = $lsit_order->render();
        $this->assign('list', $array);
        $this->assign('arra', $arra);
        $this->assign('page', $page);
        return $this->fetch('order/verification_list');

    }
    public function  sms_del()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('verification')->where(array('id'=>$id))->delete();
            if ($list) {
                return alert_success('删除成功', '/order/sms');
            } else {
                return alert_error('删除失败');
            }

        }
    }
//    //长租订单
//
//    public function  rental(){
//        $user_name = Request::param('user_name');
//        $store_name = Request::param('store_name');
//        if(!empty($user_name)){
//            $user=db('user')->where('nickname',$user_name)->find();
//            $map['uid']=$user['id'];
//        }
//        if(!empty($store_name)){
//            $store=db('proxy')->where('name',$store_name)->find();
//            $map['store_id']=$store['id'];
//        }
//        if(!empty($map)){
//            $list=db('card_order')->where($map)->order('pay_time desc')->paginate(20);
//        }else{
//            $list = db('card_order')->order('pay_time desc')->paginate(20);
//        }
//        $uid='';
//        $store_id='';
//        foreach($list as $k=>$v){
//            $uid.= $v['uid'] . ',';
//            $store_id.= $v['store_id'] . ',';
//        }
//        $user_id=db('user')->where('id','in',$uid)->select();
//        $store_list=db('proxy')->where('id','in',$store_id)->select();
//        $array=array();
//        foreach($list as $k=>$v){
//            $v['user_name']='未知';
//            $v['store_name']='未知';
//            foreach($user_id as $kk=>$vv){
//                if($vv['id']==$v['uid']){
//                    $v['user_name']=$vv['nickname'];
//                }
//            }
//            foreach($store_list as $kk=>$vv){
//                if($vv['id']==$v['store_id']){
//                    $v['store_name']=$vv['name'];
//                }
//            }
//            $array[$k]=$v;
//        }
//        $page = $list->render();
//        $this->assign('list', $array);
//        $this->assign('page', $page);
//        return $this->fetch('order/rental_list');
//    }
   
   /**
     * 免押卡记录表展示
     * 修改人：MEOW_WEI
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function real(){
        $userid = db('user')->field(['id','nickname'])->select();
        $data = db('card')->order('id','desc')->paginate(20);
        $array=array();
        foreach($data as $k=>$v){
            foreach($userid as $kk=>$vv){
                if($vv['id']==$v['uid']){
                    $v['user_name']= $vv['nickname'];
                    $v['start_time'] = date('Y-m-d H:i:s',$v['start_time']);
                    $v['end_time'] = date('Y-m-d H:i:s',$v['end_time']);
                }

            }
            $array[$k]=$v;
        }
//        echo "<pre>";
//        print_r($array);
        $page = $data->render();;
        $this->assign('list',$array);
        $this->assign('page', $page);
        return $this->fetch('order/real_list');
    }
    //免押金卡编辑
    public function real_edit($id){
        $data = db('deposit')->where('id',$id)->find();
        $this->assign('list',$data);
        return $this->fetch('order/real_edit');
    }
    //免押金 卡编提交
    public function real_edit_bath(){
        $data = Request::param();
        $id = $data['id'];
        $one_month = $data['one_month'];
        $three_month = $data['three_month'];
        $one_year = $data['one_year'];
        $one_month_second = $data['one_month_second'];
        $three_month_second = $data['three_month_second'];
        $one_year_second = $data['one_year_second'];
        $res = db('deposit')->where('id',$id)->update(['one_month'=>$one_month,
                                                                     'three_month'=>$three_month,
                                                                     'one_year'=>$one_year,
                                                                     'one_month_second'=>$one_month_second,
                                                                     'three_month_second'=>$three_month_second,
                                                                     'one_year_second'=>$one_year_second]);
        if ($res) {
            return alert_success_parent('修改成功');
        } else {
            return alert_error('修改失败');
        }
    }
    
    public  function order_list(){
        $star_time = Request::param('star_time');
        $end_time =Request::param('end_time');
        $star_times=strtotime(date('Y-m-d 00:00:00',strtotime($star_time)));
        $end_times=strtotime(date('Y-m-d 23:59:59',strtotime($end_time)));
        if(!empty($star_time)){
            $map[]=['start_time','between',"$star_times,$end_times"];
//            dump($map);die;
            $list=db('order')->where(array('is_delete'=>1))->where($map)->order('start_time desc')->paginate(20);
            $sum=db('order')->where(array('is_delete'=>1))->where($map)->sum('pay_price');
        }else{
            $list=db('order')->where(array('is_delete'=>1))->order('start_time desc')->paginate(20);
            $sum=db('order')->where(array('is_delete'=>1))->sum('pay_price');
        }

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
            $v['car_coding']='未知';
            $v['sver']='未知';
            $v['hver']='未知';
            $v['city']='未知';
            $v['iccid']='未知';
            $v['user_name']='未知';
            $v['store_name']='未知';
            foreach($user_id as $kk=>$vv){
                if($vv['id']==$v['uid']){
                    $v['user_name']=$vv['nickname'];
                }
            }
            foreach($car_list as $kk=>$vv){
                if($vv['car_id']==$v['car_id']){
                    $v['iccid']=$vv['iccid'];
                    $v['IMEI']=$vv['IMEI'];
                    $v['sver']=$vv['sver'];
                    $v['hver']=$vv['hver'];
                    $v['city']=$vv['city'];
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
        $this->assign('star_time', $star_time);
        $this->assign('end_time', $end_time);
        $this->assign('list', $array);
        $this->assign('sum', $sum);
        $this->assign('page', $page);

        return $this->fetch('order/order_list');
    }
    public  function order_del_s(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('order')->where(array('id'=>$id))->delete();
            if ($list) {
                return alert_success('删除成功', '/order/order_list');
            } else {
                return alert_error('删除失败');
            }

        }
    }


}