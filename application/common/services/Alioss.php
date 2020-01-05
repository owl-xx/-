<?php
/**
 * 阿里云服务
 * 依然范儿特西
 */

namespace app\common\services;

use  think\facade\Config;
use  think\facade\Env;


//阿里oss
use OSS\OssClient;
use OSS\Core\OssException;



class Alioss
{
    var $accessKeyId, $accessKeySecret ,$endpoint , $bucket;
    public function __construct(){
        include_once (Env::get('vendor_path'). 'aliyuncs/oss-sdk-php/autoload.php');
        $this->accessKeyId     = Config::get('config_third.alioss.accessKey');
        $this->accessKeySecret = Config::get('config_third.alioss.secretKey');
        $this->endpoint        = Config::get('config_third.alioss.endpoint');
        $this->bucket          = Config::get('config_third.alioss.bucket');
    }

    /**
     * 创建群空间
     */
    public function  creat_buket(){
        $accessKeyId = $this->accessKeyId;
        $accessKeySecret = $this->accessKeySecret;
        $endpoint = $this->endpoint;
        //存储空间名称
        $bucket = "<yourBucketName>";
        try {
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
            $ossClient->createBucket($bucket);
        } catch (OssException $e) {
            print $e->getMessage();
        }

    }

    /**
     * 单个文件上传
     */
    public  function file_upload($file_data,$path){
		if(empty($file_data)){
			return '';
        }
        $accessKeyId = $this->accessKeyId;
        $accessKeySecret = $this->accessKeySecret;
        $endpoint = $this->endpoint;
        $bucket= $this->bucket;

        //例如/users/local/myfile.txt
        $filePath = $file_data['tmp_name'];
        // 上传文件后缀
        $file_ext = substr($file_data['name'],strrpos($file_data['name'],'.')+1);
        //文件名称
        $file_name = md5(time()).'.'.$file_ext;
        // 文件名称
        $object = $path.'/'.$file_name;   
        
        try{
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
            $result  = $ossClient->uploadFile($bucket, $object, $filePath);
            $result_data = array(
                'file_path'=>'/'.$object,
                'file_ext'=>$file_ext,
                'file_view'=>$result['oss-request-url'],
                'file_name'=>$file_name,
            );
        } catch(OssException $e) {
            // printf(__FUNCTION__ . ": FAILED\n");
            // printf($e->getMessage() . "\n");
            // exit;
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
     * 单个文件分片上传
     */
    public  function multi_file_upload($file_name,$path){
        $url = "";
		if(empty($file_name)){
			return '';
        }
        
        $accessKeyId = $this->accessKeyId;
        $accessKeySecret = $this->accessKeySecret;
        $endpoint = $this->endpoint;
        $bucket= $this->bucket;
        //例如/users/local/myfile.txt
        $file = $file_name['tmp_name'];
        // 上传文件后缀
        $file_ext = substr($file_name['name'],strrpos($file_name['name'],'.')+1);
        // 文件名称
        $object = $path.'/'.md5(time()).'.'.$file_ext;

        $options = array(
            OssClient::OSS_CHECK_MD5 => true,
            OssClient::OSS_PART_SIZE => 1,
        );
        try{
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

            $result  =  $ossClient->multiuploadFile($bucket, $object, $file, $options);

            $result_data = array(
                'file_path'=>'/'.$object,
                'file_ext'=>$file_ext,
            );

        } catch(OssException $e) {
            // printf(__FUNCTION__ . ": FAILED\n");
            // printf($e->getMessage() . "\n");

            $result_data = array(
                'file_path'=>'',
                'file_ext'=>'',
            );
           
        }

        return $result_data;

    }


    /**
     * 文件下载到本地
     */
    public  function  file_download($file_name){
        $accessKeyId = $this->accessKeyId;
        $accessKeySecret = $this->accessKeySecret;
        $endpoint = $this->endpoint;
        $bucket= $this->bucket;

        // 文件名称
        $object = $file_name;
            
        try {

            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
            $content = $ossClient->getObject($bucket, $object);

        } catch (OssException $e) {
            printf(__FUNCTION__ . ": FAILED\n");
            printf($e->getMessage() . "\n");
            return;
        }

    
        print_r($content);exit;


    }

   



    /**
     * 文件列举，默认100个
     */
    public  function  file_list(){
        $accessKeyId = $this->accessKeyId;
        $accessKeySecret = $this->accessKeySecret;
        $endpoint = $this->endpoint;
        $bucket= $this->bucket;       
        try {
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
            
            $listObjectInfo = $ossClient->listObjects($bucket);
            $objectList = $listObjectInfo->getObjectList();
            if (!empty($objectList)) {
                foreach ($objectList as $objectInfo) {
                print($objectInfo->getKey() . "\t" . $objectInfo->getSize() . "\t" . $objectInfo->getLastModified() . "\n");
                }
            }
        } catch (OssException $e) {
            print $e->getMessage();
        }



    }




    /**
     * 文件删除
     */
    public  function  file_del(){
        $accessKeyId = $this->accessKeyId;
        $accessKeySecret = $this->accessKeySecret;
        $endpoint = $this->endpoint;
        $bucket= $this->bucket;

        // 文件名称
        $object = " <yourObjectName>";
        $content = "Hi, OSS.";

                
        try {
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
            $ossClient->deleteObject($bucket, $object);
        } catch (OssException $e) {
            print $e->getMessage();
        }



    }

   







}