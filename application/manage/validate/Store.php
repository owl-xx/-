<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/3 0003
 * Time: 6:53
 */

namespace app\manage\validate;
use think\Validate;

class Store extends Validate
{
    protected $rule = [
        'province_id'  =>  'require',
        'city_id'  =>  'require',
        'qu_id'  =>  'require',
        'store_name'  =>  'require',
        'address'  =>  'require',
        'complete_address'  =>  'require',
        'business_status'  =>  'require',
    ];
}