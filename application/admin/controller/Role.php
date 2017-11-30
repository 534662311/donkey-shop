<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\common\model\Role as RoleModel;
use app\common\model\Access;
use app\admin\controller\Common;

class Role extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $roles = RoleModel::all();
        return view('', [
            'role'=>'idx',
            'roles'=>$roles,
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
            $role = new RoleModel();
            $role->name = input('post.name');
            if($role->save()){
                $this->success('添加角色成功', '/admin/Role/index');
            }
        }
        return view('', [
            'role'=>'add',
        ]);
    }

    /**
     * 为用户设置权限
     */
    public function access($id)
    {
        $role = RoleModel::get($id, 'access');
        //取出所有权限
        $access_list = Access::all();
        //取出已分配给角色的权限
        $role_access = $role->access;
        $ids = array();
        foreach($role_access as $v){
            array_push($ids, $v['id']);
        }
        if(request()->isPost()){
            $data = input('post.');
            //增加角色权限
            $newIds = array_diff($data, $ids);
            if(count($newIds)){
                foreach($newIds as $id){
                    $role->access()->attach($id);
                }
            }
            //删除角色权限
            $delIds = array_diff($ids, $data);
            if(count($delIds)){
                foreach($delIds as $id){
                    $access = Access::get($id);
                    $role->access()->detach($access);
                }
            }
            $this->success('修改权限成功', '/admin/Role/index');
        }
        return view('', [
            'role'=>$role,
            'access_list'=>$access_list,
            'ids'=>$ids,
        ]);
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
        $role = RoleModel::get($id);
        if(request()->isPost()){
            $role->name = input('post.name');
            if($role->save()){
                $this->success('修改成功', 'admin/Role/index');
            }
        }
        return view('', [
            'idx'=>'add',
            'role'=>$role,
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
        //
    }
}
