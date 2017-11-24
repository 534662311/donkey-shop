-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-11-24 03:45:08
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `shop_attachment`
--

CREATE TABLE `shop_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '文件名',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '文件名',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '相对路径',
  `createtime` int(11) NOT NULL COMMENT '上传时间',
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` mediumint(9) NOT NULL COMMENT '文件大小'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `shop_category`
--

CREATE TABLE `shop_category` (
  `cid` int(11) NOT NULL COMMENT '目录id',
  `catname` char(30) NOT NULL COMMENT '栏目名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `iscover` int(11) NOT NULL DEFAULT '0' COMMENT '是否是封面栏目',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目描述',
  `linkurl` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目跳转地址',
  `orderby` smallint(6) NOT NULL DEFAULT '100' COMMENT '栏目排序',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目缩略图',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_category`
--

INSERT INTO `shop_category` (`cid`, `catname`, `pid`, `iscover`, `description`, `linkurl`, `orderby`, `thumb`, `create_time`, `update_time`) VALUES
(17, '电子类', 0, 1, '爱的色放噶速度发', 'arads', 234, 'uploads\\20171119\\ee6e71b41bb423b743a27decfd58011d.jpg', '2017-11-16 16:33:41', '2017-11-19 22:13:32'),
(18, '服装', 0, 0, '速度发发多少', 'dfgads', 33, 'uploads\\20171120\\bf795c781de340b29b5f772864e86957.jpg', '2017-11-16 16:50:53', '2017-11-20 11:54:30'),
(22, '手机', 17, 1, '啊的说法的说法', 'www.baidu.com', 3, 'uploads\\20171120\\e5f268fbe1cd53f0f6de7378c862c6fd.jpg', '2017-11-16 21:49:23', '2017-11-20 11:58:59'),
(24, '运动装', 18, 0, '啊d沙发上地方', 'www.baidu.com', 33, 'uploads\\20171119\\15b75543392e8817f1e389630d76c88b.jpg', '2017-11-17 11:49:53', '2017-11-20 14:18:13'),
(25, '数码', 17, 0, '是打发的说法都是', 'www.baidu.com', 44, 'uploads/20171120\\59804c4ab5a54a7f5591ae45b465871b.jpg', '2017-11-20 11:53:40', '2017-11-20 11:59:28'),
(26, '战衣', 18, 0, '打发打发', 'www.baidu.com', 1, 'uploads/20171120\\7c86da3417ca3cd237fd6d171f04a608.jpg', '2017-11-20 11:55:40', '2017-11-20 11:55:40');

-- --------------------------------------------------------

--
-- 表的结构 `shop_goods`
--

CREATE TABLE `shop_goods` (
  `gid` int(10) UNSIGNED NOT NULL COMMENT '商品表中的id ',
  `gname` char(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `pid` int(255) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品分类',
  `gprice` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '商城的销售的商品价格',
  `mprice` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '市场价个，是商城价的一个参考',
  `atlas` text NOT NULL COMMENT '商品图集 ，图片的url （用于放大镜出商品展示）',
  `details` text NOT NULL COMMENT '商品的详情',
  `cover` varchar(255) DEFAULT '' COMMENT '商品的封面图',
  `click` int(10) UNSIGNED DEFAULT '0' COMMENT '商品的查看次数',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '商品描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_goods`
--

INSERT INTO `shop_goods` (`gid`, `gname`, `pid`, `gprice`, `mprice`, `atlas`, `details`, `cover`, `click`, `create_time`, `update_time`, `description`) VALUES
(31, '袜子', 0, '44.00', '66.00', 'uploads/20171120\\69ccee40ac1534a70aaee6074433f0ed.jpg|uploads/20171120\\7f9388284c383157dfcb532aaf5a2bf1.jpg|uploads/20171120\\5ed9a3149ff661714f071f7ba984414a.jpg|uploads/20171120\\e0c47eeb4b9f41e8c03d00a1ef2630b3.jpg|uploads/20171120\\4ae705d4a368b58cad41d0b7e942738c.jpg', '<p>啊的说法噶发多少</p>', 'uploads/20171120\\ea08ce7860708da7b0b946b33e36ca3a.jpg', 0, '2017-11-20 11:58:19', '2017-11-20 11:58:19', '阿斯顿发的'),
(30, '球衣', 24, '55.00', '77.00', 'uploads/20171119\\3ed55d7c1abd7c3bd7d7cf70e649f220.jpg|uploads/20171119\\e121e33f818a67f2034cd2df24ffad3a.jpg|uploads/20171119\\5f0b38c4e0acbecc2a6ae46d321c0056.jpg|uploads/20171119\\17eb3c09fd091d207bc4cab566b7dcc1.jpg|uploads/20171119\\019af2e5331e4c6afafb51fd60b6bcf1.jpg', '<p>十大发生的发<br/></p>', 'uploads/20171119\\e78407a5e74e9b1957b81d014d0b60b9.jpg', 0, '2017-11-19 22:23:47', '2017-11-19 22:23:47', '爱上打发打发'),
(28, 'iPhone 8', 22, '3666.00', '4344.00', 'uploads/20171119\\287171cedfd1615fd6927ddc6e5df68e.jpg|uploads/20171119\\a18520b21e8e4ae08686da68601e9444.jpg|uploads/20171119\\1adcddfcb016698ddf832fb5d9c18d34.jpg|uploads/20171119\\2c1c885a7f088922dd2aef542d9df2c0.jpg|uploads/20171119\\b5af10302e387e8be91f4bbc6e29fe76.jpg', '<p>啊短发大的风</p>', 'uploads/20171119\\7959a4b99ba255b8ff38f06bac4e75c7.jpg', 0, '2017-11-19 22:23:57', '2017-11-19 22:23:57', '多发的说法的'),
(29, '华为mate10', 22, '3666.00', '4344.00', 'uploads/20171119\\e9d93c22ed2d8bef0b0e025260f9528e.jpg|uploads/20171119\\f0bd7ed15c5e55aa6c564d7795503a82.jpg|uploads/20171119\\512973a47074374c885854e1f6f5ef13.jpg|uploads/20171119\\7e8fc4fc8f490af5060d58132dba3eae.jpg|uploads/20171119\\9612eee38be6abe9d37265544ed0c42b.jpg', '<p>啊的说法短发士大夫</p>', 'uploads/20171119\\9b0e67ce2e8bdba63aecfb585584738d.jpg', 0, '2017-11-19 22:24:07', '2017-11-19 22:24:07', '多发的说法的');

-- --------------------------------------------------------

--
-- 表的结构 `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_name` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号列表',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人电话',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人',
  `address_id` int(10) UNSIGNED NOT NULL COMMENT '用户地址表 id',
  `goods_info` text COMMENT '商品信息',
  `status` enum('未发货','已发货','已签收') DEFAULT '未发货' COMMENT '订单状态',
  `price` decimal(10,2) UNSIGNED NOT NULL COMMENT '订单总价',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '订单备注 ',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_order_list`
--

CREATE TABLE `shop_order_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `oid` int(10) UNSIGNED NOT NULL COMMENT '订单号id',
  `number` int(10) UNSIGNED NOT NULL COMMENT '该订单购买商品数量',
  `price` decimal(10,2) UNSIGNED NOT NULL COMMENT '订单商品总价',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '订单备注',
  `goods_id` int(11) NOT NULL COMMENT '商品id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_subgoods`
--

CREATE TABLE `shop_subgoods` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '商品子类 主键id',
  `sname` varchar(50) NOT NULL DEFAULT '' COMMENT '商品的不同属性的分类',
  `snum` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '该种类的商品数量',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属那个商品'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_subgoods`
--

INSERT INTO `shop_subgoods` (`id`, `sname`, `snum`, `goods_id`) VALUES
(81, '黑色', 44, 27),
(80, '白色', 77, 27),
(84, '红色', 38, 24),
(83, '黑色', 58, 24),
(82, '白色', 666, 24),
(94, '白色', 777, 28),
(93, '黑色', 55, 28),
(96, '白色', 77, 29),
(95, '黑色', 454, 29),
(92, '白色', 888, 30),
(91, '黑色', 66, 30),
(97, '红色', 55, 31);

-- --------------------------------------------------------

--
-- 表的结构 `shop_user`
--

CREATE TABLE `shop_user` (
  `uid` int(11) NOT NULL COMMENT '递增Id主键',
  `username` char(30) NOT NULL COMMENT '用户名长度30位',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱注册用户',
  `password` varchar(255) NOT NULL COMMENT '密码长度，最长255',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_user`
--

INSERT INTO `shop_user` (`uid`, `username`, `is_admin`, `phone`, `email`, `password`, `create_time`, `update_time`) VALUES
(8, 'zx-1510629114', 1, '12345678911', '283010247@qq.com', '$2y$10$Yekj4pw7ovRyKc/FytM0fe4VnQVHOaO3BzbGB.UwKnUROhY1wKRD2', '2017-11-14 11:11:54', '2017-11-17 14:24:59'),
(9, '浩哥', 0, '13871398021', '602171703@qq.com', '$2y$10$IZXJ.tbk5ftd0M3Q45S2BO0QJfn.NFstLuOHbCSwEAUJqtOvLR.Yy', '2017-11-14 11:17:27', '2017-11-23 19:34:49'),
(13, 'zx-1510992183', 0, '18312003613', '', '$2y$10$kzNv7sP2iCbdOOKJjT3Zc.4JZ2jKlTZYdDWAaozQculWgPQoRqOGO', '2017-11-18 16:03:03', '2017-11-18 16:03:03');

-- --------------------------------------------------------

--
-- 表的结构 `shop_userinfo`
--

CREATE TABLE `shop_userinfo` (
  `id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `uid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_userinfo`
--

INSERT INTO `shop_userinfo` (`id`, `address`, `uid`) VALUES
(6, '广东省东莞市石碣镇新风西路102号', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shop_attachment`
--
ALTER TABLE `shop_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `shop_goods`
--
ALTER TABLE `shop_goods`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order_list`
--
ALTER TABLE `shop_order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_subgoods`
--
ALTER TABLE `shop_subgoods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `phone_UNIQUE` (`phone`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `shop_userinfo`
--
ALTER TABLE `shop_userinfo`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `shop_attachment`
--
ALTER TABLE `shop_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '目录id', AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `shop_goods`
--
ALTER TABLE `shop_goods`
  MODIFY `gid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品表中的id ', AUTO_INCREMENT=32;
--
-- 使用表AUTO_INCREMENT `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `shop_order_list`
--
ALTER TABLE `shop_order_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_subgoods`
--
ALTER TABLE `shop_subgoods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品子类 主键id', AUTO_INCREMENT=98;
--
-- 使用表AUTO_INCREMENT `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '递增Id主键', AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `shop_userinfo`
--
ALTER TABLE `shop_userinfo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
