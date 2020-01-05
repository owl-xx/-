<?php
namespace app\manage\controller;
use think\Controller;
use think\File;
use think\Request;
use think\facade\Session;

class Base extends Controller
{
    //整个项目关于数据库字段是json格式的都没有处理 联合营销，和店铺其他资料
    //前段页面 goods/cate_is_show  传来的参数带一个jq信息
    //分类图片处理尚未处理 活动管理的图片尚未处理
    //商品的图片处理
    //砍价和拼团是否在商品添加的时候设置，还是后期再添加拼团和砍价的时候改变goods表
    //页面删搞得layer有一些没有引入layer.js失效
    protected $request;
    function __construct(Request $request){
        $this->request = $request;
        parent::__construct();
        $this->run();
        
	}

    //首页
    public function run()
    {
        $path = $this->request->path();
        $list=db('admin')->where('id',session('admin_id'))->find();
//        dump($list);die;
        $rabc=db('permission')->where('id','in',$list['permission'])->select();
        $rabc_lsit=getChild($rabc);
//        dump($admin_mes['store_id']);die;
        Session::set("store_id",$list['store_id']);
//        dump($rabc_lsit);die;
        $this->assign('rabc_list',$rabc_lsit);
        $this->assign('list',$list);
        $this->assign('path_name',$path);
    }

    public function file_upload($name,$path){
        $dir_path=ROOT_PATH.'public'.DS.'uploads'.DS.$path;
//        halt($dir_path);
//        if(!is_dir($dir_path))mkdir($dir_path,0777);
        $file=request()->file($name);
        $info=$file->move($dir_path,true,false);
        if($info){
            $file_path=$info->getSaveName();
            $data['file_path']=$path.'/'.$info->getSaveName();
            //return $data['file_path'];
        }else{
            $data['file_path']=$file->getError();
        }
        return  $data;

    }










}
