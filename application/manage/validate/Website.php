<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/5 0005
 * Time: 10:42
 */

namespace app\manage\validate;
use think\Validate;

class Website extends Validate
{
    protected $rule = [
        'media_type'  =>  'require',
        'ad_name'  =>  'require',
        'ad_link'  =>  'require',
        'show_status'  =>  'require',
        'ad_type'  =>  'require',
    ];
}