<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/25 0025
 * Time: 16:04
 */

namespace app\manage\validate;


use think\Validate;

class Address extends Validate
{

    protected $rule = [
        'name'  =>  'require',
        'phone'  =>  'require',
        'province_id'  =>  'require',
        'city_id'  =>  'require',
        'qu_id'  =>  'require',
        'address'  =>  'require',
        'show_status'  =>  'require',
    ];


}