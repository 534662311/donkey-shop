<?php

namespace app\common\model;

use think\Model;

class Order extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
}
