<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-15
 * Time: 10:31
 */

namespace app\manage\controller;
use app\manage\model\Verification;

use think\facade\Request;

class Announcement extends Base
{
    public function announcement_list(){

        $list = db('announcement')->order('state  asc')->paginate(20);
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $list);
        $this->assign('page', $page);

        return $this->fetch('announcement/announcement_list');

    }

    public function announcement_add(){



        return $this->fetch('announcement/announcement_add');
    }
    //tijiao
    public function announcement_add_batech(){
        $centons= Request::param('centons');
        $state = Request::param('state');
        if(empty($centons)){
            return alert_error('参数错误!');
        }
        $arr=array(
            'admin_id'=>session('admin_id'),
            'time'=>time(),
            'centons'=>$centons,
            'state'=>$state,
        );
        $add=db('announcement')->insert($arr);
        if($add){
            return alert_success_parent('添加成功');
        }else{
            return alert_error('添加失败');
        }


    }
    //禁用
    public function announcement_update(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('announcement')->where(array('id'=>$id))->update(array('state'=>2));
            if ($list) {
                return alert_success('禁用成功', '/announcement/announcement_list');
            } else {
                return alert_error('禁用失败');
            }

        }

    }
    //启用
    public function announcement_update_batch(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('announcement')->where(array('id'=>$id))->update(array('state'=>1));
            if ($list) {
                return alert_success('启用成功', '/announcement/announcement_list');
            } else {
                return alert_error('启用失败');
            }

        }

    }
    public function announcement_del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('announcement')->where(array('id'=>$id))->delete();
            if ($list) {
                return alert_success('删除成功', '/announcement/announcement_list');
            } else {
                return alert_error('删除失败');
            }

        }
    }

    //短信推送
    public function  code_send(){

        $list = db('codesend')->paginate(20);
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $list);
        $this->assign('page', $page);
        return $this->fetch('announcement/code_send');
    }
    public function code_add(){

        if(Request::instance()->isPost()){
            $centons= Request::param('centon');
            $code = Request::param('code');
            if(empty($centons)){
                return alert_error('参数错误!');
            }
            if(empty($code)){
                return alert_error('参数错误!');
            }
            $arr=array(
                'centon'=>$centons,
                'code'=>$code,
            );
            $add=db('codesend')->insert($arr);
            if($add){
                return alert_success_parent('添加成功');
            }else{
                return alert_error('添加失败');
            }


        }

        return $this->fetch('announcement/code_add');
    }
    public function code_del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('codesend')->where(array('id'=>$id))->delete();
            if ($list) {
                return alert_success('删除成功', '/announcement/code_send');
            } else {
                return alert_error('删除失败');
            }

        }
    }
    //根据设置好的发送短信
    public  function code_send_batch(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $time_star=strtotime(date('Y-m-d 00:00:00'));
            $time_end=strtotime(date('Y-m-d 23:59:59'));
            // 启动事务
            $list = db('codesend')->where(array('id'=>$id))->find();
            $list_user=db('user')->where(array('is_phone'=>2,'state'=>0))->select();

            $phone_arr=array();
                foreach($list_user as $k=>$v){
                    if(!empty($v['phone'])){
                        $phone_arr[$k]=$v['phone'];
                    }

                }
            if($time_star<$list['time']&&$list['time']<$time_end){
                 return alert_error('今天已经发送一次了,请不要重复发送');
            }
            $phone=implode(',',$phone_arr);
            $code=$list['code'];
//            echo $phone;die;
                    $alisend=new Verification();
             $send=$alisend->send($phone,$code);
            if($send){
                $list = db('codesend')->where(array('id'=>$id))->update(array('time'=>time()));
                return alert_success('发送成功', '/announcement/code_send');
            }else{
                return alert_error('发送失败');
            }

        }

    }
    //短信发送记录
    public function send_info(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('user')->where(array('id'=>$id))->find();
            if(empty($list['phone'])){

               return alert_success_parent('此人没有绑定手机号');
            }
            $senddate=date('Ymd');
            $alisend=new Verification();
            $send=$alisend-> smssendinfo($list['phone'],$senddate);
            $data=$send;

            $arr=array();
            if($data['Message']=='OK') {
                $arr=$data['SmsSendDetailDTOs']['SmsSendDetailDTO'];
            }
            $this->assign('list', $arr);
        }
        return $this->fetch('user/user_code');

    }

}