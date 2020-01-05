<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/11/18 0018
 * Time: 19:54
 */

namespace app\manage\validate;

use think\Validate;
class Card extends Validate
{
    protected $rule = [
        'card_type'  =>  'require',
        'discount_money'  =>  'require',
        'money'  =>  'require',
    ];
}