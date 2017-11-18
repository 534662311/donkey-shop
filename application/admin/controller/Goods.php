<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Loader;
use app\common\model\Goods as GoodsModel;
use app\common\model\Category;

class Goods extends Controller
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
            $cover = request()->file('cover');
            if($cover){
                $re = $cover->move(ROOT_PATH.'public/uploads');
                if($re){
                    $goods->cover = 'uploads/'.$re->getSaveName();
                }else{
                    $this->error($cover->getError());
                }
            }
            $atlas = request()->file('atlas');
            if($atlas){
                $atlasArr = array();
                foreach($atlas as $atla){
                    $info = $atla->move(ROOT_PATH.'public/uploads');
                    if($info){
                        array_push($atlasArr, 'uploads/'.$info->getSaveName());
                    }
                }
            }
            $goods->atlas = implode('|',$atlasArr);
            $goods->gname = input('post.gname');
            $goods->gprice  = input('post.gprice');
            $goods->mprice  = input('post.mprice');
            $goods->details = input('post.details');
            $goods->description = input('post.description');
            if($goods->save()){
                $this->success('新增成功！', 'admin/goods/index');
            }else{
                $this->error('新增失败！');
            }
        }
        //获取分类
        $cate = new Category();
        $list = $cate->getTreeData();
        $this->assign('list', $list);
        return $this->fetch();
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {       
        //激活列表标签状态
        $this->assign('goods', 'add');

        $data = GoodsModel::get($id);
        //取出图片
        $files = explode('|', $data->atlas);
        //获取分类
        $cate = new Category();
        $list = $cate->getTreeData();

        $this->assign('list', $list);
        $this->assign('data', $data);
        $this->assign('files', $files);
        return view();
    }
    //更新
    public function update($id){
        $goods = GoodsModel::get($id);
        if(request()->isPost()){
            $validate = Loader::validate('Goods');
            if(!$validate->check(input('post.'))){
                $this->error($validate->getError());
            }
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
            $atlas = request()->file('atlas');
            if($atlas){
                //删除旧图片
                $files = explode('|', $data->atlas);
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
        if(GoodsModel::destroy($id)){
            $this->success('删除成功！');
        }
    }
}
