<?php

namespace app\common\model;

use think\Model;
use houdunwang\arr\Arr;
use think\Loader;

class Category extends Model
{
    protected $pk = 'cid';
    //获取树形结果集
    public function getTreeData(){
    	$data = $this::all();
    	$data = Arr::tree($data, 'catname');
    	return $data;
    }
    //新增
    public function add($data){
    	$validate = Loader::validate('Category');
    	if(!$validate->check($data)){
    		return ['code'=>0, 'msg'=>$validate->getError()];
    	}
		$this->catname = $data['catname'];
		$this->description = $data['description'];
		$this->linkurl = $data['linkurl'];
		$this->orderby = $data['orderby'];
		$this->thumb = $data['thumb'];
		if($data['iscover']){
			$this->iscover = 1;
		}else{
			$this->iscover = 0;
		}
		$this->save();
    	return ['code'=>1, 'msg'=>'保存成功！'];
    }
    //更新
    public function updateCate($data){

    }
    //删除
    public function delete(){

    }
}
