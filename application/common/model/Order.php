<?php

namespace app\common\model;

use think\Model;

class Order extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
    //关联订单列表
    public function orderGoods(){
        return $this->hasOne('OrderGoods', 'order_id');
    }
    //保存订单
    public function save(){

    }
}
