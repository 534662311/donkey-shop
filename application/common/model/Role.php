<?php

namespace app\common\model;

use think\Model;

class role extends Model
{
    //开启自动写入时间戳
    protected $autoWriteTimestamp = 'datetime';
    //设置状态默认值
    protected $insert = [
        'status'=> 1,
    ];
    //关联用户表
    public function user(){
        return $this->belongsToMany('User', 'user_role', 'user_id');
    }
    //关联权限表
    public function access(){
        return $this->belongsToMany('Access', 'role_access');
    }
}
