<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use think\Session;
use app\common\model\User as UserModel;
use app\common\model\Order;
use app\common\model\Role;
use app\admin\controller\Common;

class User extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $this->assign('user', 'idx');
        //取出所有用户
        $data = UserModel::all();
        return view('', [
            'data'=>$data,
        ]);
    }

    /**
     * 退出后台登陆
     *
     * @return \think\Response
     */
    public function logout()
    {
        session(null);
        $this->success('退出登陆成功！','/admin/Login/index');
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
                $this->success($re['msg'], '/admin.html');
            }else{
                $this->error($re['msg']);
            }
        }
        return view();
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
        $user = UserModel::get($id, 'roles');
        //取出所有角色
        $roles = Role::all();
        //取出用户角色
        $userRoles = $user->roles;
        $ids = array();
        foreach($userRoles as $v){
            array_push($ids, $v['id']);
        }
        if(request()->isPost()){
            $data = input('post.');
            //新增用户角色
            $newIds = array_diff($data, $ids);
            if(count($newIds)){
                foreach($newIds as $id){
                    $user->roles()->attach($id);
                }
            }
            //删除用户角色
            $delIds = array_diff($ids, $data);
            if(count($delIds)){
                foreach($delIds as $id){
                    //取出待删除的角色
                    $role = Role::get($id);
                    //删除用户角色
                    $user->roles()->detach($role);
                }
            }
            $this->success('编辑成功', 'admin/User/index');
        }
        return view('', [
            'user'=>$user,
            'roles'=>$roles,
            'ids'=>$ids,
        ]);
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
        if(Order::get($id)){
            $this->error('此用户购买过商品，不建议删除', 'admin/User/index');
        }
        if(UserModel::destroy($id)){
            $this->success('删除用户成功！');
        }else{
            $this->error('删除失败！');
        }
    }
}
