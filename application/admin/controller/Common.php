<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\common\model\Role;
use app\common\model\Access;
use app\common\model\User;
use app\common\model\AccessLog;

class Common extends Controller{
	//不需要权限的页面
	private $noAccessPages = array('admin', 'admin/user/changepassword');
	public function __construct(Request $request = null){
		parent::__construct($request);
		//判断用户是否已登陆
		if(!session('user.user_id') || session('user.user_sign') !== md5('admin')){
			$this->error('没有权限访问，请先登录后台！','admin/Login/index');
			exit();
		}
		//判断用户权限
		$cur_url = request()->path();
		$urls = $this->getUrls();
		//超级管理员拥有所有权限
		$is_admin = User::where('uid', session('user.user_id'))->value('is_admin');
		if(!in_array($cur_url, $urls) && !$is_admin){
			$this->error('没有权限访问', '/admin.html');
		}
		//记录用户操作日志
		$access = new AccessLog();
		$access->saveUserLog();
	}
	private function getUrls(){
		$uid = session('user.user_id');
		$user = User::get($uid);
		//取出用户角色
		$roles = $user->roles;
		$urls = array();
		foreach($roles as $role){
			$role = Role::get($role['id']);
			//取出角色权限
			$access = $role->access;
			foreach($access as $v){
				$data = json_decode($v['urls'], true);
				foreach($data as $s){
					array_push($urls, $s);
				}
			}
		}
		$noAccessPages = $this->noAccessPages;
		$urls = array_merge($urls, $noAccessPages);
		return $urls;
	}
}