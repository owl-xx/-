<?php
/**
 * 七牛云服务
 * 依然范儿特西
 */

namespace app\common\services;

use  think\facade\Config;
use  think\facade\Env;

//七牛配置
use Qiniu\Auth as Auth;
use Qiniu\Storage\BucketManager;
use Qiniu\Storage\UploadManager;



class QiniuServer
{
    var $accessKey, $secretKey ,$bucket , $domain_host;
    public function __construct(){
        $this->accessKey   = Config::get('config_apithird.qiniu.accessKey');
        $this->secretKey   = Config::get('config_apithird.qiniu.secretKey');
        $this->bucket      = Config::get('config_apithird.qiniu.bucket');
        $this->domain_host = Config::get('config_apithird.qiniu.domain');
    }


    /****
	 * file 上传到 七牛
	 */
	public  function upload_qiniu($file_name,$path){
		
		if(empty($file_name) || empty($path)){
			return  $result_data = array(
                        'file_path'=>'',
                        'file_ext'=>'',
                        'file_view'=>'',
                        'file_name'=>'',
                    );
		}

        $file_ext = substr($file_name['name'],strrpos($file_name['name'],'.')+1);
        include_once (Env::get('vendor_path'). 'qiniu/php-sdk/autoload.php');
    
        $auth = new Auth($this->accessKey, $this->secretKey);
        $upToken = $auth->uploadToken($this->bucket);//获取上传所需的token
        
        // 要上传文件的本地路径
        $filePath = $file_name['tmp_name'];
        // 上传到七牛后保存的文件名
        $file_rename = md5(date("YmdHis").mt_rand('11111','99999'));
        $new_file_name = $path."/".date("Ymd")."/".$file_rename.".".$file_ext;
        
        // 初始化 UploadManager 对象并进行文件的上传。
        $uploadMgr = new UploadManager();

        // 调用 UploadManager 的 putFile 方法进行文件的上传。
        list($ret, $err) = $uploadMgr->putFile($upToken, $new_file_name, $filePath);
        
        if ($err !== null) {
            // var_dump($err);
            $result_data = array(
                'file_path'=>'',
                'file_ext'=>'',
                'file_view'=>'',
                'file_name'=>'',
            );
        } else {
            // var_dump($ret);
            $result_data = array(
                'file_path'=>'/'.$ret['key'],
                'file_ext'=>$file_ext,
                'file_view'=>$this->domain_host."/".$ret['key'],
                'file_name'=>$file_rename.".".$file_ext,
            );
           
        }

		return $result_data;
	}

     /****
	 * base64 上传到 七牛
	 */
	public  function upload_qiniu_base64($file_name,$path){

		if(empty($file_name) || empty($path)){
			return '';
		}
		$file_name = trim($file_name);
        $img_mes = preg_match('/^(data:\s*image\/(\w+);base64,)/', $file_name,$result);
        
		if($img_mes){
			$file_ext = $result[2]; //图片后缀
			$str =preg_replace("/data:image\/\w+;base64,/",'',$file_name,1);
            include_once (Env::get('vendor_path'). 'qiniu/php-sdk/autoload.php');

            $auth = new Auth($this->accessKey, $this->secretKey);
			$upToken = $auth->uploadToken($this->bucket);//获取上传所需的token
			$file_rename = md5(date("YmdHis").mt_rand('11111','99999'));
			$new_file_name =$path."/".date("Ymd")."/".$file_rename.".".$file_ext;
            
			$ask_url = 'http://up.qiniu.com/putb64/-1/key/'.base64_encode($new_file_name);
            $ask_result =$this->request_by_curl($ask_url,$str,$upToken); 
            
			$result = json_decode($ask_result,true);
			if(isset($result['key']) && !empty($result['key'])){
              
                $result_data = array(
                    'file_path'=>'/'.$result['key'],
                    'file_ext'=>$file_ext,
                    'file_view'=>$this->domain_host."/".$result['key'],
                    'file_name'=>$file_rename.".".$file_ext,
                );
			}else{
				// $result_data['file_path'] = $result['error'];
                $result_data = array(
                    'file_path'=>'',
                    'file_ext'=>'',
                    'file_view'=>'',
                    'file_name'=>'',
                );
			}

		}else{
            $result_data = array(
                'file_path'=>'',
                'file_ext'=>'',
                'file_view'=>'',
                'file_name'=>'',
            );
		}
		return $result_data;
    }


   /**
    * 上传七牛公共方法
    * base64 用到
    */
	private function request_by_curl($remote_server,$post_string,$upToken) {  

        $headers = array();
        $headers[] = 'Content-Type:image/png';
        $headers[] = 'Authorization:UpToken '.$upToken;
        $ch = curl_init();  
        curl_setopt($ch, CURLOPT_URL,$remote_server);  
        //curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER ,$headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
        //curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_string);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        $data = curl_exec($ch);  
        curl_close($ch);  
        return $data; 
    }






}