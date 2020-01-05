<?php

namespace app\manage\validate;

use think\Validate;

class User extends Validate
{


    protected $rule = [
        'add_time'  =>  'require',
        'reg_from'  =>  'require',
        'reg_type'  =>  'require',
        'phone'  =>  'require',
        'nickname'  =>  'require',
        'sex'  =>  'require',
        'binding_phone'  =>  'require',
        'balance'  =>  'require',
        'user_status'  =>  'require'
    ];

}