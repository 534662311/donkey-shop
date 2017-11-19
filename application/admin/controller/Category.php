<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\common\model\Category as CateModel;
use app\common\model\Goods;
use think\Loader;

class Category extends Controller
{
    protected $model;
    public function __construct(){
        parent::__construct();
        $this->model = new CateModel();
    }
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //激活列表标签状态
        $this->assign('cate', 'idx');
        $data = $this->model->getTreeData();
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function add()
    {
        //激活编辑标签状态
        $this->assign('cate', 'add');
        $cate = $this->model;
        if(request()->isPost()){
            $validate = Loader::validate('Category');
            if(!$validate->check(input('post.'))){
                $this->error($validate->getError());
            }
           // 获取表单上传文件 例如上传了001.jpg
            $file = request()->file('thumb');
            // 移动到框架应用根目录/public/uploads/ 目录下
            if($file){
                $info = $file->move(ROOT_PATH . 'public/uploads');
                if($info){
                    // 成功上传后 获取上传信息
                    // 输出 jpg
                    echo $info->getExtension();
                    // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                    echo $info->getSaveName();
                    // 输出 42a79759f284b767dfcb2a0197904287.jpg
                    echo $info->getFilename(); 
                    $cate->thumb = 'uploads/'.$info->getSaveName();
                }else{
                    // 上传失败获取错误信息
                    echo $file->getError();
                }
            }
            $cate->catname = input('post.catname');
            $cate->description = input('post.description');
            $cate->linkurl = input('post.linkurl');
            $cate->orderby = input('post.orderby');
            $cate->pid = input('post.pid');
            if(input('post.iscover')){
                $cate->iscover = 1;
            }else{
                $cate->iscover = 0;
            }
            if($cate->save()){
                $this->success('保存成功！', 'admin/Category/index');
            }else{
                $this->error('保存失败！');
            }
        }
        $data = db('Category')->where('pid', 0)->select();
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {        
        //激活编辑标签状态
        $this->assign('cate', 'add');
        //获取所有顶级分类
        $list = db('Category')->where('pid',0)->select();
        //获取所有数据
        $data = db('Category')->where('cid', $id)->find();
        $this->assign('data', $data);
        $this->assign('list', $list);
        return $this->fetch();
    }
    //更新资源
    public function update($id){
        $cate = $this->model->where('cid', $id)->find();
        if(request()->isPost()){
            $validate = Loader::validate('Category');
            if(!$validate->check(input('post.'))){
                $this->error($validate->getError());
            }
           // 获取表单上传文件 例如上传了001.jpg
            $file = request()->file('thumb');
            // 移动到框架应用根目录/public/uploads/ 目录下
            if($file){        
                //删除旧图片
                $oldImg = ROOT_PATH.'public'.DS.$cate->thumb;
                unlink($oldImg);
        
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){
                    $cate->thumb = 'uploads'.DS.$info->getSaveName();
                }else{
                    // 上传失败获取错误信息
                    echo $file->getError();
                }
            }
            $cate->catname = input('post.catname');
            $cate->description = input('post.description');
            $cate->linkurl = input('post.linkurl');
            $cate->orderby = input('post.orderby');
            $cate->pid = input('post.pid');
            if(input('post.iscover')){
                $cate->iscover = 1;
            }else{
                $cate->iscover = 0;
            }
            if($cate->save()){
                $this->success('保存成功！', 'admin/Category/index');
            }else{
                $this->error('保存失败！');
            }
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
        if($this->model->where('pid', $id)->select()){
            $this->error('该分类下还有子类，请先删除子类');
        }
        $goods = new Goods();
        if($goods->where('pid', $id)->select()){
            $this->error('该分类下还有商品，请先删除商品');
        }
        if(db('Category')->delete($id)){
            $this->success('删除成功！');
        }
    }
}
