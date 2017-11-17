<?php
namespace app\common\validate;

use think\Validate;

class Goods extends Validate{
	protected $rule = [
		'gname' => 'require',
		'gprice' => 'require|number',
		'details' => 'require',
	];
	protected $message = [
		'gname.require' => '请填写商品名称！',
		'gprice.require' => '请填写商品价格！',
		'details.require' => '请填写商品详情！',
	];
}