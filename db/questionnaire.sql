-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2014 at 04:16 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `questionnaire`
--

-- --------------------------------------------------------

--
-- Table structure for table `certfication_status`
--

CREATE TABLE IF NOT EXISTS `certfication_status` (
  `status_id` int(10) NOT NULL AUTO_INCREMENT,
  `status_title` varchar(100) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `createdby` int(10) NOT NULL,
  `updateddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedby` int(10) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `certfication_status`
--

INSERT INTO `certfication_status` (`status_id`, `status_title`, `createddatetime`, `createdby`, `updateddatetime`, `updatedby`) VALUES
(1, 'Active', '2014-10-12 21:00:27', 0, '2014-10-12 15:30:27', 0),
(2, 'Inactive', '2014-10-12 21:00:27', 0, '2014-10-12 15:30:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `certification_admin`
--

CREATE TABLE IF NOT EXISTS `certification_admin` (
  `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminusername` varchar(45) NOT NULL,
  `adminpassword` varchar(255) DEFAULT NULL,
  `admincreateddate` datetime NOT NULL,
  `adminupdateddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Admin Login Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `certification_admin`
--

INSERT INTO `certification_admin` (`adminid`, `adminusername`, `adminpassword`, `admincreateddate`, `adminupdateddate`, `status`) VALUES
(1, 'certify_admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '2014-10-12 19:01:53', '2014-10-12 13:31:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certification_categories`
--

CREATE TABLE IF NOT EXISTS `certification_categories` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_parent_id` int(10) NOT NULL DEFAULT '0',
  `category_order` int(10) NOT NULL DEFAULT '0',
  `category_status_id` int(1) unsigned NOT NULL DEFAULT '1',
  `createddatetime` datetime NOT NULL,
  `createdby` int(11) NOT NULL,
  `updateddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedby` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `certification_categories`
--

INSERT INTO `certification_categories` (`category_id`, `category_name`, `category_parent_id`, `category_order`, `category_status_id`, `createddatetime`, `createdby`, `updateddatetime`, `updatedby`) VALUES
(1, 'Test', 0, 0, 1, '2014-10-12 22:40:04', 1, '2014-10-12 17:10:04', 1),
(3, 'Test', 0, 0, 1, '2014-10-19 00:01:01', 1, '2014-10-18 18:31:01', 1),
(4, 'Test', 0, 0, 1, '2014-10-19 00:02:51', 1, '2014-10-18 18:32:51', 1),
(5, 'Test2', 2, 0, 2, '2014-10-19 00:15:05', 1, '2014-10-18 20:20:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certification_exam`
--

CREATE TABLE IF NOT EXISTS `certification_exam` (
  `exam_id` int(10) NOT NULL AUTO_INCREMENT,
  `exam_title` varchar(255) NOT NULL,
  `exam_time` varchar(100) NOT NULL,
  `exam_attempts_count` int(10) NOT NULL,
  `exam_status_id` int(10) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `createdby` int(10) NOT NULL,
  `updatedatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedby` int(10) NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `certification_exam`
--

INSERT INTO `certification_exam` (`exam_id`, `exam_title`, `exam_time`, `exam_attempts_count`, `exam_status_id`, `createddatetime`, `createdby`, `updatedatetime`, `updatedby`) VALUES
(1, 'Test', '150', 50, 1, '2014-10-19 02:47:36', 1, '2014-10-18 21:17:36', 1),
(2, 'First Test', '1230', 10, 1, '2014-10-22 02:06:52', 1, '2014-10-21 20:36:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certification_exam_categories`
--

CREATE TABLE IF NOT EXISTS `certification_exam_categories` (
  `exam_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `exam_category_question_count` int(10) NOT NULL,
  `exam_categories_status_id` int(10) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `createdby` int(10) NOT NULL,
  `updateddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedby` int(10) NOT NULL,
  PRIMARY KEY (`exam_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `certification_exam_categories`
--

INSERT INTO `certification_exam_categories` (`exam_category_id`, `exam_id`, `category_id`, `exam_category_question_count`, `exam_categories_status_id`, `createddatetime`, `createdby`, `updateddatetime`, `updatedby`) VALUES
(1, 2, 4, 30, 1, '2014-10-22 02:06:52', 1, '2014-10-21 20:36:52', 1),
(2, 2, 3, 30, 1, '2014-10-22 02:06:52', 1, '2014-10-21 20:36:52', 1),
(3, 2, 4, 30, 1, '2014-10-22 02:06:52', 1, '2014-10-21 20:36:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certification_questions`
--

CREATE TABLE IF NOT EXISTS `certification_questions` (
  `question_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL,
  `question_type_id` int(10) NOT NULL,
  `question_title` varchar(1024) NOT NULL,
  `question_image` varchar(225) NOT NULL,
  `question_options` text NOT NULL,
  `question_answer` text NOT NULL,
  `question_status_id` int(10) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `createdby` int(10) NOT NULL,
  `updateddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedby` int(10) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `certification_question_types`
--

CREATE TABLE IF NOT EXISTS `certification_question_types` (
  `question_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `question_type_title` varchar(100) NOT NULL,
  `question_type_status_id` int(10) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `createdby` int(10) NOT NULL,
  `updateddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedby` int(10) NOT NULL,
  PRIMARY KEY (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `certification_user_exam`
--

CREATE TABLE IF NOT EXISTS `certification_user_exam` (
  `user_exam_id` int(10) NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `questions_id` text NOT NULL,
  `user_answers` text NOT NULL,
  `user_exam_status_id` int(10) NOT NULL,
  `createddatetime` datetime NOT NULL,
  `createdby` int(10) NOT NULL,
  `updateddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedby` int(10) NOT NULL,
  PRIMARY KEY (`user_exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
