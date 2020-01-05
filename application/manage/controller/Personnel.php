<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-23
 * Time: 21:23
 */

namespace app\manage\controller;


use think\facade\Request;
use think\Session;

class Personnel extends Base
{
    //救援人员
    public function personnel_list(){
        $title = Request::param('title');
        $store_id = session('store_id');
        if(empty($store_id)){
            if (!empty($title)) {
                $list = db('rescue_personnel')->where('name', $title)->paginate(20);
            } else {
                $list = db('rescue_personnel')->paginate(20);
            }
        }else{
            if (!empty($title)) {
                $list = db('rescue_personnel')->where('store_id', $store_id)->where('name', $title)->paginate(20);
            } else {
                $list = db('rescue_personnel')->where('store_id', $store_id)->paginate(20);
            }
        }

        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $list);
        $this->assign('title', $title);
        $this->assign('page', $page);
        return $this->fetch('personnel/personnel_list');
    }
    //添加
    public function personnel_add(){
             $user_store = db('proxy')->where('is_delete',2)->field('id,name')->select();
            $this->assign('list', $user_store);
        if(Request::instance()->isPost()){
            $data = Request::param();
            if(empty($data['name'])){
                return alert_error('参数错误');
            }
            if(empty($data['phone'])){
                return alert_error('参数错误');
            }
            if(empty($data['card'])){
                return alert_error('参数错误');
            }
              if(empty($data['store_id'])){
                return alert_error('参数错误');
            }
            if($_FILES['img']['error']==0){
                $file=$this->file_upload('img','user');

                $image=$file['file_path'];
            }else{
                return alert_error('参数错误！');
            }
            //Md5(MD5($pwd))
            $arr=array(
                'name'=>$data['name'],
                 'phone'=>$data['phone'],
                 'id_card'=>$data['card'],
                 'head_img'=>$image,
                'is_id_card'=>2,
                'store_id'=>$data['store_id'],
                'password'=>Md5(MD5($data['phone'])),
            );
            $add=db('rescue_personnel')->insert($arr);
            if ($add) {
                return alert_success_parent('添加成功');
            } else {
                return alert_error('添加失败');
            }
        }
        return $this->fetch('personnel/personnel_add');
    }
    //删除
    public function del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('rescue_personnel')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/user/personnel_list');
            } else {
                return alert_error('删除失败');
            }

        }


    }
    //认证
    public function rabs(){
        //认证
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('rescue_personnel')->where(array('id' => $id))->update(array('is_id_card'=>2));
            if ($list) {
                return alert_success('认证成功', '/user/personnel_list');
            } else {
                return alert_error('认证失败');
            }

        }
    }
    //认证
    public function rabsa(){
        //认证
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('rescue_personnel')->where(array('id' => $id))->update(array('is_id_card'=>1));
            if ($list) {
                return alert_success('成功', '/user/personnel_list');
            } else {
                return alert_error('失败');
            }

        }
    }
}