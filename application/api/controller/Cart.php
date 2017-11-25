<?php

namespace app\api\controller;

use think\Controller;
use think\Request;
use think\Session;
use app\common\cart\Cart as CartHandle;
use app\common\model\Goods;

class Cart extends Controller
{
    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        $cart = session('cart');
        if(!is_null($cart['goods'])){
            foreach($cart['goods'] as $k=>$v){
                $cart['goods'][$k]['cover'] = Goods::where('gid', $v['id'])->value('cover');
            } 
        }
        return json($cart);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        if(request()->isPost()){
            $cart = new CartHandle();
            $cart->add(input('post.'));
            $goods = $this->create();
            return $goods;
        }
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
        if(request()->isPut()){
            $cart = new CartHandle();
            $data =  array();
            $data['sid'] = $id;
            $data['num'] = input('num');
            $cart->update($data);
            $goods = $this->create();
            return $goods;
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
        if(request()->isDelete()){
            $cart = new CartHandle();
            $cart->del($id);
            $goods = $this->create();
            return $goods; 
        }
    }
}
