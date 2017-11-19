<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use app\common\model\Goods;
use app\common\model\SubGoods;
use app\common\model\Category;

class Details extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($gid)
    {
        $good = Goods::get($gid);
        //取出商品款式
        $subgoods = $good->subgoods;
        //取出顶级分类
        $cate = Category::all(['pid'=>0]);
        //计算总库存
        $stock = 0;
        foreach($subgoods as $v){
            $stock += $v['snum'];
        }
        return view('', [
            'good'=>$good, 
            'subgoods'=>$subgoods, 
            'cate'=>$cate,
            'stock'=>$stock,
        ]);
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
