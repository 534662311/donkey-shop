<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;

Route::rule('/','home/Index/index');
// user路由组
Route::group(['ext'=>'html'],function(){
    // method ：请求方法
    Route::rule('register','home/User/register','GET|POST');
    Route::rule('login','home/User/login','GET|POST');
    Route::get('logout','home/User/logout');
    Route::rule('changepassword','home/User/changePassword');
    // 个人中心
    Route::rule('user','home/User/index');
    // 个人地址管理
    Route::rule('address','home/User/address');
    // 订单列表
    Route::get('orderlist','home/User/orderList');
    // 删除订单
    Route::get('orderdel/:oid','home/User/orderDel');
});
// 前台路由组
Route::group(['ext'=>'html'],function(){
    // 商品分类路由
   Route::rule('category/:cid','home/Category/index');
   // 商品详情页
   Route::rule('details/:gid','home/Details/index');
   // 购物车
   Route::rule('cart','home/Cart/goodList');
   // 商品结算
   Route::rule('flow','home/Flow/index');
});
//后台路由
Route::rule('admin$','admin/Index/index');

return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'   => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],

];
