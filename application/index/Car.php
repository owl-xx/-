<?php


namespace app\proxy\controller;

use think\Request;
use app\proxy\model\Car as CarModel;

class Car
{
    public function __construct()
    {
    }

    /**
     * @api {POST} proxy/car/carList 获取车子列表
     * @apiGroup proxy
     * @apiDescription  获取车子列表
     * @apiParam {String} store_id 代理商ID[必填]
     * @apiParam {String} type 类型[必填]   //车子的状态 12未租未锁 1未租未断电 2长时间未还  3长时间未查  4长时间未使用 6故障 5可用 7上线 8 下线 9服务区外 10 定位失败    11未租未查
     * @apiParam {String} car_coding 查询条件[非必填]   //车子码  不为空则模糊查询  空则输出列表  默认为空
     * @apiParam {String} electricity 电量查询条件[非必填]   //查询小于等于电量标准的车子
     * @apiParam {String} is_location 地图查看[非必填]   //1 为地图查看  2为非地图  默认为1
     * @apiParam {String} rescueState 救援的状态[非必填]   //1=处理中  2处理完成 3取消救援  4=待救援  默认查询为1
     * @apiParam {ing} page[非必填] 分页信息 从第几条开始  不传默认为0
     * @apiSuccess {json} data 信息
     * @apiSuccess {json} data-car_coding 车子编码号
     * @apiSuccess {json} data-type //车子的状态 0未租未锁 1未租未断电 2长时间未还 3长时间未使用 3车辆故障 4低电量 5正常 6 上线 7 下线 8服务区外 9定位失败
     * @apiSuccess {json} data-available //车子可用为1  不可用为2
     * @apiSuccess {json} data-offline_reason //下线原因  空为 未下线
     * @apiSuccess {json} data-offline_time //下线时间  空为没下线
     * @apiSuccess {json} data-offline_location //下线坐标  空为 未下线
     * @apiSuccess {json} data-electricity //车子电量
     * @apiSuccess {json} data-state //车子状态  0=正常 1=异常
     * @apiSuccess {int} code 返回码
     * @apiSuccessExample {json} 成功返回样例：
     * {"code":200,"data":[{"car_coding":"111111","type":5,"available":1,"offline_reason":null,"offline_time":null,"offline_location":null,"electricity":100,"state":0}]}
     * @apiErrorExample {json}   错误返回样例：
     * {"msg":"失败","code":"20002"}
     */
    public function carList(){
        if(Request::instance()->isPost()){
            $info = Request::instance()->param();
            if(empty($info['store_id']) || empty($info['type'])){
                return error('参数不足',20001);
            }
            $info['page'] = empty($info['page']) ? 0 : $info['page'];
            $carModel = new CarModel();
            $info['type'] = $info['type'] == 12 ? 0 : $info['type'];
            return $carModel->getCarList($info);
        }
    }

    /**
     * @api {POST} proxy/car/getContList 获取车子列表的数量
     * @apiGroup proxy
     * @apiDescription  获取车子列表
     * @apiParam {String} store_id 代理商Id[必填]
     * @apiSuccess {json} data 信息
     * @apiSuccess {json} data-0 未租未锁车辆
     * @apiSuccess {json} data-1 未租未断电车辆
     * @apiSuccess {json} data-2 长时间未还车辆
     * @apiSuccess {json} data-3 长时间未查车辆
     * @apiSuccess {json} data-4 长时间未骑车辆
     * @apiSuccess {json} data-5 故障车辆
     * @apiSuccess {json} data-6 可用的车辆
     * @apiSuccess {json} data-7 上线车辆
     * @apiSuccess {json} data-8 下线车辆
     * @apiSuccess {json} data-9 服务区外车辆
     * @apiSuccess {json} data-10 定位失败车辆
     * @apiSuccess {json} data-11 学生待认证
     * @apiSuccess {json} data-12 报警信息
     * @apiSuccess {json} data-13 故障上报
     * @apiSuccess {json} data-14 换电总览
     * @apiSuccess {json} data-15 还车失败
     * @apiSuccess {int} code 返回码
     * @apiSuccessExample {json} 成功返回样例：
     * {"code":"200","data":[0,0,0,0,0,0,1,0,0,0,0,0,1,2,2,2]}
     * @apiErrorExample {json}   错误返回样例：
     * {"msg":"失败","code":"20002"}
     */

    public function getContList(){
        if(Request::instance()->isPost()){
            $storeId = Request::instance()->param('store_id');
            $carModel = new CarModel();
            return $carModel->getListCount($storeId);
        }
    }
    /**
     * @api {POST} proxy/car/carInfo 获取车子详情
     * @apiGroup proxy
     * @apiDescription  获取车子列表
     * @apiParam {String} store_id 代理商Id[必填]
     * @apiSuccess {json} data 信息
     * @apiSuccess {json} data-name 代理商名字
     * @apiSuccess {json} data-electricity 剩余电量
     * @apiSuccess {json} data-malfunction 故障的原因
     * @apiSuccess {json} data-state 是否可用
     * @apiSuccess {int} code 返回码
     * @apiSuccessExample {json} 成功返回样例：
     * {"code":200,"data":{"name":"","electricity":100,"malfunction":"车辆损坏","state":"可用"}}
     * @apiErrorExample {json}   错误返回样例：
     * {"msg":"失败","code":"20002"}
     */
    public function carInfo(){
        if(Request::instance()->isPost()){
            $catId = Request::instance()->param('car_id');
            $storeId = Request::instance()->param('store_id');
            if(empty($catId) || empty($storeId)){
                return error('参数不足',20001);
            }
            $carModel = new CarModel();
            return $carModel->carInfo($catId,$storeId);
        }
    }
    /**
     * @api {POST} proxy/car/carManagementCount 获取车子总的管理数量
     * @apiGroup proxy
     * @apiDescription  获取车子总的管理数量
     * @apiParam {String} store_id 代理商Id[必填]
     * @apiParam {String} chargeArea 电量筛选[必填]
     * @apiParam {String} page 从第几条信息开始获取 作用于分页 默认为0[非必填]
     * @apiSuccess {json} data 信息
     * @apiSuccess {json} data-car_sum-list 总的可管理的车子的列表
     * @apiSuccess {json} data-car_sum-sum 总的可管理的车子的数量
     * @apiSuccess {json} data-car_sum-list-car_coding 车子编号
     * @apiSuccess {json} data-car_sum-list-type 类型车子状态 0未租未锁  1未租未断电 2长时间未还   3长时间未查看 4长时间未使用  6车辆故障  5正常 7 上线 8 下线 9服务区外  10定位失败
     * @apiSuccess {json} data-car_sum-list-malfunction_type 故障类型  0为没有
     * @apiSuccess {json} data-car_sum-list-offline_location 车子坐标
     * @apiSuccess {json} data-car_sum-list-address 车子具体位置
     *
     * @apiSuccess {json} data-electricity-list 关于猪肝粉可管理的车子的列表
     * @apiSuccess {json} data-electricity-sum 低电量可管理的车子的数量
     * @apiSuccess {json} data-electricity-list-car_coding 车子编号
     * @apiSuccess {json} data-electricity-list-type 类型车子状态 0未租未锁  1未租未断电 2长时间未还   3长时间未查看 4长时间未使用  6车辆故障  5正常 7 上线 8 下线 9服务区外  10定位失败
     * @apiSuccess {json} data-electricity-list-malfunction_type 故障类型  0为没有
     * @apiSuccess {json} data-electricity-list-offline_location 车子坐标
     * @apiSuccess {json} data-electricity-list-address 车子具体位置

     * @apiSuccess {json} data-malfunction-list 故障可管理的车子的列表
     * @apiSuccess {json} data-malfunction-sum 故障可管理的车子的数量
     * @apiSuccess {json} data-malfunction-list-car_coding 车子编号
     * @apiSuccess {json} data-malfunction-list-type 类型车子状态 0未租未锁  1未租未断电 2长时间未还   3长时间未查看 4长时间未使用  6车辆故障  5正常 7 上线 8 下线 9服务区外  10定位失败
     * @apiSuccess {json} data-malfunction-list-malfunction_type 故障类型  0为没有
     * @apiSuccess {json} data-malfunction-list-offline_location 车子坐标
     * @apiSuccess {json} data-malfunction-list-address 车子具体位置
     * @apiSuccess {int} code 返回码
     * @apiSuccessExample {json} 成功返回样例：
     * {"code":200,"data":{"car_sum":{"list":[{"car_coding":"222","type":5,"malfunction_type":"测试","offline_location":""}],"sum":3},"electricity":{"sum":0,"list":[]},"malfunction":{"sum":2,"list":[{"car_coding":"222","type":5,"malfunction_type":"测试","offline_location":""},{"car_coding":"111111","type":5,"malfunction_type":"","offline_location":""}]},"riding":{"sum":1,"list":[{"id":19,"uid":200,"car_id":1,"car_type":"单车","start_time":1569492674,"end_time":0,"start_location":"{\"lat\":30.5702,\"lng\":104.06476}","end_location":"","order_no":"2019092650525250","pay_price":"0.00","city":"","is_pay":1,"pay_type":0,"pay_time":0,"order_type":2,"is_show":1,"is_delete":1,"store_id":1,"is_admin":1,"is_riding":1,"is_temporary_lock":1,"is_correct_parking":1,"locak_location":"","is_card":1,"riding_time":0,"riding_mileage":0}]}}}
     * @apiErrorExample {json}   错误返回样例：
     * {"msg":"失败","code":"20002"}
     */
    public function carManagementCount(){
        if(Request::instance()->isPost()){
            $storeId = Request::instance()->param('store_id');
            $page = Request::instance()->param('page');
            $chargeArea = Request::instance()->param('chargeArea');
            if(empty($storeId)){
                return error('参数不足',20001);
            }
            $carModel = new CarModel();
            $page = empty($page) ? 0 : $page;
            $chargeArea = empty($chargeArea) ? 100 : $chargeArea;
            return $carModel->managementList($storeId,$page,$chargeArea);
        }
    }

    /**
     * @api {POST} proxy/car/findWhere 条件模糊查询
     * @apiGroup proxy
     * @apiDescription  获取车子总的管理数量
     * @apiParam {String} store_id 代理商Id[必填]
     * @apiParam {String} where 模糊查询的条件[必填]
     * @apiParam {String} page 从第几条信息开始获取 作用于分页 默认为0[非必填]
     * @apiSuccess {json} data 信息
     * @apiSuccess {json} data-car_sum-list 总的可管理的车子的列表
     * @apiSuccess {json} data-car_sum-sum 总的可管理的车子的数量
     * @apiSuccess {json} data-car_sum-list-car_coding 车子编号
     * @apiSuccess {json} data-car_sum-list-type 类型车子状态 0未租未锁  1未租未断电 2长时间未还   3长时间未查看 4长时间未使用  6车辆故障  5正常 7 上线 8 下线 9服务区外  10定位失败
     * @apiSuccess {json} data-car_sum-list-malfunction_type 故障类型  0为没有
     * @apiSuccess {json} data-car_sum-list-offline_location 车子坐标
     * @apiSuccess {json} data-car_sum-list-address 车子具体位置
     *
     * @apiSuccess {json} data-electricity-list 关于猪肝粉可管理的车子的列表
     * @apiSuccess {json} data-electricity-sum 低电量可管理的车子的数量
     * @apiSuccess {json} data-electricity-list-car_coding 车子编号
     * @apiSuccess {json} data-electricity-list-type 类型车子状态 0未租未锁  1未租未断电 2长时间未还   3长时间未查看 4长时间未使用  6车辆故障  5正常 7 上线 8 下线 9服务区外  10定位失败
     * @apiSuccess {json} data-electricity-list-malfunction_type 故障类型  0为没有
     * @apiSuccess {json} data-electricity-list-offline_location 车子坐标
     * @apiSuccess {json} data-electricity-list-address 车子具体位置

     * @apiSuccess {json} data-malfunction-list 故障可管理的车子的列表
     * @apiSuccess {json} data-malfunction-sum 故障可管理的车子的数量
     * @apiSuccess {json} data-malfunction-list-car_coding 车子编号
     * @apiSuccess {json} data-malfunction-list-type 类型车子状态 0未租未锁  1未租未断电 2长时间未还   3长时间未查看 4长时间未使用  6车辆故障  5正常 7 上线 8 下线 9服务区外  10定位失败
     * @apiSuccess {json} data-malfunction-list-malfunction_type 故障类型  0为没有
     * @apiSuccess {json} data-malfunction-list-offline_location 车子坐标
     * @apiSuccess {json} data-malfunction-list-address 车子具体位置
     * @apiSuccess {int} code 返回码
     * @apiSuccessExample {json} 成功返回样例：
     * {"code":200,"data":{"car_sum":{"list":[{"car_coding":"222","type":5,"malfunction_type":"测试","offline_location":""}],"sum":3},"electricity":{"sum":0,"list":[]},"malfunction":{"sum":2,"list":[{"car_coding":"222","type":5,"malfunction_type":"测试","offline_location":""},{"car_coding":"111111","type":5,"malfunction_type":"","offline_location":""}]},"riding":{"sum":1,"list":[{"id":19,"uid":200,"car_id":1,"car_type":"单车","start_time":1569492674,"end_time":0,"start_location":"{\"lat\":30.5702,\"lng\":104.06476}","end_location":"","order_no":"2019092650525250","pay_price":"0.00","city":"","is_pay":1,"pay_type":0,"pay_time":0,"order_type":2,"is_show":1,"is_delete":1,"store_id":1,"is_admin":1,"is_riding":1,"is_temporary_lock":1,"is_correct_parking":1,"locak_location":"","is_card":1,"riding_time":0,"riding_mileage":0}]}}}
     * @apiErrorExample {json}   错误返回样例：
     * {"msg":"失败","code":"20002"}
     */
    public function findWhere(){
        if(Request::instance()->isPost()){
            $storeId = Request::instance()->param('store_id');
            $page = Request::instance()->param('page');
            $where = Request::instance()->param('where');
            if(empty($storeId) || empty($where)){
                return error('参数不足',20001);
            }
            $carModel = new CarModel();
            $page = empty($page) ? 0 : $page;
            return $carModel->findAll($storeId,$where,$page);
        }
    }
    /**
     *	车子启动
     **/
    public function start(){
    	if(Request::instance()->isPost()){
            $carId = Request::instance()->param('carId');
            $storeId = Request::instance()->param('store_id');
            if(empty($carId)){
                return error('参数不足',20001);
            }
            $carModel = new CarModel();
            return $carModel->start($carId,$storeId);
        }
    }
    /**
     *	车子关闭 上锁
     **/
    public function endCar(){
    	if(Request::instance()->isPost()){
            $carId = Request::instance()->param('carId');
            $storeId = Request::instance()->param('store_id');
            if(empty($carId)){
                return error('参数不足',20001);
            }
            $carModel = new CarModel();
            return $carModel->endCar($carId,$storeId);
        }
    }
    /**
     *	车子开坐垫锁 
     **/
    public function carOpen(){
    	if(Request::instance()->isPost()){
            $carId = Request::instance()->param('carId');
            $storeId = Request::instance()->param('store_id');
            if(empty($carId)){
                return error('参数不足',20001);
            }
            $carModel = new CarModel();
            return $carModel->open($carId,$storeId);
        }
    }
    /**
    * 寻找车子  车子鸣笛
    *	carId  车子ID 必须 
    **/
    public function speak(){
     	 if(Request::instance()->isPost()){
    		$carId = Request::instance()->param('carId');
    		$storeId = Request::instance()->param('store_id');
    		if(empty($carId)){
    			return error('参数不足');
    		}
	    	$carModel = new CarModel();
	    	return $carModel->speak($carId,$storeId);
    	}
    }
}