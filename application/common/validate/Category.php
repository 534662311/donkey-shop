<?php
namespace app\common\validate;

use think\Validate;

class Category extends Validate{
	protected $rule = [
		'catname' => 'require',
		'description' => 'require',
		'orderby' => 'require',
		//'thumb' => 'require',
	];
	protected $message = [
		'catname.require' => '请填写分类名',
		'description.require' => '请填写分类描述',
		'orderby.require' => '请填写分类排序',
		//'thumb.require' => '请上传缩略图',
	];
}