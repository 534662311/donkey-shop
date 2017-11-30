<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Loader;
use app\common\model\Goods as GoodsModel;
use app\common\model\Category;
use app\admin\controller\Common;

class Goods extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //激活列表标签状态
        $this->assign('goods', 'idx');
        $data = GoodsModel::all();
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function add()
    {
        //激活列表标签状态
        $this->assign('goods', 'add');

        $goods = new GoodsModel();
        if(request()->isPost()){
            $validate = Loader::validate('Goods');
            if(!$validate->check(input('post.'))){
                $this->error($validate->getError());
            }
            //获取封面图
            $cover = request()->file('cover');
            if($cover){
                $re = $cover->move(ROOT_PATH.'public/uploads');
                if($re){
                    $goods->cover = 'uploads/'.$re->getSaveName();
                }else{
                    $this->error($cover->getError());
                }
            }
            //获取多张图集
            $atlas = request()->file('atlas');
            if($atlas){
                $atlasArr = array();
                foreach($atlas as $atla){
                    $info = $atla->move(ROOT_PATH.'public/uploads');
                    if($info){
                        array_push($atlasArr, 'uploads/'.$info->getSaveName());
                    }else{
                        $this->error($info->getError());
                    }
                }
                $goods->atlas = implode('|',$atlasArr);
            }
            $goods->gname = input('post.gname');
            $goods->gprice  = input('post.gprice');
            $goods->mprice  = input('post.mprice');
            $goods->details = input('post.details');
            $goods->description = input('post.description');
            if($goods->save()){
                //保存关联属性
                $subArr = array();
                $sname = input('post.')['sname'];
                $snum = input('post.')['snum'];
                for($i=0; $i<count($sname); $i++){
                    $subArr[$i]['sname'] = $sname[$i];
                    $subArr[$i]['snum'] = $snum[$i];
                }
                foreach($subArr as $v){
                    $goods->subgoods()->save([
                       'sname' => $v['sname'],
                       'snum' => $v['snum'],
                   ]);
                }
                $this->success('新增成功！', 'admin/goods/index');
            }else{
                $this->error('新增失败！');
            }
        }
        
        //获取分类
        $cate = new Category();
        $list = $cate->getTreeData();
        return view('', ['list'=>$list]);
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {       
        $data = GoodsModel::get($id);
        //取出图片
        $files = explode('|', $data->atlas);
        //获取分类
        $cate = new Category();
        $list = $cate->getTreeData();
        //获取商品属性
        $subs = $data->subgoods;
        return view('', [
            'list'=>$list,
            'data'=>$data,
            'files'=>$files,
            'goods'=>'add',
            'subs'=>$subs,
        ]);
    }
    //更新
    public function update($id){
        $goods = GoodsModel::get($id);
        if(request()->isPost()){
            $validate = Loader::validate('Goods');
            if(!$validate->check(input('post.'))){
                $this->error($validate->getError());
            }
            //获取商品封面图
            $cover = request()->file('cover');
            if($cover){
                //删除旧图片
                $oldImg = ROOT_PATH.'public/'.$goods->cover;
                unlink($oldImg);

                $re = $cover->move(ROOT_PATH.'public/uploads');
                if($re){
                    $goods->cover = 'uploads/'.$re->getSaveName();
                }else{
                    $this->error($cover->getError());
                }
            }
            //获取商品图集
            $atlas = request()->file('atlas');
            if($atlas){
                //删除旧图片
                $files = explode('|', $goods->atlas);
                foreach ($files as $v) {
                    $oldImg = ROOT_PATH.'public/'.$v;
                    unlink($oldImg);
                }
                $atlasArr = array();
                foreach($atlas as $atla){
                    $info = $atla->move(ROOT_PATH.'public/uploads');
                    if($info){
                        array_push($atlasArr, 'uploads/'.$info->getSaveName());
                    }
                }
                $goods->atlas = implode('|',$atlasArr);
            }
            $goods->gname = input('post.gname');
            $goods->gprice  = input('post.gprice');
            $goods->mprice  = input('post.mprice');
            $goods->details = input('post.details');
            $goods->description = input('post.description');
            $goods->pid = input('post.pid');
            if($goods->save()){
                 //更新关联属性
                 $subArr = array();
                 $sname = input('post.')['sname'];
                 $snum = input('post.')['snum'];
                 for($i=0; $i<count($sname); $i++){
                    $subArr[$i]['sname'] = $sname[$i];
                    $subArr[$i]['snum'] = $snum[$i];
                 }
                 //先删除再增加
                 $goods->subgoods()->delete();
                 foreach($subArr as $v){
                    $goods->subgoods()->save([
                        'sname' => $v['sname'],
                        'snum' => $v['snum'],
                    ]);
                 }
                $this->success('更新成功！', 'admin/goods/index');
            }else{
                $this->error('更新失败！');
            }
        }
    }
    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //删除旧图片
        $good = GoodsModel::get($id);
        $files = explode('|', $good->atlas);
        $cover = $good->cover;
        foreach ($files as $v) {
            $oldImg = ROOT_PATH.'public/'.$v;
            unlink($oldImg);
        }
        //删除旧封面
        $oldCover = ROOT_PATH.'public/'.$cover;
        unlink($oldCover);
        
        if(GoodsModel::destroy($id)){
           
            $this->success('删除成功！');
        }
    }
}
