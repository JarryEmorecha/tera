-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2021 at 04:12 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ra`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(50) NOT NULL,
  `file` varchar(100) NOT NULL,
  `reftype` varchar(25) NOT NULL,
  `date_uploaded` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add articles', 7, 'add_articles'),
(26, 'Can change articles', 7, 'change_articles'),
(27, 'Can delete articles', 7, 'delete_articles'),
(28, 'Can view articles', 7, 'view_articles'),
(29, 'Can add folders', 8, 'add_folders'),
(30, 'Can change folders', 8, 'change_folders'),
(31, 'Can delete folders', 8, 'delete_folders'),
(32, 'Can view folders', 8, 'view_folders'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add proxies', 10, 'add_proxies'),
(38, 'Can change proxies', 10, 'change_proxies'),
(39, 'Can delete proxies', 10, 'delete_proxies'),
(40, 'Can view proxies', 10, 'view_proxies');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'ra', 'articles'),
(8, 'ra', 'folders'),
(10, 'ra', 'proxies'),
(9, 'ra', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-09 03:50:26.636746'),
(2, 'auth', '0001_initial', '2021-09-09 03:50:26.821761'),
(3, 'admin', '0001_initial', '2021-09-09 03:50:27.347799'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-09-09 03:50:27.479808'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-09 03:50:27.501810'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-09-09 03:50:27.589817'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-09-09 03:50:27.692827'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-09-09 03:50:27.720827'),
(9, 'auth', '0004_alter_user_username_opts', '2021-09-09 03:50:27.739832'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-09-09 03:50:27.800833'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-09-09 03:50:27.805834'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-09-09 03:50:27.820835'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-09-09 03:50:27.843836'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-09-09 03:50:27.869838'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-09-09 03:50:27.894840'),
(16, 'auth', '0011_update_proxy_permissions', '2021-09-09 03:50:27.910842'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-09-09 03:50:27.930843'),
(18, 'ra', '0001_initial', '2021-09-09 03:50:28.057852'),
(19, 'ra', '0002_auto_20210812_1342', '2021-09-09 03:50:28.171861'),
(20, 'ra', '0003_proxies', '2021-09-09 03:50:28.194863'),
(21, 'ra', '0004_proxies_isused', '2021-09-09 03:50:28.218864'),
(22, 'sessions', '0001_initial', '2021-09-09 03:50:28.244867');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('m760ngs8swsladpoehmotarrbxa87f30', 'eyJwcm94eSI6IjE1Mi4yMDAuMTQyLjEwMDo4MDgwIiwiaWQiOjEsIndvcmQiOiJjYW5jZXIifQ:1mRb0Y:JKscwbS4EVierMGW9uOh-N1VH5fC_PQmCLN1CA_nyGQ', '2021-10-02 14:07:58.651792');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
CREATE TABLE IF NOT EXISTS `folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foldername` varchar(25) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Folders_user_id_951efa88_fk_User_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proxies`
--

DROP TABLE IF EXISTS `proxies`;
CREATE TABLE IF NOT EXISTS `proxies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proxy` varchar(100) NOT NULL,
  `isUsed` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proxies`
--

INSERT INTO `proxies` (`id`, `proxy`, `isUsed`) VALUES
(1, '37.120.192.154:8080', 0),
(2, '190.145.200.126:53281', 0),
(3, '64.124.38.140:8080', 0),
(4, '64.124.38.141:8080', 0),
(5, '5.252.161.48:8080', 0),
(6, '186.226.172.165:57783', 0),
(7, '177.11.84.233:8080', 0),
(8, '175.139.179.65:42580', 0),
(9, '158.140.167.148:53281', 0),
(10, '103.78.252.65:8080', 0),
(11, '46.223.255.8:8080', 0),
(12, '103.78.252.113:8080', 0),
(13, '62.33.210.34:58918', 0),
(14, '64.124.38.139:8080', 0),
(15, '110.74.195.65:55443', 0),
(16, '95.0.94.170:80', 0),
(17, '194.233.69.126:443', 0),
(18, '41.222.209.12:808', 0),
(19, '94.74.132.129:808', 0),
(20, '91.89.89.5:8080', 0),
(21, '109.193.195.4:8080', 0),
(22, '95.208.208.238:8080', 0),
(23, '34.70.168.180:80', 0),
(24, '202.14.80.2:3128', 0),
(25, '209.91.184.156:80', 0),
(26, '195.138.82.198:40301', 0),
(27, '111.92.240.134:30598', 0),
(28, '78.42.42.37:8080', 0),
(29, '78.42.42.42:8080', 0),
(30, '170.254.224.7:55443', 0),
(31, '212.33.239.50:61309', 0),
(32, '128.0.179.234:41258', 0),
(33, '209.91.184.157:80', 0),
(34, '177.152.99.239:8083', 0),
(35, '45.225.93.42:999', 0),
(36, '180.178.111.218:8080', 0),
(37, '94.54.208.189:80', 0),
(38, '119.15.95.158:8080', 0),
(39, '134.3.255.9:8080', 0),
(40, '209.91.184.153:80', 0),
(41, '159.65.171.69:80', 0),
(42, '52.78.172.171:80', 0),
(43, '91.89.89.6:3128', 0),
(44, '61.29.96.146:8000', 0),
(45, '182.16.171.65:43188', 0),
(46, '154.16.63.16:3128', 0),
(47, '47.75.254.142:8888', 0),
(48, '137.74.65.101:80', 0),
(49, '181.129.70.82:46752', 0),
(50, '47.243.68.117:8080', 0),
(51, '210.212.92.182:8181', 0),
(52, '41.222.209.9:808', 0),
(53, '8.208.102.152:1088', 0),
(54, '116.12.236.212:8080', 0),
(55, '173.246.129.9:80', 0),
(56, '103.217.179.185:3128', 0),
(57, '41.79.191.182:80', 0),
(58, '189.240.60.169:8080', 0),
(59, '189.240.60.171:8080', 0),
(60, '189.240.60.163:8080', 0),
(61, '20.81.62.32:3128', 0),
(62, '189.240.60.164:8080', 0),
(63, '47.74.152.29:8888', 0),
(64, '176.9.75.42:8080', 0),
(65, '194.233.73.107:443', 0),
(66, '194.233.73.104:443', 0),
(67, '54.150.80.151:80', 0),
(68, '134.19.254.2:21231', 0),
(69, '46.4.96.137:3128', 0),
(70, '202.69.45.22:8080', 0),
(71, '128.199.214.87:3128', 0),
(72, '189.240.60.168:8080', 0),
(73, '185.61.152.137:8080', 0),
(74, '94.23.91.209:80', 0),
(75, '88.198.50.103:8080', 0),
(76, '47.243.23.114:8080', 0),
(77, '209.97.150.167:8080', 0),
(78, '159.203.61.169:8080', 0),
(79, '139.59.1.14:8080', 0),
(80, '167.71.5.83:8080', 0),
(81, '194.233.73.108:443', 0),
(82, '43.129.186.179:8080', 0),
(83, '45.70.202.162:8080', 0),
(84, '86.123.166.109:8080', 0),
(85, '116.12.236.213:8080', 0),
(86, '188.225.253.222:8080', 0),
(87, '2.188.166.25:3128', 0),
(88, '62.252.146.74:8080', 0),
(89, '182.79.103.121:80', 0),
(90, '88.198.24.108:8080', 0),
(91, '41.59.90.92:80', 0),
(92, '186.159.3.193:56861', 0),
(93, '82.212.62.24:8080', 0),
(94, '91.89.89.10:8080', 0),
(95, '109.193.195.14:8080', 0),
(96, '85.216.127.188:8080', 0),
(97, '134.3.255.4:8080', 0),
(98, '46.223.255.13:3128', 0),
(99, '91.89.89.4:8080', 0),
(100, '46.5.252.50:3128', 0),
(101, '46.237.255.3:8080', 0),
(102, '85.216.127.185:8080', 0),
(103, '78.42.42.41:8080', 0),
(104, '46.5.252.55:3128', 0),
(105, '176.9.119.170:8080', 0),
(106, '119.235.27.118:8080', 0),
(107, '190.115.143.2:8080', 0),
(108, '177.200.206.167:8080', 0),
(109, '186.228.147.58:20183', 0),
(110, '1.179.217.210:8080', 0),
(111, '183.89.3.57:8080', 0),
(112, '45.7.134.222:999', 0),
(113, '203.150.128.8:8080', 0),
(114, '117.102.81.5:53281', 0),
(115, '91.89.89.7:3128', 0),
(116, '61.91.61.110:80', 0),
(117, '52.74.18.115:80', 0),
(118, '14.97.2.106:80', 0),
(119, '67.47.16.241:87', 0),
(120, '193.149.225.103:80', 0),
(121, '161.202.226.194:80', 0),
(122, '202.182.57.114:8080', 0),
(123, '211.24.95.49:47615', 0),
(124, '189.52.154.213:3128', 0),
(125, '186.159.3.43:30334', 0),
(126, '64.124.38.142:8080', 0),
(127, '103.250.156.24:6666', 0),
(128, '182.79.103.125:80', 0),
(129, '115.84.246.51:80', 0),
(130, '134.3.255.7:8080', 0),
(131, '5.10.27.146:3128', 0),
(132, '64.124.38.26:8080', 0),
(133, '200.122.235.27:80', 0),
(134, '3.213.139.74:8888', 0),
(135, '151.232.72.15:80', 0),
(136, '181.176.151.214:3128', 0),
(137, '64.124.38.138:8080', 0),
(138, '80.48.119.28:8080', 0),
(139, '202.180.20.10:55443', 0),
(140, '200.69.80.242:8080', 0),
(141, '109.169.86.220:80', 0),
(142, '121.78.139.44:80', 0),
(143, '91.149.203.12:3128', 0),
(144, '177.86.201.22:8080', 0),
(145, '190.151.120.54:80', 0),
(146, '43.230.131.123:8083', 0),
(147, '3.113.33.235:8118', 0),
(148, '151.232.72.13:80', 0),
(149, '151.232.72.22:80', 0),
(150, '151.232.72.19:80', 0),
(151, '151.232.72.20:80', 0),
(152, '182.72.150.242:8080', 0),
(153, '192.109.165.191:80', 0),
(154, '102.129.249.120:8080', 0),
(155, '161.35.70.249:3128', 0),
(156, '181.205.22.170:7654', 0),
(157, '206.253.164.150:80', 0),
(158, '95.208.208.235:8080', 0),
(159, '46.5.252.56:8080', 0),
(160, '46.237.255.5:8080', 0),
(161, '103.78.252.30:8080', 0),
(162, '158.69.64.142:9300', 0),
(163, '138.197.148.215:80', 0),
(164, '59.153.17.186:53281', 0),
(165, '45.172.111.18:999', 0),
(166, '200.115.53.193:3128', 0),
(167, '202.137.26.8:8080', 0),
(168, '175.101.19.210:83', 0),
(169, '175.106.12.2:8089', 0),
(170, '103.233.152.140:8080', 0),
(171, '45.116.229.183:8080', 0),
(172, '172.93.3.21:999', 0),
(173, '200.24.135.59:999', 0),
(174, '103.115.164.99:8080', 0),
(175, '43.255.113.232:80', 0),
(176, '103.90.145.196:8080', 0),
(177, '3.25.85.198:80', 0),
(178, '82.64.183.22:8080', 0),
(179, '103.152.101.241:8080', 0),
(180, '89.40.48.186:8080', 0),
(181, '152.200.142.100:8080', 0),
(182, '118.185.38.153:35101', 0),
(183, '46.41.134.12:80', 0),
(184, '103.22.172.42:59458', 0),
(185, '89.222.182.144:3128', 0),
(186, '5.39.17.96:80', 0),
(187, '195.91.221.230:55443', 0),
(188, '43.229.252.28:53281', 0),
(189, '45.186.6.149:3128', 0),
(190, '202.146.232.179:8888', 0),
(191, '185.175.119.206:36442', 0),
(192, '37.49.127.226:8080', 0),
(193, '109.193.195.13:8080', 0),
(194, '82.212.62.20:8080', 0),
(195, '149.172.255.2:8080', 0),
(196, '149.172.255.10:3128', 0),
(197, '91.89.89.13:8080', 0),
(198, '134.3.255.8:8080', 0),
(199, '194.233.69.41:443', 0),
(200, '91.206.148.243:61410', 0),
(201, '34.233.73.65:8080', 0),
(202, '95.156.230.45:80', 0),
(203, '202.59.137.98:8080', 0),
(204, '102.91.6.10:8080', 0),
(205, '202.162.214.250:8080', 0),
(206, '94.181.48.181:1256', 0),
(207, '41.111.204.186:8080', 0),
(208, '103.195.74.14:84', 0),
(209, '200.85.169.18:47548', 0),
(210, '194.44.77.226:55443', 0),
(211, '91.193.253.188:23500', 0),
(212, '203.130.23.250:8080', 0),
(213, '176.88.6.235:8080', 0),
(214, '113.160.119.161:55443', 0),
(215, '161.35.216.15:3128', 0),
(216, '13.112.197.90:8080', 0),
(217, '72.47.152.224:55443', 0),
(218, '50.232.134.14:8080', 0),
(219, '74.196.229.161:8080', 0),
(220, '41.87.29.130:8080', 0),
(221, '95.47.102.178:8080', 0),
(222, '167.71.206.67:8118', 0),
(223, '186.167.33.244:42550', 0),
(224, '212.115.232.79:31280', 0),
(225, '189.195.41.242:8080', 0),
(226, '162.155.10.150:55443', 0),
(227, '200.105.215.18:33630', 0),
(228, '37.59.22.27:8118', 0),
(229, '27.116.51.85:6666', 0),
(230, '177.244.36.134:8080', 0),
(231, '118.140.151.98:3128', 0),
(232, '93.240.4.54:3128', 0),
(233, '103.255.242.115:8080', 0),
(234, '43.129.211.134:24015', 0),
(235, '82.99.217.18:8080', 0),
(236, '20.86.230.162:8080', 0),
(237, '169.57.1.84:8123', 0),
(238, '64.124.38.126:8080', 0),
(239, '42.114.93.206:8118', 0),
(240, '79.143.225.152:60517', 0),
(241, '180.211.192.61:8080', 0),
(242, '170.239.255.2:55443', 0),
(243, '177.73.16.74:55443', 0),
(244, '77.70.35.87:37475', 0),
(245, '202.158.15.146:55667', 0),
(246, '153.122.86.46:80', 0),
(247, '150.129.54.111:6666', 0),
(248, '20.94.100.35:8080', 0),
(249, '34.87.84.105:80', 0),
(250, '91.216.164.251:80', 0),
(251, '134.3.255.3:3128', 0),
(252, '185.136.103.228:80', 0),
(253, '93.117.72.27:43631', 0),
(254, '195.46.164.179:8118', 0),
(255, '217.11.66.170:3128', 0),
(256, '117.196.238.209:36429', 0),
(257, '58.26.138.168:80', 0),
(258, '47.91.44.217:8000', 0),
(259, '46.223.255.6:3128', 0),
(260, '005.252.161.48:8080', 0),
(261, '137.74.112.21:80', 0),
(262, '51.255.50.31:80', 0),
(263, '187.243.253.2:8080', 0),
(264, '196.214.185.85:80', 0),
(265, '115.84.246.50:80', 0),
(266, '95.208.208.231:8080', 0),
(267, '37.49.127.234:8080', 0),
(268, '37.49.127.236:8080', 0),
(269, '177.72.169.243:3128', 0),
(270, '2.32.128.70:3128', 0),
(271, '94.180.249.187:38051', 0),
(272, '197.248.184.157:53281', 0),
(273, '212.42.62.69:8080', 0),
(274, '121.139.218.165:31409', 0),
(275, '124.41.243.72:44716', 0),
(276, '103.251.225.16:6666', 0),
(277, '202.43.72.203:8080', 0),
(278, '177.104.125.173:55443', 0),
(279, '51.222.29.16:9300', 0),
(280, '93.48.169.74:3128', 0),
(281, '80.82.215.6:80', 0),
(282, '158.69.73.79:9300', 0),
(283, '5.44.54.106:8080', 0),
(284, '131.72.69.19:45006', 0),
(285, '193.149.225.51:80', 0),
(286, '187.95.112.36:6666', 0),
(287, '193.149.225.61:80', 0),
(288, '185.170.215.228:80', 0),
(289, '190.196.176.5:60080', 0),
(290, '192.109.165.98:80', 0),
(291, '05.252.161.48:8080', 0),
(292, '193.149.225.106:80', 0),
(293, '109.193.195.7:8080', 0),
(294, '109.193.195.11:8080', 0),
(295, '165.16.46.193:8080', 0),
(296, '36.91.106.87:8089', 0),
(297, '45.195.76.130:999', 0),
(298, '128.199.45.26:12007', 0),
(299, '62.113.113.155:16286', 0),
(300, '13.234.0.192:80', 0),
(301, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `proxy` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `proxy`) VALUES
(1, 'albano', 'albano123', NULL),
(2, 'albano', 'albano123', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `Folders_user_id_951efa88_fk_User_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
