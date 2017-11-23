<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use think\Session;
use app\common\model\User as UserModel;

class User extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //获取所有顶级分类
        $cate = db('Category')->where('pid',0)->select();
        return view('', [
            'cate'=>$cate,
        ]);
    }

    /**
     * 用户登陆
     *
     * @return \think\Response
     */
    public function login(Request $request)
    {
        //获取所有顶级分类
        $cate = db('Category')->where('pid',0)->select();
        if($request->isPost()){
            $user = new UserModel();
            $re = $user->login(input('post.'));
            if($re['valid']){
                $this->success($re['msg'],'/');
            }else{
                $this->error($re['msg']);
            }
        }
        return view('', [
            'cate'=>$cate
        ]);
    }

    /**
     * 前台用户注册
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function register(Request $request)
    {
        //获取所有顶级分类
        $cate = db('Category')->where('pid',0)->select();
        $user = new UserModel();
        if($request->isPost()){
            $info = $user -> userRegister(input('post.'));
            if($info['valid']){
                $this->success($info['msg'],'/login.html');
            }else{
                $this->error($info['msg']);
            }

        }
        return view('', [
            'cate'=>$cate,
        ]);
    }

    /**
     * 退出登陆
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function logout()
    {
        session(null);
        $this->success('退出成功', '/');
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
    public function orderList($id)
    {
        return view();
    }
    /**
     * 修改密码
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function changePassword(Request $request)
    {
       if($request->isPost()){
            $user = new UserModel();
            $re = $user->changePassword(input('post.'));
            if($re['code']){
                session('user', null);
                $this->success($re['msg'], '/login.html');
            }else{
                $this->error($re['msg']);
            }
        }
        return view();
    }
}
