<?php

namespace app\common\model;

use think\Model;

class access extends Model
{
    //开启自动写入时间戳
    protected $autoWriteTimestamp = 'datetime';
    //关联角色表
    public function roles(){
        return $this->belongsToMany('Role', 'role_access');
    }
}
