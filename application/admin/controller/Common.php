<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;
class Common extends Controller{
	public function __construct(Request $request){
		parent::__construct($request);
		if(!session('user_id') || session('user_sign') !== md5('admin')){
			$this->error('没有权限访问，请先登录后台！','admin/Login/index');
			exit();
		}
	}
}