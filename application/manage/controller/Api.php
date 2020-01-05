<?php
namespace app\manage\controller;
use think\Controller;
use think\facade\Session;
use think\Request;
use think\facade\Config;
use think\captcha\Captcha;

//阿里云服务
use app\common\services\Alioss;

/**
 * 公共方法
 */

class Api extends Base
{
    

    //验证码
    public function verify()
    {
        $captcha = new Captcha();
        return $captcha->entry();    
    }



	



	/**
	 * 百度编辑器上传图片
	 */
	public function file_upload_ueditor(){
		
		$file = request()->file();

		if (!empty($file) && isset($file['upfile'])) {

			$alioss_model = model("AliossModel");

			$upfile = $file['upfile'];
			$file_data = $upfile->getInfo();
			$path = 'thumb';
			$file_mes =  $alioss_model->file_upload($file_data,$path);

			$img_host_url = Config::get("config_set.img_host_url");

			$result = [
				'state' => 'SUCCESS',
				'url' => $img_host_url.$file_mes['file_path'],
				'title' => '图片',
				'original' => $file_mes['file_path']
			];

			return json($result);
		
		}else{
			return json([
				'state' => '文件上传失败'
			]);
		}

		
	}




















}
