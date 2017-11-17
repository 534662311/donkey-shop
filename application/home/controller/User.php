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
        return $this->fetch();
    }

    /**
     * 用户登陆
     *
     * @return \think\Response
     */
    public function login(Request $request)
    {
        if($request->isPost()){
            $user = new UserModel();
            $re = $user->login(input('post.'));
            if($re['valid']){
                $this->success($re['msg'],'/');
            }else{
                $this->error($re['msg']);
            }
        }
        return $this->fetch();
    }

    /**
     * 前台用户注册
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function register(Request $request)
    {
        $user = new UserModel();
        if($request->isPost()){
            $info = $user -> userRegister(input('post.'));
            if($info['valid']){
                $this->success($info['msg'],'/login.html');
            }else{
                $this->error($info['msg']);
            }

        }
        return $this->fetch();
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
    public function delete($id)
    {
        //
    }
}
