<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-10-22
 * Time: 18:54
 */

namespace app\manage\controller;

use think\facade\Request;
use think\Loader;

class Workbench extends Base
{
    //列表展示
    public function workbench_list()
    {
        $title = Request::param('title');
        $store_id = session('store_id');
        if(empty($store_id)){
            if (!empty($title)) {
                $list = db('proxy')->where('name','like','%'.$title.'%')->where('is_delete', 2)->order('addtime desc')
                    ->paginate(20);
            } else {
                $list = db('proxy')->where('is_delete', 2)->order('addtime desc')->paginate(20);
            }
        }else{
            if (!empty($title)) {
                $list = db('proxy')->where('id',$store_id)->where('name','like','%'.$title.'%')->where('is_delete', 2)->order('addtime desc')
                    ->paginate(20);
            } else {
                $list = db('proxy')->where('id',$store_id)->where('is_delete', 2)->order('addtime desc')->paginate(20);
            }
        }
        $arr = '';//店铺
        foreach ($list as $k => $v) {
            if (!empty($v['parent_id'])) {
                $arr .= $v['parent_id'] . ',';
            }

        }
        $user_store = db('proxy')->where('id', 'in', $arr)->field('id,name')->select();
        $arra = array();
        foreach ($list as $k => $v) {
            $v['proxy_name'] = '暂无';
            if (!empty($v['parent_id'])) {
                foreach ($user_store as $kk => $vv) {
                    if ($v['parent_id'] == $vv['id']) {
                        $v['proxy_name'] = $vv['name'];
                    }
                }

            }
            $arra[$k] = $v;
        }
        // 获取分页显示
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', $arra);
        $this->assign('title', $title);
        $this->assign('page', $page);
        return $this->fetch('workbench/workbench_list');
    }
    //代理商删除
    public function workbench_del()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务

            $list = db('proxy')->where(array('id' => $id))->update(array('is_delete' =>1));
            if ($list) {
                return alert_success('删除成功', '/finance/workbench_list');
            } else {
                return alert_error('删除失败');
            }

        }
    }
    //代理商修改 {修改人：Xiaox}
    public function workbench_edit($id){
        $data = db('proxy')->where('id',$id)->field(['id','phone','account','city','name','location1','location2','location3','location4'])->find();
        $this->assign('data',$data);
        return $this->fetch('workbench/workbench_edit');
    }

    /**
     * 代理商修改提交
     * 修改人：Xiaox
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function workbench_commit(){
        if(Request::instance()->isPost()){
            $data = Request::param();
            $id = $data['id'];
            $datas['phone'] = $data['phone'];
            $datas['account'] =$data['account'];
            $datas['name'] = $data['name'];
            $datas['city'] = $data['city'];
            if(!empty($data['locations0'])){
                $a1 = explode(",", $data['locations0']);
                $b1 =json_encode([
                    'lat'=>$a1[0],
                    'lng'=>$a1[1],
                ]);
                $datas['location1']=$b1;
            }
            if(!empty($data['locations1'])){
                $a2 = explode(",", $data['locations1']);
                $b2 =json_encode([
                    'lat'=>$a2[0],
                    'lng'=>$a2[1],
                ]);
                $datas['location2']=$b2;
            }
            if(!empty($data['locations2'])){
                $a3 = explode(",", $data['locations2']);
                $b3 =json_encode([
                    'lat'=>$a3[0],
                    'lng'=>$a3[1],
                ]);
                $datas['location3']=$b3;
            }
            if(!empty($data['locations3'])){
                $a4 = explode(",", $data['locations3']);
                $b4 =json_encode([
                    'lat'=>$a4[0],
                    'lng'=>$a4[1],
                ]);
                $datas['location4']=$b4;
            }
            $res = db('proxy')->where('id',$id)->update($datas);
            if ($res) {
                return alert_success_parent('修改成功');
            } else {
                return alert_error('修改失败');
            }
        }
    }
    //代理商冻结
    public function workbench_freeze()
    {
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('proxy')->where(array('id' => $id))->update(array('state' => 1));
            if ($list) {
                return alert_success('封号成功', '/finance/workbench_list');
            } else {
                return alert_error('封号失败');
            }

        }
    }
    //代理商解冻
    public function workbench_freeze_batch()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('proxy')->where(array('id' => $id))->update(array('state' => 0));
            if ($list) {
                return alert_success('解冻成功', '/finance/workbench_list');
            } else {
                return alert_error('解冻失败');
            }

        }
    }
    //查看详情
    public function workbench_info()
    {
        $id = Request::param('id');
        if (empty($id)) {
            return alert_error('参数错误');
        }
        $list = db('proxy')->where('id', $id)->find();
        $parent = db('proxy')->where('id', $list['parent_id'])->find();
        $name = $parent['name'] ? $parent['name'] : '暂无上级';
        $this->assign('name', $name);
        $this->assign('list', $list);
        return $this->fetch('workbench/workbench_info');
    }
    //代办事项
    public function car_malfunction_list()
    {
        $title = Request::param('title');
        $store_id = session('store_id');
        if(empty($store_id)){
            if (!empty($title)) {
                $user_stores = db('proxy')->where('name','like','%'. $title.'%')->field('id,name')->find();
                $list = db('car')->where('store_id', $user_stores['id'])->where('type', 'neq', 5)->paginate(20);
            } else {
                $list = db('car')->where('type', 'neq', 5)->paginate(20);
            }
        }else{
            if (!empty($title)) {
                $user_stores = db('proxy')->where('name','like','%'. $title.'%')->where('id',$store_id)->field('id,name')->find();
                $list = db('car')->where('store_id', $user_stores['id'])->where('type', 'neq', 5)->paginate(20);
            } else {
                $list = db('car')->where('store_id',$store_id)->where('type', 'neq', 5)->paginate(20);
            }
        }
        $arr = '';//店铺
        foreach ($list as $k => $v) {
            if (!empty($v['store_id'])) {
                $arr .= $v['store_id'] . ',';
            }

        }
        $user_store = db('proxy')->where('id', 'in', $arr)->field('id,name')->select();

        $arra = array();
        foreach ($list as $k => $v) {
            $v['proxy_name'] = '未知';

            foreach ($user_store as $kk => $vv) {

                if ($v['store_id'] == $vv['id']) {
                    $arra[$v['store_id']]['proxy_name'] = $vv['name'];
                    $arra[$v['store_id']]['store_id'] = $v['store_id'];
                    $arra[$v['store_id']]['id'][$k] = $vv['id'];
//                        $arra[$v['store_id']]['number'] =$i;
                }

            }

        }
//        dump(array_values($arra));die;
        // 获取分页显示
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list', array_values($arra));
        $this->assign('title', $title);
        $this->assign('page', $page);
        return $this->fetch('workbench/car_malfunction_list');
    }
    //滑块
    public function car_malfunction_list_gz()
    {

        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $arr = array();
            for ($i = 0; $i < 12; $i++) {
                $list[$i] = db('car')->where(array('store_id' => $id))->where(array('type' => $i))->count();
            }
            $this->assign('arr', $list);
        }
        return $this->fetch('workbench/car_gz_list');
    }
    //故障车子列表
    public function car_list()
    {
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('car')->where(array('store_id' => $id))->paginate(20);
            $page = $list->render();
            // 模板变量赋值
            $this->assign('list', $list);
            $this->assign('page', $page);

        }
        return $this->fetch('workbench/car_list');

    }
    //车子详情
    public function car_info()
    {
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            $list = db('car')->where(array('car_id' => $id))->find();
            // 模板变量赋值
            $this->assign('list', $list);

        }
        return $this->fetch('workbench/car_info');
    }
    //事件详情
    public function event_list()
    {
        $id = Request::param('id');//
        $time = Request::param('time');


        $arr = array();
        //行驶时间
        $arra = array();
        //行驶里程
        $arraa = array();
        //订单量
        $array=array();

        $arr_user=array();

        $array_refund=array();

        //时间
        $array_time=array();
        $array_time1=array();
        $array_time2=array();

        if(!empty($time)){

            $a_time=strtotime(date('Y-m-d 00:00:00',strtotime($time)));
            $a_time_1=strtotime(date('Y-m-d 23:59:59',strtotime($time)));
            $a1['end_time'] = array('between',array($a_time,$a_time_1));
            $a2['addtime'] = array('between',array($a_time,$a_time_1));
            $a3['pay_time'] = array('between',array($a_time,$a_time_1));


            $list = db('order')->where(array('is_pay' => 2))->where('end_time','between',[$a_time,$a_time_1])->field('pay_price,pay_time,start_time,end_time,riding_mileage')->select();
            //注册量
            $user = db('user')->where(array('is_proxy' => 1, 'state' => array('neq', 2), 'is_service' => 0))->where('addtime','between',[$a_time,$a_time_1])->field('addtime')->select();
            //退款数量
            $refund = db('refund')->where(array('is_delete' => 1, 'refund_type' => 2))->where('pay_time','between',[$a_time,$a_time_1])->field('pay_time,price')->select();

            $i = 0;
            foreach ($list as $k => $v) {
                $array_time[$k]=date('Y-m-d H:i:s', $v['end_time']);
                $arr['label'] = '订单收益';
                $arr['borderWidth'] =1;
                $arr['borderColor'] = 'rgba(0,0,0,0)';
                $arr['backgroundColor'] = 'rgba(51,202,185,0.5)';
                $arr['hoverBackgroundColor'] = 'rgba(51,202,185,0.7)';
                $arr['hoverBorderColor'] = 'rgba(0,0,0,0)';
                $arr['data'][$i] = $v['pay_price'];
                $arr['fill'] = false;
                $arr['lineTension'] =0.5;

                $arra['label'] = '行驶时间';
                $arra['borderWidth'] =1;
                $arra['borderColor'] = '#358ed7';
                $arra['backgroundColor'] = '#358ed7';
                $arra['hoverBackgroundColor'] = '#358ed7';
                $arra['hoverBorderColor'] = '#358ed7';
                $arra['data'][$i] = (($v['end_time']-$v['start_time'])/3600).'小时';
                $arra['fill'] = false;
                $arra['lineTension'] =0.5;


                $arraa['label'] = '行驶里程';
                $arraa['borderWidth'] =1;
                $arraa['borderColor'] = '#99C3FF';
                $arraa['backgroundColor'] = '#99C3FF';
                $arraa['hoverBackgroundColor'] = '#99C3FF';
                $arraa['hoverBorderColor'] = '#99C3FF';
                $arraa['data'][$i] = $v['riding_mileage'];
                $arraa['fill'] = false;
                $arraa['lineTension'] =0.5;


                $array['label'] = '订单总量';
                $array['borderWidth'] =1;
                $array['borderColor'] = '#99C3FF';
                $array['backgroundColor'] = '#99C3FF';
                $array['hoverBackgroundColor'] = '#99C3FF';
                $array['hoverBorderColor'] = '#99C3FF';
                $array['data'][$i] =$k+1;
                $array['fill'] = false;
                $array['lineTension'] =0.5;
                $i++;
            }

            foreach($user as $k=>$v){
                $array_time1[$k]=date('Y-m-d H:i:s', $v['addtime']);

                $arr_user['label'] = '注册量';
                $arr_user['borderWidth'] =1;
                $arr_user['borderColor'] = '#99C3FF';
                $arr_user['backgroundColor'] = '#99C3FF';
                $arr_user['hoverBackgroundColor'] = '#99C3FF';
                $arr_user['hoverBorderColor'] = '#99C3FF';
                $arr_user['data'][$k] =$k+1;//
                $arr_user['fill'] = false;
                $arr_user['lineTension'] =0.5;
            }
            //

            foreach($refund as $k=>$v){
                $array_time2[$k]=date('Y-m-d H:i:s', $v['pay_time']);
                $array_refund['label'] = '补款金额';
                $array_refund['borderWidth'] =1;
                $array_refund['borderColor'] = '#99C3FF';
                $array_refund['backgroundColor'] = '#99C3FF';
                $array_refund['hoverBackgroundColor'] = '#99C3FF';
                $array_refund['hoverBorderColor'] = '#99C3FF';
                $array_refund['data'][$k] =$v['price'];
                $array_refund['fill'] = false;
                $array_refund['lineTension'] =0.5;
            }


        }else{
            //订单收益 行驶时间 行驶里程
            $number=date("t");//获取到当月的天数
            for($i=0;$i<$number;$i++){
                $a_time=strtotime(date('Y-m-'.$i.' 00:00:00'));
                $a_time_1=strtotime(date('Y-m-'.$i.' 23:59:59'));
                $list = db('order')->where(array('is_pay' => 2))->where('end_time','between',[$a_time,$a_time_1])->field('pay_price,pay_time,start_time,end_time,riding_mileage')->count();
                $list_pay_price = db('order')->where(array('is_pay' => 2))->where('end_time','between',[$a_time,$a_time_1])->field('pay_price,pay_time,start_time,end_time,riding_mileage')->sum('pay_price');
                $list_pay_riding_mileage = db('order')->where(array('is_pay' => 2))->where('end_time','between',[$a_time,$a_time_1])->field('pay_price,pay_time,start_time,end_time,riding_mileage')->sum('riding_mileage');
                $list_pay_pricetime = db('order')->where(array('is_pay' => 2))->where('end_time','between',[$a_time,$a_time_1])->field('pay_price,pay_time,start_time,end_time,riding_mileage')->find();
                //注册量
                $user = db('user')->where(array('is_proxy' => 1, 'state' => array('neq', 2), 'is_service' => 0))->where('addtime','between',[$a_time,$a_time_1])->count();
                //退款数量
                $refund = db('refund')->where(array('is_delete' => 1, 'refund_type' => 2))->where('pay_time','between',[$a_time,$a_time_1])->field('pay_time,price')->sum('price');
                $array_time1[$i]=$i+1;
                $arr_user['label'] = '注册量';
                $arr_user['borderWidth'] =1;
                $arr_user['borderColor'] = '#99C3FF';
                $arr_user['backgroundColor'] = '#99C3FF';
                $arr_user['hoverBackgroundColor'] = '#99C3FF';
                $arr_user['hoverBorderColor'] = '#99C3FF';
                $arr_user['data'][$i] =$user;//
                $arr_user['fill'] = false;
                $arr_user['lineTension'] =0.5;
                //补款金额
                $array_time2[$i]=$i+1;
                $array_refund['label'] = '补款金额';
                $array_refund['borderWidth'] =1;
                $array_refund['borderColor'] = '#99C3FF';
                $array_refund['backgroundColor'] = '#99C3FF';
                $array_refund['hoverBackgroundColor'] = '#99C3FF';
                $array_refund['hoverBorderColor'] = '#99C3FF';
                $array_refund['data'][$i] =$refund;
                $array_refund['fill'] = false;
                $array_refund['lineTension'] =0.5;

                $array_time[$i]=$i+1;
                $arr['label'] = '订单收益';
                $arr['borderWidth'] =1;
                $arr['borderColor'] = 'rgba(0,0,0,0)';
                $arr['backgroundColor'] = 'rgba(51,202,185,0.5)';
                $arr['hoverBackgroundColor'] = 'rgba(51,202,185,0.7)';
                $arr['hoverBorderColor'] = 'rgba(0,0,0,0)';
                $arr['data'][$i] = $list_pay_price;
                $arr['fill'] = false;
                $arr['lineTension'] =0.5;

                $arra['label'] = '行驶时间';
                $arra['borderWidth'] =1;
                $arra['borderColor'] = '#358ed7';
                $arra['backgroundColor'] = '#358ed7';
                $arra['hoverBackgroundColor'] = '#358ed7';
                $arra['hoverBorderColor'] = '#358ed7';
                $arra['data'][$i] = (($list_pay_pricetime['end_time']-$list_pay_pricetime['start_time'])/3600).'小时';
                $arra['fill'] = false;
                $arra['lineTension'] =0.5;


                $arraa['label'] = '行驶里程';
                $arraa['borderWidth'] =1;
                $arraa['borderColor'] = '#99C3FF';
                $arraa['backgroundColor'] = '#99C3FF';
                $arraa['hoverBackgroundColor'] = '#99C3FF';
                $arraa['hoverBorderColor'] = '#99C3FF';
                $arraa['data'][$i] = $list_pay_riding_mileage;
                $arraa['fill'] = false;
                $arraa['lineTension'] =0.5;


                $array['label'] = '订单总量';
                $array['borderWidth'] =1;
                $array['borderColor'] = '#99C3FF';
                $array['backgroundColor'] = '#99C3FF';
                $array['hoverBackgroundColor'] = '#99C3FF';
                $array['hoverBorderColor'] = '#99C3FF';
                $array['data'][$i] =$list;
                $array['fill'] = false;
                $array['lineTension'] =0.5;
            }
        }
//        dump($arr_user);die;
        switch($id){
            case 1:
                $this->assign('time',json_encode($array_time));
                $this->assign('list',json_encode($arr));
                break;
            case 2:
                $this->assign('time',json_encode($array_time));
                $this->assign('list',json_encode($arra));
                break;
            case 3:
                $this->assign('time',json_encode($array_time));
                $this->assign('list',json_encode($arraa));
                break;
            case 4:
                $this->assign('time',json_encode($array_time1));
                $this->assign('list',json_encode($arr_user));
                break;
            case 5:
                $this->assign('time',json_encode($array_time));
                $this->assign('list',json_encode(array_values($array)));
                break;
            case 6:
                $this->assign('time',json_encode($array_time2));
                $this->assign('list',json_encode($array_refund));
                break;
            default:
                $this->assign('time',json_encode($array_time1));
                $this->assign('list',json_encode($arr_user));
                break;

        }
        $this->assign('id',$id);
        $this->assign('times',$time);
        return $this->fetch('workbench/event_list');
    }
    //添加
    public  function workbench_add(){
    //$a=md5(md5('1234'));
    //echo $a;
        if(Request::instance()->isPost()){
            $data=Request::param();

            $arra['phone']=$data['phone'];
            $arra['account']=$data['account'];
            $arra['poasword']=md5(md5($data['pwd']));
            $arra['city']=$data['address'];
            $arra['addtime']=time();
            $arra['name']=$data['name'];
            $arra['admin_id']=session('admin_id');

            if(!empty($data['locations0'])){
                $a1 = explode(",", $data['locations0']);
                $b1 =json_encode([
                    'lat'=>$a1[0],
                    'lng'=>$a1[1],
                ]);
                $arra['location1']=$b1;
            }
            if(!empty($data['locations1'])){
                $a2 = explode(",", $data['locations1']);
                $b2 =json_encode([
                    'lat'=>$a2[0],
                    'lng'=>$a2[1],
                ]);
                $arra['location2']=$b2;
            }
            if(!empty($data['locations2'])){
                $a3 = explode(",", $data['locations2']);
                $b3 =json_encode([
                    'lat'=>$a3[0],
                    'lng'=>$a3[1],
                ]);
                $arra['location3']=$b3;
            }
            if(!empty($data['locations3'])){
                $a4 = explode(",", $data['locations3']);
                $b4 =json_encode([
                    'lat'=>$a4[0],
                    'lng'=>$a4[1],
                ]);
                $arra['location4']=$b4;
            }

           $add=db('proxy')->insert($arra);
            if ($add) {
                return alert_success_parent('添加成功');
            } else {
                return alert_error('添加失败');
            }
        }
        return $this->fetch('workbench/workbench_add');
    }

}