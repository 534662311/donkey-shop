<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Loader;
use app\common\model\Goods as GoodsModel;

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
                $re = $cover->move(ROOT_PATH.'public'.DS.'uploads');
                if($re){
                    $goods->cover = 'uploads'.$re->getSaveName();
                }else{
                    $this->error($cover->getError());
                }
            }
            $atlas = request()->file('atlas');
            if($atlas){
                $atlasArr = array();
                foreach($atlas as $atla){
                    $info = $atla->move(ROOT_PATH.'public'.DS.'uploads');
                    if($info){
                        array_push($atlasArr, 'uploads'.$re->getSaveName());
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
                $this->success('新增成功！');
            }else{
                $this->error('新增失败！');
            }
        }
        return $this->fetch();
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
