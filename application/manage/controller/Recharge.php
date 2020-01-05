<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-11
 * Time: 10:59
 */

namespace app\manage\controller;


use app\manage\validate\Card;
use app\manage\validate\Ridingcard;
use app\manage\validate\Setting;
use think\Db;
use think\facade\Request;

class Recharge extends  Base
{
    //骑行卡查询
    public function recharge_list(){
        $list=db('recharge_list')->paginate(20);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        return $this->fetch('recharge/recharge_list');
    }
    //骑行卡添加
    public function recharge_add(){
        return $this->fetch('recharge/recharge_add');
    }
    public function recharge_add_batch(){
        $data=Request::param();
        $user_validata = new Ridingcard;
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        $arr=array(
            'money'  => $data['money'],
            'discount_money'  => $data['discount_money'],
            'gift_money'  =>  $data['gift_money'],
            'discount'  => $data['discount'],
        );
        $add=db('recharge_list')->insert($arr);
        if ($add) {
            return alert_success_parent('添加成功');
        } else {
            return alert_error('添加失败');
        }
    }
    //骑行卡修改
    public function recharge_updele(){
        $id=Request::param('id');
        $list=db('recharge_list')->where('id',$id)->find();
        $this->assign('list', $list);
        return $this->fetch('recharge/recharge_updele');
    }
    public function recharge_updele_batch(){
        $data=Request::param();
        $user_validata = new Ridingcard;
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        if($data['discount'] == 0){
        	return alert_error('不可调整为0折，请重新调整！');
        }
        $arr=array(
            'money'  => $data['money'],
            'discount_money'  => $data['discount_money'],
            'gift_money'  =>  $data['gift_money'],
            'discount'  => $data['discount'],
            'addtime' => time()
        );
        $add=db('recharge_list')->where('id',$data['id'])->update($arr);
        if ($add) {
            return alert_success_parent('修改成功');
        } else {
            return alert_error('修改失败');
        }
    }
    //骑行卡删除
    public function recharge_delete(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('recharge_list')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除', '/recharge/recharge_list');
            } else {
                return alert_error('删除失败');
            }

        }
    }
    //充值查询
    public function card_list(){
        $list=db('card_list')->paginate(20);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        return $this->fetch('recharge/card_list');
    }
    //充值添加
    public function card_add(){
        return $this->fetch('recharge/card_add');
    }
    public function card_add_batch(){
        $data=Request::param();
        $user_validata = new Card();
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        $arr=array(
            'money'  => $data['money'],
            'discount_money'  => $data['discount_money'],
            'card_type'  =>  $data['card_type'],
            'sum'  =>$data['sum'],
             'addtime'=>time(),
        );
        if($arr['card_type']==1){
            $arr['day_count']=7;
        }else if($arr['card_type']==2){
            $arr['day_count']=30;
        }else{
            $arr['day_count']=365;
        }
        $add=db('card_list')->insert($arr);
        if ($add) {
            return alert_success_parent('添加成功');
        } else {
            return alert_error('添加失败');
        }
    }
    //充值修改
    public function card_updele(){
        $id=Request::param('id');
        $list=db('card_list')->where('id',$id)->find();
        $this->assign('list', $list);
        return $this->fetch('recharge/card_updele');
    }
    public function card_updele_batch(){
        $data=Request::param();
        $user_validata = new Card();
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        $arr=array(
            'money'  => $data['money'],
            'discount_money'  => $data['discount_money'],
            'card_type'  =>  $data['card_type'],
            'sum'  =>$data['sum'],
            'addtime'=>time(),
        );
        if($arr['card_type']==1){
            $arr['day_count']=7;
        }else if($arr['card_type']==2){
            $arr['day_count']=30;
        }else{
            $arr['day_count']=365;
        }

        $add=db('card_list')->where('id',$data['id'])->update($arr);
        if ($add) {
            return alert_success_parent('修改成功');
        } else {
            return alert_error('修改失败');
        }
    }
    //骑行卡删除
    public function card_delete(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('card_list')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除', '/recharge/card_list');
            } else {
                return alert_error('删除失败');
            }

        }
    }
    //充值明细
    public function recharge(){
        $user_name = Request::param('nickname');;
        $star_time = Request::param('star_time');;
        $end_time = Request::param('end_time');;

        $stars_time= strtotime(date("Y-m-d 00:00:00",strtotime($star_time)));
        $ends_time=strtotime(date("Y-m-d 23:59:59",strtotime($end_time)));
        if(!empty($star_time)){
            $map[] = ['time', 'between', [$stars_time, $ends_time]];
        }

        if(!empty($user_name)){
            $user=db('user')->where('nickname',$user_name)->find();
//            $map[]=['uid',$user['id']];
        }

//        ->where('time','between',[$stars_time,$ends_time])
        if(!empty($map)){
//            echo 11;die;
//            dump($map);die;
            $list=   Db::table('d_recharge')->join('d_user','d_recharge.uid=d_user.id')->where($map)->paginate(20);
            $sum=db('recharge')->join('d_user','d_recharge.uid=d_user.id')->where($map)->sum('pay_price');
        }else{
            $list=   Db::table('d_recharge')->join('d_user','d_recharge.uid=d_user.id')->paginate(20);
            $sum=db('recharge')->join('d_user','d_recharge.uid=d_user.id')->sum('pay_price');
        }
//        halt($list);
        $page = $list->render();
        $this->assign('list', $list);
            $this->assign('end_time', $end_time);
            $this->assign('star_time', $star_time);
        $this->assign('page', $page);
        $this->assign('sum', $sum);
        $this->assign('nickname', $user_name);
        return $this->fetch('recharge/recharge');
    }
    //骑行收费
    public function car_price(){
        $user_name = Request::param('nickname');;
        if(!empty($user_name)){
            $map['car_type']=$user_name;
        }
        if(!empty($map)){
            $list=   db('car_price')->where($map)->paginate(20);
        }else{
            $list=   db('car_price')->paginate(20);
        }
        // dump($list);die;
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('nickname', $user_name);
        return $this->fetch('recharge/car_price');
    }
    //收费明细
    public function detail(){
        $user_name = Request::param('nickname');;
        if(!empty($user_name)){
            $user=db('user')->where('nickname',$user_name)->find();
            $map['uid']=$user['id'];
        }
        if(!empty($map)){
            $list=   Db::table('d_detail')->join('d_user','d_detail.uid=d_user.id')->field('store_id,d_detail.money,type,time,pay_type,nickname')->where($map)->order('time desc')->paginate(20);
            $sum= Db::table('d_detail')->join('d_user','d_detail.uid=d_user.id')->where($map)->sum('d_detail.money');
        }else{
            $list=   Db::table('d_detail')->join('d_user','d_detail.uid=d_user.id')->order('time desc')->field('d_detail.money,type,time,pay_type,nickname')->paginate(20);
            $sum= Db::table('d_detail')->join('d_user','d_detail.uid=d_user.id')->sum('d_detail.money');
        }

        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('sum', $sum);
        $this->assign('nickname', $user_name);
        return $this->fetch('recharge/detail');
    }
    //罚款规则
    public function setting(){
        $list=db('setting')->paginate(20);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        return $this->fetch('recharge/setting');
    }
    //罚款规则添加
    public function setting_add(){
        return $this->fetch('recharge/setting_add');
    }
    public function setting_add_batch(){
        $data=Request::param();
        $user_validata = new Setting;
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        $arr=array(
            'money'  => $data['money'],
            'electricity'  => $data['electricity'],
            'violation_money'  =>  $data['violation_money'],
            'deposit'  => $data['deposit'],
        );
        $add=db('setting')->insert($arr);
        if ($add) {
            return alert_success_parent('添加成功');
        } else {
            return alert_error('添加失败');
        }
    }
    //罚款规则修改
    public function setting_updele(){
        $id=Request::param('id');
        $list=db('setting')->where('id',$id)->find();
        $this->assign('list', $list);
        return $this->fetch('recharge/setting_updele');
    }
    public function setting_updele_batch(){
        $data=Request::param();
        $user_validata = new Setting;
        $result   = $user_validata->batch()->check($data);
        if ($result !== true) {
            return alert_error('参数错误！');
        }
        $arr=array(
            'money'  => $data['money'],
            'electricity'  => $data['electricity'],
            'violation_money'  =>  $data['violation_money'],
            'deposit'  => $data['deposit'],
        );
        $add=db('setting')->where('id',$data['id'])->update($arr);
        if ($add) {
            return alert_success_parent('修改成功');
        } else {
            return alert_error('修改失败');
        }
    }
    //罚款规则删除
    public function setting_delete(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('setting')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除', '/recharge/setting');
            } else {
                return alert_error('删除失败');
            }

        }
    }
    //罚款明细
    public function setting_list(){
        $user_name = Request::param('nickname');;
        if(!empty($user_name)){
            $user=db('user')->where('nickname',$user_name)->find();
            $map['uid']=$user['id'];
        }
        if(!empty($map)){
            $list=   Db::table('d_order')->join('d_user','d_order.uid=d_user.id')->where('is_correct_parking',2)
                    ->where($map)->order('start_time desc')->paginate(20);
        }else{
            $list=   Db::table('d_order')->join('d_user','d_order.uid=d_user.id')->where('is_correct_parking',2)->order('start_time desc')->paginate(20);
        }
        $arr = array();
        foreach($list as $k=>$v){
            $v['start_location']=getRealyAddress($v['start_location']);
            $v['end_location']=getRealyAddress($v['end_location']);
            $arr[$k] = $v;
        }
        $page = $list->render();
        $this->assign('list', $arr);
        $this->assign('page', $page);
        $this->assign('nickname', $user_name);
        return $this->fetch('recharge/setting_list');
    }
    //骑行收费标准
    public function car_price_add(){
        if(Request::instance()->isPost()){
            $car_type = Request::param('car_type');;
            $one_time = Request::param('one_time');;
            $one_price= Request::param('one_price');;
            $two_time = Request::param('two_time');;
            $two_price= Request::param('two_price');;
            $store_id= Request::param('store_id');
            // $time_type = Request::param('time_type');;
            if(empty($car_type)){
                return alert_error('请输入车的类型');
            }
            if(empty($one_time)){
                return alert_error('请输入车的第一时段');
            }
            
            if(empty($one_price)){
                return alert_error('请输入车的第一时段价格收费标准');
            }
            if(empty($two_time)){
                return alert_error('请输入车的第二时段');
            }
            if(empty($two_price)){
                return alert_error('请输入车的第二时段价格收费标准');
            }
            $list=db('car_price')->where(array('car_type'=>$car_type))->find();
            if($list){
                return alert_error('请不要重复录入');
            }
            $arr=array(
                'car_type'=>$car_type,
                 'one_time'=>$one_time,
                 'one_price'=>$one_price,
                  'two_time'=>$two_time,
                 'two_price'=>$two_price,
                'store_id'=>$store_id,
                'addtime'=>time(),
            );
            $inster=db('car_price')->insert($arr);
            if($inster){
                return alert_success_parent('添加成功');
            }else{
                return alert_error('添加失败');
            }



        }
        //查询代理信息
        $proxy=db("proxy")->where(['is_delete'=>2])->select();
        $this->assign('proxy', $proxy);
        return $this->fetch('recharge/car_price_add');
    }
    public function car_price_update(){
        $id = Request::param('id');;
        if(empty($id)){
            return alert_success_parent('参数错误');
        }
        $inster=db('car_price')->where(array('id'=>$id))->find();
        $this->assign('inster', $inster);
        return $this->fetch('recharge/car_price_update');
    }
    //提交
    public function car_price_update_batch()
    {
        if (Request::instance()->isPost()) {
            $car_type = Request::param('car_type');;
           $one_time = Request::param('one_time');;
            $one_price= Request::param('one_price');;
            $two_time = Request::param('two_time');;
            $two_price= Request::param('two_price');;
            $id = Request::param('id');;
            if(empty($car_type)){
                return alert_error('请输入车的类型');
            }
            if(empty($one_time)){
                return alert_error('请输入车的第一时段');
            }
            
            if(empty($one_price)){
                return alert_error('请输入车的第一时段价格收费标准');
            }
            if(empty($two_time)){
                return alert_error('请输入车的第二时段');
            }
            if(empty($two_price)){
                return alert_error('请输入车的第二时段价格收费标准');
            }
            if (empty($id)) {
                return alert_error('参数错误');
            }

            $arr = array(
                'car_type' => $car_type,
               'one_time'=>$one_time,
                 'one_price'=>$one_price,
                  'two_time'=>$two_time,
                 'two_price'=>$two_price,
                'addtime' => time(),
                'id' => $id,
            );
            $inster = db('car_price')->update($arr);
            if ($inster) {
                return alert_success_parent('修改成功');
            } else {
                return alert_error('修改失败');
            }
        }
    }
    public  function car_price_del(){
        if (Request::instance()->isGet()) {
            $id = Request::param('id');
            if (empty($id)) {
                return alert_error('参数错误');
            }
            // 启动事务
            $list = db('car_price')->where(array('id' => $id))->delete();
            if ($list) {
                return alert_success('删除成功', '/recharge/car_price');
            } else {
                return alert_error('删除失败');
            }

        }
    }

    public function excel_add(){
        $file=$this->file_upload('excel','car');
        $path=ROOT_PATH.DS.'public'.DS.'uploads'.DS.$file['file_path'];
        $extension = strtolower(pathinfo($path, PATHINFO_EXTENSION));
        require ROOT_PATH."vendor/phpoffice/phpexcel/Classes/PHPExcel.php";
        if ($extension == 'xlsx') {
            $objReader = new \PHPExcel_Reader_Excel2007();
            $objExcel = $objReader->load($path);
        } else if ($extension == 'xls') {
            $objReader = new \PHPExcel_Reader_Excel5();
            $objExcel = $objReader->load($path);
        }
        $excel_array = $objExcel->getsheet(0)->toArray();   //转换为数组格式
        array_shift($excel_array);  //删除第一个数组(标题);
        // array_shift($excel_array);  //删除th
        foreach ($excel_array as $k=>$v){
            if(!$v[0] || !$v[1]){
                unset($excel_array[$k]);
            }
        }
        $data = [];
        try {
            foreach ($excel_array as $k => $v) {
                $data[$k]["car_coding"] = $v[0];//名称
                $data[$k]["car_model"] = $v[1];//编号
                $data[$k]['car_frame']=$v[2];
                $data[$k]['iccid']=$v[3];
                $data[$k]['billing']=$v[5];
                $data[$k]['IMEI']=$v[6];
                $data[$k]['address']=$v[7];
                $data[$k]['address']=$v[7];
                $data[$k]['distance']=$v[8];
                $data[$k]['distance']=$v[9];
                //根据名称查询代理并导入
               $user= db("proxy")->where(['account'=>$v[4]])->find();

                //查询不到直接舍弃
               if(!$user){
                    continue;
                }
               $data[$k]['store_id']=$user['id'];
            }
        } catch (Exception $e) {
            err("", "请按照规定格式导入");
        }
        db('car')->insertAll($data);
        return alert_success_parent('操作成功');
    }
}