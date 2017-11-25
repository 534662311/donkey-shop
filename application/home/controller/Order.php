<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use think\Session;
use app\common\model\Category;
use app\common\model\Userinfo;
use app\common\model\Goods;
use app\common\cart\Cart;
use app\common\model\Order as OrderModel;

class Order extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //取出顶级分类
        $cate = Category::all(['pid'=>0]);
        //取出购物车数据
        $cart = session('cart');
        //取出商品数据
        $goods = $cart['goods'];
        if(!is_null($goods)){
            foreach($goods as $k=>$good){
                $cover = Goods::get($good['id'])->cover;
                $goods[$k]['cover'] = $cover;
            }
        }
        //取出收货地址
        $uid = session('user.user_id');
        $address = Userinfo::all(['uid'=>$uid]);
        if(request()->isPost()){
            $order = new OrderModel();
        }
        return view('', [
            'cate'=>$cate,
            'goods'=>$goods,
            'cart'=>$cart,
            'address'=>$address,
        ]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function add()
    {
        if(request()->isPost()){
            $cart = new Cart();
            $cart->add(input('post.'));
        }
        $this->redirect('/order.html');
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
