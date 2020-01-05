<?php
namespace app\index\controller;

class Index
{
    public function index()
    {
        return json(['status'=>'1','errorcode'=>'0','message'=>'hello', 'result'=>'']);
    }



}
