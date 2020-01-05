<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-23
 * Time: 14:51
 */

namespace app\manage\controller;


use think\facade\Config;
use think\facade\Request;

class Athou extends Base
{

    public  function athou_list(){
        $list=db('admin')->where('account','<>','admin')->paginate(20);
        $store_id='';
        foreach($list as $k=>$v){
            $store_id.=$v['store_id'].',';
        }
        $user_store = db('proxy')->where('id', 'in', $store_id)->field('id,name')->select();
        $arra = array();
        foreach ($list as $k => $v) {
            $ab='';
            $v['permission_name']='未知';
            $a=db('permission')->where('id', 'in', $v['permission'])->field('menu_name')->select();
            $v['proxy_name'] = '暂无';
            foreach($a as $kk=>$vv){
                $ab.=$vv['menu_name'].',';
            }
            $v['permission_name']=$ab;
            if (!empty($v['parent_id'])) {
                foreach ($user_store as $kk => $vv) {
                    if ($v['parent_id'] == $vv['id']) {
                        $v['proxy_name'] = $vv['name'];
                    }
                }

            }
            $arra[$k] = $v;
        }
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $arra);
        $this->assign('page', $page);
        return $this->fetch('athou/athou_list');
    }

    public function athou_update(){
        //修改当前用户权限
        $user_store = db('proxy')->where('is_delete',2)->field('id,name')->select();
        $array=db('permission')->select();
        $list=getChild($array);
//        dump($list);
        $this->assign('list', $list);
        $this->assign('lists', $user_store);
        return $this->fetch('athou/athou_add');
    }
    public function athou_update_batch(){
        $title = Request::param();
        $web_md5_str =Config::get("config_set.web_md5_str");
        $adds=db('admin')->where(array('account'=>$title['role-input']))->find();
        if($adds){
            return alert_error('添加失败');
        }
     $arr=array(
         'account'=>$title['role-input'],
         'password'=>MD5($title['pwd'].$web_md5_str),
         'permission'=>implode(',',$title['rules']),
     );
        $add=db('admin')->insert($arr);
        if ($add) {
            return alert_success_parent('添加成功');
        } else {
            return alert_error('添加失败');
        }
    }
    public  function del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('admin')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/website/athou');
            } else {
                return alert_error('删除失败');
            }

        }
    }
}