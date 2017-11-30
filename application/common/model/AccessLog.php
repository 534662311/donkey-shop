<?php

namespace app\common\model;

use think\Model;
use think\Session;

class AccessLog extends Model
{
    //开启自动写入时间戳
    protected $autoWriteTimestamp = 'datetime';
    public function saveUserLog(){
        $this->uid = session('user.user_id');
        $this->target_url = request()->url();
        $this->query_params = json_encode(request()->param());
        $this->ua = request()->header('user-agent');
        $this->ip = request()->ip();
        if($this->save()){
            return ['code'=>1, 'message'=>'保存成功'];
        }
    }
}
