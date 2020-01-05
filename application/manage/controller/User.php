<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-10-24
 * Time: 11:46
 */

namespace app\manage\controller;


use think\facade\Config;
use think\facade\Request;
use think\Session;

class User extends  Base
{
    public function user_list()
    {
        $title = Request::param('title');
        if (!empty($title)) {
            $list = db('user')->where('nickname', $title)->order('addtime desc')->paginate(20);
        } else {
            $list = db('user')->order('addtime desc')->paginate(20);
        }

        // 获取分页显示
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $list);
        $this->assign('title', $title);
        $this->assign('page', $page);

        return $this->fetch('user/user_list');
    }

    public function user_info()
    {
        $id = Request::param('id');
        if (empty($id)) {
            return alert_error('参数错误');
        }
        $list = db('user')->where('id', $id)->find();
        $parent = db('card')->where('uid',$id)->find();
        $this->assign('parent',$parent);
        $this->assign('list', $list);
        return $this->fetch('user/user_info');

    }
/*    public function user_student()
    {
        $title = Request::param('title');
        if (!empty($title)) {
            $list = db('user')->where('nickname', $title)->where('is_student',2)->order('addtime desc')->paginate(20);
        } else {
            $list = db('user')->where('is_student',2)->order('addtime desc')->paginate(20);
        }

        // 获取分页显示
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $list);
        $this->assign('title', $title);
        $this->assign('page', $page);

        return $this->fetch('user/user_student');
    }*/
    
    /**
     * 实名认证
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function user_real(){

        $list = Db('user')->order('addtime desc')->paginate(20);
        // 获取分页显示
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $list);
        //$this->assign('title', $title);
        $this->assign('page', $page);
        return $this->fetch('user/user_real');
    }
    
    //修改管理员个人信息
    public function admin_user_update(){
        $id=session('admin_id');
        $user_list=db('admin')->where(array('id'=>$id))->find();
        if(Request::instance()->isPost()){
            $data=Request::param();
            $user_lists=db('admin')->where(array('id'=>$id))->find();
            $web_md5_str =Config::get("config_set.web_md5_str");
            if(empty($data['pwd'])){
                $new_password=$user_lists['password'];
            }else{
                $new_password = MD5($data['pwd'].$web_md5_str);
            }

            $id=session('admin_id');
            if($_FILES['image']['error']==0){
                $file=$this->file_upload('image','user');
                $image=$file['file_path'];
            }else{
                $image= $user_lists['img'];
            }
            $arr=array(
                'name'=>$data['nickname']??$user_lists['name'],
                 'password'=>$new_password,
                 'img'=>$image,
            );
            $list=db('admin')->where(array('id'=>$id))->update($arr);
            if ($list) {
//                session(null);
                return alert_success_parent('修改成功');
            } else {
                return alert_error('修改失败');
            }

        }
        $this->assign('user_find',$user_list);
        return $this->fetch('user/admin_update');
    }
    public  function user_che(){
        header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
        header("Cache-Control: no-cache, must-revalidate" );
        return alert_success('清空成功','/admin/index');
    }
}