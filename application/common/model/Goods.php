<?php

namespace app\common\model;

use think\Model;

class Goods extends Model
{
    protected $pk = 'gid';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
    //关联商品属性
    public function subgoods()
    {
        return $this->hasMany('Subgoods', 'goods_id');
    }
}
