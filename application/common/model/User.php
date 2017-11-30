<?php

namespace app\common\model;

use think\Model;
use think\Loader;
use think\Session;

class User extends Model
{
	protected $pk = 'uid';
    // 开启自动写入时间戳字段
	protected $autoWriteTimestamp = 'datetime';
	
	protected $insert = ['is_admin' => 0];
	//用户登录
	public function login($data){
		$validate = Loader::validate('Login');
		if(!$validate->check($data)){
			return ['valid'=>0, 'msg'=>$validate->getError()];
		}
		if(isset($data['type'])&&$data['type']==='front'){
			//前台登陆
			$info = $this->where('phone|email',$data['username'])->find();
			$userSign = 'customer';
		}else{
			//后台登陆
			$info = $this->where('phone|email',$data['username'])->find();
			$userSign = 'admin';
		}
		if(!$info){
			return ['valid'=>0, 'msg'=>'用户名不存在'];
		}
		if(!password_verify($data['password'], $info['password'])){
			return ['valid'=>0, 'msg'=>'密码错误'];
		}

		session('user.user_name', $info['username']);
		session('user.user_id', $info['uid']);
		session('user.user_sign',md5($userSign));

		return ['valid'=>1, 'msg'=>'登陆成功'];
	}
	//用户注册
    public function userRegister($data){
    	$validate = Loader::validate('Register');
    	if(!$validate->check($data)){
    		return ['valid' => 0, 'msg'=>$validate->getError()];
    	}
    	$phone = $this->where('phone', $data['phone'])->find();
    	if($phone){
    		return ['valid' => 0, 'msg'=>'手机已注册'];
    	}
    	$this -> username = 'zx-'.time();
		$this -> password = password_hash($data['password'], PASSWORD_DEFAULT);
		$this -> phone = $data['phone'];
		if($this -> save()){
			return ['valid'=>1,'msg'=>'用户注册成功'];
		}else{
			return ['valid'=>0,'msg'=>'用户注册失败'];
		}
    }
    //修改密码
    public function changePassword($data){
    	$validate = Loader::validate('Password');
    	if(!$validate->check($data)){
    		return ['code'=>0, 'msg'=>$validate->getError()];
    	}
    	$user = $this::get(session('user.user_id'));
    	$oldPwd = $user->password;
    	if(!password_verify($data['oldPassword'], $oldPwd)){
    		return ['code'=>0, 'msg'=>'旧密码有误'];
    	}
    	if(password_verify($data['newPassword'], $oldPwd)){
    		return ['code'=>0, 'msg'=>'新密码和旧密码不能一样'];
    	}
    	$user->password = password_hash($data['newPassword'], PASSWORD_DEFAULT);
    	if($user->save()){
    		return ['code'=>1, 'msg'=>'密码修改成功！'];
    	}else{
    		return ['code'=>1, 'msg'=>'密码修改失败！'];
    	}
	}
	//更新用户信息
	public function updateUser($data){
		$userValidate = Loader::validate('User');
		if(!$userValidate->check($data)){
			return ['code'=>0, 'msg'=>$userValidate->getError()];
		}
		$user = $this->where('uid', $data['uid'])->find();
		//手机、邮箱不能重复
		$phoneCheck = $this->where('is_admin', 0)->where('phone', $data['phone'])->find();
		if($phoneCheck && $user->phone!==$data['phone']){
			return ['code'=>0, 'msg'=>'该手机已绑定其他帐号'];
		}
		$emailCheck = $this->where('is_admin', 0)->where('email', $data['email'])->find();
		if($emailCheck && $user->email!==$data['email']){
			return ['code'=>0, 'msg'=>'该邮箱已绑定其他帐号'];
		}
		$user->phone = $data['phone'];
		$user->username = $data['username'];
		$user->email = $data['email'];
		if($user->save()){
			return ['code'=>1, 'msg'=>'更新成功'];
		}
	}
	//关联地址表
	public function userInfo(){
		return $this->hasMany('Userinfo', 'uid');
	}
	//关联角色表
	public function roles(){
		return $this->belongsToMany('Role', 'user_role', 'role_id');
	}
}
