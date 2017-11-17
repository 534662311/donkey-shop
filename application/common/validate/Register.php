<?php
namespace app\common\validate;

use think\Validate;

class User extends Validate{
	protected $rule = [
		'password' => 'require|confirm:confirm_password|length:6,16',
		'phone' => 'require|number|length:11',
	];
	protected $message = [
		'phone.require' => '请填写手机号码',
		'password.require' => '请填写密码',
	];
}