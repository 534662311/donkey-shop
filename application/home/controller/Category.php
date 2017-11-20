<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use app\common\model\Category as CateModel;
use app\common\model\Goods;

class Category extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($cid)
    {
        //取出顶级分类
        $cate = CateModel::all(['pid'=>0]);
        //取出该分类下的所有子分类
        $subCate = CateModel::all(['pid'=>$cid]);
        //取出当前分类
        $current = CateModel::get($cid);

        if($current->pid !== 0 && !$subCate){
            //子分类，取出该分类下的商品
            $goods = $current->goods;
            $pid = CateModel::where('cid', $cid)->value('pid');
            $subCate = CateModel::all(['pid'=>$pid]);
        }else{
            //全部分类，取出所有商品
            //取出子分类的cid
            $subCid = CateModel::where('pid', $cid)->column('cid');
            //取出商品
            $goods = Goods::where('pid', 'in', $subCid)->select();
        }
        return view('', [
            'cate'=>$cate,
            'subCate'=>$subCate,
            'cid'=>$cid,
            'goods'=>$goods,
        ]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
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
