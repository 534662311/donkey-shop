<?php
namespace app\common\validate;

use think\Validate;

class User extends Validate{
    protected $rule = [
        'phone'=>'require|number|length:11',
        'email'=>'require|email',
    ];
    protected $message = [
        'phone.require'=>'请填写手机号码',
        'email.require'=>'请填写邮箱',
    ];
}