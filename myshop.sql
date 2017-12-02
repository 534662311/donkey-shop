-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-02 03:12:59
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
-- 表的结构 `shop_access`
--

CREATE TABLE `shop_access` (
  `id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `urls` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `shop_access`
--

INSERT INTO `shop_access` (`id`, `title`, `urls`, `update_time`, `create_time`) VALUES
(1, '系统设置页', '["admin\\/user\\/index","admin\\/role\\/index","admin\\/access\\/index"]', '2017-11-30 15:31:17', '2017-11-30 12:07:48'),
(2, '栏目页', '["admin\\/category\\/index","admin\\/category\\/edit","admin\\/category\\/add"]', '2017-11-30 17:19:07', '2017-11-30 13:40:09'),
(3, '商品页', '["admin\\/goods\\/index","admin\\/goods\\/edit","admin\\/goods\\/add"]', '2017-11-30 17:19:22', '2017-11-30 13:40:35'),
(4, '订单页', '["admin\\/order\\/index","admin\\/order\\/edit","admin\\/order\\/add"]', '2017-11-30 17:19:42', '2017-11-30 13:41:04');

-- --------------------------------------------------------

--
-- 表的结构 `shop_access_log`
--

CREATE TABLE `shop_access_log` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌UID',
  `target_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问的url',
  `query_params` longtext COMMENT 'get和post参数',
  `ua` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器标识',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '访问ip',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT 'json格式备注字段',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作记录表';

--
-- 转存表中的数据 `shop_access_log`
--

INSERT INTO `shop_access_log` (`id`, `uid`, `target_url`, `query_params`, `ua`, `ip`, `note`, `create_time`, `update_time`) VALUES
(1, 8, '/admin/user/changepassword.html', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:29:50', '2017-11-30 16:29:50'),
(2, 8, '/admin.html', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:29:56', '2017-11-30 16:29:56'),
(3, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:30:37', '2017-11-30 16:30:37'),
(4, 8, '/admin.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:30:43', '2017-11-30 16:30:43'),
(5, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:31:24', '2017-11-30 16:31:24'),
(6, 8, '/admin.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:31:28', '2017-11-30 16:31:28'),
(7, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:31:57', '2017-11-30 16:31:57'),
(8, 8, '/admin.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:32:05', '2017-11-30 16:32:05'),
(9, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:32:48', '2017-11-30 16:32:48'),
(10, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:32:49', '2017-11-30 16:32:49'),
(11, 8, '/admin/category/edit/id/17.html', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:32:51', '2017-11-30 16:32:51'),
(12, 8, '/admin/category/edit/id/17.html', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:33:10', '2017-11-30 16:33:10'),
(13, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:55:40', '2017-11-30 16:55:40'),
(14, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:55:56', '2017-11-30 16:55:56'),
(15, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:56:56', '2017-11-30 16:56:56'),
(16, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:57:22', '2017-11-30 16:57:22'),
(17, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:57:26', '2017-11-30 16:57:26'),
(18, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:57:28', '2017-11-30 16:57:28'),
(19, 8, '/admin/category/edit/id/17.html', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:57:31', '2017-11-30 16:57:31'),
(20, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 16:57:36', '2017-11-30 16:57:36'),
(21, 8, '/admin/category/edit/id/17.html', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:01:42', '2017-11-30 17:01:42'),
(22, 8, '/admin/category/edit.html?id=17', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:02:02', '2017-11-30 17:02:02'),
(23, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:18', '2017-11-30 17:03:18'),
(24, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:19', '2017-11-30 17:03:19'),
(25, 8, '/admin/category/basr_url/admin/category/edit?id=17', '{"id":"17","admin":"category"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:22', '2017-11-30 17:03:22'),
(26, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:34', '2017-11-30 17:03:34'),
(27, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:34', '2017-11-30 17:03:34'),
(28, 8, '/admin/category/edit?id=17', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:36', '2017-11-30 17:03:36'),
(29, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:38', '2017-11-30 17:03:38'),
(30, 8, '/admin/category/edit?id=17', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:46', '2017-11-30 17:03:46'),
(31, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:03:49', '2017-11-30 17:03:49'),
(32, 8, '/admin/category/delete/id/25.html', '{"id":"25"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:07', '2017-11-30 17:05:07'),
(33, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:11', '2017-11-30 17:05:11'),
(34, 8, '/admin/category/edit?id=17', '{"id":"17"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:23', '2017-11-30 17:05:23'),
(35, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:30', '2017-11-30 17:05:30'),
(36, 8, '/admin/category/add.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:31', '2017-11-30 17:05:31'),
(37, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:32', '2017-11-30 17:05:32'),
(38, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:36', '2017-11-30 17:05:36'),
(39, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:54', '2017-11-30 17:05:54'),
(40, 8, '/admin/goods/edit/id/31.html', '{"id":"31"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:57', '2017-11-30 17:05:57'),
(41, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:05:58', '2017-11-30 17:05:58'),
(42, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:35', '2017-11-30 17:06:35'),
(43, 8, '/admin/goods/edit?id=31', '{"id":"31"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:38', '2017-11-30 17:06:38'),
(44, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:40', '2017-11-30 17:06:40'),
(45, 8, '/admin/order/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:42', '2017-11-30 17:06:42'),
(46, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:43', '2017-11-30 17:06:43'),
(47, 8, '/admin/user/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:44', '2017-11-30 17:06:44'),
(48, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:45', '2017-11-30 17:06:45'),
(49, 8, '/admin/user/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:45', '2017-11-30 17:06:45'),
(50, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:46', '2017-11-30 17:06:46'),
(51, 8, '/admin/user/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:47', '2017-11-30 17:06:47'),
(52, 8, '/admin/user/edit/id/8.html', '{"id":"8"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:48', '2017-11-30 17:06:48'),
(53, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:06:51', '2017-11-30 17:06:51'),
(54, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:02', '2017-11-30 17:07:02'),
(55, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:05', '2017-11-30 17:07:05'),
(56, 8, '/admin/goods/delete/id/29.html', '{"id":"29"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:08', '2017-11-30 17:07:08'),
(57, 8, '/admin/goods/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:11', '2017-11-30 17:07:11'),
(58, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:12', '2017-11-30 17:07:12'),
(59, 8, '/admin/role/edit/id/1.html', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:24', '2017-11-30 17:07:24'),
(60, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:46', '2017-11-30 17:07:46'),
(61, 8, '/admin/role/add.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:50', '2017-11-30 17:07:50'),
(62, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:51', '2017-11-30 17:07:51'),
(63, 8, '/admin/role/edit/id/1.html', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:52', '2017-11-30 17:07:52'),
(64, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:53', '2017-11-30 17:07:53'),
(65, 8, '/admin/role/access/id/1.html', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:54', '2017-11-30 17:07:54'),
(66, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:07:54', '2017-11-30 17:07:54'),
(67, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:19', '2017-11-30 17:09:19'),
(68, 8, '/admin/role/edit.html?id=1', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:20', '2017-11-30 17:09:20'),
(69, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:21', '2017-11-30 17:09:21'),
(70, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:21', '2017-11-30 17:09:21'),
(71, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:23', '2017-11-30 17:09:23'),
(72, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:30', '2017-11-30 17:09:30'),
(73, 8, '/admin/Role/access.html?id=%3E2', '{"id":">2"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:31', '2017-11-30 17:09:31'),
(74, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:48', '2017-11-30 17:09:48'),
(75, 8, '/admin/Role/access.html?id=%3E3', '{"id":">3"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:09:49', '2017-11-30 17:09:49'),
(76, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:10:09', '2017-11-30 17:10:09'),
(77, 8, '/admin/role/edit.html?id=2', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:10:11', '2017-11-30 17:10:11'),
(78, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:10:13', '2017-11-30 17:10:13'),
(79, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:11:11', '2017-11-30 17:11:11'),
(80, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:11:12', '2017-11-30 17:11:12'),
(81, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:11:22', '2017-11-30 17:11:22'),
(82, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:11:24', '2017-11-30 17:11:24'),
(83, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:11:24', '2017-11-30 17:11:24'),
(84, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:11:33', '2017-11-30 17:11:33'),
(85, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:13:37', '2017-11-30 17:13:37'),
(86, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:14:09', '2017-11-30 17:14:09'),
(87, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:14:09', '2017-11-30 17:14:09'),
(88, 8, '/admin/Role/access.html?id=%3E1', '{"id":">1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:16:02', '2017-11-30 17:16:02'),
(89, 8, '/admin/Role/access.html?id=1', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:16:30', '2017-11-30 17:16:30'),
(90, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:17:09', '2017-11-30 17:17:09'),
(91, 8, '/admin/role/edit.html?id=1', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:17:13', '2017-11-30 17:17:13'),
(92, 8, '/admin/user/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:17:46', '2017-11-30 17:17:46'),
(93, 8, '/admin/User/edit.html?id=8', '{"id":"8"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:17:49', '2017-11-30 17:17:49'),
(94, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:18:44', '2017-11-30 17:18:44'),
(95, 8, '/admin/Access/edit.html?id=1', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:18:45', '2017-11-30 17:18:45'),
(96, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:18:47', '2017-11-30 17:18:47'),
(97, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:18:49', '2017-11-30 17:18:49'),
(98, 8, '/admin/Access/edit.html?id=2', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:18:53', '2017-11-30 17:18:53'),
(99, 8, '/admin/Access/edit.html?id=2', '{"id":"2","title":"\\u680f\\u76ee\\u9875","urls":"admin\\/category\\/index\\r\\nadmin\\/category\\/edit\\r\\nadmin\\/category\\/add"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:07', '2017-11-30 17:19:07'),
(100, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:10', '2017-11-30 17:19:10'),
(101, 8, '/admin/Access/edit.html?id=3', '{"id":"3"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:12', '2017-11-30 17:19:12'),
(102, 8, '/admin/Access/edit.html?id=3', '{"id":"3","title":"\\u5546\\u54c1\\u9875","urls":"admin\\/goods\\/index\\r\\nadmin\\/goods\\/edit\\r\\nadmin\\/goods\\/add"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:22', '2017-11-30 17:19:22'),
(103, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:25', '2017-11-30 17:19:25'),
(104, 8, '/admin/Access/edit.html?id=4', '{"id":"4"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:27', '2017-11-30 17:19:27'),
(105, 8, '/admin/Access/edit.html?id=4', '{"id":"4","title":"\\u8ba2\\u5355\\u9875","urls":"admin\\/order\\/index\\r\\nadmin\\/order\\/edit\\r\\nadmin\\/order\\/add"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:42', '2017-11-30 17:19:42'),
(106, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:19:45', '2017-11-30 17:19:45'),
(107, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:01', '2017-11-30 17:20:01'),
(108, 8, '/admin/user/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:03', '2017-11-30 17:20:03'),
(109, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:07', '2017-11-30 17:20:07'),
(110, 8, '/admin.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:12', '2017-11-30 17:20:12'),
(111, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:14', '2017-11-30 17:20:14'),
(112, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:23', '2017-11-30 17:20:23'),
(113, 8, '/admin.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:36', '2017-11-30 17:20:36'),
(114, 8, '/admin/category/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:38', '2017-11-30 17:20:38'),
(115, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:20:40', '2017-11-30 17:20:40'),
(116, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:36', '2017-11-30 17:23:36'),
(117, 8, '/admin/role/edit.html?id=1', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:37', '2017-11-30 17:23:37'),
(118, 8, '/admin/user/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:39', '2017-11-30 17:23:39'),
(119, 8, '/admin/User/edit.html?id=8', '{"id":"8"}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:40', '2017-11-30 17:23:40'),
(120, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:41', '2017-11-30 17:23:41'),
(121, 8, '/admin/user/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:41', '2017-11-30 17:23:41'),
(122, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:42', '2017-11-30 17:23:42'),
(123, 8, '/admin/access/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:42', '2017-11-30 17:23:42'),
(124, 8, '/admin/Access/add.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:44', '2017-11-30 17:23:44'),
(125, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:23:44', '2017-11-30 17:23:44'),
(126, 8, '/admin/role/index.html', '[]', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '127.0.0.1', '', '2017-11-30 17:24:49', '2017-11-30 17:24:49');

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
(28, 'iPhone 8', 22, '3666.00', '4344.00', 'uploads/20171119\\287171cedfd1615fd6927ddc6e5df68e.jpg|uploads/20171119\\a18520b21e8e4ae08686da68601e9444.jpg|uploads/20171119\\1adcddfcb016698ddf832fb5d9c18d34.jpg|uploads/20171119\\2c1c885a7f088922dd2aef542d9df2c0.jpg|uploads/20171119\\b5af10302e387e8be91f4bbc6e29fe76.jpg', '<p>啊短发大的风</p>', 'uploads/20171119\\7959a4b99ba255b8ff38f06bac4e75c7.jpg', 0, '2017-11-19 22:23:57', '2017-11-19 22:23:57', '多发的说法的');

-- --------------------------------------------------------

--
-- 表的结构 `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `order_num` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号列表',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人电话',
  `address` varchar(255) NOT NULL COMMENT '用户地址',
  `status` enum('未发货','已发货','已签收') DEFAULT '未发货' COMMENT '订单状态',
  `total_price` decimal(11,2) NOT NULL COMMENT '商品总价',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '订单备注 ',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_order_goods`
--

CREATE TABLE `shop_order_goods` (
  `id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `goods_price` decimal(11,2) NOT NULL,
  `goods_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `goods_img` varchar(150) CHARACTER SET utf8 NOT NULL,
  `goods_num` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `shop_role`
--

CREATE TABLE `shop_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '角色名称',
  `status` int(11) NOT NULL COMMENT '状态，1表示有效，0表示无效',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `shop_role`
--

INSERT INTO `shop_role` (`id`, `name`, `status`, `create_time`, `update_time`) VALUES
(1, '经理', 1, '2017-11-29 00:00:00', '2017-11-29 00:00:00'),
(2, '技术总监', 1, '2017-11-29 00:00:00', '2017-11-29 00:00:00'),
(3, '前端', 1, '2017-11-29 17:06:58', '2017-11-29 17:06:58');

-- --------------------------------------------------------

--
-- 表的结构 `shop_role_access`
--

CREATE TABLE `shop_role_access` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `shop_role_access`
--

INSERT INTO `shop_role_access` (`id`, `role_id`, `access_id`) VALUES
(1, 1, 1),
(8, 2, 2),
(7, 2, 1),
(9, 2, 3),
(10, 2, 4),
(12, 1, 4),
(13, 3, 3);

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
(8, '浩哥', 1, '12345678911', '283010247@qq.com', '$2y$10$nkSOQ.Wls2liD9jolufozuai3kOwcGU/YfairebIiYjsfKJ1661wy', '2017-11-14 11:11:54', '2017-11-30 15:35:30'),
(9, '镇哥', 1, '13871398021', '602171703@qq.com', '$2y$10$IZXJ.tbk5ftd0M3Q45S2BO0QJfn.NFstLuOHbCSwEAUJqtOvLR.Yy', '2017-11-14 11:17:27', '2017-11-23 19:34:49'),
(13, '宇哥', 0, '18312003613', '', '$2y$10$kzNv7sP2iCbdOOKJjT3Zc.4JZ2jKlTZYdDWAaozQculWgPQoRqOGO', '2017-11-18 16:03:03', '2017-11-18 16:03:03');

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
(6, '广东省东莞市石碣镇新风西路102号', 9),
(8, '广东省东莞市石碣镇', 13),
(9, '广东省广州市天河区智慧园', 13);

-- --------------------------------------------------------

--
-- 表的结构 `shop_user_role`
--

CREATE TABLE `shop_user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `shop_user_role`
--

INSERT INTO `shop_user_role` (`id`, `user_id`, `role_id`) VALUES
(26, 9, 3),
(25, 8, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shop_access`
--
ALTER TABLE `shop_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_access_log`
--
ALTER TABLE `shop_access_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`);

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
-- Indexes for table `shop_order_goods`
--
ALTER TABLE `shop_order_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_role`
--
ALTER TABLE `shop_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_role_access`
--
ALTER TABLE `shop_role_access`
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
-- Indexes for table `shop_user_role`
--
ALTER TABLE `shop_user_role`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `shop_access`
--
ALTER TABLE `shop_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `shop_access_log`
--
ALTER TABLE `shop_access_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
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
-- 使用表AUTO_INCREMENT `shop_order_goods`
--
ALTER TABLE `shop_order_goods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_role`
--
ALTER TABLE `shop_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `shop_role_access`
--
ALTER TABLE `shop_role_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `shop_user_role`
--
ALTER TABLE `shop_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
