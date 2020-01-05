<?php
namespace app\manage\controller;

use think\Controller;
use think\facade\Session;
use think\facade\Request;
use  think\facade\Config;
/**
 * 登录
 */
class Login extends Base
{
    
    public function index(Request $request)
    {
        return $this->fetch('index/login');
    }

    public function login_send()
    {
        $request_data = Request::param();
        if(!Request::has('admin_name','post') ||!Request::has('admin_password','post')  || !Request::has('captcha','post') ){
            return json(['status'=>'1','message'=>'手机号或密码不能为空']);
        }
        $admin_name = $request_data['admin_name'];
        $admin_password  =  $request_data['admin_password'];
        $captcha  =  $request_data['captcha'];

        //验证码校验
        if( !captcha_check($captcha )){
            return json(['status'=>'1','message'=>'验证码错误']);
        }
		$admin_mes  = db("admin")
			->field('id,account,password')
			->where('account',$admin_name)
            ->find();
            
        $web_md5_str =Config::get("config_set.web_md5_str");
		if($admin_mes){
            $new_password = MD5($admin_password.$web_md5_str);
			if($new_password == $admin_mes['password']){
                Session::set("admin_id",$admin_mes['id']);
				return json(['status'=>'2','message'=>'登录成功']);
			}else{
				return json(['status'=>'1','message'=>'密码错误']);
			}
		}else{
			return json(['status'=>'1','message'=>'用户名或密码错误']);
		}
        

    }



    //退出
    public function logout()
    {
        session(null);
        $url = '/login';
        return redirect($url);

    }










}
