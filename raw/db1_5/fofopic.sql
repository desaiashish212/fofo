-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2017 at 08:38 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fofopic`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `status`) VALUES
(0, 'root', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785', 1);

-- --------------------------------------------------------

--
-- Table structure for table `avatar`
--

CREATE TABLE IF NOT EXISTS `avatar` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`aid`),
  KEY `auid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `avatar`
--

INSERT INTO `avatar` (`aid`, `uid`, `path`, `created_at`) VALUES
(1, 1, 'uploads/avatar/ads.jpg', '2017-05-01 08:54:31'),
(2, 2, 'uploads/avatar/hd.jpg', '2017-05-01 08:54:31'),
(3, 3, 'uploads/avatar/ak.jpg', '2017-05-01 11:35:40'),
(4, 4, 'uploads/avatar/pj.jpg', '2017-05-01 11:35:56'),
(5, 5, 'uploads/avatar/hk.jpg', '2017-05-01 11:36:02'),
(6, 6, 'uploads/avatar/rg.jpg', '2017-05-01 11:36:06'),
(7, 7, 'uploads/avatar/ram.jpg', '2017-05-01 11:36:13'),
(8, 8, 'uploads/avatar/bk.jpg', '2017-05-01 11:36:17'),
(9, 9, 'uploads/avatar/abs.jpg', '2017-05-01 11:36:21'),
(10, 10, 'uploads/avatar/ad.jpg', '2017-05-01 11:36:32'),
(11, 11, 'uploads/avatar/rd.jpg', '2017-05-01 11:36:38'),
(12, 12, 'uploads/avatar/vp.jpg', '2017-05-01 11:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `fcm`
--

CREATE TABLE IF NOT EXISTS `fcm` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `project_no` text COLLATE utf8_unicode_ci NOT NULL,
  `api_key` text COLLATE utf8_unicode_ci NOT NULL,
  `version_no` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fcm`
--

INSERT INTO `fcm` (`fid`, `project_no`, `api_key`, `version_no`) VALUES
(1, '145789632145', 'asda21as1da1sd4dds1d1d3a4das6', '1.02');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `uid`, `subject`, `message`, `created_at`) VALUES
(1, '1', 'Issue', 'App crash', '2017-04-30 18:10:54'),
(2, '1', 'Issue', 'App crash', '2017-04-30 18:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`),
  KEY `fuid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor` text COLLATE utf8_unicode_ci NOT NULL,
  `item` text COLLATE utf8_unicode_ci NOT NULL,
  `price` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` text COLLATE utf8_unicode_ci NOT NULL,
  `date` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `vendor`, `item`, `price`, `quantity`, `date`) VALUES
(1, 'Ashish', 'T-shirt', '1000', '10', '2017-04-20'),
(2, 'Hemant', 'Watches', '2000', '15', '2017-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `smtp` text COLLATE utf8_unicode_ci NOT NULL,
  `port` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`),
  KEY `muid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `notid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `not_date` date DEFAULT NULL,
  PRIMARY KEY (`notid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `path` text COLLATE utf8_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  KEY `puid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`pid`, `path`, `uid`, `status`, `type`, `created_at`) VALUES
(3, 'uploads/photo/ads.jpg', 1, 1, 2, '2017-05-01 12:25:39'),
(4, 'uploads/photo/hd.jpg', 2, 1, 2, '2017-05-01 12:25:47'),
(5, 'uploads/photo/ak.jpg', 3, 1, 2, '2017-05-01 12:31:01'),
(6, 'uploads/photo/pj.jpg', 4, 1, 2, '2017-05-01 12:31:10'),
(7, 'uploads/photo/hk.jpg', 5, 1, 2, '2017-05-01 12:31:14'),
(8, 'uploads/photo/rg.jpg', 6, 1, 2, '2017-05-01 12:31:35'),
(9, 'uploads/photo/rk.jpg', 7, 1, 2, '2017-05-01 12:31:42'),
(10, 'uploads/photo/bk.jpg', 8, 1, 2, '2017-05-01 12:32:13'),
(11, 'uploads/photo/abs.jpg', 9, 1, 2, '2017-05-01 12:32:17'),
(12, 'uploads/photo/ad.jpg', 10, 1, 2, '2017-05-01 12:32:24'),
(13, 'uploads/photo/rd.jpg', 11, 1, 2, '2017-05-01 12:32:32'),
(14, 'uploads/photo/vp.jpg', 12, 1, 2, '2017-05-01 12:32:35'),
(15, 'uploads/photo/ads1.jpg', 1, 1, 2, '2017-05-01 14:54:29'),
(16, 'uploads/photo/hd1.jpg', 2, 1, 2, '2017-05-01 14:55:31'),
(17, 'uploads/photo/ak1.jpg', 3, 1, 2, '2017-05-01 14:55:33'),
(18, 'uploads/photo/pj1.jpg', 4, 1, 2, '2017-05-01 14:55:41'),
(19, 'uploads/photo/hk1.jpg', 5, 1, 2, '2017-05-01 14:55:43'),
(20, 'uploads/photo/rg1.jpg', 6, 1, 2, '2017-05-01 14:55:46'),
(21, 'uploads/photo/rk1.jpg', 7, 1, 2, '2017-05-01 14:55:49'),
(22, 'uploads/photo/bk1.jpg', 8, 1, 2, '2017-05-01 14:55:52'),
(23, 'uploads/photo/abs1.jpg', 9, 1, 2, '2017-05-01 14:55:55'),
(24, 'uploads/photo/ad1.jpg', 10, 1, 2, '2017-05-01 14:56:00'),
(25, 'uploads/photo/rd1.jpg', 11, 1, 2, '2017-05-01 14:56:03'),
(26, 'uploads/photo/vp1.jpg', 12, 1, 2, '2017-05-01 14:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `ppid` (`pid`),
  KEY `puid1` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `pid`, `message`, `uid`, `created_at`) VALUES
(1, 3, NULL, 1, '2017-05-01 08:45:25'),
(2, 4, NULL, 2, '2017-05-01 08:45:36'),
(3, 5, NULL, 3, '2017-05-01 12:33:19'),
(4, 6, NULL, 4, '2017-05-01 12:33:27'),
(5, 7, NULL, 5, '2017-05-01 12:34:07'),
(6, 8, NULL, 6, '2017-05-01 12:34:08'),
(7, 9, NULL, 7, '2017-05-01 12:34:09'),
(8, 10, NULL, 8, '2017-05-01 12:34:12'),
(9, 11, NULL, 9, '2017-05-01 12:34:14'),
(10, 12, NULL, 10, '2017-05-01 12:34:15'),
(11, 13, NULL, 11, '2017-05-01 12:34:17'),
(12, 14, NULL, 12, '2017-05-01 12:34:23'),
(13, 15, NULL, 1, '2017-05-01 14:59:02'),
(14, 16, NULL, 2, '2017-05-01 14:59:03'),
(15, 17, NULL, 3, '2017-05-01 14:59:04'),
(16, 18, NULL, 4, '2017-05-01 14:59:07'),
(17, 19, NULL, 5, '2017-05-01 14:59:09'),
(18, 20, NULL, 6, '2017-05-01 14:59:12'),
(19, 21, NULL, 7, '2017-05-01 14:59:20'),
(20, 22, NULL, 8, '2017-05-01 14:59:21'),
(21, 23, NULL, 9, '2017-05-01 14:59:22'),
(22, 24, NULL, 10, '2017-05-01 14:59:29'),
(23, 25, NULL, 11, '2017-05-01 14:59:44'),
(24, 26, NULL, 12, '2017-05-01 15:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `post_comment`
--

CREATE TABLE IF NOT EXISTS `post_comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `cpid` (`pid`),
  KEY `cuid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_dislike`
--

CREATE TABLE IF NOT EXISTS `post_dislike` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`did`),
  KEY `duid` (`uid`),
  KEY `dpid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE IF NOT EXISTS `post_like` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lid`),
  KEY `luid` (`uid`),
  KEY `lpid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_share`
--

CREATE TABLE IF NOT EXISTS `post_share` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `share_type` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`),
  KEY `spid` (`pid`),
  KEY `suid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prize`
--

CREATE TABLE IF NOT EXISTS `prize` (
  `prize_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `week` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`prize_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `prize`
--

INSERT INTO `prize` (`prize_id`, `title`, `image`, `week`, `date_added`) VALUES
(4, 'Nikon camera ', 'uploads/prize/13_2017.jpg', '13_2017', '2017-03-31'),
(2, 'Sony vivo laptop', 'uploads/prize/12_2017.jpg', '12_2017', '2017-03-24'),
(3, 'Fasttrack watch', 'uploads/prize/11_2017.png', '11_2017', '2017-03-16');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE IF NOT EXISTS `sms` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `getway` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`sid`, `getway`, `key`, `name`) VALUES
(1, 'Msg91', 'aaaaaaaaaaaaaaaaaa', 'FOFOPC');

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE IF NOT EXISTS `theme` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` text COLLATE utf8_unicode_ci,
  `theme_pic` text COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `week` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`tid`, `theme_name`, `theme_pic`, `start_date`, `end_date`, `week`, `created_at`) VALUES
(11, 'Flower', 'uploads/theme/17_2017.jpg', '2017-05-24', '2017-04-30', '17_2017', '2017-04-30 15:40:58'),
(12, 'Car', 'uploads/theme/18_2017.png', '2017-05-01', '2017-05-07', '18_2017', '2017-05-01 14:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `theme_post`
--

CREATE TABLE IF NOT EXISTS `theme_post` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tp_id`),
  KEY `tp_tid` (`tid`),
  KEY `tp_pid` (`pid`),
  KEY `tp_uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `theme_post`
--

INSERT INTO `theme_post` (`tp_id`, `tid`, `pid`, `uid`, `created_at`) VALUES
(1, 11, 1, 1, '2017-05-01 13:42:05'),
(2, 11, 2, 2, '2017-05-01 13:42:07'),
(3, 11, 3, 3, '2017-05-01 13:42:09'),
(4, 11, 4, 4, '2017-05-01 13:42:11'),
(5, 11, 5, 5, '2017-05-01 13:42:15'),
(6, 11, 6, 6, '2017-05-01 13:42:17'),
(7, 11, 7, 7, '2017-05-01 13:42:19'),
(8, 11, 8, 8, '2017-05-01 13:42:20'),
(9, 11, 9, 9, '2017-05-01 13:42:22'),
(10, 11, 10, 10, '2017-05-01 13:42:27'),
(11, 11, 11, 11, '2017-05-01 13:42:29'),
(12, 11, 12, 12, '2017-05-01 13:42:34'),
(13, 12, 13, 1, '2017-05-01 14:57:38'),
(14, 12, 14, 2, '2017-05-01 14:57:49'),
(15, 12, 15, 3, '2017-05-01 15:02:50'),
(16, 12, 16, 4, '2017-05-01 15:03:20'),
(17, 12, 17, 5, '2017-05-01 15:03:22'),
(18, 12, 18, 6, '2017-05-01 15:03:25'),
(19, 12, 19, 7, '2017-05-01 15:03:26'),
(20, 12, 20, 8, '2017-05-01 15:03:28'),
(21, 12, 21, 9, '2017-05-01 15:03:29'),
(22, 12, 22, 10, '2017-05-01 15:03:31'),
(25, 12, 23, 11, '2017-05-01 15:03:32'),
(26, 12, 24, 12, '2017-05-01 15:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `mobile` text COLLATE utf8_unicode_ci,
  `fb_id` text COLLATE utf8_unicode_ci,
  `dob` date DEFAULT NULL,
  `login_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `email`, `mobile`, `fb_id`, `dob`, `login_type`, `created_at`, `updated_at`) VALUES
(1, 'Ashish Desai', 'desaiashish212@gmail.com', '9421355900', NULL, '1992-05-19', 'email', '2017-04-30 10:23:15', '2017-04-30 10:23:15'),
(2, 'Hemant Divekar', 'hemanttdivekar@gmail.com', '8007002203', NULL, '1993-12-10', 'email', '2017-04-30 10:25:49', '2017-04-30 10:25:49'),
(3, 'Akshay Mane', 'akshay@gmail.com', '9865743210', NULL, '1992-03-15', 'email', '2017-05-01 11:10:18', '2017-05-01 11:10:18'),
(4, 'Pravin Jadhav', 'pravin@gmail.com', '3658794210', NULL, '1992-08-16', 'email', '2017-05-01 11:11:31', '2017-05-01 11:11:31'),
(5, 'Hanmant Kadam', 'hanmant@gmail.com', '9875641230', NULL, '1994-07-03', 'email', '2017-05-01 11:32:07', '2017-05-01 11:32:07'),
(6, 'Rahul Gilbile', 'ragul@gmail.com', '9632587410', NULL, '1989-05-03', 'email', '2017-05-01 11:13:12', '2017-05-01 11:13:12'),
(7, 'Ramchamdra Khawanewadkar', 'ram@gmail.com', '9632587418', NULL, '1992-05-23', 'email', '2017-05-01 11:14:19', '2017-05-01 11:14:19'),
(8, 'Balu Khendat', 'balu@gmail.com', '9685321474', NULL, '1912-03-25', 'email', '2017-05-01 11:15:56', '2017-05-01 11:15:56'),
(9, 'Abhijit Khumbhar', 'abs@gmail.com', '7896541230', NULL, '1992-05-31', 'email', '2017-05-01 11:17:01', '2017-05-01 11:17:01'),
(10, 'Ajit Desai', 'ajit@gmail.com', '9856321470', NULL, '1992-07-03', 'email', '2017-05-01 11:17:46', '2017-05-01 11:17:46'),
(11, 'Renold Desuza', 'rey@gmail.com', '7896541230', NULL, '1991-05-24', 'email', '2017-05-01 11:18:56', '2017-05-01 11:18:56'),
(12, 'Vaibhav Pisal', 'pisal@gmail.com', '9865741230', NULL, '1992-10-27', 'email', '2017-05-01 11:19:43', '2017-05-01 11:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE IF NOT EXISTS `visits` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vid`),
  KEY `vuid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `weekly_winner`
--

CREATE TABLE IF NOT EXISTS `weekly_winner` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wid`),
  KEY `wpid` (`pid`),
  KEY `wuid` (`uid`),
  KEY `wtid` (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `weekly_winner`
--

INSERT INTO `weekly_winner` (`wid`, `pid`, `uid`, `tid`, `rank`, `created_at`) VALUES
(1, 1, 1, 11, 1, '2017-05-01 08:45:56'),
(2, 2, 2, 11, 2, '2017-05-01 08:46:28'),
(3, 3, 3, 11, 3, '2017-05-01 12:35:21'),
(4, 4, 4, 11, 4, '2017-05-01 12:35:29'),
(5, 5, 5, 11, 5, '2017-05-01 12:35:37'),
(6, 6, 6, 11, 6, '2017-05-01 12:35:43'),
(7, 7, 7, 11, 7, '2017-05-01 12:35:49'),
(8, 8, 8, 11, 8, '2017-05-01 12:35:55'),
(9, 9, 9, 11, 9, '2017-05-01 12:36:01'),
(10, 10, 10, 11, 10, '2017-05-01 12:36:19'),
(11, 11, 11, 11, 11, '2017-05-01 12:36:40'),
(12, 12, 12, 11, 12, '2017-05-01 12:36:57'),
(13, 13, 1, 12, 7, '2017-05-01 15:45:21'),
(14, 14, 2, 12, 4, '2017-05-01 15:45:15'),
(15, 15, 3, 12, 9, '2017-05-01 15:45:28'),
(16, 16, 4, 12, 12, '2017-05-01 15:45:35'),
(17, 17, 5, 12, 2, '2017-05-01 15:45:11'),
(18, 18, 6, 12, 8, '2017-05-01 15:45:24'),
(19, 19, 7, 12, 10, '2017-05-01 15:45:31'),
(20, 20, 8, 12, 1, '2017-05-01 15:45:09'),
(21, 21, 9, 12, 3, '2017-05-01 15:45:13'),
(22, 22, 10, 12, 11, '2017-05-01 15:45:33'),
(23, 23, 11, 12, 5, '2017-05-01 15:45:17'),
(24, 24, 12, 12, 6, '2017-05-01 15:45:19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avatar`
--
ALTER TABLE `avatar`
  ADD CONSTRAINT `auid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `fuid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `muid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `puid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `ppid` FOREIGN KEY (`pid`) REFERENCES `photos` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `puid1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_comment`
--
ALTER TABLE `post_comment`
  ADD CONSTRAINT `cpid` FOREIGN KEY (`pid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_dislike`
--
ALTER TABLE `post_dislike`
  ADD CONSTRAINT `dpid` FOREIGN KEY (`pid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `duid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `lpid` FOREIGN KEY (`pid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `luid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_share`
--
ALTER TABLE `post_share`
  ADD CONSTRAINT `spid` FOREIGN KEY (`pid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `suid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theme_post`
--
ALTER TABLE `theme_post`
  ADD CONSTRAINT `tp_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_pid` FOREIGN KEY (`pid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_tid` FOREIGN KEY (`tid`) REFERENCES `theme` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `vuid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weekly_winner`
--
ALTER TABLE `weekly_winner`
  ADD CONSTRAINT `wpid` FOREIGN KEY (`pid`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wtid` FOREIGN KEY (`tid`) REFERENCES `theme` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wuid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
