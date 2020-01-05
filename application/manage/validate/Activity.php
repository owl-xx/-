<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/27 0027
 * Time: 17:53
 */

namespace app\manage\validate;

use think\Validate;
class Activity extends Validate
{
    protected $rule = [
        'theme'  =>  'require',
        'content'  =>  'require',
        'url'  =>  'require',
        'start_time'  =>  'require',
        'end_time'  =>  'require',
        'store_id'  =>  'require',
        'state'  =>  'require',
    ];
}