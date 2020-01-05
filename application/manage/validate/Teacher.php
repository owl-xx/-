<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/3 0003
 * Time: 7:26
 */

namespace app\manage\validate;

use think\Validate;
class Teacher extends Validate
{
    protected $rule = [
        'store_id'  =>  'require',
        'teacher_name'  =>  'require',
        'teacher_info'  =>  'require',
    ];
}