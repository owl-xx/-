<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/29 0029
 * Time: 0:16
 */

namespace app\manage\validate;
use think\Validate;

class Goods extends Validate
{

    protected $rule = [
        'store_id' => 'require',
        'goods_name' => 'require',
        'content' => 'require',
//        'goods_type' => 'require',
        'shop_price' => 'require',
        'is_on_sale' => 'require',
        'store_count' => 'require',
        'is_kind_goods' => 'require',
//        'is_index_show' => 'require',
//        'is_earnest' => 'require',
    ];


}