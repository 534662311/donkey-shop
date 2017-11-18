<?php
namespace app\home\controller;
use think\Controller;
use app\common\model\Goods;
use app\common\model\Category;

class Index extends Controller
{
    public function index()
    {
        //取出顶级分类
        $cate = Category::all(['pid'=>0]);
        //取出首页分类
        $indexCate = Category::where(['iscover'=>1])->column('cid');
        //取出首页分类下的所有商品
        
        $goods = Goods::where('pid', 'in', $indexCate)->find();
        return view('', ['goods'=>$goods, 'cate'=>$cate]);
    }
}
