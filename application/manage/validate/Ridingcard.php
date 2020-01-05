<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/11/18 0018
 * Time: 11:45
 */

namespace app\manage\validate;


use think\Validate;

class Ridingcard extends Validate
{
    protected $rule = [
        'money'  =>  'require',
        'discount_money'  =>  'require',
        'gift_money'  =>  'require',
        'discount'  =>  'require',
    ];

}