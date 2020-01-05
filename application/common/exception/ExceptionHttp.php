<?php
namespace app\common\exception;

use Exception;
use think\exception\Handle;
use think\exception\HttpException;
use think\exception\ValidateException;
use think\Config;

/**
 * 自定义异常接管
 */
class ExceptionHttp extends Handle
{
    public function render(Exception $e)
    {
        $debug_status = Config('app.app_debug');
        if($debug_status){
            //调试模式下显示错误信息
            return parent::render($e);
        }else{
            $errorcode = $e->getCode();
            if($errorcode == '9999'){
                $return_code = '9999';
            }else{
                $return_code = '100000';
            }
            return json(['status'=>'2','errorcode'=>$return_code,'message'=>$e->getMessage(), 'result'=>'']);
        }
    }
    


}