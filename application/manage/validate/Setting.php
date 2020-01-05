<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/11/20 0020
 * Time: 14:12
 */
namespace app\manage\validate;

use think\Validate;
class Setting extends Validate
{
    protected $rule = [
        'money'  =>  'require',
        'electricity'  =>  'require',
        'violation_money'  =>  'require',
        'deposit'  =>  'require',
    ];
}