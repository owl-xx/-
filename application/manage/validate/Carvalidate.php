<?php
/**
 * Created by PhpStorm.
 * User: leiqi
 * Date: 2019-11-18
 * Time: 20:49
 */

namespace app\manage\validate;

use think\Validate;

class Carvalidate extends Validate
{
    protected $rule = [
        'car_coding' => 'require',
        'iccid' => 'require',
        'IMEI' => 'require',
        //'sver' => 'require',
        //'hver' => 'require',
        'city' => 'require',
        'distance' => 'require',
        //'mileage' => 'require',
        //'billing' => 'require',
        'address' => 'require',
        'car_frame' => 'require',
        'car_model' => 'car_model',
        // 'landmark' => 'require',
        'car_type' => 'require',
    ];

}