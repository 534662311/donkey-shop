<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\common\model\Access as AccessModel;
use app\admin\controller\Common;

class Access extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //取出所有权限
        $access_list = AccessModel::all();
        return view('', [
            'access'=>'idx',
            'access_list'=>$access_list,
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
            $title = trim(input('post.title'));
            $urls = trim(input('post.urls'));
            $re = AccessModel::get(['title'=>$title]);
            if($re){
                $this->error('该权限已存在');
            }
            $urls = explode("\r\n", $urls);
            $access = new AccessModel();
            $access->title = $title;
            $access->urls = json_encode($urls);
            if($access->save()){
                $this->success('新增成功', 'admin/Access/index');
            }
        }
        return view('', [
            'access'=>'add',
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
        $data = AccessModel::get($id);
        if(request()->isPost()){
            $data->title = trim(input('post.title'));
            $urls = trim(input('post.urls'));
            $urls = explode("\r\n", $urls);
            $data->urls = json_encode($urls);
            if($data->save()){
                $this->success('修改成功', 'admin/Access/index');
            } 
        }
        $urls = json_decode($data->urls, true);
        $urls = implode("\r\n", $urls);
        return view('', [
            'access'=>'add',
            'data'=>$data,
            'urls'=>$urls,
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
