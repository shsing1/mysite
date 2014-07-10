-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： Y-m-d: H:i:s
-- 伺服器版本: 5.6.16
-- PHP 版本： 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫： `mysite`
--

-- --------------------------------------------------------

--
-- 資料表結構 `ci_backend_menu`
--

CREATE TABLE IF NOT EXISTS `ci_backend_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL,
  `name__1` varchar(50) NOT NULL,
  `name__2` varchar(50) NOT NULL,
  `name__3` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 資料表的匯出資料 `ci_backend_menu`
--

INSERT INTO `ci_backend_menu` (`id`, `sort`, `deleted`, `parent_id`, `name__1`, `name__2`, `name__3`, `url`) VALUES
(1, 1, 0, 0, '後台管理', 'backend', '后台管理', ''),
(2, 2, 0, 1, 'Metadata', 'Metadata', 'Metadata', ''),
(3, 3, 0, 2, '型別', 'Type', '型別', 'type'),
(4, 4, 0, 2, 'Entity', 'Entity', 'Entity', 'entity'),
(5, 5, 0, 2, '語系', 'Language', '语系', 'language'),
(6, 6, 0, 2, 'Option', 'Option', 'Option', 'option'),
(7, 7, 0, 1, '資料管理', 'Data Management', '资料管理', ''),
(8, 8, 0, 7, '後台選單', 'Backend Menu', '后台选单', 'backend_menu'),
(9, 9, 0, 1, '權限管理', 'Authority', '权限管理', ''),
(10, 10, 0, 9, '角色', 'Role', '角色', 'role'),
(11, 11, 0, 9, '帳號', 'Account', '帐号', 'account');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_base_language`
--

CREATE TABLE IF NOT EXISTS `ci_base_language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `map` varchar(10) NOT NULL,
  `datepicker` varchar(10) NOT NULL,
  `editor` varchar(10) NOT NULL,
  `browser` varchar(10) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `jqgrid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 資料表的匯出資料 `ci_base_language`
--

INSERT INTO `ci_base_language` (`id`, `name`, `map`, `datepicker`, `editor`, `browser`, `sort`, `deleted`, `jqgrid`) VALUES
(1, '繁', 'zh-TW', 'zh-TW', 'zh', 'zh-tw', 1, 0, 'tw'),
(2, 'EN', 'en', '', 'en', 'en-us', 2, 0, 'en'),
(3, '簡', 'zh-CN', 'zh-CN', 'zh-cn', 'zh-cn', 3, 0, 'cn');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('2f95d7f64f4c3dfbd97ae6386b92805a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0 FirePHP/0.7.4', 1404986328, 'a:2:{s:9:"user_data";s:0:"";s:7:"lang_id";s:1:"1";}');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
