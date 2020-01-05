<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
include_once("common/functions/sys_common.php");

/**
 * $msg 待提示的消息
 * $url 待跳转的链接
 * $icon 这里主要有两个，5和6，代表两种表情（哭和笑）
 * $time 弹出维持时间（单位秒）
 */
function alert_success($msg = '', $url = '', $time = 3)
{
    $str = '<script type="text/javascript" src="/static/plugins/jQuery/jQuery-2.1.4.min.js"></script> <script type="text/javascript" src="/static/plugins/layui/layer/layer.js"></script>';//加载jquery和layer
    $str .= '<script>
        $(function(){
            layer.msg("' . $msg . '",{icon:"6",time:' . ($time * 1000) . '});
            setTimeout(function(){
                window.location.href="' . $url . '"
            },2000)
        });
    </script>';//主要方法
    return $str;
}

/**
 * $msg 待提示的消息
 * $icon 这里主要有两个，5和6，代表两种表情（哭和笑）
 * $time 弹出维持时间（单位秒）
 */
function alert_error($msg = '', $time = 3)
{
    $str = '<script type="text/javascript" src="/static/plugins/jQuery/jQuery-2.1.4.min.js"></script> <script type="text/javascript" src="/static/plugins/layui/layer/layer.js"></script>';//加载jquery和layer
    $str .= '<script>
        $(function(){
            layer.msg("' . $msg . '",{icon:"5",time:' . ($time * 1000) . '});
            setTimeout(function(){
                window.history.go(-1);
            },2000)
        });
    </script>';//主要方法
    return $str;
}

//
/**
 * $msg 待提示的消息
 * $url 待跳转的链接
 * $icon 这里主要有两个，5和6，代表两种表情（哭和笑）
 * $time 弹出维持时间（单位秒）
 */
function alert_success_parent($msg = '', $time = 3)
{
    $str = '<script type="text/javascript" src="/static/plugins/jQuery/jQuery-2.1.4.min.js"></script> <script type="text/javascript" src="/static/plugins/layui/layer/layer.js"></script>';//加载jquery和layer
    $str .= '<script>
        $(function(){
            layer.msg("' . $msg . '",{icon:"6",time:' . ($time * 1000) . '});
            setTimeout(function(){
             parent.location.reload();//刷新父窗口
             parent.layer.closeAll();//关闭所有layer窗口
            },2000)
        });
    </script>';//主要方法
    return $str;
}

function getRealyAddress($a)
{
    $address = '';
    $lats=json_decode($a,true);
    if(empty($lats)){
         return '';
    }

    if ($lats['lat'] && $lats['lng']) {
        $arr =changeToBaidu($lats['lat'], $lats['lng']);
        $url = 'http://api.map.baidu.com/geocoder/v2/?callback=&location=' . $arr['y'] . ',' . $arr['x'] . '.&output=json&pois=1&ak=K8GB5F2a8GIbUTxeGPdd4PzgrxO0tNCh';
        $content = file_get_contents($url);
        $place = json_decode($content, true);
        $address = $place['result']['formatted_address'];
    }
    return $address;
}

function changeToBaidu($lat, $lng)
{

    $apiurl = 'http://api.map.baidu.com/geoconv/v1/?coords=' . $lng . ',' . $lat . '&from=1&to=5&ak=K8GB5F2a8GIbUTxeGPdd4PzgrxO0tNCh';
    $file = file_get_contents($apiurl);
    $arrpoint = json_decode($file, true);
    return $arrpoint['result'][0];
}
function getCode($key){
    $pattern='1234567890';
    for( $i=0; $i<6; $i++ ) {
        $key .= $pattern[mt_rand(0, 9)];
    }
    return $key;
}
function http_get($url, $ssl = FALSE)
{
    // 关闭句柄
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); // 从证书中检查SSL加密算法是否存在
    $tmpInfo = curl_exec($curl); //返回api的json对象
    if(curl_exec($curl) === false)
    {
        return 'Curl error: ';
    }
//关闭URL请求
    curl_close($curl);
    return $tmpInfo; //返回json对象
}
function getChild($data, $id = 0)
{
    //初始化儿子
    $child = [];
    //循环所有数据找$id的儿子
    foreach ($data as $key => $datum) {
        //找到儿子了
        if ($datum['pid'] == $id) {
            //保存下来，然后继续找儿子的儿子
            $child[$datum['id']] = $datum;
            //先去掉自己，自己不可能是自己的儿孙
            unset($data[$key]);
            //递归找，并把找到的儿子放到一个child的字段中
            $child[$datum['id']]['child'] =getChild($data, $datum['id']);
        }
    }
    return $child;
}
