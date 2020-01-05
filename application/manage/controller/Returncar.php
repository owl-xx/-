<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/11/15 0015
 * Time: 12:21
 */

namespace app\manage\controller;


use think\facade\Request;
use app\manage\validate\Returncars;
use app\manage\validate\Returncarss;

class Returncar extends Base
{
    //查询还车点
    public function returncar_car(){
        $list = db('car_location')->paginate(20);
        $page = $list->render();
        // $user_store = db('car_location')->select();
        $arr = array();
         $store_id='';
        foreach($list as $k=>$v){
            $store_id.= $v['store_id'] . ',';
        }


        $store_list=db('proxy')->where('id','in',$store_id)->select();
//        dump($user_store);die;
        foreach($list as $k=>$v){
            // $a=explode('-',$v['location']);
                $v['location1']=getRealyAddress($v['location1']);
                // $v['location']=end($a);
            // $ab=explode('-',$v['location']);
            // $v['location3']=$ab[0];
            // $v['location1']=end($ab);
                foreach($store_list as $kk=>$vv){
               if($vv['id']==$v['store_id']){
                    $v['store_name']=$vv['name'];
                }    
            }
            $arr[$k] = $v;
        }
        $arra=array();
        // foreach($arr as $k=>$v){
        //     $v['location'] =getRealyAddress($v['location4']).'----'.getRealyAddress($v['location']);
        //     $v['location1'] =getRealyAddress($v['location3']).'----'.getRealyAddress($v['location1']);;
        //     $arra[$k] = $v;
        // }
//        dump($arra);die;
        // 模板变量赋值
        $this->assign('list', $arr);
        $this->assign('page', $page);
        return $this->fetch('returncar/returncar_car');

    }
    //查看还车区域
    public function  returncar_info(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('car_location')->where(array('id' => $id))->select();
            // 模板变量赋值
            $arr = array();
            foreach ($list as $v){
                if($v['location']){
                    $location =json_decode($v['location'],true);
                    $arr['location']= array_values($location);
                }
                if($v['location1']){
                    $location1 =json_decode($v['location1'],true);
                    $arr['location1']= array_values($location1);
                }
                if($v['location2']){
                    $location2 =json_decode($v['location2'],true);
                    $arr['location2']=array_values($location2);
                }
                if($v['location3']){
                    $location3 =json_decode($v['location3'],true);
                    $arr['location3']= array_values($location3);
                }
                if($v['location4']){
                    $location4 =json_decode($v['location4'],true);
                    $arr['location4']= array_values($location4);
                }
            }
            $this->assign('list',json_encode(array_values($arr)));
        }

        return $this->fetch('Returncar/returncar_info');
    }
    //添加还车点
    public function  returncar_add(){
        $list=db('car_location')->select();
        $arr='';
        foreach($list as $k=>$v){
            $arr.=$v['store_id'].',';
        }
        // $user_store = db('proxy')->where('id','not in',$arr)->field('id,name')->select();
        $user_store = db('proxy')->where('is_delete',2)->field('id,name')->select();
        $this->assign('list', $user_store);
        return $this->fetch('returncar/returncar_add');
    }
    public function returncar_add_batch(){
        $data=Request::param();
        $user_validata = new Returncarss;
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        if(empty($data['number'])){
            return alert_error('参数错误！');
        }
       // dump($data);die;
        // foreach($data['location'] as $k=>$v){
        //     $a1=explode(",",$v);
        //     $b1[$k] =json_encode([
        //         'lat'=>$a1[0],
        //         'lng'=>$a1[1],
        //     ]);
        // }
        // $a_z=implode('-',$b1);
 foreach($data['location1'] as $k=>$v){
     $a2=explode(",",$v);
     $b2[$k] =[
         'lat'=>$a2[0],
         'lng'=>$a2[1],
     ];
 }
        $a_z_2=json_encode($b2[0]);
        // halt($a_z_2);
//        $a1 = explode(",", $data['location0']);
//         $b1 =[
//             'lat'=>$a1[0],
//             'lng'=>$a1[1],
//         ];
//        $a2 = explode(",", $data['location1']);
//        $b2 =[
//            'lat'=>$a2[0],
//            'lng'=>$a2[1],
//        ];
//        $a3 = explode(",", $data['location2']);
//        $b3 =[
//            'lat'=>$a3[0],
//            'lng'=>$a3[1],
//        ];
//        $b4 = '';
//        if(isset($data['location3'])==true){
//            $a4 = explode(",", $data['location3']);
//            $b4 =[
//                'lat'=>$a4[0],
//                'lng'=>$a4[1],
//            ];
//        }
//        $b5 ='';
//        if(isset($data['location4'])==true){
//            $a5 = explode(",", $data['location0']);
//            $b5 =[
//                'lat'=>$a5[0],
//                'lng'=>$a5[1],
//            ];
//        }
        $arr=array(
            'city'  => $data['city'],
            'store_id'  => $data['store_id'],
            // 'state'  => $data['state'],
            'handling_fee'  => $data['handling_fee'],
            // 'location'  =>$a_z,
            'location1'  => $a_z_2,
            'range'=>$data['number'],
//            'location2'  => json_encode((object)$b3),
//            'location3'  => $b4?json_encode((object)$b4):'',
//            'location4'  => $b5?json_encode((object)$b5):'',
        );
        $add=db('car_location')->insert($arr);
        if ($add) {
            return alert_success_parent('添加成功');
        } else {
            return alert_error('添加失败');
        }
    }
    //删除还车点
    public function returncar_delete(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('car_location')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除', '/returncar/returncar_car');
            } else {
                return alert_error('删除失败');
            }

        }
    }

    //还车点修改
    public function returncar_updele(){
        $id=Request::param('id');
        $list=db('car_location')->where('id',$id)->find();
        $user_stores = db('proxy')->where('id',$list['store_id'])->field('id,name')->find();
        $user_store = db('proxy')->field('id,name')->select();
        $this->assign('lists', $user_store);
        $this->assign('list', $list);
        $this->assign('data', $user_stores);
        return $this->fetch('returncar/returncar_updele');
    }
    public function returncar_updele_batch(){
        $data=Request::param();
//        dump($data);die;
        $user_validata = new Returncars;
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        if(empty($data['number'])){
            return alert_error('参数错误！');
        }
        foreach($data['location'] as $k=>$v){
            $a1=explode(",",$v);
            $b1[$k] =json_encode([
                'lat'=>$a1[0],
                'lng'=>$a1[1],
            ]);
        }
        $a_z=implode('-',$b1);
        foreach($data['location1'] as $k=>$v){
            $a2=explode(",",$v);
            $b2[$k] =[
                'lat'=>$a2[0],
                'lng'=>$a2[1],
            ];
        }
        $a_z_2=json_encode($b2);
        $list=db('car_location')->where('id',$data['id'])->find();
        $arr=array(
            'city'  => $data['city'],
            'store_id'  => $data['store_id'],
            'state'  => $data['state'],
            'handling_fee'  => $data['handling_fee'],
            'location'  =>$a_z?$a_z:$list['location'],
            'location1'  =>$a_z_2?$a_z_2:$list['location1'],
            'range'=>$data['number'],
//            'location2'  => $b3?json_encode((object)$b3):$list['location2'],
//            'location3'  => $b4?json_encode((object)$b4):$list['location3'],
//            'location4'  =>$b5?json_encode((object)$b5):$list['location4'],
        );

        $add=db('car_location')->where('id',$data['id'])->update($arr);
        if ($add) {
            return alert_success_parent('修改成功');
        } else {
            return alert_error('修改失败');
        }
    }
    public  function  return_info_list(){

         $list = db('city_region')->paginate(20);
        $page = $list->render();
        // $user_store = db('car_location')->select();
        $store_id='';
       

        foreach($list as $k=>$v){
            $store_id.= $v['store_id'] . ',';
        }


        $store_list=db('proxy')->where('id','in',$store_id)->select();
        $arr = array();
//        dump($user_store);die;
        foreach($list as $k=>$v){
            $a=explode('-',$v['location_info']);
                $v['location']=$a[0];
                $v['location1']=end($a);

            $arr[$k] = $v;
        }
        $arra=array();
        foreach($arr as $k=>$v){
            $v['location'] =getRealyAddress($v['location']).'----'.getRealyAddress($v['location1']);
            foreach($store_list as $kk=>$vv){
               if($vv['id']==$v['store_id']){
                    $v['store_name']=$vv['name'];
                }    
            }
            $arra[$k] = $v;
        }

//        dump($arra);die;
        // 模板变量赋值
        $this->assign('list', $arra);
        $this->assign('page', $page);

        return $this->fetch('returncar/returncar_info_list');

    }
    //添加还车区域

        public  function  returncar_info_add(){

        $list=db('city_region')->select();
        $arr="";
        foreach($list as $k=>$v){
            $arr.=$v['store_id'].',';
        }
        $user_store = db('proxy')->where('id','not in',$arr)
            ->where('is_delete',2)->field('id,name')->select();
        $this->assign('list', $user_store);
        if(Request::instance()->isPost()){
            $data=Request::param();

            if(empty($data['city'])){
            return alert_error('参数错误！');
           }
             if(empty($data['store_id'])){
            return alert_error('参数错误！');
           }
             if(empty($data['location'])){
            return alert_error('参数错误！');
           }
           foreach($data['location'] as $k=>$v){
            $a1=explode(",",$v);
            $b1[$k] =json_encode([
                'lat'=>$a1[0],
                'lng'=>$a1[1],
            ]);
        }
           $a_z=implode('-',$b1);
           $arr=array(
                  'city'=>$data['city'],
                  'location_info'=>$a_z,
                  'addtime'=>time(),
                  'store_id'=>$data['store_id'],
            );
           // dump($arr);die;
           $add=db('city_region')->insert($arr);
           if ($add) {
            return alert_success_parent('添加成功');
        } else {
            return alert_error('添加失败');
        }
        }
        return $this->fetch('returncar/returncar_info_add');

        }
        public  function returncar_info_delete(){

    if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('city_region')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/returncar/return_info_list');
            } else {
                return alert_error('删除失败');
            }

        }

        }
}