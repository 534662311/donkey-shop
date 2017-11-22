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
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        $goods = session('cart.goods');
        if(!is_null($goods)){
            foreach($goods as $k=>$v){
                $goods[$k]['cover'] = Goods::where('gid', $v['id'])->value('cover');
            }
        }
        return json($goods);
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
    public function delete()
    {
        if(request()->isDelete()){
            $cart = new CartHandle();
            $cart->del(input('id'));
            $goods = $this->create();
            return $goods; 
        }
    }
}
