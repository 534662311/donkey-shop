<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use think\Session;
use app\common\model\User as UserModel;
use app\common\model\Category;
use app\common\model\Userinfo;

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
        $uid = session('user.user_id');
        $userinfo = UserModel::get($uid);
        $data = array();
        $data = input('post.');
        $data['uid'] = $uid;
        //更新用户信息
        if(request()->isPost()){
            $data = array();
            $data = input('post.');
            $data['uid'] = $uid;
            $userModel = new UserModel();
            $re = $userModel->updateUser($data);
            if($re['code']){
                $this->success($re['msg']);
            }else{
                $this->error($re['msg']);
            }
        }
        return view('', [
            'cate'=>$cate,
            'user'=>true,
            'userinfo'=>$userinfo,
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
        $cate = Category::get(['pid'=>0]);
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
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function orderList()
    {
        //获取所有顶级分类
        $cate = Category::get(['pid'=>0]);
        return view('', [
            'orderList'=>true,
            'cate'=>$cate,
        ]);
    }
    /**
     * 修改密码
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function changePassword(Request $request)
    {
        //获取所有顶级分类
        $cate = Category::get(['pid'=>0]);
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
        return view('', [
            'change'=>true,
            'cate'=>$cate,
        ]);
    }
    //我的地址
    public function address(){
        //获取所有顶级分类
        $cate = Category::get(['pid'=>0]);
        $uid = session('user.user_id');
        $user = UserModel::get($uid, 'userInfo');
        $userInfo = $user->userInfo;
        if(request()->isPost()){
            $address['detail'] = input('post.detail');
            $address = implode('', input('post.'));
            $re = $user->userInfo()->save([
                'address'=>$address,
            ]);
            if($re){
                $this->success('新增地址成功');
            }
        }
        return view('', [
            'address'=>true,
            'cate'=>$cate,
            'userInfo'=>$userInfo,
        ]);
    }
    //删除地址
    public function delete($id){
        if(Userinfo::destroy($id)){
            $this->success('删除成功');
        }
    }
    //更新地址
    public function updateAddress($id){
        if(request()->isPut()){
            $userinfo = Userinfo::get($id);
            $userinfo->address = input('put.address');
            if($userinfo->save()){
                return json($userinfo);
            }
        }
    }
}
