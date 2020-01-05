<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/27 0027
 * Time: 17:53
 */

namespace app\manage\validate;

use think\Validate;
class Returncars extends Validate
{
    protected $rule = [
        'city'  =>  'require',
        'store_id'  =>  'require',
//        'location0'  =>  'require',
//        'location1'  =>  'require',
//        'location2'  =>  'require',
        'handling_fee'  =>  'require',
        'state'  =>  'require',
    ];
}