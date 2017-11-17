<?php
namespace app\common\validate;

use think\Validate;

class Password extends Validate{
	protected $rule = [
		'oldPassword' => 'require|length:6,16',
		'newPassword' => 'require|confirm:rePassword|length:6,16',
		'rePassword' => 'require|length:6,16',
	];
	protected $message = [
		'oldPassword.require' => '请填写旧密码',
		'oldPassword.length' => '密码长度大于6位，小于16位',
		'newPassword.require' => '请填写新密码',
		'newPassword.confirm' => '两次密码必须一致',
		'newPassword.length' => '密码长度大于6位，小于16位',
		'oldPassword.require' => '请再次输入密码',
		'oldPassword.length' => '密码长度大于6位，小于16位',
	];
}