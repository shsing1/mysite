-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： Y-m-d H:i:s
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
`id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL,
  `name__1` varchar(50) NOT NULL,
  `name__2` varchar(50) NOT NULL,
  `name__3` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL
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
`id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `map` varchar(10) NOT NULL,
  `datepicker` varchar(10) NOT NULL,
  `editor` varchar(10) NOT NULL,
  `browser` varchar(10) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `jqgrid` varchar(10) NOT NULL
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
-- 資料表結構 `ci_meta_entity`
--

CREATE TABLE IF NOT EXISTS `ci_meta_entity` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 資料表的匯出資料 `ci_meta_entity`
--

INSERT INTO `ci_meta_entity` (`id`, `name`, `table_name`, `sort`, `deleted`) VALUES
(1, 'entity', 'meta_entity', 1, 0),
(2, 'property', 'meta_property', 2, 0),
(3, 'type', 'meta_type', 3, 0),
(4, 'language', 'base_language', 4, 0),
(5, 'backend_menu', 'backend_menu', 5, 0),
(6, 'option', 'meta_option', 6, 0),
(7, 'option_item', 'meta_option_item', 7, 0),
(8, 'role', 'auth_role', 8, 0),
(9, 'account', 'auth_account', 9, 0),
(10, 'static_text', 'static_text', 10, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ci_meta_option`
--

CREATE TABLE IF NOT EXISTS `ci_meta_option` (
`id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type_id` int(10) unsigned NOT NULL,
  `name__1` varchar(255) NOT NULL,
  `name__2` varchar(255) NOT NULL,
  `name__3` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 資料表的匯出資料 `ci_meta_option`
--

INSERT INTO `ci_meta_option` (`id`, `sort`, `deleted`, `type_id`, `name__1`, `name__2`, `name__3`) VALUES
(1, 1, 0, 2, '性別', 'gender', '性别');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_meta_option_item`
--

CREATE TABLE IF NOT EXISTS `ci_meta_option_item` (
`id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `description__1` varchar(255) NOT NULL,
  `description__2` varchar(255) NOT NULL,
  `description__3` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 資料表的匯出資料 `ci_meta_option_item`
--

INSERT INTO `ci_meta_option_item` (`id`, `sort`, `deleted`, `parent_id`, `value`, `description__1`, `description__2`, `description__3`) VALUES
(1, 1, 0, 1, 'm', '男', 'Male', '男'),
(2, 2, 0, 1, 'f', '女', 'Female', '女');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_meta_property`
--

CREATE TABLE IF NOT EXISTS `ci_meta_property` (
`id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `column_name` varchar(50) DEFAULT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `length` int(10) DEFAULT NULL,
  `nullable` tinyint(1) NOT NULL,
  `updatable` tinyint(1) NOT NULL,
  `multilingual` tinyint(1) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 資料表的匯出資料 `ci_meta_property`
--

INSERT INTO `ci_meta_property` (`id`, `parent_id`, `name`, `column_name`, `type_id`, `length`, `nullable`, `updatable`, `multilingual`, `sort`, `deleted`) VALUES
(1, 1, 'id', '', 1, 10, 0, 0, 0, 1, 0),
(2, 1, 'name', '', 2, 30, 0, 1, 0, 2, 0),
(3, 1, 'table_name', '', 2, 30, 0, 1, 0, 3, 0),
(4, 1, 'delete', '', 1, 1, 0, 0, 0, 4, 0),
(5, 1, 'sort', '', 1, 10, 0, 0, 0, 5, 0),
(6, 2, 'id', '', 1, 10, 0, 0, 0, 6, 0),
(7, 2, 'parent_id', '', 1, 10, 0, 0, 0, 7, 0),
(8, 2, 'name', '', 2, 50, 0, 1, 0, 8, 0),
(9, 2, 'column_name', '', 2, 50, 1, 1, 0, 9, 0),
(10, 2, 'type_id', '', 1, 10, 0, 1, 0, 10, 0),
(11, 2, 'length', '', 1, 10, 0, 1, 0, 11, 0),
(12, 2, 'nullable', '', 5, 1, 0, 1, 0, 12, 0),
(13, 2, 'updatable', '', 5, 1, 0, 1, 0, 13, 0),
(14, 2, 'multilingual', '', 5, 1, 0, 1, 0, 14, 0),
(15, 2, 'sort', '', 1, 10, 0, 0, 0, 15, 0),
(16, 2, 'deleted', '', 5, 1, 0, 0, 0, 16, 0),
(17, 3, 'id', '', 1, 10, 0, 0, 0, 17, 0),
(18, 3, 'name', '', 2, 30, 0, 1, 0, 18, 0),
(19, 3, 'length', '', 1, 10, 0, 1, 0, 19, 0),
(20, 3, 'class_name', '', 2, 50, 0, 1, 0, 20, 0),
(21, 3, 'formatter', '', 2, 50, 0, 1, 0, 21, 0),
(22, 3, 'sort', '', 1, 10, 0, 0, 0, 22, 0),
(23, 3, 'deleted', '', 5, 1, 0, 0, 0, 23, 0),
(24, 3, 'column_type', '', 2, 30, 0, 1, 0, 24, 0),
(25, 4, 'id', '', 1, 10, 0, 0, 0, 25, 0),
(26, 4, 'name', '', 2, 30, 0, 1, 0, 26, 0),
(27, 4, 'map', '', 2, 30, 0, 1, 0, 27, 0),
(28, 4, 'datepicker', '', 2, 30, 0, 1, 0, 28, 0),
(29, 4, 'editor', '', 2, 30, 0, 1, 0, 29, 0),
(30, 4, 'browser', '', 2, 30, 0, 1, 0, 30, 0),
(31, 4, 'sort', '', 1, 10, 0, 0, 0, 31, 0),
(32, 4, 'deleted', '', 5, 1, 0, 0, 0, 32, 0),
(33, 4, 'jqgrid', '', 2, 30, 0, 1, 0, 33, 0),
(34, 5, 'id', NULL, 1, 10, 0, 0, 0, 34, 0),
(35, 5, 'sort', NULL, 1, 10, 0, 0, 0, 35, 0),
(36, 5, 'deleted', NULL, 5, 10, 0, 0, 0, 36, 0),
(37, 5, 'parent_id', '', 1, 10, 1, 0, 0, 37, 0),
(38, 5, 'name', '', 2, 50, 0, 1, 1, 38, 0),
(39, 5, 'url', '', 6, 255, 1, 1, 0, 39, 0),
(40, 6, 'id', NULL, 1, 10, 0, 0, 0, 40, 0),
(41, 6, 'sort', NULL, 1, 10, 0, 0, 0, 41, 0),
(42, 6, 'deleted', NULL, 5, 10, 0, 0, 0, 42, 0),
(43, 6, 'type_id', '', 1, 10, 0, 1, 0, 43, 0),
(44, 6, 'name', '', 2, 255, 0, 1, 1, 44, 0),
(45, 7, 'id', NULL, 1, 10, 0, 0, 0, 45, 0),
(46, 7, 'sort', NULL, 1, 10, 0, 0, 0, 46, 0),
(47, 7, 'deleted', NULL, 5, 10, 0, 0, 0, 47, 0),
(48, 7, 'parent_id', '', 1, 10, 0, 0, 0, 48, 0),
(49, 7, 'value', '', 2, 255, 0, 1, 0, 49, 0),
(50, 7, 'description', '', 2, 255, 0, 1, 1, 50, 0),
(51, 8, 'id', NULL, 1, 10, 0, 0, 0, 51, 0),
(52, 8, 'sort', NULL, 1, 10, 0, 0, 0, 52, 0),
(53, 8, 'deleted', NULL, 5, 10, 0, 0, 0, 53, 0),
(54, 8, 'name', '', 2, 255, 0, 1, 1, 54, 0),
(55, 9, 'id', NULL, 1, 10, 0, 0, 0, 55, 0),
(56, 9, 'sort', NULL, 1, 10, 0, 0, 0, 56, 0),
(57, 9, 'deleted', NULL, 5, 10, 0, 0, 0, 57, 0),
(58, 9, 'account', '', 2, 255, 0, 0, 0, 58, 0),
(59, 9, 'password', '', 2, 255, 0, 1, 0, 59, 0),
(60, 10, 'id', NULL, 1, 10, 0, 0, 0, 60, 0),
(61, 10, 'sort', NULL, 1, 10, 0, 0, 0, 61, 0),
(62, 10, 'deleted', NULL, 5, 10, 0, 0, 0, 62, 0),
(63, 10, 'key', 'key', 2, 50, 0, 1, 0, 63, 0),
(64, 10, 'value', 'value', 3, 0, 0, 1, 1, 64, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ci_meta_type`
--

CREATE TABLE IF NOT EXISTS `ci_meta_type` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `length` int(10) unsigned DEFAULT NULL,
  `class_name` varchar(80) NOT NULL,
  `formatter` varchar(1000) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `column_type` varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 資料表的匯出資料 `ci_meta_type`
--

INSERT INTO `ci_meta_type` (`id`, `name`, `length`, `class_name`, `formatter`, `sort`, `deleted`, `column_type`) VALUES
(1, 'int', 10, 'int', '', 1, 0, 'INT'),
(2, 'string', 255, 'string', '', 2, 0, 'VARCHAR'),
(3, 'text', 0, 'string', '', 3, 0, 'TEXT'),
(4, 'date', 0, 'date', 'Y-m-d', 4, 0, 'DATE'),
(5, 'boolean', 1, 'boolean', '', 5, 0, 'TINYINT'),
(6, 'url', 255, 'string', '', 6, 0, 'VARCHAR');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) DEFAULT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('72e33ea2a52f9ce7ef8da1f7fa7b72f9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0 FirePHP/0.7.4', 1405068842, 'a:3:{s:9:"user_data";s:0:"";s:7:"lang_id";s:1:"1";s:10:"flexi_auth";a:7:{s:15:"user_identifier";s:15:"admin@admin.com";s:7:"user_id";s:1:"1";s:5:"admin";b:1;s:5:"group";a:1:{i:3;s:12:"Master Admin";}s:10:"privileges";a:11:{i:1;s:10:"View Users";i:2;s:16:"View User Groups";i:3;s:15:"View Privileges";i:4;s:18:"Insert User Groups";i:5;s:17:"Insert Privileges";i:6;s:12:"Update Users";i:7;s:18:"Update User Groups";i:8;s:17:"Update Privileges";i:9;s:12:"Delete Users";i:10;s:18:"Delete User Groups";i:11;s:17:"Delete Privileges";}s:22:"logged_in_via_password";b:1;s:19:"login_session_token";s:40:"551e13515c5aa8f9cceb55119f40dcb4bec3f2a2";}}');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_static_text`
--

CREATE TABLE IF NOT EXISTS `ci_static_text` (
`id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `key` varchar(50) NOT NULL,
  `value__1` text NOT NULL,
  `value__2` text NOT NULL,
  `value__3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_accounts`
--

CREATE TABLE IF NOT EXISTS `ci_user_accounts` (
`uacc_id` int(11) unsigned NOT NULL,
  `uacc_group_fk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uacc_email` varchar(100) NOT NULL DEFAULT '',
  `uacc_username` varchar(15) NOT NULL DEFAULT '',
  `uacc_password` varchar(60) NOT NULL DEFAULT '',
  `uacc_ip_address` varchar(40) NOT NULL DEFAULT '',
  `uacc_salt` varchar(40) NOT NULL DEFAULT '',
  `uacc_activation_token` varchar(40) NOT NULL DEFAULT '',
  `uacc_forgotten_password_token` varchar(40) NOT NULL DEFAULT '',
  `uacc_forgotten_password_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uacc_update_email_token` varchar(40) NOT NULL DEFAULT '',
  `uacc_update_email` varchar(100) NOT NULL DEFAULT '',
  `uacc_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `uacc_suspend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `uacc_fail_login_attempts` smallint(5) NOT NULL DEFAULT '0',
  `uacc_fail_login_ip_address` varchar(40) NOT NULL DEFAULT '',
  `uacc_date_fail_login_ban` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time user is banned until due to repeated failed logins',
  `uacc_date_last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uacc_date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 資料表的匯出資料 `ci_user_accounts`
--

INSERT INTO `ci_user_accounts` (`uacc_id`, `uacc_group_fk`, `uacc_email`, `uacc_username`, `uacc_password`, `uacc_ip_address`, `uacc_salt`, `uacc_activation_token`, `uacc_forgotten_password_token`, `uacc_forgotten_password_expire`, `uacc_update_email_token`, `uacc_update_email`, `uacc_active`, `uacc_suspend`, `uacc_fail_login_attempts`, `uacc_fail_login_ip_address`, `uacc_date_fail_login_ban`, `uacc_date_last_login`, `uacc_date_added`) VALUES
(1, 3, 'admin@admin.com', 'admin', '$2a$08$lSOQGNqwBFUEDTxm2Y.hb.mfPEAt/iiGY9kJsZsd4ekLJXLD.tCrq', '127.0.0.1', 'XKVT29q2Jr', '', '', '0000-00-00 00:00:00', '', '', 1, 0, 0, '', '0000-00-00 00:00:00', '2014-07-11 16:43:06', '2011-01-01 00:00:00'),
(2, 2, 'moderator@moderator.com', 'moderator', '$2a$08$q.0ZhovC5ZkVpkBLJ.Mz.O4VjWsKohYckJNx4KM40MXdP/zEZpwcm', '0.0.0.0', 'ZC38NNBPjF', '', '', '0000-00-00 00:00:00', '', '', 1, 0, 0, '', '0000-00-00 00:00:00', '2012-04-10 21:58:02', '2011-08-04 16:49:07'),
(3, 1, 'public@public.com', 'public', '$2a$08$GlxQ00VKlev2t.CpvbTOlepTJljxF2RocJghON37r40mbDl4vJLv2', '0.0.0.0', 'CDNFV6dHmn', '', '', '0000-00-00 00:00:00', '', '', 1, 0, 0, '', '0000-00-00 00:00:00', '2012-04-10 22:01:41', '2011-09-15 12:24:45');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_address`
--

CREATE TABLE IF NOT EXISTS `ci_user_address` (
`uadd_id` int(11) NOT NULL,
  `uadd_uacc_fk` int(11) NOT NULL DEFAULT '0',
  `uadd_alias` varchar(50) NOT NULL DEFAULT '',
  `uadd_recipient` varchar(100) NOT NULL DEFAULT '',
  `uadd_phone` varchar(25) NOT NULL DEFAULT '',
  `uadd_company` varchar(75) NOT NULL DEFAULT '',
  `uadd_address_01` varchar(100) NOT NULL DEFAULT '',
  `uadd_address_02` varchar(100) NOT NULL DEFAULT '',
  `uadd_city` varchar(50) NOT NULL DEFAULT '',
  `uadd_county` varchar(50) NOT NULL DEFAULT '',
  `uadd_post_code` varchar(25) NOT NULL DEFAULT '',
  `uadd_country` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 資料表的匯出資料 `ci_user_address`
--

INSERT INTO `ci_user_address` (`uadd_id`, `uadd_uacc_fk`, `uadd_alias`, `uadd_recipient`, `uadd_phone`, `uadd_company`, `uadd_address_01`, `uadd_address_02`, `uadd_city`, `uadd_county`, `uadd_post_code`, `uadd_country`) VALUES
(1, 4, 'Home', 'Joe Public', '0123456789', '', '123', '', 'My City', 'My County', 'My Post Code', 'My Country'),
(2, 4, 'Work', 'Joe Public', '0123456789', 'Flexi', '321', '', 'My Work City', 'My Work County', 'My Work Post Code', 'My Work Country');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_groups`
--

CREATE TABLE IF NOT EXISTS `ci_user_groups` (
`ugrp_id` smallint(5) NOT NULL,
  `ugrp_name` varchar(20) NOT NULL DEFAULT '',
  `ugrp_desc` varchar(100) NOT NULL DEFAULT '',
  `ugrp_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 資料表的匯出資料 `ci_user_groups`
--

INSERT INTO `ci_user_groups` (`ugrp_id`, `ugrp_name`, `ugrp_desc`, `ugrp_admin`) VALUES
(1, 'Public', 'Public User : has no admin access rights.', 0),
(2, 'Moderator', 'Admin Moderator : has partial admin access rights.', 1),
(3, 'Master Admin', 'Master Admin : has full admin access rights.', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_login_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_user_login_sessions` (
  `usess_uacc_fk` int(11) NOT NULL DEFAULT '0',
  `usess_series` varchar(40) NOT NULL DEFAULT '',
  `usess_token` varchar(40) NOT NULL DEFAULT '',
  `usess_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `ci_user_login_sessions`
--

INSERT INTO `ci_user_login_sessions` (`usess_uacc_fk`, `usess_series`, `usess_token`, `usess_login_date`) VALUES
(1, '', '551e13515c5aa8f9cceb55119f40dcb4bec3f2a2', '2014-07-11 16:55:19');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_privileges`
--

CREATE TABLE IF NOT EXISTS `ci_user_privileges` (
`upriv_id` smallint(5) NOT NULL,
  `upriv_name` varchar(20) NOT NULL DEFAULT '',
  `upriv_desc` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- 資料表的匯出資料 `ci_user_privileges`
--

INSERT INTO `ci_user_privileges` (`upriv_id`, `upriv_name`, `upriv_desc`) VALUES
(1, 'View Users', 'User can view user account details.'),
(2, 'View User Groups', 'User can view user groups.'),
(3, 'View Privileges', 'User can view privileges.'),
(4, 'Insert User Groups', 'User can insert new user groups.'),
(5, 'Insert Privileges', 'User can insert privileges.'),
(6, 'Update Users', 'User can update user account details.'),
(7, 'Update User Groups', 'User can update user groups.'),
(8, 'Update Privileges', 'User can update user privileges.'),
(9, 'Delete Users', 'User can delete user accounts.'),
(10, 'Delete User Groups', 'User can delete user groups.'),
(11, 'Delete Privileges', 'User can delete user privileges.');

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_privilege_groups`
--

CREATE TABLE IF NOT EXISTS `ci_user_privilege_groups` (
`upriv_groups_id` smallint(5) unsigned NOT NULL,
  `upriv_groups_ugrp_fk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `upriv_groups_upriv_fk` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- 資料表的匯出資料 `ci_user_privilege_groups`
--

INSERT INTO `ci_user_privilege_groups` (`upriv_groups_id`, `upriv_groups_ugrp_fk`, `upriv_groups_upriv_fk`) VALUES
(1, 3, 1),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
(12, 2, 2),
(13, 2, 4),
(14, 2, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_privilege_users`
--

CREATE TABLE IF NOT EXISTS `ci_user_privilege_users` (
`upriv_users_id` smallint(5) NOT NULL,
  `upriv_users_uacc_fk` int(11) NOT NULL DEFAULT '0',
  `upriv_users_upriv_fk` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- 資料表的匯出資料 `ci_user_privilege_users`
--

INSERT INTO `ci_user_privilege_users` (`upriv_users_id`, `upriv_users_uacc_fk`, `upriv_users_upriv_fk`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 2, 1),
(13, 2, 2),
(14, 2, 3),
(15, 2, 6);

-- --------------------------------------------------------

--
-- 資料表結構 `ci_user_profiles`
--

CREATE TABLE IF NOT EXISTS `ci_user_profiles` (
`upro_id` int(11) NOT NULL,
  `upro_uacc_fk` int(11) NOT NULL DEFAULT '0',
  `upro_company` varchar(50) NOT NULL DEFAULT '',
  `upro_first_name` varchar(50) NOT NULL DEFAULT '',
  `upro_last_name` varchar(50) NOT NULL DEFAULT '',
  `upro_phone` varchar(25) NOT NULL DEFAULT '',
  `upro_newsletter` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 資料表的匯出資料 `ci_user_profiles`
--

INSERT INTO `ci_user_profiles` (`upro_id`, `upro_uacc_fk`, `upro_company`, `upro_first_name`, `upro_last_name`, `upro_phone`, `upro_newsletter`) VALUES
(1, 1, '', 'John', 'Admin', '0123456789', 0),
(2, 2, '', 'Jim', 'Moderator', '0123465798', 0),
(3, 3, '', 'Joe', 'Public', '0123456789', 0);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `ci_backend_menu`
--
ALTER TABLE `ci_backend_menu`
 ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ci_base_language`
--
ALTER TABLE `ci_base_language`
 ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ci_meta_entity`
--
ALTER TABLE `ci_meta_entity`
 ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ci_meta_option`
--
ALTER TABLE `ci_meta_option`
 ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ci_meta_option_item`
--
ALTER TABLE `ci_meta_option_item`
 ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ci_meta_property`
--
ALTER TABLE `ci_meta_property`
 ADD PRIMARY KEY (`id`), ADD KEY `parent_id` (`parent_id`), ADD KEY `type_id` (`type_id`);

--
-- 資料表索引 `ci_meta_type`
--
ALTER TABLE `ci_meta_type`
 ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`session_id`), ADD KEY `last_activity` (`last_activity`);

--
-- 資料表索引 `ci_static_text`
--
ALTER TABLE `ci_static_text`
 ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ci_user_accounts`
--
ALTER TABLE `ci_user_accounts`
 ADD PRIMARY KEY (`uacc_id`), ADD UNIQUE KEY `uacc_id` (`uacc_id`), ADD KEY `uacc_group_fk` (`uacc_group_fk`), ADD KEY `uacc_email` (`uacc_email`), ADD KEY `uacc_username` (`uacc_username`), ADD KEY `uacc_fail_login_ip_address` (`uacc_fail_login_ip_address`);

--
-- 資料表索引 `ci_user_address`
--
ALTER TABLE `ci_user_address`
 ADD PRIMARY KEY (`uadd_id`), ADD UNIQUE KEY `uadd_id` (`uadd_id`), ADD KEY `uadd_uacc_fk` (`uadd_uacc_fk`);

--
-- 資料表索引 `ci_user_groups`
--
ALTER TABLE `ci_user_groups`
 ADD PRIMARY KEY (`ugrp_id`), ADD UNIQUE KEY `ugrp_id` (`ugrp_id`) USING BTREE;

--
-- 資料表索引 `ci_user_login_sessions`
--
ALTER TABLE `ci_user_login_sessions`
 ADD PRIMARY KEY (`usess_token`), ADD UNIQUE KEY `usess_token` (`usess_token`);

--
-- 資料表索引 `ci_user_privileges`
--
ALTER TABLE `ci_user_privileges`
 ADD PRIMARY KEY (`upriv_id`), ADD UNIQUE KEY `upriv_id` (`upriv_id`) USING BTREE;

--
-- 資料表索引 `ci_user_privilege_groups`
--
ALTER TABLE `ci_user_privilege_groups`
 ADD PRIMARY KEY (`upriv_groups_id`), ADD UNIQUE KEY `upriv_groups_id` (`upriv_groups_id`) USING BTREE, ADD KEY `upriv_groups_ugrp_fk` (`upriv_groups_ugrp_fk`), ADD KEY `upriv_groups_upriv_fk` (`upriv_groups_upriv_fk`);

--
-- 資料表索引 `ci_user_privilege_users`
--
ALTER TABLE `ci_user_privilege_users`
 ADD PRIMARY KEY (`upriv_users_id`), ADD UNIQUE KEY `upriv_users_id` (`upriv_users_id`) USING BTREE, ADD KEY `upriv_users_uacc_fk` (`upriv_users_uacc_fk`), ADD KEY `upriv_users_upriv_fk` (`upriv_users_upriv_fk`);

--
-- 資料表索引 `ci_user_profiles`
--
ALTER TABLE `ci_user_profiles`
 ADD PRIMARY KEY (`upro_id`), ADD UNIQUE KEY `upro_id` (`upro_id`), ADD KEY `upro_uacc_fk` (`upro_uacc_fk`) USING BTREE;

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `ci_backend_menu`
--
ALTER TABLE `ci_backend_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- 使用資料表 AUTO_INCREMENT `ci_base_language`
--
ALTER TABLE `ci_base_language`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `ci_meta_entity`
--
ALTER TABLE `ci_meta_entity`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- 使用資料表 AUTO_INCREMENT `ci_meta_option`
--
ALTER TABLE `ci_meta_option`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `ci_meta_option_item`
--
ALTER TABLE `ci_meta_option_item`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `ci_meta_property`
--
ALTER TABLE `ci_meta_property`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- 使用資料表 AUTO_INCREMENT `ci_meta_type`
--
ALTER TABLE `ci_meta_type`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- 使用資料表 AUTO_INCREMENT `ci_static_text`
--
ALTER TABLE `ci_static_text`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ci_user_accounts`
--
ALTER TABLE `ci_user_accounts`
MODIFY `uacc_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `ci_user_address`
--
ALTER TABLE `ci_user_address`
MODIFY `uadd_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `ci_user_groups`
--
ALTER TABLE `ci_user_groups`
MODIFY `ugrp_id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `ci_user_privileges`
--
ALTER TABLE `ci_user_privileges`
MODIFY `upriv_id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- 使用資料表 AUTO_INCREMENT `ci_user_privilege_groups`
--
ALTER TABLE `ci_user_privilege_groups`
MODIFY `upriv_groups_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- 使用資料表 AUTO_INCREMENT `ci_user_privilege_users`
--
ALTER TABLE `ci_user_privilege_users`
MODIFY `upriv_users_id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- 使用資料表 AUTO_INCREMENT `ci_user_profiles`
--
ALTER TABLE `ci_user_profiles`
MODIFY `upro_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
