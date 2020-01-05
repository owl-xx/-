<?php

namespace app\http\middleware;
use think\Config;
use think\facade\Session;
class Authlogin
{

     /**
     * 登录中间件： 
     *
     * @return mixed
     */
    public function handle($request, \Closure $next)
    {   
        $session_hash =  Session::has('admin_id');
        if (!$session_hash) {
            //跳转到父窗口
            echo "<script>window.parent.location.href='/login'</script>";
           
        }

        return $next($request);

    }



}
