-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2025 at 09:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parvamco_hr_portal_db_latest`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_from` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) NOT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `warranty` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `uuid`, `name`, `purchase_date`, `purchase_from`, `manufacturer`, `model`, `serial_number`, `supplier`, `condition`, `warranty`, `value`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '#AST-00001', 'Laptop', '2023-11-29', 'girias', 'Dell', '123', '1234', 'harshitha', 'good', 12, '42000', 'test', 'Approved', '2023-11-29 10:16:30', '2023-11-29 10:16:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `checkin_time` datetime DEFAULT NULL,
  `checkout_time` datetime DEFAULT NULL,
  `checkin_status` varchar(255) DEFAULT NULL,
  `checkout_status` varchar(255) DEFAULT NULL,
  `attendance_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `checkin_time`, `checkout_time`, `checkin_status`, `checkout_status`, `attendance_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, '2023-10-05 18:28:31', '2023-10-05 18:28:47', 'Late', 'Early', '2023-10-05', '2023-10-05 12:58:31', '2023-10-05 12:58:47', NULL),
(2, 9, NULL, NULL, 'Late', NULL, '2023-10-09', '2023-10-09 11:23:30', '2023-10-09 11:23:30', NULL),
(3, 10, '2023-10-09 17:43:14', NULL, 'Late', NULL, '2023-10-09', '2023-10-09 12:13:14', '2023-10-09 12:13:14', NULL),
(4, 10, '2023-10-12 12:02:57', NULL, 'Late', NULL, '2023-10-12', '2023-10-12 06:32:57', '2023-10-12 06:32:57', NULL),
(5, 11, '2023-10-26 11:30:09', '2023-10-26 11:30:12', 'Late', 'Half Day', '2023-10-26', '2023-10-26 06:00:09', '2023-10-26 06:00:12', NULL),
(6, 11, '2023-11-29 15:05:58', '2023-11-29 15:05:58', 'Late', 'Early', '2023-11-29', '2023-11-29 09:35:58', '2023-11-29 09:35:58', NULL),
(7, 9, '2023-12-16 12:56:41', '2023-12-16 12:57:19', 'Late', 'Half Day', '2023-12-16', '2023-12-16 07:26:41', '2023-12-16 07:27:19', NULL),
(8, 11, '2023-12-21 11:45:22', '2023-12-21 12:05:08', 'Late', 'Half Day', '2023-12-21', '2023-12-21 06:15:22', '2023-12-21 06:35:08', '2023-12-21 07:07:58'),
(9, 11, '2023-12-21 12:38:12', '2023-12-21 12:38:41', 'Late', 'Half Day', '2023-12-21', '2023-12-21 07:08:12', '2023-12-21 07:08:41', '2023-12-21 07:08:48'),
(10, 11, '2023-12-21 12:39:43', '2023-12-21 12:39:43', 'Late', 'Half Day', '2023-12-21', '2023-12-21 07:09:43', '2023-12-21 07:09:43', '2023-12-21 07:09:55'),
(11, 11, '2023-12-21 12:46:40', '2023-12-21 12:47:22', 'Late', 'Half Day', '2023-12-21', '2023-12-21 07:16:40', '2023-12-21 07:17:22', '2023-12-21 07:17:31'),
(12, 11, '2023-12-21 12:51:55', '2023-12-21 12:52:03', 'Late', 'Half Day', '2023-12-21', '2023-12-21 07:21:55', '2023-12-21 07:22:03', '2023-12-21 07:22:13'),
(13, 11, '2023-12-21 12:52:24', '2023-12-21 12:52:28', 'Late', 'Half Day', '2023-12-21', '2023-12-21 07:22:24', '2023-12-21 07:22:28', '2023-12-21 07:22:36'),
(14, 11, '2024-01-06 10:34:00', '2024-01-06 11:25:16', 'Late', 'Half Day', '2024-01-06', '2024-01-06 05:04:00', '2024-01-06 05:55:16', NULL),
(15, 3, '2024-01-14 06:52:27', '2024-01-14 06:53:01', 'Early', 'Half Day', '2024-01-14', '2024-01-14 01:22:27', '2024-01-14 01:23:01', NULL),
(16, 11, '2024-05-20 17:19:49', '2024-05-20 17:20:03', 'Late', 'Early', '2024-05-20', '2024-05-20 11:49:49', '2024-05-20 11:50:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_cat_child`
--

CREATE TABLE `blog_cat_child` (
  `blog_cat_child_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_cat_child`
--

INSERT INTO `blog_cat_child` (`blog_cat_child_id`, `blog_id`, `category_id`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 1, 1, NULL, '', NULL, '', 0),
(2, 2, 2, NULL, '', NULL, '', 0),
(3, 3, 1, NULL, '', NULL, '', 0),
(4, 4, 1, NULL, '', NULL, '', 0),
(5, 7, 2, NULL, '', NULL, '', 0),
(6, 8, 2, NULL, '', NULL, '', 0),
(7, 9, 7, '2023-04-13 09:02:45', '', NULL, '', 0),
(8, 10, 8, '2023-04-13 09:02:51', '', NULL, '', 0),
(9, 11, 9, '2023-04-13 09:02:57', '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_master`
--

CREATE TABLE `blog_master` (
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `blog_title` text NOT NULL,
  `blog_desc` text NOT NULL,
  `blog_image` varchar(32) NOT NULL,
  `blog_status` varchar(32) NOT NULL,
  `is_approved` varchar(32) NOT NULL,
  `category_namee` varchar(32) NOT NULL,
  `like_count` int(11) NOT NULL,
  `dislike_count` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_master`
--

INSERT INTO `blog_master` (`blog_id`, `user_id`, `user_name`, `blog_title`, `blog_desc`, `blog_image`, `blog_status`, `is_approved`, `category_namee`, `like_count`, `dislike_count`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 1, 'Pranitha', 'Web Development', 'Web Development desc', 'graphic-3.jpg', 'Active', '', 'Web Development', 7, 3, NULL, '', NULL, '', 0),
(2, 1, 'Pranitha', 'Mobile Apps', 'Mobile Apps desc', 'mobile-app-banner.jpg', 'Active', '', 'Mobile Apps', 1, 0, NULL, '', NULL, '', 0),
(3, 3, 'Pranitha', 'PHP', 'PHP desc', 'PHP.jpg', 'Active', '', 'Web Development', 1, 1, NULL, '', NULL, '', 0),
(4, 2, 'Rakesh', 'Javascript', 'Javascript desc', 'Javascript-Cover.png', 'Active', '', 'Web Development', 2, 2, NULL, '', NULL, '', 0),
(7, 5, 'Deepak', 'Android Development', 'Android Development desc', 'mobile-app-banner.jpg', 'Active', '', 'Mobile Apps', 1, 6, NULL, '', NULL, '', 0),
(8, 6, 'Imran', 'IOS ', 'IOS desc', 'ios.jpg', 'Active', '', 'Mobile Apps', 10, 8, NULL, '', NULL, '', 0),
(9, 3, 'Harshitha', 'Git Hub Explorer', 'git hub explorer desc', 'PHP.jpg', 'Active', '', 'Cloud Computing', 4, 15, '2023-04-13 09:01:45', '', NULL, '', 0),
(10, 2, 'Rakesh', 'Covid Awareness', 'Covid Awareness desc', 'Javascript-Cover.png', 'Active', '', 'Full stack Development', 5, 2, '2023-04-13 09:01:54', '', NULL, '', 0),
(11, 5, 'Deepak', 'Restaurant App', 'Restaurant App desc', 'mobile-app-banner.jpg', 'Active', '', 'Mobile Apps', 16, 9, '2023-04-13 09:02:05', '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_tag_child`
--

CREATE TABLE `blog_tag_child` (
  `blog_tag_child_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_tag_child`
--

INSERT INTO `blog_tag_child` (`blog_tag_child_id`, `blog_id`, `tag_id`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 4, 1, NULL, '', NULL, '', 0),
(2, 7, 2, NULL, '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_master`
--

CREATE TABLE `category_master` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `category_desc` text NOT NULL,
  `category_code` varchar(32) NOT NULL,
  `category_status` varchar(32) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_master`
--

INSERT INTO `category_master` (`category_id`, `category_name`, `category_desc`, `category_code`, `category_status`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 'Web Development', 'Web Development Desc', '', 'Active', NULL, '', NULL, '', 0),
(2, 'Mobile Apps', 'Mobile Apps Desc', '', 'Active', NULL, '', NULL, '', 0),
(3, 'Artificial Intelligence', 'Artificial Intelligence Description', '', 'Active', NULL, '', NULL, '', 0),
(4, 'Desktop  Application Development', 'Desktop Application Development Desc', '', 'Active', '2023-04-13 09:00:19', '', NULL, '', 0),
(5, 'Cloud Computing', 'Cloud Computing Desc', '', 'Active', '2023-04-13 09:00:30', '', NULL, '', 0),
(6, 'Full Stack Development', 'Full Stack Description', '', 'Active', '2023-04-13 09:00:02', '', NULL, '', 0),
(7, 'API Development', 'API Development Desc', '', 'Active', '2023-03-13 09:00:36', '', NULL, '', 0),
(8, 'security Software Development', 'security software development Desc', '', 'Active', '2023-04-13 09:00:45', '', NULL, '', 0),
(9, 'Front end Development', 'Front end developent Description', '', 'Active', '2023-04-13 09:00:52', '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `project_title` varchar(255) NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `project_spoc` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `email`, `phone`, `company`, `avatar`, `deleted_at`, `created_at`, `updated_at`, `status`, `start_date`, `project_title`, `project_type`, `project_spoc`, `location`) VALUES
(1, 'Vijay', NULL, 'vijay@gmail.com', '9987456210', 'Herowin', '1701252313.png', NULL, '2023-11-29 10:05:13', '2023-11-29 10:05:13', 'Prospect', '2023-11-29', 'ITF', 'Websites', '11', 'Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `client_meetings`
--

CREATE TABLE `client_meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agenda` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `attendees` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `referred_by` varchar(255) DEFAULT NULL,
  `action_on_team` text DEFAULT NULL,
  `action_on_santhosh` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_meetings`
--

INSERT INTO `client_meetings` (`id`, `agenda`, `date`, `client_name`, `project_name`, `project_type`, `status`, `attendees`, `referred_by`, `action_on_team`, `action_on_santhosh`, `created_at`, `updated_at`, `employee_detail_id`, `deleted_at`) VALUES
(1, 'Test', '2023-11-29', 'Vijay', 'Commercial', 'Website', 'Lead', '[\"3\",\"11\"]', 'Santhosh', 'Explor on website', 'need to follow up with client', '2023-11-29 10:09:17', '2023-11-29 10:09:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT 'on',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `number`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Harshitha S', 'harshitha59@gmail.com', '6362936018', NULL, NULL, '2023-02-10 23:36:49', '2023-02-10 23:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(32) NOT NULL,
  `contact_email` varchar(32) NOT NULL,
  `contact_phone` varchar(32) NOT NULL,
  `contact_subject` varchar(32) NOT NULL,
  `contact_message` text NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_subject`, `contact_message`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 'Pranitha', 'pranithah.parvam@gmail.com', '9986082866', 'Job Enquiry', 'Job Enquiry', '2023-04-21 05:48:18', '1', NULL, '', 0),
(2, 'Harshitha', 'harshitha.parvam@gmail.com', '9902389295', 'ERP Requirement', '', '2023-04-21 09:08:18', '1', NULL, '', 0),
(3, 'Akshay', 'akshay@gmail.com', '9988007876', 'CRM Requirement', 'CRM Requirement', '2023-04-24 05:58:23', '1', NULL, '', 0),
(4, 'User', 'user123@gmail.com', '9008548639', 'user test mail', 'user test mail', '2023-04-24 06:01:28', '1', NULL, '', 0),
(7, 'ParvaM', 'parvam@gmail.com', '9008548639', 'Job Enquiry', 'Job Enquiry', '2023-04-24 06:21:22', '1', NULL, '', 0),
(13, 'pranitha', 'Pranitharaj@gmail.com', '09876543210', 'Job Enquiry', '', '2023-04-24 06:38:56', '1', NULL, '', 0),
(16, 'Pranitharaj', 'pranitharaj1998@gmail.com', '9986082866', 'Website Requirement', '', '2023-04-24 06:47:09', '1', NULL, '', 0),
(17, 'Pranitha', 'pranitharaj1998@gmail.com', '9986082866', 'Job Enquiry', '', '2023-04-24 08:41:15', '1', NULL, '', 0),
(18, 'Pranitha', 'pranithah.parvam@gmail.com', '09876543210', 'Job Enquiry', '', '2023-04-25 05:19:13', '1', NULL, '', 0),
(19, 'Harshitha M K', 'harshitha.parvam@gmail.com', '9902389295', 'Digital Marketing', '', '2023-04-25 05:20:04', '1', NULL, '', 0),
(20, 'ParvaM', 'parvam@gmail.com', '9008548639', 'Job Enquiry', '', '2023-04-25 05:20:56', '1', NULL, '', 0),
(21, 'Rakesh', 'rakesh@gmail.com', '09876543210', 'Job Enquiry', '', '2023-04-25 05:29:21', '1', NULL, '', 0),
(22, 'usertest pasha', 'user123@gmail.com', '09876543210', 'Job Enquiry', '', '2023-04-25 05:35:35', '1', NULL, '', 0),
(23, 'Navya', 'navya@gmail.com', '9856741235', 'Branding', 'need to brand our product', '2023-04-25 06:03:50', '1', NULL, '', 0),
(24, 'Sandeep', 'sandeep@gmail.com', '9902389295', 'Requirement for E-Commerce websi', '', '2023-04-26 05:18:48', '1', NULL, '', 0),
(25, 'sharanya', 'sharanya@gmail.com', '9874561230', 'CRM Requirement', '', '2023-04-26 05:22:55', '1', NULL, '', 0),
(26, 'RobertPoics', 'alfredegov@gmail.com', '88131735928', 'Hallo  i am write about your the', 'Ola, quería saber o seu prezo.', '2023-10-11 00:46:18', '1', NULL, '', 0),
(27, 'PhilPoics', 'septon36giannixi@gmail.com', '83774735378', 'Hi  i writing about   the price', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', '2023-10-25 13:43:50', '1', NULL, '', 0),
(28, 'Reginald Howton', 'howton.reginald@gmail.com', '969 58 201', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2023-10-26 06:26:18', '1', NULL, '', 0),
(29, 'Harris Chapin', 'harris.chapin@gmail.com', '(03) 5391 5711', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2023-10-29 13:59:46', '1', NULL, '', 0),
(30, 'RobertPoics', 'zelatcol@gmail.com', '88183558143', 'Hallo,   write about     price', 'Ciao, volevo sapere il tuo prezzo.', '2023-11-11 01:05:14', '1', NULL, '', 0),
(31, 'Gloria Bayne', 'bayne.gloria@outlook.com', '04623 90 87 07', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2023-11-15 10:03:43', '1', NULL, '', 0),
(32, 'Crystal Brown', 'notification@ednscorporation.co', '+1-899-389-5499x88581', 'PARVAMCONSULTECH.COM EXPIRE NOTI', 'Disclaimer: We are not accountable for any economic losses, data loss, reduction in search engine rankings, missed customers, undeliverable email or any other harm that you may suffer after the expiration of parvamconsultech.com. For more details please refer to section 12.e.1a of our Terms and Conditions.\nThis represents your final notice to renew parvamconsultech.com:\nhttps://ednscorporation.co/?d=cnZqd3ZjcWV0eVViaXNxaC5xZWM=\nIn the case that parvamconsultech.com lapses, we reserve the privilege to present your spot to competing businesses in the equivalent niche and zone after 3 business days on an auction basis.\nThis is the final notification that we are obliged to send out concerning the termination of parvamconsultech.com\nSafe Online Payment:\nhttps://ednscorporation.co/?d=cnZqd3ZjcWV0eVViaXNxaC5xZWM=\nAll operations will be instantly renewed on parvamconsultech.com if payment is received in full before termination. Thanks for  your cooperation.', '2023-11-25 05:53:57', '1', NULL, '', 0),
(33, 'Zack Hutchins', 'lasonya.hutchins@gmail.com', '', 'Are you still in Bussiness ?', 'If you are facing any website  issues, error,  bugs or need any other help with your site?\r\n\r\nThen yes, you are in the right place. I am here to provide you 24/7 Support/help in order to solve your Website  issue.\r\n\r\ncontact me here and tell me what you need  ===== > https://tinyurl.com/5n9y58yy\r\n\r\nSee you there\r\n\r\nRegards\r\nZack', '2023-11-25 10:14:32', '1', NULL, '', 0),
(34, 'RobertPoics', 'lucido.leinteract@gmail.com', '81387575421', 'Hi  i am write about     price', 'Sveiki, es gribēju zināt savu cenu.', '2023-11-26 10:26:43', '1', NULL, '', 0),
(35, '21.01hgqz5jvdjvcswk8jbev3vqf0@ma', '21.01hgqz5jvdjvcswk8jbev3vqf0@ma', '21.01hgqz5jvdjvcswk8jbev3vqf0@ma', '21.01hgqz5jvdjvcswk8jbev3vqf0@ma', 'dolorum repudiandae accusamus laboriosam dignissimos nobis expedita. ipsa ipsum quas quo sed et impedit quaerat sed. hic adipisci ea et iste aperiam deleniti. ab id nisi aut iusto. velit corporis temp', '2023-12-04 12:05:44', '1', NULL, '', 0),
(36, '22.01hgqz5jvdjvcswk8jbev3vqf0@ma', '22.01hgqz5jvdjvcswk8jbev3vqf0@ma', '22.01hgqz5jvdjvcswk8jbev3vqf0@ma', '22.01hgqz5jvdjvcswk8jbev3vqf0@ma', 'inventore esse suscipit dolor accusantium ab distinctio saepe et voluptas. tempora rerum assumenda odit repellendus rerum cum et amet repudiandae modi sit. qui cupiditate ex vitae laborum nostrum accu', '2023-12-05 07:48:50', '1', NULL, '', 0),
(37, 'Phil Stewart', 'dontreplyhere@gmail.com', '212-555-1222', 'question', 'I have 100% fully verified website contact forms for sale. Do your own blasts - save money!\r\n\r\nQuantity	Price\r\n=====================\r\n500,000		$50\r\n1 Million	$99\r\n5 Million	$199\r\n10 Million	$299\r\n20 Million	$499\r\n\r\nCredit card payment accepted, download links provided same day of purchase. Get in touch with me at my email/skype below for more info or if you would like to order.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps8385@gomail2.xyz', '2023-12-06 00:50:19', '1', NULL, '', 0),
(38, 'Zack Ferrer', 'ferrer.manual@googlemail.com', '', 'Are you still in Bussiness ?', 'If you are facing any website  issues, error,  bugs or need any other help with your site?\r\n\r\nThen yes, you are in the right place. I am here to provide you 24/7 Support/help in order to solve your Website  issue.\r\n\r\ncontact me here and tell me what you need  ===== > https://tinyurl.com/5n9y58yy\r\n\r\nSee you there\r\n\r\nRegards\r\nZack', '2023-12-13 14:52:49', '1', NULL, '', 0),
(39, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'I now offer contact form blasting service. With my DFY service you can either do a targeted blast to only websites that match your criteria or bulk blast large volumes of sites worldwide. Prices start at just $50 to reach 500,000 bulk sites. Contact me at my email or skype below for details.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps11012@gomail2.xyz', '2023-12-14 21:52:40', '1', NULL, '', 0),
(40, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'I now offer contact form blasting service. With my DFY service you can either do a targeted blast to only websites that match your criteria or bulk blast large volumes of sites worldwide. Prices start at just $50 to reach 500,000 bulk sites. Contact me at my email or skype below for details.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps4661 Rp@gomail2.xyz', '2023-12-28 22:05:28', '1', NULL, '', 0),
(41, 'Franziska Gorham', 'gorham.franziska@gmail.com', '51-68-93-17', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2023-12-30 12:43:45', '1', NULL, '', 0),
(42, 'Tyree Linney', 'linney.tyree@yahoo.com', '812-844-5482', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-01-02 09:32:16', '1', NULL, '', 0),
(43, 'BestFarmJes', 'iunskiygipertonik@gmail.com', '88125897493', 'Buy pills without restrictions. ', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', '2024-01-02 21:55:29', '1', NULL, '', 0),
(44, 'Ramon Sammons', 'ramon.sammons@yahoo.com', '0471 46 35 64', 'Dear parvamconsultech.com Admin.', 'I now offer contact form blasting service. With my DFY service you can either do a targeted blast to only websites that match your criteria or bulk blast large volumes of sites worldwide. Prices start at just $50 to reach 500,000 bulk sites. Contact me at my email or skype below for details.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps7140@gomail2.xyz', '2024-01-08 04:11:44', '1', NULL, '', 0),
(45, 'Tabitha Triplett', 'triplett.tabitha@gmail.com', '0365 9151477', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-01-16 13:50:44', '1', NULL, '', 0),
(46, 'Duane Wesley', 'wesley.duane@gmail.com', '06-71832568', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-01-25 15:29:44', '1', NULL, '', 0),
(47, '29.01hk6pdp5es3m2h4ezsgna2dzv@ma', '29.01hk6pdp5es3m2h4ezsgna2dzv@ma', '29.01hk6pdp5es3m2h4ezsgna2dzv@ma', '29.01hk6pdp5es3m2h4ezsgna2dzv@ma', 'rerum ut ducimus doloribus omnis eos eligendi. magni excepturi debitis quaerat provident eius aperiam ex sapiente et dicta aliquid placeat rem est qui amet veniam. et vel reprehenderit rerum autem asp', '2024-02-01 12:18:02', '1', NULL, '', 0),
(48, 'Zack Barth', 'jorg.barth@gmail.com', '077 1861 8009', 'Are you still in Bussiness ?', 'If you are facing any website  issues, error,  bugs or need any other help with your site?\r\n\r\nThen yes, you are in the right place. I am here to provide you 24/7 Support/help in order to solve your Website  issue.\r\n\r\ncontact me here and tell me what you need  ===== > https://tinyurl.com/5n9y58yy\r\n\r\nSee you there\r\n\r\nRegards\r\nZack', '2024-02-06 09:37:32', '1', NULL, '', 0),
(49, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'I just delivered this message to you via your website contact form and I can do the same for your ad message to millions of websites. You can get this service for a fraction of the cost of conventional advertising.If you are interested, you can reach me via email or skype below.\r\n\r\nP. Stewart\r\nEmail: 7apmte@gomail2.xyz\r\nSkype: live:.cid.2bc4ed65aa40fb3b', '2024-02-10 03:07:40', '1', NULL, '', 0),
(50, 'Ravi Stern', 'edmund.stern@outlook.com', '0483 26 77 56', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Alastair D. i, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\n I recently grew my client’s organic search traffi with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/7ejfvwut\r\n\r\n\r\n', '2024-02-18 06:04:30', '1', NULL, '', 0),
(51, 'Zack Yancy', 'yancy.twyla44@gmail.com', '02382 76 49 76', 'Are you still in Bussiness ?', 'If you are facing any website  issues, error,  bugs or need any other help with your site?\r\n\r\nThen yes, you are in the right place. I am here to provide you 24/7 Support/help in order to solve your Website  issue.\r\n\r\ncontact me here and tell me what you need  ===== > https://tinyurl.com/5n9y58yy\r\n\r\nSee you there\r\n\r\nRegards\r\nZack', '2024-02-19 15:02:19', '1', NULL, '', 0),
(52, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'I just delivered this message to you via your website contact form and I can do the same for your ad message to millions of websites. You can get this service for a fraction of the cost of conventional advertising.For more information, please email me or skype me below.\r\n\r\nP. Stewart\r\nEmail: fmjst4@gomail2.xyz\r\nSkype: live:.cid.2bc4ed65aa40fb3b', '2024-02-19 17:30:42', '1', NULL, '', 0),
(53, 'Ravi Desantis', 'fay.desantis@hotmail.com', '06-68320851', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Alastair D. i, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\n I recently grew my client’s organic search traffi with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/7ejfvwut\r\n\r\n\r\n', '2024-02-20 06:51:29', '1', NULL, '', 0),
(54, 'Brian And Dee Fawkner', 'fawkner.veronique@msn.com', '0371-6459456', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-02-25 16:43:04', '1', NULL, '', 0),
(55, 'Dorthy Block', 'block.dorthy@yahoo.com', '435-209-9264', 'Hello parvamconsultech.com Owner', 'Are you okay running your business without much funds? This could slow down growth and delay returns on your business.\r\n\r\nNow you have the Opportunity to Fund your Busineses and Projects without stress and without the burden of repayment as our interest in first for the growth of your business and projects, and for your to arrive at your desired business goals and dreams.\r\n\r\nTake advantage of our Funding opportunity and get funded on your business and Projects within days and have an ample number of years/Loan Term Period which gives you time to grow and achieve your business goals.\r\n\r\nGive us a call on:\r\n+852 3008 8373, \r\nor write us at:\r\ninfo@capitalfund-hk.com', '2024-03-04 15:51:50', '1', NULL, '', 0),
(56, 'Ravi Wurfel', 'wm.wurfel@yahoo.com', '66 543 32 74', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Alastair D. i, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\n I recently grew my client’s organic search traffi with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/7ejfvwut\r\n\r\n\r\n', '2024-03-04 18:06:51', '1', NULL, '', 0),
(57, 'Max Pardue', 'max.pardue@msn.com', '66 852 13 43', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-03-05 10:19:20', '1', NULL, '', 0),
(58, 'Brian And Dee Oconnor', 'flossie.oconnor@outlook.com', '0352 4478813', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-03-06 07:09:43', '1', NULL, '', 0),
(59, 'MalcolmLut', 'no.reply.MathiasEvans@gmail.com', '88192576699', 'An extraordinary new way of adve', 'Good day! parvamconsultech.com \r\n \r\nDid you know that it is possible to send commercial offer correctlСѓ legal? We offer a novel approach to sending messages through contact forms. \r\nAs Communication Forms are important, messages sent through them have less chance of being seen as spam. \r\nWe are inviting you to take advantage of our service without any charge. \r\nWe can deliver a maximum of 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\n \r\nWe only use chat for communication. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693', '2024-03-06 21:05:07', '1', NULL, '', 0),
(60, 'IirinaEnurl', 'Chainny@gmail.com', '87989535374', 'Very interesting offer!', 'Hi! Have s3x in your city today.  -  https://rb.gy/9pkq6l?Enurl', '2024-03-09 00:31:39', '1', NULL, '', 0),
(61, 'Ravi Luse', 'luse.clay56@yahoo.com', '041 895 39 85', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Alastair D. i, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\n I recently grew my client’s organic search traffi with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/7ejfvwut\r\n\r\n\r\n', '2024-03-09 17:12:24', '1', NULL, '', 0),
(62, 'Brian And Dee Robles', 'robles.floyd@yahoo.com', '512-527-5402', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-03-09 17:13:18', '1', NULL, '', 0),
(63, 'Ravi Bourque', 'bourque.lou@yahoo.com', '078 7068 0862', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Alastair D. i, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\n I recently grew my client’s organic search traffi with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/7ejfvwut\r\n\r\n\r\n', '2024-03-12 11:53:17', '1', NULL, '', 0),
(64, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Hey, looking to boost your ad game? Picture your message hitting website contact forms worldwide, grabbing attention from potential customers everywhere! Starting at just under a hundred bucks my budget-friendly packages are designed to make an impact. Drop me an email now to discuss how you can get more leads and sales now!\r\n\r\nP. Stewart\r\nEmail: kgv2ny@gomail2.xyz\r\nSkype: live:.cid.2bc4ed65aa40fb3b', '2024-03-16 00:31:33', '1', NULL, '', 0),
(65, 'Zack Gladden', 'gladden.angelia@gmail.com', '3154168991', 'Are you still in Bussiness ?', 'If you are facing any website  issues, error,  bugs or need any other help with your site?\r\n\r\nThen yes, you are in the right place. I am here to provide you 24/7 Support/help in order to solve your Website  issue.\r\n\r\ncontact me here and tell me what you need  ===== > https://tinyurl.com/5n9y58yy\r\n\r\nSee you there\r\n\r\nRegards\r\nZack', '2024-03-17 14:51:47', '1', NULL, '', 0),
(66, 'Ravi Mcdaniels', 'mcdaniels.ed@googlemail.com', '3814440055', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Alastair D. i, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\n I recently grew my client’s organic search traffi with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/7ejfvwut\r\n\r\n\r\n', '2024-03-18 12:46:27', '1', NULL, '', 0),
(67, 'Lara Ackman', 'lara.ackman@hotmail.com', '5138856177', 'Hi parvamconsultech.com Admin.', 'DEADLINE to claim your tax credit: April 15, 2024 \r\n•	Our company is in Arizona andwill help you claim it; up to $32,220. \r\n•	There are NO fees unless we get you your check from the IRS. \r\nDon’t miss your COVID tax credit: \r\nCall Kerry at 480-790-9186\r\nEmail Kerry at kerry@directfunder.com\r\nOr watch the explanation here: https://taxcreditfunder.com/en/', '2024-03-19 14:42:10', '1', NULL, '', 0),
(68, 'Brian And Dee Nord', 'abdul.nord@outlook.com', '686032087', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-03-23 11:53:01', '1', NULL, '', 0),
(69, 'Mike Dean\r\n', 'mikeGoalkLap@gmail.com', '83235884412', 'FREE fast ranks for parvamconsul', 'Hi there \r\n \r\nJust checked your parvamconsultech.com baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Dean\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', '2024-03-25 09:49:34', '1', NULL, '', 0),
(70, 'Chang Hargis', 'chang.hargis@gmail.com', '798349311', 'To the parvamconsultech.com Owne', 'Are you okay running your business without much funds? This could slow down growth and delay returns on your business.\r\n\r\nNow you have the Opportunity to Fund your Busineses and Projects without stress and without the burden of repayment as our interest in first for the growth of your business and projects, and for your to arrive at your desired business goals and dreams.\r\n\r\nTake advantage of our Funding opportunity and get funded on your business and Projects within days and have an ample number of years/Loan Term Period which gives you time to grow and achieve your business goals.\r\n\r\nGive us a call on:\r\n+852 3008 8373, \r\nor write us at:\r\ninfo@capitalfund-hk.com', '2024-03-26 00:05:13', '1', NULL, '', 0),
(71, 'Brian And Dee Archdall', 'archdall.leo25@outlook.com', '6808168220', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-03-27 12:09:36', '1', NULL, '', 0),
(72, 'PillsJes', 'iunskiygipertonik@gmail.com', '87926149167', 'Cialis, Viagra, Levitra - Trial ', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://cutt.ly/7wC5m1Id \r\nhttps://cse.google.com.mx/url?q=https://true-pill.top/\r\nhttps://wooderwindows.com/bitrix/redirect.php?goto=https://true-pill.top/\r\nhttps://aquamarine.gold/bitrix/redirect.php?goto=https://true-pill.top/\r\nhttps://avto-888.ru:443/bitrix/rk.php?goto=https://true-pill.top/\r\nhttp://m.taes.co.kr/member/login.html?noMemberOrder=&returnUrl=http%3a%2f%2ftrue-pill.top\r\n \r\n \r\nUro-tarivid\r\nMacorel\r\nLoratan\r\nProstanil\r\nTrihexyphen\r\nMinotabs\r\nMetocyl\r\nGovazol\r\nRizodal\r\nIndocycline\r\nFordesia\r\nOratane\r\nWymox\r\nClarityne d\r\nTorval cr\r\nBaligluc\r\nSelftison\r\nIkaclomin\r\nFlucoral\r\nFlexicam\r\nPhagocin\r\nFinap\r\nAlpicort\r\nDiltiasyn\r\nFludocel\r\nYalipent\r\nAxodin\r\nBeatacycline\r\nDiapride\r\nTriptafen\r\nServitrocin\r\nPhthizoetham\r\nFelodipino\r\nП»їп»ї\r\nSostilar\r\nCefalex\r\nSarve\r\nClaxid\r\nScandene\r\nOflogen\r\n', '2024-03-28 19:37:55', '1', NULL, '', 0),
(73, 'Boris Gallagher', 'gallagher.boris@googlemail.com', '638162586', 'Grabe Life Time Deal for your Em', 'Hi,\r\n\r\nThis deal gives you access to Reachinbox with unlimited email accounts, AI Generated E-mails, Automated warmups, unified inbox and agency whitelabelling.\r\n\r\nNo need to pay more again for any expensive email marketing tool\r\n\r\nGet the Life time deal now  click here to start  ====>  www.reachinbox.ai/insider-ltd?ref=Omar\r\n\r\n\r\nRegards \r\n', '2024-03-31 19:30:29', '1', NULL, '', 0),
(74, 'Syed Atif', 'pr5yukr3hkpq@opayq.com', '89178366113', 'Capital Business Funding', 'Hello, \r\n \r\nWe provide funding through our venture capital company to both start-up and existing companies either looking for funding for expansion or to accelerate growth in their company. \r\nWe have a structured joint venture investment plan in which we are interested in an annual return on investment not more than 10% ROI. We are also currently structuring a convertible debt and loan financing of 3% interest repayable annually with no early repayment penalties. \r\n \r\nWe would like to review your business plan or executive summary to understand a much better idea of your business and what you are looking to do, this will assist in determining the best possible investment structure we can pursue and discuss more extensively. \r\n \r\n \r\nI hope to hear back from you soon. \r\n \r\nSincerely, \r\n \r\nSyed Atif \r\nInvestment Director \r\nDevcorp International E.C. \r\nP.O Box 10236 Shop No. 305 \r\nFlr 3 Manama Centre, Bahrain \r\nEmail: syedatif1001@gmail.com \r\nWebsite: https://devcorpinternational.com', '2024-04-02 03:04:30', '1', NULL, '', 0),
(75, 'Mellisa Vigano', 'mellisa.vigano@msn.com', '26202922', 'Grabe Life Time Deal for your Em', 'Hi,\r\n\r\nThis deal gives you access to Reachinbox with unlimited email accounts, AI Generated E-mails, Automated warmups, unified inbox and agency whitelabelling.\r\n\r\nNo need to pay more again for any expensive email marketing tool\r\n\r\nAsk the support chat to provide you with life time deal Payment link and mention that you are referred from Omar \r\n\r\nGet the Life time deal now  click here to start  ====>  www.reachinbox.ai/insider-ltd?ref=Omar\r\n\r\n\r\nRegards \r\n', '2024-04-06 14:32:44', '1', NULL, '', 0),
(76, 'Diego Billiot', 'diego.billiot@gmail.com', '4013244607', 'Why You are not in Googles searc', 'Hi,\r\n\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\nI recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6', '2024-04-12 05:12:33', '1', NULL, '', 0),
(77, 'Murray Swift Melrose', 'melrose.kassie@msn.com', '261085190', 'Do you have Instagram Page ?', 'Hi,\r\n\r\nI am Murray Swift a Marketing Expert Featured on Forbes , I and  My Team and I Specialize in Growing Instagram Reach Organically without wasting your money in useless paid ads .\r\n\r\nJOIN OUR HAPPY clients and let us grow your Instagram Page now\r\n\r\nLets chat click here to Know what you are looking exactly for =====> https://tinyurl.com/wrbkauz7\r\n\r\nSee Inside\r\n\r\nRegards \r\n', '2024-04-16 10:26:13', '1', NULL, '', 0),
(78, 'Alena Dexter', 'dexter.alena@gmail.com', '7773222437', 'Hello parvamconsultech.com Admin', 'Hey there! Looking to save on energy costs?\r\n Look no further! At Nexus Energy Group Ltd., we’ve got your back. With over two decades of experience, we’ll help you navigate the energy markets, find the best rates, and keep your wallet happy. Let’s power up together! Reply for details: Nexusenergygroupltd@gmail.com', '2024-04-18 21:27:41', '1', NULL, '', 0),
(79, 'Jeffery Hope', 'hope.jeffery@gmail.com', '5085711438', 'Dear parvamconsultech.com Admin!', ' Hands down, the Easiest Customer Financing Program in the Industry Stop losing clients just because they have poor credit scores\r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nGet in touch with me below for more info\r\n\r\nJessica Snyder\r\njessica.snyder@helloratespros.com\r\nhttps://helloratespros.com/5-6/\r\n', '2024-04-23 16:30:43', '1', NULL, '', 0),
(80, 'Syed Atif', 'pr5yukr3hkpq@opayq.com', '87225143957', 'Capital Business Funding', 'Hello, \r\n \r\nWe provide funding through our venture capital company to both start-up and existing companies either looking for funding for expansion or to accelerate growth in their company. \r\nWe have a structured joint venture investment plan in which we are interested in an annual return on investment not more than 10% ROI. We are also currently structuring a convertible debt and loan financing of 3% interest repayable annually with no early repayment penalties. \r\n \r\nWe would like to review your business plan or executive summary to understand a much better idea of your business and what you are looking to do, this will assist in determining the best possible investment structure we can pursue and discuss more extensively. \r\n \r\n \r\nI hope to hear back from you soon. \r\n \r\nSincerely, \r\n \r\nSyed Atif \r\nInvestment Director \r\nDevcorp International E.C. \r\nP.O Box 10236 Shop No. 305 \r\nFlr 3 Manama Centre, Bahrain \r\nEmail: syedatif@devcorpinternationalbh.com \r\nWebsite: https://devcorpinternational.com', '2024-04-24 00:36:45', '1', NULL, '', 0),
(81, 'Brian And Dee Waldron', 'waldron.earnest@outlook.com', '3492561505', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-04-24 09:24:53', '1', NULL, '', 0),
(82, 'Shaun Willett', 'admin@charterunionfin.com', '81672358', 'To the parvamconsultech.com Admi', 'Do not stay out of business, or close down due to lack of Funding and finance. Your projects, businesses and financial needs is completely possible.\r\n\r\nYou can now fund your projects, businesses without worries of repayment as you can have ample amount of time to execute your projects and businesses and build up, grow financially, to achieve your complete set goals.\r\n\r\nAre you also a broker/consultant? Make life easy for various of your clients globlly to help provide funding for their various Businesses and Projects, edging them towards a better buiness and financial goals.\r\n\r\nChu Yeung\r\nCustomer Care Department\r\ninfo@charterunionfin.com\r\n+852 8199 9324', '2024-04-27 01:53:36', '1', NULL, '', 0),
(83, 'Mike Fraser\r\n', 'mikeGoalkLap@gmail.com', '83355656797', 'FREE fast ranks for parvamconsul', 'Hi there \r\n \r\nJust checked your parvamconsultech.com baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Fraser\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', '2024-04-27 13:15:29', '1', NULL, '', 0),
(84, 'IrenEnurlb', 'shienilielta@gmail.com', '89895989869', 'Hey there, handsome', 'Hi handsome, how about we share a steamy sauna session? -  https://u.to/CXOGIA?Enurl', '2024-04-30 13:08:12', '1', NULL, '', 0),
(85, 'Mike Bradshaw\r\n', 'peterIngend@gmail.com', '86665714831', 'Whitehat SEO for parvamconsultec', 'Howdy \r\n \r\nI have just took an in depth look on your  parvamconsultech.com for the ranking keywords and saw that your website could use a boost. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Bradshaw\r\n \r\nDigital X SEO Experts', '2024-05-01 16:37:54', '1', NULL, '', 0),
(86, 'Harold Connely', 'harold.connely@gmail.com', '1553197904', 'Dear parvamconsultech.com Webmas', 'Running a business can be stressful and hard. \r\n\r\nPayroll, Insurance, inventory, marketing ……UGHH\r\n\r\nLet us help remove that stress and give you some breathing room.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com\r\n\r\n\r\n', '2024-05-03 19:32:53', '1', NULL, '', 0),
(87, 'RaymondFlief', 'no.reply.StevenBrown@gmail.com', '85814516223', 'We guarantee the delivery of you', 'Good day! parvamconsultech.com \r\n \r\nDo you know that it is possible to send a proposal legally and legitimately? We submit a unique way of sending letters through feedback forms. \r\nAs Feedback Forms messages are considered important, they will not be marked as spam. \r\nTrу out our service without paying a dіme! \r\nWe can deliver up to 50,000 messages on your instruction. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', '2024-05-04 01:52:30', '1', NULL, '', 0),
(88, 'Mike Adamson\r\n', 'peterIngend@gmail.com', '84769138449', 'Increase sales for your local bu', 'Hi there \r\n \r\nAre you tired of spending money on advertising that doesn’t work? \r\nWe have the right strategy for you, to meet the right audience within your City boundaries. \r\n \r\nB2B Local City Marketing that works: \r\nhttps://www.onlinelocalmarketing.org/product/local-research-advertising/ \r\n \r\nWith our innovative marketing approach, you will receive calls, leads, and website interactions within a week. \r\n \r\nRegards \r\nMike Adamson\r\n https://www.onlinelocalmarketing.org', '2024-05-05 07:17:13', '1', NULL, '', 0),
(89, 'Mike Hailey\r\n', 'mikedups@gmail.com', '84471325496', 'NEW: Semrush Backlinks', 'Good Day \r\n \r\nThis is Mike Hailey\r\n \r\nLet me present you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your parvamconsultech.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Hailey\r\n \r\nmike@strictlydigital.net', '2024-05-07 16:08:44', '1', NULL, '', 0),
(90, 'Diane Zahel', 'diane.zahel@msn.com', '407431338', 'Hello parvamconsultech.com Owner', 'Best financial company to fund your business project globally, i can help, email me here:                                                                                                         info@financeworldwidehk.com', '2024-05-08 16:11:34', '1', NULL, '', 0),
(91, 'Clark Penn', 'penn.clark@gmail.com', '3230440362', 'Hi parvamconsultech.com Administ', ' \r\nWho said running a business was easy? \r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com\r\n\r\n\r\n', '2024-05-08 16:18:48', '1', NULL, '', 0),
(92, 'Miriam Dupre', 'dupre.miriam@gmail.com', '510724924', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-05-08 19:54:01', '1', NULL, '', 0),
(93, 'Horacio De Lissa', 'admin@charterunionfin.com', '7886123879', 'To the parvamconsultech.com Webm', 'Do not stay out of business, or close down due to lack of Funding and finance. Your projects, businesses and financial needs is completely possible.\r\n\r\nYou can now fund your projects, businesses without worries of repayment as you can have ample amount of time to execute your projects and businesses and build up, grow financially, to achieve your complete set goals.\r\n\r\nAre you also a broker/consultant? Make life easy for various of your clients globlly to help provide funding for their various Businesses and Projects, edging them towards a better buiness and financial goals.\r\n\r\nChu Yeung\r\nCustomer Care Department\r\ninfo@charterunionfin.com\r\n+852 8199 9324', '2024-05-09 01:58:38', '1', NULL, '', 0),
(94, 'Lona Agar', 'agar.lona@hotmail.com', '165634789', 'Hi parvamconsultech.com Owner.', '> Sorry to be a bother, but I was informed that you have either a Residential or Business debt to pay off.\r\n>\r\n> When this is true, we at Cancel1Mortgage.info guarantee your debt will be paid off/Discharged/Extinguished in 14 days when you follow our Client Instructions.\r\n>\r\n> Please visit Cancel1Mortgage.info today and order your debt removal securities Processing now which is 100% legal and ordered by courts to be debt payment.\r\n>\r\n> Thank you for your business and for extinguishing your debt through Cancel1Mortgage.info when you decide to use our very successful registered Promissory Note securities to pay off your debt in 14 days Guaranteed.\r\n>\r\n> You may also contact me, David Young de God, through SKYPE with dayglobal..\r\n>\r\n> Thank you again for reading..', '2024-05-10 15:37:02', '1', NULL, '', 0),
(95, 'Coy Keldie', 'keldie.coy@msn.com', '7736162347', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-05-19 16:01:04', '1', NULL, '', 0),
(96, 'Mike Carrington\r\n', 'mikeLapentext@gmail.com', '89144289973', 'Domain Authority of your parvamc', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\n \r\nThanks and regards \r\nMike Carrington\r\n', '2024-05-20 10:58:30', '1', NULL, '', 0),
(97, 'Yong Brunton', 'brunton.yong@gmail.com', '5607252309', 'Hello parvamconsultech.com Admin', ' Game changing customer financing approves down to 500 FICO No more turning down business due to low credit scores\r\n\r\n** USA Based Businesses Only! **\r\n\r\nSend me a message at my contact info below for info\r\n\r\nJessica Snyder\r\njessica.snyder@helloratespros.com\r\nhttps://helloratespros.com/5-6/\r\n', '2024-05-24 04:33:45', '1', NULL, '', 0),
(98, 'Brian And Dee Worrell', 'olivia.worrell1@msn.com', '4634927', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-05-25 03:59:41', '1', NULL, '', 0),
(99, 'AmeliaEnurl1', 'Obedayzed2@gmail.com', '82985465325', 'Hello dear, want some company?', 'Hello, how about we share some sweet treats in bed? -  https://rb.gy/7xb976?Bep', '2024-05-27 10:22:38', '1', NULL, '', 0),
(100, 'Tobias Bidwill', 'bidwill.tobias78@msn.com', '7187400695', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-05-27 16:35:35', '1', NULL, '', 0),
(101, 'Otis Carrico', 'otis.carrico@gmail.com', '', 'Hi parvamconsultech.com Admin.', ' Finally, an all in one customer financing solution for ANY credit score between 500-850 FICO Stop losing clients just because they have poor credit scores\r\n\r\n** USA Based Businesses Only! **\r\n\r\nGet in touch with me below for more info\r\n\r\nJessica Snyder\r\njessica.snyder@helloratespros.com\r\nhttps://helloratespros.com/5-6/\r\n', '2024-05-29 19:29:44', '1', NULL, '', 0),
(102, 'Mike Kingsman\r\n', 'peterIngend@gmail.com', '84238994121', 'Whitehat SEO for parvamconsultec', 'Howdy \r\n \r\nI have just took an in depth look on your  parvamconsultech.com for the ranking keywords and saw that your website could use a push. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://digitalx.press/unbeatable-seo/ \r\nWhatsapp us: https://wa.link/fqchim \r\n \r\nRegards \r\nMike Kingsman\r\n \r\nDigital X SEO Experts', '2024-05-30 09:10:27', '1', NULL, '', 0),
(103, 'Rayford Visconti', 'visconti.rayford@gmail.com', '', 'Hello parvamconsultech.com Admin', 'Businesses that get Vetted are running circles around their competition that continue pouring more money into leads & advertising.\r\nVetted builds essential trust, transparency & credibility to help you close up to 60% more deals eliminating the need to spend more on advertising or leads.\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Vetted-30-DAY-FREE-TRIAL! \r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-05-30 21:23:46', '1', NULL, '', 0),
(104, 'Veronique McKay', 'veronique.mckay32@gmail.com', '448098285', 'Hi parvamconsultech.com Administ', ' Finally, an all in one customer financing solution for ANY credit score between 500-850 FICO No more turning down business due to low credit scores\r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nGet in touch with me below for more info\r\n\r\nJessica Snyder\r\njessica.snyder@helloratespros.com\r\nhttps://helloratespros.com/5-6/\r\n', '2024-05-30 21:28:22', '1', NULL, '', 0),
(105, 'AmeliaEnurl1', 'Obedayzed1@gmail.com', '85515656125', 'Hello dear, want some company?', 'Hello, how about we share some sweet treats in bed? -  https://rb.gy/7xb976?Bep', '2024-05-30 23:49:36', '1', NULL, '', 0);
INSERT INTO `contact_us` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_subject`, `contact_message`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(106, 'Zack Branham', 'clara.branham@hotmail.com', '286307050', 'Are you still in Bussiness ?', 'If you are facing any website  issues, error,  bugs or need any other help with your site?\r\n\r\nThen yes, you are in the right place. I am here to provide you 24/7 Support/help in order to solve your Website  issue.\r\n\r\ncontact me here and tell me what you need  ===== > https://tinyurl.com/5n9y58yy\r\n\r\nSee you there\r\n\r\nRegards\r\nZack', '2024-06-01 14:33:34', '1', NULL, '', 0),
(107, 'Carma', 'carma@durgin.podiatristusa.sale', '96078024', 'Carma Durgin', 'Hey there,\r\n\r\nIf you are one of the sufferers of the common problems nails have, then you are in luck! Our Toenail Clippers is here to help. It has a specially designed clip that can help those with troubles with winding nails, hard nails, two nails, nail cracks, deep nails, and thickened nails.\r\n\r\nWe are confident that our Toenail Clippers will provide you with the results you are looking for.\r\n\r\nGet yours today with 60% OFF: https://podiatristusa.sale\r\n\r\nBest,\r\n\r\nCarma', '2024-06-02 03:24:50', '1', NULL, '', 0),
(108, 'Brian And Dee Lock', 'sara.lock22@gmail.com', '533225057', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-06-02 10:58:45', '1', NULL, '', 0),
(109, 'Mike Roger\r\n', 'mikedups@gmail.com', '84286639354', 'NEW: Semrush Backlinks', 'Howdy \r\n \r\nThis is Mike Roger\r\n \r\nLet me introduce to you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nThe new Semrush Backlinks, which will make your parvamconsultech.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.co/ \r\n \r\nCheap and effective \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Roger\r\n https://www.strictlydigital.co/whatsapp-us/', '2024-06-03 17:27:56', '1', NULL, '', 0),
(110, 'Christen Gilruth', 'gilruth.christen@gmail.com', '7855045653', 'To the parvamconsultech.com Owne', 'Don’t continue pouring good money into advertising & leads without first getting your business Vetted.\r\nVetted helps you close up to 60% more of the leads you already have.\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-06-03 18:50:39', '1', NULL, '', 0),
(111, 'Brian And Dee Barden', 'barden.antonietta@gmail.com', '7830653747', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-06-04 14:51:00', '1', NULL, '', 0),
(112, 'Ara Coy', 'coy.ara@gmail.com', '7033159055', 'Hello parvamconsultech.com Owner', ' Finally, an all in one customer financing solution for ANY credit score between 500-850 FICO Stop losing clients just because they have poor credit scores\r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nJessica Snyder\r\njessica.snyder@helloratespros.com\r\nhttps://helloratespros.com/5-6/\r\n', '2024-06-04 17:44:34', '1', NULL, '', 0),
(113, 'Hannah Ackerman', 'alternative.f.a.m@outlook.com', '84575183113', 'Tailored financial Solution', 'Good day, \r\n \r\nWe specialize in consulting for a group of high-net-worth foreign investors, providing exclusive investment opportunities with a 2.5% interest rate, a 2-year grace period, and a repayment term of 10 to 15 years. If you are seeking funding for your business or personal projects, please indicate your interest, and we will reach out to you for a consultation through our official platform. \r\n \r\nThank you for your time and consideration. \r\n \r\nBest regards, \r\n \r\nMrs. Hannah Ackerman \r\n \r\nalternativeconsult@hgdtkbcs-sec.com \r\n \r\nAlternative Finance \r\n \r\nRelationship Manager', '2024-06-06 13:48:45', '1', NULL, '', 0),
(114, 'Joycelyn Cloutier', 'joycelyn.cloutier26@gmail.com', '3807562753', 'Dear parvamconsultech.com Admini', 'The Vetted Business Directory has completed its May 2024 updates with 7,358 new businesses added.\r\n\r\nYour business was unfortunately NOT ABLE TO BE INCLUDED :-(\r\n\r\nDon’t worry, this is easy to fix.\r\n \r\nUse the link in my signature to add or update your Vetted business details and realize the powerful benefits of being a Vetted Business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-06-06 14:52:08', '1', NULL, '', 0),
(115, 'AmandaHackBeef1', 'amandaarcadimac@gmail.com', '85945628677', 'Hey stud, ready for love?', 'Hey darling, want to hang out? -  https://u.to/IGq5IA?Juidism', '2024-06-06 16:37:20', '1', NULL, '', 0),
(116, 'Mickey Hoffmann', 'mickey.hoffmann@gmail.com', '620047340', 'Hi parvamconsultech.com Owner.', ' Finally, an all in one customer financing solution for ANY credit score between 500-850 FICO No more turning down business due to low credit scores\r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nJessica Snyder\r\njessica.snyder@helloratespros.com\r\nhttps://helloratespros.com/5-6/\r\n', '2024-06-09 00:15:05', '1', NULL, '', 0),
(117, 'Nikole Tenney', 'nikole.tenney@gmail.com', '5127407976', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-06-10 08:46:10', '1', NULL, '', 0),
(118, 'Sue Vanatta', 'vanatta.sue@gmail.com', '3189148990', 'Hi parvamconsultech.com Webmaste', 'You don’t need to buy more leads or advertising. \r\nYou just need to convert more of the leads you already have.\r\n \r\n+Vetted helps you close up to 60% more deals and spend less on advertising.\r\n+Start your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-06-11 07:53:48', '1', NULL, '', 0),
(119, 'Kermit', 'kermit@parvamconsultech.com', '7082588435', 'Kermit Massola', 'Hey \r\n\r\nThe New Powerful LED Flashlight is The Perfect Flashlight For Any Situation!\r\n\r\nThe 3,000 Lumens & Adjustable Zoom gives you the wide field of view and brightness other flashlights don’t have.\r\n\r\n50% OFF + Free Shipping!  Get it Now: https://linterna.cc\r\n\r\nAll the best, \r\n\r\nKermit', '2024-06-14 02:04:38', '1', NULL, '', 0),
(120, 'Melanie Bowser', 'melanie.bowser90@googlemail.com', '587533751', 'Hi parvamconsultech.com Administ', 'Businesses in the Vetted Business Directory & Portal close up to 60% more sales due to amplified trust, transparency and credibility.\r\n\r\nGetting Vetted is easy and over 7,000 businesses were added to the platform in May.\r\n\r\nYour business was unfortunately NOT INCLUDED :-(\r\n\r\nDon’t worry, this is easy to fix.\r\n \r\nUse the link in my signature to add or update your Vetted business details and fully realize the powerful benefits of being a Vetted Business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-06-14 14:29:08', '1', NULL, '', 0),
(121, 'Brian And Dee Nanson', 'clarence.nanson35@googlemail.com', '619299625', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-06-15 18:00:18', '1', NULL, '', 0),
(122, 'Airpodsxm', 'afonas.e.v.navit@gmail.com\r\n', '89542355942', 'Реплика AirPods PRO', 'Обожаю свои <a href=https://myapplestory.ru/>реплика Airpods PRO</a>, они стали моими постоянными спутниками.', '2024-06-17 09:37:40', '1', NULL, '', 0),
(123, 'Charis Tuckett', 'tuckett.charis@outlook.com', '535135289', 'To the parvamconsultech.com Owne', 'Businesses that get Vetted are running circles around their competition that continue pouring more money into leads & advertising.\r\nVetted builds essential trust, transparency & credibility to help you close up to 60% more deals eliminating the need to spend more on advertising or leads.\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Vetted-30-DAY-FREE-TRIAL! \r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-06-17 16:09:20', '1', NULL, '', 0),
(124, 'MasonPoics', 'yjdisantoyjdissemin@gmail.com', '89777266497', 'Aloha    write about     price', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', '2024-06-17 19:21:07', '1', NULL, '', 0),
(125, 'Mike Porter\r\n', 'mikeIngend@gmail.com', '86696596961', 'Domain Authority of your parvamc', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\n \r\nThanks and regards \r\nMike Porter\r\n \r\nMonkey Digital \r\nhttps://www.monkeydigital.co/whatsapp-us/', '2024-06-19 11:21:17', '1', NULL, '', 0),
(126, 'Wade Neidig', 'wade.neidig@gmail.com', '4200608', 'To the parvamconsultech.com Admi', ' \r\nPeople + Processes + Capital = The Recipe for Business Success\r\n\r\nHowever most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no access to working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com\r\n\r\n\r\n', '2024-06-20 00:33:04', '1', NULL, '', 0),
(127, 'TobiasLence', 'no.reply.ArthurAndersson@gmail.c', '85499588924', 'An inventive new system of adver', 'Hi-ya! \r\n \r\nDid you know that it is possible to send business offer well legal? We tender a new way of sending business offers through feedback forms. \r\nContact Form messages are usually not sent to spam because they are regarded as important. \r\nCome and give our service a try – it’s free! \r\nYou can count on us for sending up to 50,000 messages. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', '2024-06-21 02:35:41', '1', NULL, '', 0),
(128, 'Miles Bellew', 'miles.bellew@gmail.com', '43916690', 'Hello parvamconsultech.com Webma', 'Vetted is a powerful sales multiplier that helps you close 60 % more deals. \r\nThat’s a game changer.\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-06-22 15:13:27', '1', NULL, '', 0),
(129, 'Santo Akehurst', 'santo.akehurst63@hotmail.com', '9605148812', 'Hi parvamconsultech.com Owner.', ' \r\nPeople + Processes + Capital = The Recipe for Business Success\r\n\r\nHowever most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no access to working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com\r\n\r\n\r\n', '2024-06-26 05:22:51', '1', NULL, '', 0),
(130, 'Troy McComas', 'mccomas.troy@gmail.com', '', 'Dear parvamconsultech.com Webmas', 'Getting your business Vetted will supercharge your sales & help you close up to 60% more leads than non Vetted businesses.\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nGet started & more info linked in my signature below.\r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Vetted-30-DAY-FREE-TRIAL! \r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-06-27 16:18:06', '1', NULL, '', 0),
(131, 'Mike Lewin\r\n', 'peterIngend@gmail.com', '82358977876', 'Whitehat SEO for parvamconsultec', 'Hi there \r\n \r\nI have just took a look on your SEO for  parvamconsultech.com for the ranking keywords and saw that your website could use a push. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.co/unbeatable-seo/ \r\n \r\nRegards \r\nMike Lewin\r\n \r\nDigital X SEO Experts \r\nhttps://www.digital-x-press.co/whatsapp-us/', '2024-06-27 16:46:15', '1', NULL, '', 0),
(132, 'Ilene Hinder', 'ilene.hinder@msn.com', '6747737865', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-06-28 20:12:13', '1', NULL, '', 0),
(133, 'Louvenia Llanos', 'llanos.louvenia@gmail.com', '', 'To the parvamconsultech.com Admi', '\r\nHave you ever worried that you won’t make payroll?\r\n\r\nAre rising business expenses stressing you out?\r\n\r\nLet us help take this stress away & give you some breathing room. \r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com\r\n\r\n\r\n', '2024-06-29 17:49:31', '1', NULL, '', 0),
(134, 'Mike Ward\r\n', 'mikeAerosse@gmail.com', '81594757913', 'NEW: Semrush Backlinks', 'Hi \r\n \r\nThis is Mike Ward\r\n \r\nLet me introduce to you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nThe new Semrush Backlinks, which will make your parvamconsultech.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictly-seo.com/semrush-backlinks/ \r\n \r\nCheap and effective \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Ward\r\n https://www.strictly-seo.com/whatsapp-us/', '2024-07-01 17:58:02', '1', NULL, '', 0),
(135, 'Ralf Bulcock', 'ralf.bulcock@yahoo.com', '7930131077', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-07-05 14:58:18', '1', NULL, '', 0),
(136, 'Lucy Soward', 'lucy.soward62@gmail.com', '890090788', 'Dear parvamconsultech.com Owner.', 'Don’t spend another penny on leads or advertising without first getting your business Vetted. \r\nVetted builds essential trust, transparency & credibility to help you close up to 60% more deals. \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-07-05 19:32:02', '1', NULL, '', 0),
(137, 'Brian And Dee Truong', 'truong.denese@msn.com', '4176095', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-07-06 00:19:40', '1', NULL, '', 0),
(138, 'Ravi Beak', 'sondra.beak@gmail.com', '623844190', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '2024-07-06 02:17:57', '1', NULL, '', 0),
(139, 'Miguel Bohm', 'bohm.miguel80@gmail.com', '41701201', 'Dear parvamconsultech.com Owner!', 'WANTED: Partnerships & Agents for Global E-commerce Firm\r\n\r\n4U2 Inc., a premier E-commerce , Sourcing Brokerage firm, is actively seeking partnerships and collaboration with manufacturers and wholesalers for agricultural, commercial, and residential products. We offer a diverse marketplace for both new and used items, including vehicles and equipment.\r\n\r\nWhy Choose 4U2 Inc.? (see https.//www.4u2inc.com)\r\n\r\nGlobal reach for your products\r\nImmediate requirements for a wide range of items\r\nOpportunity to expand your business network\r\nJoin Our Team We’re also looking for Independent Contractor Agents (Account Executives) to help us discover new business opportunities. Whether you’re seeking a full-time or part-time role, you can earn up to $60,000 based on performance.\r\n\r\nGet in Touch Don’t miss out on this opportunity. Contact us at 4u2inc123@gmail.com to learn more or to start our partnership today!\r\n\r\nThis version is more direct and easier to read, highlighting the key points and call to action for potential partners and agents. If you need further refinements or have specific requirements, feel free to let me know!', '2024-07-08 13:32:38', '1', NULL, '', 0),
(140, 'Brook Dunrossil', 'brook.dunrossil@outlook.com', '4168702056', 'To the parvamconsultech.com Webm', 'The Vetted Business Directory has completed its May 2024 updates with 7,358 new businesses added.\r\n\r\nYour business was unfortunately NOT ABLE TO BE INCLUDED :-(\r\n\r\nDon’t worry, this is easy to fix.\r\n \r\nUse the link in my signature to add or update your Vetted business details and realize the powerful benefits of being a Vetted Business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n', '2024-07-10 20:05:13', '1', NULL, '', 0),
(141, 'Brian And Dee Belcher', 'norris.belcher@gmail.com', '353825899', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-07-11 10:18:34', '1', NULL, '', 0),
(142, 'Omar Elkin', 'creatify64@gmail.com', '43988516', 'I will create free Marketing sho', 'Hi,\r\nI am Omar , I am offering for your website or Producrts  free Marketing short video that you can use it freely in any of your social accounts or Youtube channel , if you are Intrested , please\r\n\r\n\r\n\r\nput your details here and I will sen you the Free video ===> https://tinyurl.com/2a4j95ph\r\n\r\nRegards', '2024-07-13 15:07:49', '1', NULL, '', 0),
(143, 'Ryder Copley', 'ryder.copley@yahoo.com', '3272591508', 'Certified Epson Renewal Program ', 'EQUIP YOUR CLASSROOM or BOARDROOM at a DISCOUNT!\r\n\r\nEPSON PowerLite 1288\r\n4K Lumen, 1080p, Wi-Fi Projector for ONLY $599!\r\n\r\nThe Epson PowerLite 1288 4K Lumen Full HD 3LCD Projector includes Wi-Fi connectivity that enables wireless screen mirroring via Miracast, enabling you to show your corporate slideshows without hassle. The projector outputs up to 4000 lumens of color and white brightness and has a high-definition native resolution to provide vibrant, high-resolution images with supported content.\r\n\r\n- Full 3 Year Warranty\r\n- Free Ground Shipping\r\n- In Stock / Immediately Available\r\n- Certified Epson Renewal Program\r\n- Only 20 left At This Price\r\n\r\n+++ Buy now: https://bit.ly/4dNAKqQ\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe by filling this form: https://bit.ly/myounsubscribe\r\nVia Santa Teresa 150, Augusta, SR, USA, 96011', '2024-07-14 11:00:00', '1', NULL, '', 0),
(144, 'Kelley Maness', 'kelley.maness@outlook.com', '490587583', 'Hello parvamconsultech.com Admin', 'Payroll, Insurance, inventory, marketing EXPENSES ……UGHH\r\n\r\nWant to remove the stress and get some breathing room?\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-07-14 14:03:58', '1', NULL, '', 0),
(145, 'Omar Edinburgh', 'creatify64@gmail.com', '8185338735', 'I will create free Marketing sho', 'Hi,\r\nI am Omar , I am offering for your website or Producrts  free Marketing short video that you can use it freely in any of your social accounts or Youtube channel , if you are Intrested ,\r\n\r\n please put your details here and I will sent you the Free video ===> https://forms.gle/SPateGQUdeBtdcqB7\r\n\r\nRegards', '2024-07-16 11:16:45', '1', NULL, '', 0),
(146, 'Janelle Banks', 'banks.janelle@hotmail.com', '882063969', 'To the parvamconsultech.com Owne', ' Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-07-17 17:43:10', '1', NULL, '', 0),
(147, 'Dewitt Askins', 'askins.dewitt@googlemail.com', '9104281567', 'To the parvamconsultech.com Admi', 'How would you like a surefire way to dominate your local market & win more sales from your competition?\r\n\r\nGetting Vetted is a powerful sales multiplier that helps you close 60 % more deals. \r\nThat’s a game changer.\r\nVetted also provides great SEO & FREE local leads\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?\r\n', '2024-07-17 17:51:44', '1', NULL, '', 0),
(148, 'Alaric Ong', 'rylanjoseph85@gmail.com', '87564743781', 'We created a marketing system ', 'Hi, \r\n \r\nMy mentor Alaric Ong is a million-dollar funnel builder with a proven track record of generating leads, appointments, and sales automatically. He has driven millions of dollars in revenue through his own funnels. \r\n \r\nOur strategy allows us to achieve a cost per lead of $3 to $10 in competitive markets and $20 to $30 per appointment. The key to our success is running thousands of variations of ads, preventing ad fatigue and reducing costs. Most marketers run only a few ads, causing them to quickly lose effectiveness. \r\n \r\nWe use AI to split test and optimize our ads, ensuring we spend more on successful ads and less on underperforming ones. \r\n \r\nThis approach results in leads costing $10 each and appointments costing $30 in Singapore. In Malaysia, we achieve appointments at RM 9.94 (SGD $3). In USA, $20 per appointment \r\n \r\nIf you’re interested in learning more, visit https://funnel.alaric.ai. \r\n \r\nBest, \r\nAlaric \r\n \r\nWhatsApp: https://wa.link/z7f073 \r\n \r\nEmail: alaricong123@gmail.com \r\n \r\n1000+ Client results: http://alaric.site/wins \r\n \r\nHundreds of Testimonials: https://alaricong.com/p/testimonials.html \r\n \r\nJoin our WhatsApp group: https://chat.whatsapp.com/Ln6E1UBammC6MOzcXhXYlN', '2024-07-19 12:16:38', '1', NULL, '', 0),
(149, 'Mike Milton\r\n', 'mikeIngend@gmail.com', '88269872529', 'Improve your website`s ranks tot', 'Hi there, \r\n \r\nWhile checking your parvamconsultech.com for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\n \r\nRegards \r\nMike Milton\r\n \r\nWhatsapp: https://www.hilkom-digital.de/whatsapp-us/', '2024-07-19 22:40:18', '1', NULL, '', 0),
(150, 'Nigel Jasper', 'jasper.nigel96@gmail.com', '267139236', 'Experience Natural Pain Relief w', 'Tired of sore muscles, aches, and pains? Eager to return to doing what you love?\r\n\r\nTry MYONATURAL, recommended by massage therapists, chiropractors, and athletic trainers.\r\n\r\nSave 20% on your first purchase.\r\nUse Coupon Code: VV7UP5HH\r\n\r\n++URL++:  https://bit.ly/4eODq8g\r\n\r\n* MYONATURAL offers a collection of safe, all-natural products aimed at relieving pain and improving your life. Our pain-relieving creams and oral sprays work separately or in combination to ease pain, reduce anxiety, and support restorative sleep. Developed by someone who understands your struggles, we are dedicated to helping you feel better, move better, and live better. Experience the MYONATURAL difference today!\r\n\r\n\r\n\r\n\r\nUnsubscribe by filling the form: https://bit.ly/myounsubscribe\r\n78 Dora Creek, The Channon, NSW, USA, 2480', '2024-07-20 05:01:31', '1', NULL, '', 0),
(151, 'Brian And Dee Sowell', 'hung.sowell94@gmail.com', '639978074', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-07-21 10:24:10', '1', NULL, '', 0),
(152, 'Ashton Bragg', 'bragg.ashton2@gmail.com', '4822234036', 'Hi parvamconsultech.com Admin.', ' Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-07-21 15:17:12', '1', NULL, '', 0),
(153, 'Omar Rowcroft', 'creatify64@gmail.com', '4505311926', 'I will create free Marketing sho', 'Hi,\r\nI am Omar , I am offering for your website or Producrts  free Marketing short video that you can use it freely in any of your social accounts or Youtube channel , if you are Intrested ,\r\n\r\n please put your details here and I will sent you the Free video ===> https://tinyurl.com/5btpxwsk\r\n\r\nRegards', '2024-07-23 10:32:54', '1', NULL, '', 0),
(154, 'Philip Rosario', 'rosario.philip@msn.com', '7042272194', 'Hi parvamconsultech.com Webmaste', 'Have you seen a great feature or an entire website design that you love and wish that you could have for your business?\r\n\r\nWe can make it happen and at wholesale rates.\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', '2024-07-26 13:33:32', '1', NULL, '', 0),
(155, 'India Marr', 'marr.india82@gmail.com', '7884635883', 'Dear parvamconsultech.com Webmas', 'Important: \r\nYour Vetted Business listing is no longer visible because the annual verification email that we sent, was returned to us as “undeliverable”.\r\n\r\nIf the returned email was in error, you can add or update your email & listing info using the link in my signature.\r\n\r\nOnce remedied, you’ll reactivate your Vetted Directory benefits:\r\n \r\n+A robust Vetted business profile that promotes trust, transparency & credibility in your market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Local leads from consumers that use our national platform to find Vetted Businesses by category\r\n \r\nSee link in my signature to add /update your Vetted business details, and get the powerful benefits of being a Vetted business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n', '2024-07-26 13:57:42', '1', NULL, '', 0),
(156, 'Shana Heady', 'heady.shana@hotmail.com', '3934505762', 'Dear parvamconsultech.com Admin!', ' Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-07-27 13:35:30', '1', NULL, '', 0),
(157, 'Pamela Arreguin', 'arreguin.pamela@gmail.com', '516503458', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-07-27 14:01:37', '1', NULL, '', 0),
(158, 'Mike Nelson\r\n', 'peterIngend@gmail.com', '83935791197', 'Whitehat SEO for parvamconsultec', 'Howdy \r\n \r\nI have just verified your SEO on  parvamconsultech.com for its SEO metrics and saw that your website could use an upgrade. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digitalxpresscom.net/monthly-seo/ \r\n \r\nRegards \r\nMike Nelson\r\n \r\nDigital X SEO Experts \r\nhttps://www.digitalxpresscom.net/whatsapp-us/', '2024-07-28 01:30:35', '1', NULL, '', 0),
(159, 'Brian And Dee Goolsby', 'goolsby.sheri@outlook.com', '9122243765', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-07-29 10:21:55', '1', NULL, '', 0),
(160, 'Aundrea Townley', 'aundrea.townley@outlook.com', '', 'To the parvamconsultech.com Admi', 'Payroll, Insurance, inventory, marketing EXPENSES ……UGHH\r\n\r\nWant to remove the stress and get some breathing room?\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-07-30 14:49:27', '1', NULL, '', 0),
(161, 'Hilda Schiller', 'schiller.hilda5@msn.com', '9083442141', 'Hello parvamconsultech.com Admin', 'Important: \r\nYour Vetted Business listing is no longer visible because the annual verification email that we sent, was returned to us as “undeliverable”.\r\n\r\nIf the returned email was in error, you can add or update your email & listing info using the link in my signature.\r\n\r\nOnce remedied, you’ll reactivate your Vetted Directory benefits:\r\n \r\n+A robust Vetted business profile that promotes trust, transparency & credibility in your market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Local leads from consumers that use our national platform to find Vetted Businesses by category\r\n \r\nSee link in my signature to add /update your Vetted business details, and get the powerful benefits of being a Vetted business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n', '2024-08-01 22:29:03', '1', NULL, '', 0),
(162, 'Erlinda Holzman', 'erlinda.holzman@gmail.com', '7832986822', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-08-02 23:33:46', '1', NULL, '', 0),
(163, 'Errol Flint', 'flint.errol@gmail.com', '733367202', 'Dear parvamconsultech.com Admin.', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-08-05 17:28:12', '1', NULL, '', 0),
(164, 'Edgar Maiden', 'edgar.maiden@gmail.com', '3505078606', 'To the parvamconsultech.com Admi', 'Do you have a list of website updates that you want to deploy but hate having to pay the INSANE prices to get it done?\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', '2024-08-06 00:56:34', '1', NULL, '', 0),
(165, 'Lawerence Rae', 'lawerence.rae@gmail.com', '688262292', 'Upgrade Your Office with the Eps', '4000 Lumen ANSI Epson Projector for $649\r\n\r\n-- https://bit.ly/PowerLite-1288\r\n\r\n- price at Epson US is $850\r\n- Comes with 3 years of warranty\r\n\r\nEnjoy effortless wireless presentations with the Epson PowerLite 1288 Full HD 3LCD Projector with 4000 Lumens. Built-in Wi-Fi and Miracast support allow for wireless projection in any meeting room. See vibrant, high-resolution images with 1080p clarity and 4000 lumens of brightness.\r\n\r\nOrder now and elevate your presentations to the next level!\r\nOrder now—In stock and ready to be delivered!\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe by filling the form on: https://bit.ly/unsubscribe-pages\r\nWijenburg 115, Amsterdam, NH, United States, 1082 Vt', '2024-08-06 18:09:12', '1', NULL, '', 0),
(166, 'Omar Haddad', 'creatify64@gmail.com', '656810142', 'Increase your Youtube Views!', 'Hi ,\r\nBoost your views by tracking millions of high-performing videos\r\nFind your next video idea, title and thumbnail much faster saving you hours of research and accelerate your views!\r\n\r\nStart Now  ===> https://shorturl.at/RlYNx\r\n\r\nRegards', '2024-08-07 15:06:09', '1', NULL, '', 0),
(167, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'You?ve just demonstrated the power of contact form blasting by reading this message! The key to successful advertising is getting your ad noticed, and you?ve done exactly that - noticed my ad! Let?s amplify your reach and drive sales, followers, and YouTube views. Discover our high-volume blasting plans designed for affiliate marketers and agencies.For details, check out my website\r\n\r\nhttp://vax0hs.contactblasting.xyz', '2024-08-08 23:59:34', '1', NULL, '', 0),
(168, 'Nadya Easter', 'creatify64@gmail.com', '4839355', 'I will take care !', 'Hi ,\r\n\r\nI will help you develop your brand and digital marketing strategies over all your social media accounts\r\n\r\n\r\nchat with me now to discusee further ===> https://shorturl.at/NF2Nj\r\n\r\nRegards', '2024-08-10 14:30:54', '1', NULL, '', 0),
(169, 'Ronnie Andersen', 'andersen.ronnie@hotmail.com', '3366700528', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-08-11 13:05:27', '1', NULL, '', 0),
(170, 'Shawna Blakeley', 'blakeley.shawna@hotmail.com', '6068373166', 'Hello parvamconsultech.com Owner', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-08-12 01:17:09', '1', NULL, '', 0),
(171, 'Mike Garrison\r\n', 'mikeIngend@gmail.com', '81156363488', 'Improve your website`s ranks tot', 'Hi there, \r\n \r\nWhile checking your parvamconsultech.com for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.freeseocleanups.com/get-started/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\n \r\nRegards \r\nMike Garrison\r\n \r\nWhatsapp:https://www.freeseocleanups.com/whatapp-us/', '2024-08-14 12:21:19', '1', NULL, '', 0),
(172, 'Vincentexige', 'fabiangerrity@hotmail.com', '81819881494', 'Innovate Your Sales Approach: Se', 'Partner with https://SellAccs.net and tap into a lucrative market for buying and selling online accounts! With competitive commissions and a user-friendly platform, maximize your earnings while reshaping the digital commerce landscape. \r\n \r\n \r\nCLICK THROUGH THE NEXT WEBSITE: https://SellAccs.net', '2024-08-14 21:19:03', '1', NULL, '', 0),
(173, 'Agueda Adey', 'agueda.adey@hotmail.com', '126765618', 'To the parvamconsultech.com Owne', 'Important: \r\nYour Vetted Business listing is no longer visible because the annual verification email that we sent, was returned to us as “undeliverable”.\r\n\r\nIf the returned email was in error, you can add or update your email & listing info using the link in my signature.\r\n\r\nOnce remedied, you’ll reactivate your Vetted Directory benefits:\r\n \r\n+A robust Vetted business profile that promotes trust, transparency & credibility in your market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Local leads from consumers that use our national platform to find Vetted Businesses by category\r\n \r\nSee link in my signature to add /update your Vetted business details, and get the powerful benefits of being a Vetted business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n', '2024-08-14 22:12:43', '1', NULL, '', 0),
(174, 'Everett Lafountain', 'lafountain.everett5@yahoo.com', '9642923531', 'Hello parvamconsultech.com Webma', 'Payroll, Insurance, inventory, marketing EXPENSES ……UGHH\r\n\r\nWant to remove the stress and get some breathing room?\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-08-16 18:58:29', '1', NULL, '', 0);
INSERT INTO `contact_us` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_subject`, `contact_message`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(175, 'Flora Dalton', 'dalton.flora@googlemail.com', '3381552743', 'Hi parvamconsultech.com Webmaste', 'Important: \r\nYour Vetted Business listing is no longer visible because the annual verification email that we sent, was returned to us as “undeliverable”.\r\n\r\nIf the returned email was in error, you can add or update your email & listing info using the link in my signature.\r\n\r\nOnce remedied, you’ll reactivate your Vetted Directory benefits:\r\n \r\n+A robust Vetted business profile that promotes trust, transparency & credibility in your market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Local leads from consumers that use our national platform to find Vetted Businesses by category\r\n \r\nSee link in my signature to add /update your Vetted business details, and get the powerful benefits of being a Vetted business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n', '2024-08-18 01:39:53', '1', NULL, '', 0),
(176, 'Sergio Osterhagen', 'sergio.osterhagen@gmail.com', '818026370', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-08-18 15:37:54', '1', NULL, '', 0),
(177, 'Genesis Forsythe', 'forsythe.genesis@yahoo.com', '6137624678', 'Hi parvamconsultech.com Administ', 'Do you have big ideas and plans to update your website, but hate the outrageous fees that most agencies charge?\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', '2024-08-20 13:24:50', '1', NULL, '', 0),
(178, 'Kimber Freitag', 'kimber.freitag@yahoo.com', '218305839', 'Hello parvamconsultech.com Admin', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-08-26 15:28:14', '1', NULL, '', 0),
(179, 'Jefferey Prior', 'prior.jefferey@gmail.com', '492166776', 'Receive $100 Free Credit – Start', 'Frustrated of your site being sluggish or experiencing downtime now and then?\r\nTry Cloudways Autonomous...\r\n\r\nEasy, Powerful, Reliable & Scalable WordPress Hosting!\r\nGet a hosting solution with minimal setup, one-click management, and zero downtimes.\r\nSimply host your site and concentrate on growing your enterprise, while Autonomous does the rest!\r\n\r\n- Go Hands-off\r\n- Truly Autoscale\r\n- Remain Highly Available\r\n- Try Free With A $100 Credit\r\n\r\nTap into the capabilities of your site today: https://bit.ly/3WEGGef\r\n\r\n\r\n\r\n\r\n\r\n\r\nYou can unsubscribe by filling this form: https://bit.ly/removefrmlist\r\nBessenveldstraat 180, Mollem, VBR, Belgium, 1730', '2024-09-01 15:22:51', '1', NULL, '', 0),
(180, 'Valeron83Rat', 'kingbigmoo@gmail.com', '87945531794', 'Casino VIP ', 'Hello. \r\nTake advantage of our First Time Purchase offer! Get 10 million Gold Coins for $10 + 30 FREE Sweeps Coins. Find out more - https://dub.sh/Tm2uIwS  \r\n \r\nGood luck :)', '2024-09-02 09:34:00', '1', NULL, '', 0),
(181, 'Amelie Sceusa', 'amelie.sceusa@gmail.com', '226141159', 'Hello parvamconsultech.com Admin', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-09-02 11:07:37', '1', NULL, '', 0),
(182, 'Lenard Hyam', 'lenard.hyam@gmail.com', '322642006', 'To the parvamconsultech.com Admi', 'Tired of overpaying for simple web work and website updates?\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency with wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', '2024-09-05 14:22:08', '1', NULL, '', 0),
(183, 'Nadya Conover', 'creatify64@gmail.com', '4135659937', 'Chat GPT Making Money Guide', 'Hi ,\r\n\r\nDiscover 300+ Ways To Make Money With GPT in this Free Guide \r\n\r\nCheck my X post and get the Guide for free  ===> https://x.com/omarmohdomain/status/1831305975619305654\r\n\r\n\r\nRegards', '2024-09-05 15:34:26', '1', NULL, '', 0),
(184, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'You?ve just demonstrated the power of contact form blasting by reading this message! The key to successful advertising is getting your ad noticed, and you?ve done exactly that - noticed my ad! Let?s amplify your reach and drive sales, followers, and YouTube views. Discover our high-volume blasting plans designed for affiliate marketers and agencies.For more information, visit my site\r\n\r\nhttp://rybu9e.contactuspagemarketing.xyz', '2024-09-08 15:25:49', '1', NULL, '', 0),
(185, 'Fredric Lafountain', 'fredric.lafountain@gmail.com', '5194629065', 'Dear parvamconsultech.com Owner!', 'Payroll, Insurance, inventory, marketing EXPENSES ……UGHH\r\n\r\nWant to remove the stress and get some breathing room?\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-09-10 12:45:23', '1', NULL, '', 0),
(186, 'Mike Roger\r\n', 'info@professionalseocleanup.com', '89625659419', 'Improve your website`s ranks tot', 'Hi there, \r\n \r\nWhile checking your parvamconsultech.com for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\n \r\nRegards \r\nMike Roger\r\n \r\nWhatsapp:https://www.professionalseocleanup.com/whatsapp-us/ \r\nEmail us: info@professionalseocleanup.com', '2024-09-12 22:16:50', '1', NULL, '', 0),
(187, 'Jung Babcock', 'jung.babcock@gmail.com', '691312662', 'Hello parvamconsultech.com Admin', 'GAMIFIED VIDEOS WORK BETTER THAN OPEN AI  \r\n\r\nGet ANY Video GAMIFIED for FREE if it has over 5,000 views. ($789 Value)\r\n\r\nKeep viewers hooked, ensure full watch time, and collect their emails.\r\n\r\nSend us your video link (showing it has more than 5k views) to see if you qualify.\r\n\r\nMinimum subscriber/follower count required.\r\n\r\nTURN YOUR VIDEO INTO A VIDEO GAME TODAY.\r\n\r\nReply to me here: gamifyvideo@gmail.com\r\n\r\n\r\n\r\n', '2024-09-14 19:54:54', '1', NULL, '', 0),
(188, 'Sue McCasland', 'mccasland.sue96@gmail.com', '5159671454', 'Dear parvamconsultech.com Webmas', 'Payroll, Insurance, inventory, marketing EXPENSES ……UGHH\r\n\r\nWant to remove the stress and get some breathing room?\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', '2024-09-14 20:11:29', '1', NULL, '', 0),
(189, 'Jaqueline', 'jaqueline@parvamconsultech.com', '', 'Jaqueline Harman', 'New Multifunction Anti-theft Waterproof Sling Bag\r\n\r\nThe best ever SUPER Sling Bag: Drop-proof/Anti-theft/Scratch-resistant/USB Charging\r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED time\r\n\r\nBuy now: https://xbags.shop\r\n\r\nCheers, \r\n\r\nJaqueline', '2024-09-17 02:13:37', '1', NULL, '', 0),
(190, 'Roberta Feint', 'feint.roberta13@gmail.com', '265150789', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-09-17 08:06:36', '1', NULL, '', 0),
(191, 'Nadya Dawbin', 'dawbin.helaine@gmail.com', '240938070', 'Youtube Thumbnail', 'Hi ,\r\n\r\nCheck this Link ===>  youtubethumbnail.com\r\n', '2024-09-23 00:51:26', '1', NULL, '', 0),
(192, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'I can send your ad to 5 million sites just like I did on your contact form for less than $200 For Details: http://qwncl6.contactformblasting.xyz', '2024-09-23 16:22:30', '1', NULL, '', 0),
(193, 'Kourtney Kirton', 'kourtney.kirton@hotmail.com', '918888530', 'Dear parvamconsultech.com Owner.', 'Running a small business is not easy.\r\n\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a Working Capital Solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a friendly no obligation working capital financing quote in less than 2 minutes.\r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com\r\n', '2024-09-24 17:03:33', '1', NULL, '', 0),
(194, 'Beatrice Cobbs', 'cobbs.beatrice@gmail.com', '623635268', 'Hello parvamconsultech.com Webma', 'Running a small business is not easy.\r\n\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a Working Capital Solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a friendly no obligation working capital financing quote in less than 2 minutes.\r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com\r\n', '2024-09-27 15:15:50', '1', NULL, '', 0),
(195, 'Nadya Welton', 'welton.rolland@yahoo.com', '249796881', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\n\r\n\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-09-27 22:49:26', '1', NULL, '', 0),
(196, 'May', 'parvamconsultech.com@mail.com', '182299850', 'ParvaM Software Solutions', 'Morning \r\n \r\nDefrost frozen foods in minutes safely and naturally with our THAW KING™. \r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED \r\n\r\nBuy now: https://thawking.shop\r\n \r\nBest, \r\n \r\nMay', '2024-09-30 23:56:54', '1', NULL, '', 0),
(197, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Want to get millions of people to engage with your content on a budget?\r\n Visit: http://ty7cle.resultswithformblasting.xyz', '2024-10-01 13:46:16', '1', NULL, '', 0),
(198, 'Laurent Gustafsson\r\n', 'no-replyxxx@gmail.com', '83835285389', 'Earn 35% Commission with Our Aff', 'Hi, \r\n \r\nAre you looking to monetize your website with a high-converting affiliate program? Look no further! We’re offering 35% commission on every sale generated through our affiliate program, and we’d love for you to be a part of it. \r\n \r\nHere’s why webmasters love partnering with us: \r\n \r\n•	Generous 35% Commission: Earn big on every sale, no limits! \r\n•	High-Converting Products: We offer services that are in demand, making it easy for you to generate commissions. \r\n•	Real-Time Tracking: Monitor your earnings and performance with ease. \r\n•	Dedicated Affiliate Support: We’re here to help you succeed with tips, resources, and support whenever you need it. \r\n \r\nJoining is simple and completely free. Start earning by promoting our services to your audience today! \r\n \r\nSign Up Now and Start Earning: https://www.earn35percent.com/get-started/ \r\n \r\nIf you have any questions or need more details, feel free to reach out. We’re excited to partner with you and help you boost your earnings! \r\n \r\nBest regards, \r\nLaurent Gustafsson\r\n \r\nMonkey Digital \r\nhttps://wa.link/md1k3j', '2024-10-02 07:32:28', '1', NULL, '', 0),
(199, 'Brian And Dee Teague', 'mammie.teague@gmail.com', '7710902431', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-10-03 08:08:34', '1', NULL, '', 0),
(200, 'Florencia Leason', 'florencia.leason@gmail.com', '7149227431', 'Dear parvamconsultech.com Admin!', 'Payroll, Insurance, inventory, & advertising EXPENSES ……UGH\r\n\r\nWant some breathing room and a break from these expenses?\r\n\r\nGet a no obligation business working capital funding quote in less than 2 minutes.\r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nSend me a message at my contact info below for info\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com\r\n', '2024-10-03 16:43:03', '1', NULL, '', 0),
(201, 'Ravi Baccarini', 'claudette.baccarini@googlemail.c', '5707433506', 'Why You are not in Googles searc', 'Hi,\r\nMy name is Ravi, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n I recently grew my client’s organic search traffic  with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/yycmkjf6\r\n\r\n\r\n', '2024-10-05 14:54:27', '1', NULL, '', 0),
(202, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Want to get millions of people to notice your message economically?\r\n More Info: http://t2l05g.contactblasting-instantresults.xyz', '2024-10-06 01:06:37', '1', NULL, '', 0),
(203, 'Thank you for registering - it w', '#file_links[\"c:softotmasterase', '88532168113', 'Thank you for registering - it w', 'Thank you for registering - it was incredible and pleasant all the best http://parvamconsultech.com ladonna  cucumber', '2024-10-06 11:07:38', '1', NULL, '', 0),
(204, 'Vasily Kichigin MacDonnell', 'macdonnell.phyllis@outlook.com', '3564528519', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2024-10-07 19:30:15', '1', NULL, '', 0),
(205, 'Jens Vandermark', 'vandermark.jens@outlook.com', '3899873288', 'Hi parvamconsultech.com Admin!', 'Running a small business is not easy.\r\n\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a Working Capital Solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a friendly no obligation working capital financing quote in less than 2 minutes.\r\n\r\nUSA Based Businesses Only! \r\n\r\nGet in touch with me below for more info\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com\r\n', '2024-10-08 02:03:41', '1', NULL, '', 0),
(206, 'Caleb Heaton', 'caleb.heaton@yahoo.com', '298001221', 'Dear parvamconsultech.com Admin!', 'Do you loathe the BBB and their business model that was minted in the 1950’s?\r\n\r\nThere is a MUCH better option available that actually meets the needs of both the business owners and the consumers.\r\n\r\nIntroducing Vetted Business Credential Reports \r\n\r\nVetted Business Credential Reports allow you to host and 1 click share:\r\n\r\n+ Your Business License, Insurance & Bond\r\n+ Your Business & Professional Certifications & Accreditations\r\n+ Your Industry, Local & Trade Affiliations\r\n+ Your Trust Badges, Awards, & Associations Memberships\r\n+ Much more!\r\n\r\nGet Vetted and dominate your local market \r\nSee how Vetted can SUPERCHARGE your business with a No RISK 30 DAY FREE TRIAL \r\nSee link in my profile to learn more or to get started.\r\n\r\n\r\nWarmly,\r\n\r\nJennifer Corbitt\r\nVetted Business Report Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nJennifer.Corbitt@Vettedprobusinessusa.com\r\nhttps://www.VettedProBusinessUSA.com\r\n', '2024-10-08 22:12:55', '1', NULL, '', 0),
(207, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Need a way to get millions of people to engage with your website on a budget?\r\n Check out: http://x6j47m.contact-form-marketing.club', '2024-10-11 14:25:25', '1', NULL, '', 0),
(208, 'Brian And Dee Childers', 'stacy.childers@gmail.com', '3276479639', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-10-13 06:38:22', '1', NULL, '', 0),
(209, 'Ronny Oakley', 'marilou.oakley18@yahoo.com', '116465524', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/2s3z2ef3\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2024-10-15 12:08:44', '1', NULL, '', 0),
(210, 'Felicia Woods', 'felicia.woods@hotmail.com', '49728623', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-10-19 13:17:44', '1', NULL, '', 0),
(211, 'XRRat', 'xrumer23Rat@gmail.com', '87844315276', 'Test, just a XRumer 23 StrongAI ', 'Hello! \r\n \r\nGood cheer to all on this beautiful day!!!!! \r\n \r\nGood luck :)', '2024-10-21 02:36:09', '1', NULL, '', 0),
(212, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Want to get millions of people to notice your message economically?\r\n If you’re interested in learning more about how this works, reach out to me using the contact info below.\r\n\r\nRegards,\r\nBilly Bresnahan\r\nEmail: Billy.Bresnahan@morebiz.my\r\nWebsite: http://7ehg5u.form-marketing.top\r\nSkype: marketingwithcontactforms', '2024-10-23 15:13:22', '1', NULL, '', 0),
(213, 'JosephBuh', 'mjkwgmz85fgkc3i@tempmail.us.com', '85537861526', 'TomyAccount: The Home of Verifie', 'ToMyAccount.com is the leading provider of verified social media accounts. Our PVA accounts are crafted with care, using unique server IPs to ensure they work effectively. Whether you need accounts for business, personal use, or marketing, we’ve got the perfect solution for you. \r\n \r\nVisit Link: \r\n \r\nhttps://ToMyAccount.com \r\n \r\nThanks for Everything!', '2024-10-23 16:54:44', '1', NULL, '', 0),
(214, 'Alastair D. Pelsaert', 'pelsaert.sonya36@gmail.com', '4186416259', 'I will help you Rank in Google s', '\r\nMy name is Alastair D. i, owner of Webomaze Australia. You have finally found an SEO Company that GETS RESULTS. The proof is my 24,800+ reviews out of which 98.6% are 5-STAR REVIEWS.\r\n\r\n I recently grew my client’s organic search traffi with high google search ranking  by 166% in 4 months. We’re an SEO Company with a difference.Our focus is Customer Delight.\r\n\r\nAnd we do everything to make it a great experience of working with us. We are in touch with you at every stage of the project. Even after we deliver the project, I will support you with any query you have. \r\n\r\n\r\nContact me today and get a FREE SEO AUDIT for your website\r\n\r\nClick here to start ====> http://tinyurl.com/7ejfvwut', '2024-10-26 08:00:19', '1', NULL, '', 0),
(215, 'RobertVem', 'yasen.krasen.13+80617@mail.ru', '84937154698', 'Ofiefheufjwoidjwi hfjsfoiewhgife', 'Ojwdjiowkdeofjeij ifsfhoewdfeifhweui hieojkaskdfwjfghewejif eiwhfufdawdijwehfuihewguih jeifjeweijeruigherug parvamconsultech.com', '2024-10-27 16:53:32', '1', NULL, '', 0),
(216, 'Veronique Rech', 'rech.veronique40@gmail.com', '917703817', 'Experience Simple Powerful Hosti', 'Tired of your site being unresponsive and/or being unavailable occasionally?\r\nSwitch to Cloudways Autonomous...\r\n\r\nSimple, Powerful, Dependable & Autoscaling WordPress Hosting!\r\nGet a hosting solution with minimal setup, single-click control, and constant uptime.\r\nHost your site and focus on growing your enterprise, while Autonomous takes care of everything!\r\n\r\n- No Hands Needed\r\n- Seamless Scaling\r\n- High Availability\r\n- Try Free With A $100 Credit\r\n\r\nTap into the power of your website today: https://bit.ly/wayscloud\r\n\r\n\r\n\r\n\r\n\r\nYou can unsubscribe by filling the form: https://bit.ly/remove-url\r\nBetburweg 14, Huntsville\r\n\r\n, Texas, US', '2024-10-28 15:16:00', '1', NULL, '', 0),
(217, 'Alastair D. Kay', 'kay.becky@msn.com', '329549358', 'Do you Tiktok account ?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://shorturl.at/PQge2\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee', '2024-10-29 02:24:08', '1', NULL, '', 0),
(218, 'Mike Jan-Olof Leroy\r\n', 'mikexxxx@gmail.com', '84733715627', 'Collaboration Request', 'Hello, \r\n \r\nThis is Mike Goldman\r\n from Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://wa.link/md1k3j \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Goldman\r\n \r\nmonkeydigital.co', '2024-11-02 06:32:32', '1', NULL, '', 0),
(219, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Want to get millions of people to share your content on a budget?\r\n If you’re interested in learning more about how this works, reach out to me using the contact info below.\r\n\r\nRegards,\r\nMariana Brito\r\nEmail: Mariana.Brito@morebiz.my\r\nWebsite: http://92r85s.form-marketing.top\r\nSkype: marketingwithcontactforms', '2024-11-03 13:43:44', '1', NULL, '', 0),
(220, 'Jonathan Morris', 'info@prboostcolab.com', '12345678', 'Spotlight Your Brand on Benzinga', 'Hi there,\r\n\r\nHope you’re well.\r\n\r\nMy name is Jonathan, and I couldn’t help but admire your brand and the great work you’re doing.\r\n\r\nI wanted to present to you an exclusive opportunity: a free article on Benzinga, one of the top financial platforms with over 14M+ monthly visitors. This is a fantastic way to boost your brand’s credibility and reach.\r\n\r\nWe can publish your article on affiliates of Fox, CBS, NBC, ABC, and more than 300 other news outlets. We could even get you published on Business Insider, Yahoo Finance, and Market Watch—think of the visibility your brand could gain!\r\n\r\nThis deal is available only for the first 10 people who reply—so if you’re interested in taking advantage of your free Benzinga article, just reply with, \"\"YES, I want to be featured in Benzinga!\"\"\r\n\r\nI’d be thrilled to help your brand get the recognition it deserves.\r\n\r\nCheers,  \r\nJonathan\r\n\r\n\r\n\r\n\r\nIf you wish to stop to receive notifications from us in the future, please send a reply to this email with the phrase: \"No, thank you\".\r\n\r\n', '2024-11-04 13:53:12', '1', NULL, '', 0),
(221, 'Zoila Kline', 'zoila.kline@hotmail.com', '681261000', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-11-06 21:14:32', '1', NULL, '', 0),
(222, 'Ronny Kinsella', 'kinsella.louis@msn.com', '7865732297', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/2s3z2ef3\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2024-11-07 12:11:32', '1', NULL, '', 0),
(223, 'GeorgePoics', 'ibucezevuda439@gmail.com', '89269628648', 'Hi, i writing about   the price ', 'Hai, saya ingin tahu harga Anda.', '2024-11-07 12:18:43', '1', NULL, '', 0),
(224, 'Chelsea Hernandez', '5cv.ir.t.u.als@gmail.com', '904-717-0825', 'Don’t let tasks hold you back – ', 'Greetings\r\n\r\nIs managing repetitive tasks taking your attention away from business growth?\r\n\r\nAt 5C Virtual Assistance, we have spent 6+ years helping businesses like yours save hours each week and reduce operational costs by up to 70%. Our expert virtual assistants take over your routine tasks so you can dedicate more time to strategic growth.\r\n\r\nWhy industry leaders choose 5C Virtual Assistance: • Cost-effective: + Premium support at just $9/hour – a fraction of local hiring\r\n+ Flexibility: Scale support up or down based on your changing needs\r\n+ Experience: 6+ years serving diverse industries\r\n+ No overhead: Zero training, benefits, or office space costs\r\n+ Time-zone aligned: Seamless workflow integration with your team\r\n\r\nOur VAs excel in: \r\n- Administrative Support\r\n- Customer Service\r\n- Data Entry & Management\r\n- Calendar & Email Management\r\n- Social Media Management\r\n- Research & Reporting\r\n\r\nImagine the possibilities with an extra 20-30 hours freed up each week. Our clients typically report:\r\n+ 40% increase in productivity\r\n+ 25% improvement in customer response times\r\n+ 15+ hours saved weekly on administrative tasks\r\n\r\nReady to transform your workflow? Book a free 30-minute consultation to discuss your needs. Reply to this email or call us at [phone number].\r\n\r\n** Visit: https://bit.ly/5cvaservices\r\n\r\nBest regards,\r\nChelsea Hernandez\r\n5C Virtual Assistance\r\nhttps://bit.ly/5cvaservices\r\n\r\nP.S. Did you know? Switching to virtual assistance saves businesses an average of $3,000 monthly. Let’s discuss how we can deliver similar results for you.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2024-11-07 18:42:11', '1', NULL, '', 0),
(225, 'Brian And Dee Himmel', 'himmel.federico@outlook.com', '442265445', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-11-07 22:12:55', '1', NULL, '', 0),
(226, 'James Moreau\r\n', 'info@professionalseocleanup.com', '87739722913', 'Improve your website`s ranks tot', 'Hi there, \r\n \r\nWhile checking your parvamconsultech.com for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\nRegards \r\nMikeJames Moreau\r\n \r\nWhatsapp: https://wa.link/rx6lkm \r\nEmail us: info@professionalseocleanup.com', '2024-11-10 15:06:17', '1', NULL, '', 0),
(227, 'Chase Novak', 'novak.chase@gmail.com', '671003696', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-11-12 07:14:10', '1', NULL, '', 0),
(228, 'Vasily Kichigin Abrams', 'leroy.abrams@gmail.com', '2534474814', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2024-11-13 07:32:23', '1', NULL, '', 0),
(229, 'Cecilcrulk', 'sharonforet1900@microoremail.ru', '84449553545', 'Онлайн магазин баз для Xrumer и ', 'Лучшие базы для Xrumer и GSA Search Engine Ranker по самым лучшим ценам \r\nhttps://dseo24.monster \r\nОнлайн магазин баз для Xrumer и GSA     лучшие цены', '2024-11-13 23:40:03', '1', NULL, '', 0),
(230, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', 'ask', 'Need a way to get millions of people to read your ad on a budget?\r\n If you’re interested in learning more about how this works, reach out to me using the contact info below.\r\n\r\nRegards,\r\nHugo Lake\r\nEmail: Hugo.Lake@morebiz.my\r\nWebsite: http://p6benq.form-marketing.top\r\nSkype: marketingwithcontactforms', '2024-11-14 02:17:33', '1', NULL, '', 0),
(231, 'JohnPoics', 'somasesokiyo31@gmail.com', '88665415232', 'Hi, i wrote about   the prices', 'Dia duit, theastaigh uaim do phraghas a fháil.', '2024-11-14 22:48:50', '1', NULL, '', 0),
(232, 'Ronny Barnett', 'lilia.barnett@hotmail.com', '51996592', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/2s3z2ef3\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2024-11-16 14:07:07', '1', NULL, '', 0),
(233, 'Brian And Dee Mancuso', 'jorg.mancuso@hotmail.com', '2676445208', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-11-16 14:18:10', '1', NULL, '', 0),
(234, 'XRRat', 'xrumer23Rat@gmail.com', '84816658857', 'Test, just a XRumer 23 StrongAI ', 'Hello. \r\n \r\nGood cheer to all on this beautiful day!!!!! \r\n \r\nGood luck :)', '2024-11-17 06:25:29', '1', NULL, '', 0),
(235, 'Desmond', 'info@rackley.thebackpack.biz', '21213318', 'Desmond Rackley', 'New Multifunction Waterproof Backpack\r\n\r\nThe best ever SUPER Backpack: Drop-proof/Scratch-resistant/USB Charging/Large capacity storage\r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED time\r\n\r\nBuy now: https://thebackpack.biz\r\n\r\nAll the best, \r\n\r\nDesmond', '2024-11-18 21:07:14', '1', NULL, '', 0),
(236, 'Ardita J Howchin', 'marko.howchin@gmail.com', '887038799', 'I will setup,optimize and do pin', 'Hi,\r\nMy name is RArdita Ji, I have the skill to create a professional Pinterest presence for you. Your updated account will showcase your product, service or posts to millions of users searching for experts, boards & pins in your niche.\r\n\r\nClick here to start ====> https://shorturl.at/mbppj\r\n\r\n\r\n', '2024-11-22 08:46:06', '1', NULL, '', 0),
(237, 'Jeremy Evans', 'charlotte@businesstechgenius.com', '5551234567', 'Fireflies ai records every meeti', 'Hi\r\n\r\nFinding it hard to maximize the value of your meetings? Fireflies ai can help turn things around. It turns your meetings into actionable insights with ease.\r\n\r\nRecords, transcribes, and creates summaries seamlessly.\r\n\r\nGuarantees that no key point is overlooked.\r\n\r\nMakes past discussions instantly searchable.\r\n\r\nTry Fireflies ai for free today and make meetings effortless.\r\n\r\nSign up for free now at: https://businesstechgenius.com/FirefliesAi \r\n\r\nBest regards,\r\nJoshua\r\n\r\n\r\nIf you choose to opt-out of further correspondence from our side, kindly reply with the message: \"No thanks\"\r\nNeue Ro?Str. 61, Coxsackie, NY, USA, 70794', '2024-11-23 19:06:02', '1', NULL, '', 0),
(238, 'Nadya Siddons', 'siddons.felicia@gmail.com', '3223415690', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\n\r\n\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-11-25 14:21:00', '1', NULL, '', 0),
(239, 'JosephBuh', 'mjkwgmz85fgkc3i@tempmail.us.com', '83721527118', 'Verified Accounts for Instant Us', 'Need verified social media accounts? ToMyAccount.com is here to help. Our PVA accounts are perfect for all your online activities, created with different server IPs for maximum reliability. Shop with us for quick access and top-tier service every time you need an account. \r\n \r\nGo to Website: \r\n \r\nhttps://ToMyAccount.com \r\n \r\nI’m Indebted to You!', '2024-11-26 15:57:08', '1', NULL, '', 0),
(240, 'Ardita J Cyril', 'cyril.amie@gmail.com', '7720747365', 'I will setup,optimize and do pin', 'Hi,\r\nMy name is RArdita Ji, I have the skill to create a professional Pinterest presence for you. Your updated account will showcase your product, service or posts to millions of users searching for experts, boards & pins in your niche.\r\n\r\nClick here to start ====> https://shorturl.at/mbppj\r\n\r\n\r\n', '2024-11-26 16:36:15', '1', NULL, '', 0),
(241, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', 'enquiry', 'Want advertising that works for you while you sleep? Our automated contact form service sends your message to millions of websites, guaranteeing delivery without any extra effort. One flat rate.\r\n\r\n Feel free to contact me using the details below if you want to learn more about my approach.\r\n\r\nRegards,\r\nHelaine Dolling\r\nEmail: Helaine.Dolling@morebiz.my\r\nWebsite: http://ty565e.advertise-with-contactforms.pro\r\nSkype: marketingwithcontactforms', '2024-11-27 22:08:29', '1', NULL, '', 0),
(242, 'Aleks Plekhov', 'abc@eforum.top', '88543634278', 'Dear friend and like-minded comp', 'Have you ever thought about what kind of gift can leave a lifelong impression on a child? Today, as 100 years ago, the true treasure in the world remains the book, and in modern life - the digital book. \r\nToday, taking a break from the whirlwind of workdays for a couple of minutes, you have a unique opportunity to do a wise thing and give a book to your most beloved, your closest child, and along with the book, give the child the joy of learning about the world around him. \r\nAnd you have everything for this! \r\nSincerely yours, \r\nAleks Plekhov \r\nP.S. The ABCs of the Amazing are Nearby View books on Facebook and on Amazon \r\nhttps://www.facebook.com/abc.eforum/ \r\nView on Amazon and here Plekhov Books \r\nhttps://plekhov.top/', '2024-11-29 08:45:50', '1', NULL, '', 0),
(243, 'Alica Lim', 'alica.lim@outlook.com', '673634291', 'looking for clarification', 'Hi, this is a friendly reminder that if your business accepted Visa/Mastercard between 2004 and 2019, you may be eligible to participate in the Visa/Mastercard class action settlement, which has set aside $5.54 Billion for businesses like yours. The deadline to submit your claim quickly arrives on February 4, 2025. You must be a USA business. For assistance with filing your claim, please visit this website: https://myvisasclaim.com', '2024-11-29 14:34:54', '1', NULL, '', 0),
(244, 'Wolfgang Mallette', 'wolfgang.mallette@msn.com', '7747863501', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-11-30 08:25:08', '1', NULL, '', 0),
(245, 'MichealRed', 'raymondIngend@gmail.com', '87926682742', 'We guarantee that your emails wi', 'What’s up? parvamconsultech.com \r\n \r\nDid you know that it is possible to send proposal utterly legit? \r\nWhen such business offers are sent, no personal data is employed, and messages are dispatched to forms specifically created to securely and safely receive messages and appeals. Messages that are sent by using Feedback Forms are not considered to be spam, as they are viewed as important. \r\nWe offer you the chance to try out our service for free. \r\nWe guarantee you up to 50,000 messages. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis letter is automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2024-11-30 13:07:43', '1', NULL, '', 0),
(246, 'Ardita J Plumb', 'lucio.plumb@gmail.com', '630368197', 'I will setup,optimize and do pin', 'Hi,\r\nMy name is RArdita Ji, I have the skill to create a professional Pinterest presence for you. Your updated account will showcase your product, service or posts to millions of users searching for experts, boards & pins in your niche.\r\n\r\nClick here to start ====> https://shorturl.at/mbppj\r\n\r\n\r\n', '2024-11-30 13:13:35', '1', NULL, '', 0),
(247, 'Mike Calhoun\r\n', 'mikexxxx@gmail.com', '83472758879', 'Unlock Your parvamconsultech.com', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Calhoun\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', '2024-12-01 21:07:58', '1', NULL, '', 0),
(248, 'nghtsnw', 'jwatkins@trisian-global.com', '86914631263', 'Personalized Contact Data Extrac', 'The art of data collection made easy! Order now and receive all the essential business contacts you need. https://telegra.ph/Personalized-Contact-Data-Extraction-from-Google-Maps-10-03 (or telegram: @chamerion)', '2024-12-03 01:18:57', '1', NULL, '', 0),
(249, 'Mike Ferguson\r\n', 'mikexxxx@gmail.com', '89812724297', 'Social Ads Traffic by Country fo', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Ferguson\r\n \r\nmonkeydigital.co', '2024-12-03 22:08:40', '1', NULL, '', 0),
(250, 'Nadya Oneill', 'hayley.oneill37@gmail.com', '3678823957', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\n\r\n\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-12-04 07:17:17', '1', NULL, '', 0),
(251, 'Ayden Mack', 'webtraf.fichack.s@gmail.com', '4660116', 'Transform Your Web Into Visitor ', 'Hello,  \r\n\r\nAs you probably know, to grow your website, you need rankable keywords, quality backlinks, and targeted traffic.  \r\n\r\nWhat if there were 3 simple hacks to drive more traffic to your website, would you use them? Start 2025 by taking your website to the next level.  \r\nUsing the third hack, one of my recent posts got nearly 150,000 views in under 5 days.  \r\n\r\nThrough extensive testing and research, I’ve compiled these strategies for you  \r\n1. Specific long-tail niche KEYWORDS to rank faster on Google and methods to ensure your site gets crawled and indexed quickly.  \r\n2. A unique way to get high DA & DR BACKLINKS to make your site more appealing to search engines.  \r\n3. The best places to share your content and links to attract thousands of views and TRAFFIC to your site (join my exclusive group).  \r\n\r\nThis year, let your website achieve unprecedented growth.  \r\n\r\nUse promo code CYBER50 to get 50% off until Thursday, December 5, 2024.  \r\n\r\nCheck out https://bit.ly/webtraffichacks\r\n\r\n\r\n\r\n\r\nIf at any point you decide not to receive additional messages from our side, please reply back fill the form at https://bit.ly/unsubscribesite \r\nHoltagata 87, Drangsnes, NY, USA, 520\r\n', '2024-12-04 12:50:18', '1', NULL, '', 0),
(252, 'Mahalia Ambrose', 'mahalia.ambrose@gmail.com', '7151581209', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2024-12-05 11:46:17', '1', NULL, '', 0),
(253, 'Nadya Sulman', 'latoya.sulman82@yahoo.com', '3574480135', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\n\r\n\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-12-06 21:28:14', '1', NULL, '', 0);
INSERT INTO `contact_us` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_subject`, `contact_message`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(254, 'Lazaro Blaxland', 'blaxland.lazaro@googlemail.com', '1182276012', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-12-07 03:53:03', '1', NULL, '', 0),
(255, 'CJ Ebanks', 'a.bcmark.et.in.gservicesvpsal.es', '6887638695', 'Transform Your Operations With O', 'Hello,  \r\n\r\nWant to streamline operations, boost efficiency, and reduce expenses by outsourcing?  \r\n\r\nWe have fully equipped tech centers with a thousand-plus agent positions prepared for:  \r\n- Comprehensive Customer Support & Help Desk across voice, text, chat, and email.  \r\n- Recover and transform abandoned leads into sales opportunities.  \r\n- Virtual Assistants: Support in finance, healthcare, legal, and more.  \r\n- Boost lead generation and schedule sales appointments with Market Outreach.  \r\n\r\nAvoid hassles, let us work with you to cut costs, expand and help simplify operations!  \r\n\r\nBook your free consultation now: https://bit.ly/abcmarketinglink  \r\n\r\nRegards,  \r\nC.J. Ebanks  \r\nABC Services Webpage: https://bit.ly/abccorporate \r\n1-866-904-6927 \r\n\r\n\r\n\r\n\r\n\r\n\r\nWhenever you decide not to receive subsequent messages from me, kindly visit and fill the form at https://bit.ly/removeuspls\r\nDavidschlag 25, Blindenmarkt, NY, USA, 4600\r\n', '2024-12-07 20:13:01', '1', NULL, '', 0),
(256, 'Ardita J Luckett', 'luckett.cortez@hotmail.com', '', 'I will setup,optimize and do pin', 'Hi,\r\nMy name is RArdita Ji, I have the skill to create a professional Pinterest presence for you. Your updated account will showcase your product, service or posts to millions of users searching for experts, boards & pins in your niche.\r\n\r\nClick here to start ====> https://shorturl.at/mbppj\r\n\r\n\r\n', '2024-12-08 11:33:52', '1', NULL, '', 0),
(257, 'Carlota Prieto', 'carlota.prieto@outlook.com', '3947753877', 'To the parvamconsultech.com Owne', '������ Boost Your Sales with Client Financing!\r\nDo your clients hesitate because of upfront costs? At Client Financing (International) and Credee (Tier1 International), we offer tailored financing options to help them say \"YES\" faster. Let us handle the financing so you can focus on growing your business.\r\n\r\n������ Learn More:\r\n\r\nInternational: https://info.clientfinancing.com?fpr=kristi86\r\nTier1 International: https://kristi-ventures.credee.net/\r\n������ Reach out for details: KristiReed.Funding@gmail.com\r\n\r\n', '2024-12-08 15:58:27', '1', NULL, '', 0),
(258, 'Vasily Kichigin Amaya', 'bettina.amaya@gmail.com', '8015919636', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2024-12-09 16:36:09', '1', NULL, '', 0),
(259, 'Nadya Hakala', 'phillis.hakala@hotmail.com', '656201318', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\n\r\n\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-12-11 09:20:00', '1', NULL, '', 0),
(260, '<html><a href=\"https://u.to/uoYO', 'rostislava.kruglashova@mail.ru', '89524651893', 'NeinsNeins', 'NeinsNeinsNeinsNeinsNeins', '2024-12-12 21:03:43', '1', NULL, '', 0),
(261, 'Partizanus', 'consultoriogce@gmail.com', '84317322141', 'Personalized Contact Data Extrac', 'Looking for business contact details? Let me do the hard work for you! Get all the info you need for just $30 https://telegra.ph/Personalized-Contact-Data-Extraction-from-Google-Maps-10-03 (or telegram: @chamerion)', '2024-12-13 00:52:58', '1', NULL, '', 0),
(262, 'Nadya Inglis', 'inglis.miquel21@googlemail.com', '223018848', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\n\r\n\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-12-15 08:16:39', '1', NULL, '', 0),
(263, 'NAYUYUTY2799235NEYRTHYT', 'helennorton2005@puedemail.com', '83768689957', 'TOTYJTRT2799235TIGFHFGER', 'MERTHYTJTJ2799235MAERWETT', '2024-12-18 01:33:56', '1', NULL, '', 0),
(264, 'Earlene Holley', 'earlene.holley@hotmail.com', '3990376019', 'need help', 'Businesses that accepted Visa/Mastercard payments between 2004 and 2019 may qualify for compensation as part of the $5.54 billion class action settlement.\r\nThe deadline is fast approaching: February 4, 2025.\r\nAct now to claim your share!\r\nVisit: http://cardsettlement.top for details and filing assistance.', '2024-12-18 22:25:50', '1', NULL, '', 0),
(265, 'Mike Torsten Van Dijk\r\n', 'mikexxxx@gmail.com', '81498998859', 'Semrush links for parvamconsulte', 'Hi there \r\n \r\nHaving some bunch of links pointing to parvamconsultech.com could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Torsten Van Dijk\r\n \r\nstrictlydigital.net', '2024-12-19 02:29:33', '1', NULL, '', 0),
(266, 'Ronny Sallee', 'patti.sallee@gmail.com', '47285708', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/2s3z2ef3\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2024-12-19 08:16:26', '1', NULL, '', 0),
(267, 'Adrian Morrison', 'sherman.jannie@gmail.com', '', 'Boost Your Brand’s Visibility wi', '<h1>Contact Form Bulk Submissions</h1>\r\n\r\n<b>Just like as you got this message, we can submit your message to millions of contact forms.</b>\r\n\r\n  \r\n    Need cost-effective <b>lead generation?</b> \r\n    We specialize in <i>delivering</i> messages directly through <b>business</b> contact forms, ensuring your message <i>reaches</i> the right inboxes.\r\n  \r\n\r\n  <ul>\r\n    <li>Start reaching <b>100M</b> potential customers today, all starting from just <b>$22!</b></li>\r\n    <li>We’ll send your message to connect with <b>millions of</b> website owners/managers, that is your potential clients, driving quality traffic and leads to your site.</li>\r\n    <li>Our solution ensures your message is delivered <i>right to the source</i>, starting at just <b>$22 only.</b></li>\r\n  </ul>\r\n\r\n  <b>Let’s build brand awareness together!</b>\r\n\r\n  Need more brand <i>visibility?</i>\r\n\r\n  \r\n    <table border=\"1\" cellpadding=\"5\">\r\n      <tr>\r\n        <th>Feature</th>\r\n        <th>Benefit</th>\r\n      </tr>\r\n      <tr>\r\n        <td>Contact Form Outreach</td>\r\n        <td>Ensures your message sends to site admins and decision-makers.</td>\r\n      </tr>\r\n      <tr>\r\n        <td>Pricing</td>\r\n        <td>Starting from just <b>$22 only.</b></td>\r\n      </tr>\r\n    </table>\r\n  \r\n\r\n  ++++ <b>Check out:</b> \r\n   https://bit.ly/cfblasting\r\n  \r\n<img src=\"https://bit.ly/contact-forms-image\" alt=\"Bulk Form Submissions\" style=\"width: 400px; height: auto;\">\r\n\r\n\r\n<img src=\"https://bit.ly/the-new-image\" alt=\"\" style=\"display:none;\" width=\"3\" height=\"2\">\r\n\r\n\r\n\r\n\r\n\r\n\r\nIf you wish to stop getting subsequent communications from this email, kindly <b>use</b> <a href=\"https://bit.ly/nowremove\" target=\"_blank\">the provided link\r\n    </a>\r\n', '2024-12-22 06:40:34', '1', NULL, '', 0),
(268, 'AmeliaPoics', 'yawiviseya67@gmail.com', '88449337133', 'Hello  i am writing about your  ', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', '2024-12-22 13:08:42', '1', NULL, '', 0),
(269, 'Nadya Collado', 'collado.edison@gmail.com', '7080555872', 'Get Your AI Chatbot, Website, or', 'Hi ,\r\n\r\n\r\nI will help to build chatbot with the power of AI & help you to integrate in your desired platform (mobile app, website, desktop app).\r\n I have 3+ years of experience in building multiple chatbots. You can always check our portfolio. \r\nBelow are the services that we offer in this gig:\r\n\r\nIn-demand:\r\n\r\nCustom GPT Integration (Trained on GPT Builder)\r\nCustom chatbot trained on your dataset\r\nDocument Question Answering Chatbot\r\nAI Website\r\nAI Web App\r\nAI Saas\r\n\r\nJump over to video counsltation and lets chat about your needs  ====>  https://shorturl.at/VE4dm', '2024-12-23 04:05:55', '1', NULL, '', 0),
(270, 'Brian And Dee Port', 'port.gordon72@gmail.com', '7946587783', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2024-12-23 04:50:12', '1', NULL, '', 0),
(271, 'Mike Kristian Jacobs\r\n', 'mikexxxx@gmail.com', '87192197466', 'Unlock Your parvamconsultech.com', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Kristian Jacobs\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', '2024-12-25 17:47:20', '1', NULL, '', 0),
(272, 'David Pethebridge', 'david.pethebridge@gmail.com', '157412220', 'need information', 'Don’t Let Upfront Costs Drive Clients Away. Are you losing business because clients can’t afford the upfront costs? Without flexible financing options, you risk losing valuable opportunities. Let Client Financing and Credee help you secure more clients by making your services more affordable and accessible.\r\n\r\nDon’t miss out—act now before your competitors do!\r\n������ Unlock these advantages:\r\n\r\nMore client approvals\r\nFaster decision-making\r\nA seamless process for you and your clients\r\n������ Get started:\r\n\r\nhttp://hcjgbk.credeefastapproval.top\r\nhttp://he3kfe.clientfinancing-quickapproval.top', '2024-12-28 14:47:39', '1', NULL, '', 0),
(273, 'Omar Elias', 'elias.nicole@gmail.com', '6641252767', 'Thank you Elon Musk!', 'Hi ,\r\nPlease Stop use emails for Marketing to reach your clients , use X (Twetter) instead , you can use this tool to send bulk X Dm  and forget landing in spam or waste you emails for no reply \r\n\r\nLet me show  this tool how it works let start Free Demo here ==> https://shorturl.at/G53lh\r\n\r\nRegards', '2024-12-29 08:01:07', '1', NULL, '', 0),
(274, 'Dewayne Howell', 'howell.dewayne@msn.com', '', 'looking for clarification', 'Get your message in front of millions without breaking the bank. Our service guarantees delivery to website contact forms for one affordable flat rate. No per click charges ever. Start today and grow your audience.\r\n\r\n If you’re interested in learning more about how this works, reach out to me using the contact info below.\r\n\r\nRegards,\r\nDewayne Howell\r\nEmail: Dewayne.Howell@uniqueadvertising.pro\r\nWebsite: http://x2dahg.advertiseviaforms.my\r\n', '2024-12-29 20:55:58', '1', NULL, '', 0),
(275, 'Gary Charles', 'gary_charles@dominatingkeywords.', '8054002077', 'DominatingKeywords.com', 'I am not offering you SEO, nor PPC.\r\nThis is something completely different.\r\nJust send us keywords of your interest and your website banner instantly appears number one on Google and Bing search results without Pay Per Click charges.\r\nLet me show you how it works and you will be pleasantly surprised by the results. ', '2024-12-29 23:15:03', '1', NULL, '', 0),
(276, 'Erick Burke', 'enquiries@comfortcoachhire.com', '7843565392', 'quick question', 'Planning a group trip? Choose Comfort Coach Hire for:  \r\n- Comfortable travel with a modern fleet.  \r\n- Safe, professional drivers.  \r\n- Flexible options for any budget.  \r\n\r\nEmail us now to get your free quote: **enquiries@comfortcoachhire.com**  \r\n', '2024-12-31 02:30:19', '1', NULL, '', 0),
(277, 'Ardita J Filler', 'filler.barrett@gmail.com', '672607055', 'I will setup,optimize and do pin', 'Hi,\r\nMy name is RArdita Ji, I have the skill to create a professional Pinterest presence for you. Your updated account will showcase your product, service or posts to millions of users searching for experts, boards & pins in your niche.\r\n\r\nClick here to start ====> https://shorturl.at/mbppj\r\n\r\n\r\n', '2025-01-01 07:25:30', '1', NULL, '', 0),
(278, 'Omar Mullah', 'mullah.antje@gmail.com', '4239428', 'How  I close 10 k clients', 'Hi ,\r\nCheck out my secret way for clients outreach and how you can close 10k clients \r\n\r\ncheck this post on X : https://x.com/omarmohdomain/status/1874432303554085282', '2025-01-01 13:26:41', '1', NULL, '', 0),
(279, 'MasonPoics', 'ebojajuje04@gmail.com', '84591427853', 'Hallo, i writing about   the pri', 'Sveiki, aš norėjau sužinoti jūsų kainą.', '2025-01-02 05:47:59', '1', NULL, '', 0),
(280, 'Mike Giinter Nilsson\r\n', 'mike@monkeydigital.co', '87729693297', 'Social Ads Traffic by Country fo', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Giinter Nilsson\r\n \r\nmonkeydigital.co', '2025-01-02 22:57:55', '1', NULL, '', 0),
(281, 'Omar McMurtry', 'freddie.mcmurtry32@msn.com', '', 'How to send bulk X  ( twitter) f', 'Hi ,\r\nStart Send bulk X (twitter) Dm 500 dm /day Free  in Simple 3 step system\r\n\r\n1- sign up & create  your account  with this link : https://shorturl.at/EYhaw\r\n2-Tell the tool about your self\r\n3-connect your X account \r\n\r\nAnd happy bulk sending \r\n', '2025-01-04 07:50:32', '1', NULL, '', 0),
(282, 'Ronny Remley', 'remley.ernestina@gmail.com', '283213627', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/2s3z2ef3\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2025-01-04 10:25:09', '1', NULL, '', 0),
(283, 'Russell Olsen', 'd.osbor.ne.len.ds2025@googlemail', '', 'Unlock Your Potential With Fast ', 'Hey there,\r\n\r\nWould your business thrive with access to extra working capital or tailored financing solutions?\r\n\r\nOur expertise lies in delivering quick, straightforward funding solutions customized for your business.\r\n\r\nExplore our tailored funding options:\r\n - Lines of Credit and Term Loans to handle expenses and drive growth.\r\n - SBA and Working Capital Loans for seamless operations.\r\n - Commercial and Equipment Financing to facilitate necessary upgrades.\r\n - Revenue-based Merchant Cash Advances for greater flexibility.\r\n\r\nWhat Sets Us Apart?\r\n - Simple Application Process: A one-page form gets you started.\r\n - Quick Approvals: Get approved in as little as 24 hours with funding up to $5 million.\r\n - Flexible Requirements: No minimum FICO score—your business performance matters most.\r\n\r\nWhat You’ll Need:\r\n - Your business should be at least 6 months old.\r\n - A business bank account is required.\r\n - Gross monthly revenue of $5,000 or more.\r\n\r\nExcited to see how we can assist in achieving your goals? \r\nVisit https://bit.ly/BLNFunding or shoot us an email to get started today.\r\n\r\n\r\n\r\n\r\n\r\nIf at any point you no longer wish to get emails from us, please write back to this communication and include \"No Thank You\".\r\nSchachterlweg 61, Irvington, NY, USA, 3042', '2025-01-06 06:56:45', '1', NULL, '', 0),
(284, 'Teddy Glockner', 'glockner.teddy@yahoo.com', '483903855', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-01-06 13:44:42', '1', NULL, '', 0),
(285, 'Ardita J Blubaugh', 'blubaugh.don89@gmail.com', '', 'I will setup,optimize and do pin', 'Hi,\r\nMy name is RArdita Ji, I have the skill to create a professional Pinterest presence for you. Your updated account will showcase your product, service or posts to millions of users searching for experts, boards & pins in your niche.\r\n\r\nClick here to start ====> https://shorturl.at/mbppj\r\n\r\n\r\n', '2025-01-06 14:01:41', '1', NULL, '', 0),
(286, 'Claudine Porter', 'info@globalwidepr.com', '12345678', 'Let’s Transform Your Brand – Fre', 'Hey,  \r\n\r\nHave you ever thought about how media exposure could transform your business?  \r\n\r\nWith Global Wide PR, we help businesses build credibility and attract new customers via features on leading media platforms.  \r\n\r\nTo give you a taste of what’s possible, we’re giving away a free feature on Digital Journal—a straightforward method to improve your brand’s image and exposure.  \r\n\r\nFor those aiming to go even further, we can also publish your article on major networks like Yahoo Finance, Market Watch, and AP News.  \r\n\r\nIf you’re interested, reply \"\"FREEPR\"\" and I’d be happy to share more details.  \r\n\r\nBest wishes,  \r\nClaudine \r\nGlobal Wide PR\r\n\r\n\r\nIf you no longer wish to receive our emails, we’ve made it quick and easy. Go to https://bit.ly/form-unsubscribe and fill in your website information.', '2025-01-07 17:37:01', '1', NULL, '', 0),
(287, 'Ronny Bertram', 'bertram.bonita@googlemail.com', '554060779', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/2s3z2ef3\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2025-01-10 14:22:30', '1', NULL, '', 0),
(288, 'Maybell Jernigan', 'jernigan.maybell@yahoo.com', '7774943738', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-01-14 07:03:48', '1', NULL, '', 0),
(289, 'Ardita J Bolton', 'bolton.roger@gmail.com', '3666860482', 'I will setup,optimize and do pin', 'Hi,\r\nMy name is RArdita Ji, I have the skill to create a professional Pinterest presence for you. Your updated account will showcase your product, service or posts to millions of users searching for experts, boards & pins in your niche.\r\n\r\nClick here to start ====> https://shorturl.at/mbppj\r\n\r\n\r\n', '2025-01-16 00:11:19', '1', NULL, '', 0),
(290, 'Christian Parmis', 'christian.parmis@certn.co', '7787172414', 'Urgent Employment Verification', 'Good day ParvaM Software Solutions,\r\n\r\nI hope this email finds you well! I work for Certn, a Canadian background check company and I am wondering if there is an HR or payroll department that I can get in touch with now and in the future for employment verifications. As I have a candidate who has listed your company as part of their employment history and I am looking to verify that information.  \r\n \r\nI look forward to hearing back from you!  \r\n\r\nThank you,', '2025-01-16 17:01:29', '1', NULL, '', 0),
(291, 'GeorgePoics', 'ibucezevuda439@gmail.com', '83921581282', 'Hello    writing about your   pr', 'Salut, ech wollt Äre Präis wëssen.', '2025-01-16 17:25:00', '1', NULL, '', 0),
(292, 'WlasowBestesKn', '14777@loves-ltd.com', '89834794777', 'seo интернет air force online ww', 'Приветствуем вас, коллеги, на вашем интернет-сайте! \r\n \r\nК вам обращается агентство по СЕО продвижению XRumer Inc. \r\n \r\nВаш портал, как можно отметить, только набирает обороты. Чтобы ускорить процесс его роста, готовы предложить услуги по внешней СЕО-оптимизации. У нас есть недорогие и качественные инструменты для СЕО-специалистов. У нас серьезный опыт, в арсенале присутствуют реальные рабочие кейсы - если интересует, покажем по запросу. \r\n \r\nМы готовы предложить скидку 10% на все услуги. \r\n \r\nУслуги нашей компании: \r\n \r\n- Подьем позиций в Yandex LLC - Телеграм групп, Инстаграм,  Вконтакте  - 1,2-2500рублей \r\n \r\n- Емаил рассылка: 10000 сообщений - 1000руб \r\n \r\n- Размещаем вечные трастовые ссылки (требуется любому сайту) – от 1,5 до 5000 р \r\n \r\n- Трастовые безанкорные ссылки (2500 штук) (полезно любым сайтам) – 3900 р \r\n \r\n- Качественный прогон по 110 000 сайтам в зоне RU (очень полезно для сайтов) – 2.900 р \r\n \r\n- Размещение 150 постов в VK про ваш сайт (отличная реклама) – 3.900 руб \r\n \r\n- Публикации о вашем сайте на 300 форумах (мощнейшая раскрутка ресурса) – 29000 руб \r\n \r\n- Супер Постинг – отличный прогон по 3 млн площадок (мощнейшее размещение для вашего сайта) – 39 900 рублей \r\n \r\n- Рассылка рекламных сообщений по сайтам с помощью обратной связи – договорная стоимость, будет зависеть от объема. \r\n \r\nОбращайтесь, подскажем по любому вопросу. \r\n \r\n \r\nОплата: Yoo.Money, Bitcoin, МИР, СБП, Visa, MasterCard... \r\nПринимаем USDT - Отчётность. \r\nТелега: https://t.me/exrumer \r\nSkype: Loves.Ltd \r\n \r\nТолько этот.', '2025-01-19 07:24:02', '1', NULL, '', 0),
(293, 'Lorraine Shivers', 'shivers.lorraine@googlemail.com', '4343301', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-01-19 13:25:08', '1', NULL, '', 0),
(294, 'RobertPoics', 'ixutikob077@gmail.com', '89763711794', 'Hello    writing about     price', 'Hej, jeg ønskede at kende din pris.', '2025-01-19 22:11:45', '1', NULL, '', 0),
(295, 'Brian And Dee Reidy', 'dana.reidy25@msn.com', '3457667001', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/pxj2ynka\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2025-01-20 08:30:52', '1', NULL, '', 0),
(296, 'Spartak Christensen', 'baldridge.kit94@gmail.com', '6462365875', 'Coffee Aficionados Are Obsessed ', 'Hi,\r\n\r\nI hope this message finds you well. My name is Spartak as an official distributor of Pavin Caffè, a renowned Italian coffee roaster with a legacy dating back to 1950, I’m excited to introduce you to a coffee experience that surpasses even the most recognized brands like Illy.\r\n\r\nCheck it out now: https://bit.ly/pavincaffe\r\n\r\nWhat Sets Pavin Caffè Apart?\r\n • Artisanal Roasting Techniques: We blend tradition with modern technology, ensuring each batch delivers optimal flavor and aroma.\r\n • Premium Bean Selection: Only the finest beans are used, resulting in a rich, smooth taste that embodies the true essence of Italy.\r\n • Diverse Product Range: From signature blends to single-origin selections, there’s a perfect match for every coffee lover.\r\n\r\nAs the official distributor, I’d be delighted to discuss special pricing for large wholesale orders tailored to your needs.\r\n\r\nLet me know if you’re interested in samples or more details on wholesale opportunities.\r\n\r\nWarm regards,\r\n\r\nSpartak | Owner\r\nEmail: Spartak@pavincaffe.us\r\nWebsite: https://bit.ly/pavincaffe\r\n215 Thompson St\r\nNew York, NY 10012\r\n646 236 5875\r\nreply no in subject line if you’d like to not receive any further communication', '2025-01-21 04:45:45', '1', NULL, '', 0),
(297, 'Mathias Norriss', 'mathias.norriss@msn.com', '3654885097', 'A little confused—need help!', 'Looking to speed up your work process? Forget about the endless hours spent creating content. These AI tools help you save time and get results fast: \r\n**Create professional videos in minutes  \r\n**Generate high-quality content effortlessly  \r\n**Convert text into speech with ease  \r\nSave time and stress less! http://3amazingaitools.top/\r\n', '2025-01-21 15:12:36', '1', NULL, '', 0),
(298, 'Mike Charlie Jensen\r\n', 'info@speed-seo.net', '87265675746', 'Unlock Your parvamconsultech.com', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Charlie Jensen\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', '2025-01-23 14:37:15', '1', NULL, '', 0),
(299, 'Gudrun Downie', 'gudrun.downie49@gmail.com', '6127735953', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > https://tinyurl.com/3ckxfu2c\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-01-25 08:44:17', '1', NULL, '', 0),
(300, 'Thao Boake', 'thao.boake@gmail.com', '608067570', 'website', 'Hi Parvamconsultech \r\n\r\nWe would love to talk to you about some sample leads for your company, please come and have a chat with us for website and get an instant sample of clients..\r\n\r\n<a href=\"https://pcxleads.com\">PCXLeads.com </a>\r\n\r\nThao', '2025-01-27 18:11:48', '1', NULL, '', 0),
(301, 'Nathaniel Jackson', 'hong.cortney32@gmail.com', '490321700', 'Get Up to 100K in Startup Capita', 'Easy Funding & Business Loan.\r\n\r\nDiscover powerful financial solutions to accelerate your business in 2025!\r\n\r\nHere’s how you benefit:  \r\n- Access tailored financial solutions designed to meet your individual business needs.  \r\n- Scale your business rapidly with business-friendly financing.  \r\n - Apply with zero paperwork and no delays.  \r\n- Benefit from expert guidance to understand the complexities of business financing.\r\n\r\n++ Get your funding: https://bit.ly/bestfundingnow now\r\n\r\nDiscover powerful financial solutions to boost your business in 2025!\r\n\r\nDiscover how you can:  \r\n- Get smart funding solutions crafted to fit your company’s financial goals.  \r\n- Secure funding that grows with you, ensuring long-term success.  \r\n - Apply with reduced paperwork and no stress.  \r\n- Benefit from expert guidance to navigate the complexities of business financing.\r\n\r\n++ Get your funding: https://bit.ly/bestfundingnow now', '2025-01-29 17:40:37', '1', NULL, '', 0),
(302, 'Mike Dirk Thomas\r\n', 'mike@monkeydigital.co', '89392787693', 'Social Ads Traffic by Country fo', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Dirk Thomas\r\n \r\nmonkeydigital.co', '2025-01-30 06:53:42', '1', NULL, '', 0),
(303, 'IslaPoics', 'yawiviseya67@gmail.com', '82733666966', 'Hi  i writing about   the price', 'Hi, kam dashur të di çmimin tuaj', '2025-02-01 15:37:50', '1', NULL, '', 0),
(304, 'Evan Trumper', 'trumper.evan@msn.com', '7845711714', 'wondering', 'Want results without the usual marketing costs? Send your ad text to millions of website contact forms. One flat rate, no hidden charges, and guaranteed visibility.\r\n\r\n Contact me at the details below if you’d like to explore this further.\r\n\r\nRegards,\r\nEvan Trumper\r\nEmail: Evan.Trumper@uniqueadvertising.pro\r\nWebsite: http://ksxule.marketing-with-contactforms.top\r\n', '2025-02-01 20:10:52', '1', NULL, '', 0),
(305, 'Kaylee Clark', 'canipe.sal@gmail.com', '3198449794', 'The Deadline That Could Cost You', 'Fast Track Your Refund with the Self-Employed Tax Credit\r\n\r\nNow is the time for self-employed individuals to claim their savings. The SETC program won’t last forever—claim your refund while you can!\r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\nHere’s why you can’t wait:\r\n- Claim hidden tax credits you may not even know exist.  \r\n- Receive your refund within 5-7 days of submitting your SETC application.  \r\n\r\n+ With tax credits expiring in April 2025, acting now is critical. Don’t leave money on the table!  \r\n\r\n* Why This Matters to You:\r\n- This could be the refund that transforms your finances.  \r\n- Claiming your refund has never been simpler or quicker.  \r\n\r\nTurn Q1 2025 into your most profitable quarter.\r\n\r\nBegin your journey to financial relief today!  \r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\n\r\n\r\n\r\nShould you wish to stop getting notifications from me anymore, just fill the form at https://bit.ly/unsubscribe-form-1 with your website url.', '2025-02-02 19:18:19', '1', NULL, '', 0),
(306, 'OscarPoics', 'ebojajuje04@gmail.com', '82393673248', 'Hello  i wrote about your   pric', 'Hej, jeg ønskede at kende din pris.', '2025-02-04 00:16:04', '1', NULL, '', 0),
(307, 'Palma Oliphant', 'rivada1238@ostinmail.com', '248233586', 'Not Acceptable!', 'Hey! \r\n\r\nLooking for long lost friends? Employees working at a certain company? Clients for your company ? Come try out our people and company search for free!\r\n\r\nhttps://marketingiii.com/Parvamconsultech', '2025-02-04 03:15:20', '1', NULL, '', 0),
(308, 'AmandaHackBeefb', 'amandaarcadimac@gmail.com', '87614582661', 'I want to feel the heat between ', 'Let’s see how far we can take this tonight  -  https://rb.gy/es66fc?pritly', '2025-02-04 12:23:20', '1', NULL, '', 0),
(309, 'Vasily Kichigin Baier', 'baier.louann@googlemail.com', '9424933075', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2025-02-04 18:43:50', '1', NULL, '', 0),
(310, 'Ingrid Bankston', 'rivada1238@ostinmail.com', '417064060', 'Ever Wondered How to Get Google ', 'Hi there,\r\n\r\nThere’s a little-known trick that could make Google your best friend in just minutes. \r\n\r\nIf you’ve ever wanted more free traffic for your offers, this might be what you’re looking for https://marketingeee.com', '2025-02-04 23:23:27', '1', NULL, '', 0),
(311, 'Samantha Smith', 'menge.jack@msn.com', '7800015077', 'Your Guide to Tax Credits in 202', 'Fast Track Your Refund with the Self-Employed Tax Credit\r\n\r\nIf you’re self-employed, this is your moment to save big. The Self-Employed Tax Credit (SETC) program is winding down, but there’s still time to claim the refund you deserve!\r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\nHere’s why you can’t wait:\r\n- Claim hidden tax credits you may not even know exist.  \r\n- Get your refund in just 5-7 days after submitting your SETC packet.  \r\n\r\n+ Don’t wait! Tax credits end in April 2025, so act fast. Don’t leave money on the table!  \r\n\r\n* Why This Matters to You:\r\n- This could be the refund that transforms your finances.  \r\n- It’s faster and easier than ever to get what you’re owed.  \r\n\r\nMake Q1 2025 the year you maximize your earnings.\r\n\r\nStart your SETC process today!  \r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\n\r\n\r\n\r\nIn case you wish to stop receiving notifications from this address again, please fill the form at https://bit.ly/unsubscribe-form-1 with your website url.', '2025-02-08 04:13:30', '1', NULL, '', 0),
(312, 'Rosemary Keefer', 'keefer.rosemary63@gmail.com', '408502986', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > \r\n\r\nhttps://shorturl.at/C2Nl9\r\n\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-02-09 14:35:33', '1', NULL, '', 0),
(313, 'Yasuhiro Yamada', 'rohtopharmaceutical@via.tokyo.jp', '84739411635', 'Re: Remote Job Opportunity with ', 'Greetings, Mr./Ms. \r\n \r\nWith all due respect. We are looking for a Spokesperson/Financial Coordinator for ROHTO Pharmaceutical Co., Ltd. based in the USA, Canada, or Europe. This part-time role offers a minimum $5k salary and requires only a few minutes of your time daily. It will not create any conflicts if you work with other companies. If interested, please contact apply@rohtopharmaceutical.com \r\n \r\nBest regards, \r\nYasuhiro Yamada \r\nSenior Executive Officer \r\nhttps://rohtopharmaceutical.com/', '2025-02-10 01:33:34', '1', NULL, '', 0),
(314, 'Claudine Patterson', 'info@globalwidepr.com', '12345678', 'Be the Star of Digital Journal –', 'Hi,\r\n\r\nYour brand deserves to stand out, and we’re here to help.\r\n\r\nAt Global Wide PR, we specialize in connecting businesses with top media platforms to increase visibility and credibility. As a gesture to get started, we’re offering a free article on Digital Journal—a great way to showcase your business to a wider audience.\r\n\r\nFor those looking to maximize exposure, we can also feature your brand on affiliates of FOX, NBC, CBS, ABC, and 300+ other sites for just $297. These placements can help you build trust and attract new customers.\r\n\r\nTo take advantage of this opportunity, click the link below to sign up on our site, and we’ll get back to you ASAP:\r\nhttps://bit.ly/globalwidepr\r\n\r\nLooking forward to helping your brand shine!\r\n\r\nBest regards,\r\nClaudine\r\nGlobal Wide PR\r\n\r\n\r\nWe understand that you might prefer not to receive our updates. To opt out of our emails, please submit the form here with your website address: https://bit.ly/unsubscribemeurl', '2025-02-10 13:39:32', '1', NULL, '', 0),
(315, 'Mike Ralf Thomas\r\n', ' check-message4682@gmail.com', '85445523828', 'Semrush links for parvamconsulte', 'Hi there \r\n \r\nHaving some bunch of links pointing to parvamconsultech.com could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Ralf Thomas\r\n \r\nstrictlydigital.net \r\ninfo@strictlydigital.net', '2025-02-16 23:05:27', '1', NULL, '', 0),
(316, 'Mike Helmut Smit\r\n', ' check-message3654@gmail.com', '81292668422', 'Collaboration Request', 'Hello, \r\n \r\nThis is Mike Jenkin\r\nfrom Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Helmut Smit\r\n \r\nmonkeydigital.co \r\nmike@monkeydigital.co', '2025-02-17 07:14:18', '1', NULL, '', 0),
(317, 'Conrad Bushby', 'conrad.bushby@hotmail.com', '266922636', 'looking for clarification', 'Get your message in front of millions without breaking the bank. Our service guarantees delivery to website contact forms for one affordable flat rate. No per click charges ever. Start today and grow your audience.\r\n\r\n Reach out today to find out how this works—my info is below.\r\n\r\nRegards,\r\nConrad Bushby\r\nEmail: Conrad.Bushby@freshnewleads.my\r\nWebsite: http://fe5ezq.contactformads.top\r\n', '2025-02-19 04:17:01', '1', NULL, '', 0),
(318, 'Vasily Kichigin Serle', 'kerri.serle@gmail.com', '647986933', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://shorturl.at/p9jus\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2025-02-19 15:57:14', '1', NULL, '', 0),
(319, 'Mike Svein Dupont\r\n', ' check-message2652@gmail.com', '87615228672', 'Unlock Your parvamconsultech.com', 'Hi, \r\n \r\nInterested in how your online presence is ranking? \r\nDiscover its pros and cons with our Free SEO Check Tool! \r\n \r\nIn just a couple of minutes, you’ll get a comprehensive analysis of your search performance and steps to help improve your search position. \r\n \r\nTake the first step towards stronger SEO and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues damage your rankings. \r\nFix your website today and outrank competitors in search results! \r\n \r\nNeed more info? Whatsapp with a SEO expert: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nWishing you success, \r\n \r\n \r\nMike Svein Dupont\r\n \r\nSpeed SEO \r\nPhone/WhatsApp: +1 (833) 454-8622 \r\nEmail: info@speed-seo.net', '2025-02-19 19:06:50', '1', NULL, '', 0),
(320, 'Armand Minnis', 'armand.minnis94@gmail.com', '9179479427', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > \r\n\r\nhttps://shorturl.at/C2Nl9\r\n\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-02-20 00:45:34', '1', NULL, '', 0),
(321, 'RaymondFlief', 'raymondIngend@gmail.com', '89353176283', '', 'What’s up? parvamconsultech.com \r\n \r\n \r\n  \r\n \r\n \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2025-02-20 07:48:23', '1', NULL, '', 0),
(322, 'Dotty Pye', 'pye.dotty@hotmail.com', '353734084', 'questioning', 'Want to generate amazing content? Need videos or text-to-speech? Check out these 3 Amazing AI Tools: \r\n**Create stunning videos  \r\n**Produce written content quickly  \r\n**Convert text to realistic speech  \r\nGet started today! http://3amazingaitools.top/\r\n', '2025-02-22 14:13:39', '1', NULL, '', 0),
(323, 'Brian And Dee Beauregard', 'beauregard.christen@hotmail.com', '97248369', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://shorturl.at/so4jb\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2025-02-23 12:27:43', '1', NULL, '', 0),
(324, 'AmandaHackBeefb', 'amandaarcadimab@gmail.com', '86334527252', 'My thoughts are wild, and they’r', 'Can you guess what I’m craving right now?  -  https://rb.gy/es66fc?pritly', '2025-02-24 13:04:07', '1', NULL, '', 0),
(325, 'Mike Hugo Karlsson\r\n', 'info@professionalseocleanup.com', '86991917228', 'Improve your website`s ranks tot', 'Hi there, \r\n \r\nWhile checking your parvamconsultech.com for its ranks, I have noticed that \r\nthere are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nAsk us how we do it: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nRegards \r\nMike Hugo Karlsson\r\n \r\nPhone: +1 (855) 221-7591', '2025-02-25 05:22:29', '1', NULL, '', 0),
(326, 'Apple Inc. 2025. All rights rese', 'e.xp.ans.e.uyor.acl.e.7.1@gmail.', 'Apple Inc. 2025. All rights rese', 'Apple Inc. 2025. All rights rese', '', '2025-02-28 15:22:34', '1', NULL, '', 0),
(327, 'Mike Simon Larsen\r\n', 'mike@monkeydigital.co', '89547148965', 'Collaboration Request', 'Hi, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am reaching out regarding a mutual opportunity. \r\n \r\nHow would you like to feature our promotions on your site and link back via your unique referral link towards popular services from our website? \r\n \r\nThis way, you earn a solid 35% profit share, every month from any purchases that generate from your site. \r\n \r\nThink about it, everyone benefit from SEO, so this is a big opportunity. \r\n \r\nWe already have 12k+ affiliates and our commissions are sent every month. \r\nRecently, we paid out $27280 in affiliate earnings to our partners. \r\n \r\nIf you want in, kindly message us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr register today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nBest Regards, \r\nMike Simon Larsen\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-03-01 18:45:57', '1', NULL, '', 0),
(328, 'DuweewHaf', 'rew33@donetsk365.ru', '89448351147', 'https://don-coffee.com/remont/', '<a href=https://domcoffee.site>fuck off bitch  щдюхи вонючие пезды </a> \r\ndomcoffee.site  <a href=https://domcoffee.site> щдюхи вонючие пезды</a> \r\n+zwz4753674   <a href=https://domcoffee.site> fucking porno video</a> \r\n+zwz4753674', '2025-03-02 07:06:41', '1', NULL, '', 0),
(329, 'SignsDync', 'y.a.n.v.orobey.94@gmail.com\r\n', '83886692414', 'Signature', 'Crafting the perfect signature takes expertise. Our professionals specialize in <a href=https://www.pinterest.com/pin/969188782567356827/>sign creation</a>, offering customized solutions for personal and business use. Whether you need a digital autograph, a calligraphy-style design, or a signature for official documents, we ensure an artistic and professional result. Get a signature that speaks for you and enhances your identity today!', '2025-03-02 19:14:46', '1', NULL, '', 0),
(330, 'AmandaHackBeefa', 'amandaarcadima2@gmail.com', '87263824129', ' Looking for me? ', ' I think we could get along! Let’s talk?  \r\n \r\nMessage me there! ---> https://rb.gy/44z0k7?pritly', '2025-03-02 19:42:02', '1', NULL, '', 0),
(331, 'Matthewflene', 'metabrez@gmx.de', '85365794131', 'We offer 100 mg Generic Viagra® ', 'Trusted by Over 40,933 Men Across the U.S. \r\n \r\nAffordable ED Treatment No Catch \r\n \r\nWe offer 100 mg Generic Viagra® and 20 mg Generic Cialis® for just $0.45 per dose—a price that’s up to 97% less than the big brands. \r\n \r\nHow do we do it? By building our direct-to-patient platform from scratch and sourcing medication directly from the manufacturer, we cut out the middlemen and pass the savings on to you. No hidden fees, no markups—just proven ED treatments at an unbeatable price. \r\n \r\nhttps://cutt.ly/teX52Bd3 \r\nhttps://cutt.ly/geMsuEqP \r\nhttps://telegra.ph/Ordering-Viagra-from-an-online-pharmacy-12-25', '2025-03-05 00:23:05', '1', NULL, '', 0);
INSERT INTO `contact_us` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_subject`, `contact_message`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(332, 'Mike Per-Olof Bertrand\r\n', 'info@digital-x-press.com', '87276314156', 'Get More Traffic with Monthly SE', 'Greetings, \r\n \r\nI know that many have difficulty to grasp that organic ranking growth takes patience and a well-planned ongoing investment. \r\n \r\nUnfortunately, very few site owners have the determination to wait for the gradual yet business-changing gains that can elevate their company. \r\n \r\nWith frequent SEO changes, a steady, commitment to SEO is essential for securing a positive ROI. \r\n \r\nIf you believe this as the most effective approach, partner with us! \r\n \r\nExplore Our SEO Growth Packages \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nContact Us on Instant Messaging \r\nhttps://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe deliver measurable growth for your SEO spend, and you will appreciate choosing us as your digital agency. \r\n \r\nLooking forward, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-03-06 18:33:12', '1', NULL, '', 0),
(333, 'Stacy Sperling', 'sperling.stacy@outlook.com', '', 'question', 'BOOST YOUR BUSINESS WITH TRUSTPILOT REVIEWS!\r\n\r\nWant to enhance your business reputation and attract more customers?\r\nTrustpilot reviews can help you build credibility and drive targeted\r\nvisitors and leads.\r\n\r\n WHY REVIEWS MATTER:\r\n* Customers check reviews before making a decision.\r\n* A strong reputation sets you apart from competitors.\r\n* Positive reviews increase trust and conversions.\r\n\r\nWHAT WE OFFER:\r\n✔ Fast & Reliable Delivery\r\n✔ High-Quality, Authentic Reviews\r\n✔ No Admin Access Required\r\n✔ 24/7 Customer Support\r\n✔ Flexible & Customizable Options\r\n\r\nhttps://websboost.com/order/trustpiolotreviews.php\r\n\r\nWe also offer website visitors, SEO services, speed optimization, and\r\nwebsite design.\r\n\r\nLET’S GROW YOUR BUSINESS TOGETHER!', '2025-03-06 21:09:23', '1', NULL, '', 0),
(334, 'LincolnAcago', 'nomin.momin+145b6@mail.ru', '85242992232', 'Ncfwuwjijdwefjehue iwiqkwodeigi ', 'Nfwhdkjdwj rdqskwjfej wkdwodkwkifjejr okeowjrfiejfiej rowjedowkrfiejfi jrowkorwkjrfejfi jorkdworefoijfeijfowek okdwofjiejgierjfoe parvamconsultech.com', '2025-03-07 23:23:53', '1', NULL, '', 0),
(335, 'Gertie Heckel', 'heckel.gertie@yahoo.com', '354601801', 'hello?', 'Imagine having your message seen by millions of potential customers. With our service, we can send your ad text directly to website contact forms, guaranteeing that your message will be read. And the best part? There are no per click costs - just one flat rate to reach a massive audience.\r\n\r\n Reach out using the contact info below to learn more.\r\n\r\nRegards,\r\nGertie Heckel\r\nEmail: Gertie.Heckel@freshnewleads.my\r\nWebsite: http://j2ts9a.reach-more-clients.my\r\n', '2025-03-08 22:51:25', '1', NULL, '', 0),
(336, 'Adolph Du Cane', 'ducane.adolph@gmail.com', '51922318', 'Monetize Your Website Effortless', 'Are you ready to earn money from your website with minimal effort? ������ With ForeMedia.net, you can start making revenue from ad impressions alone—clicks are just a bonus!\r\n\r\nHere’s why website owners love us:\r\n✅ Instant approval for new publishers\r\n✅ Earnings from traffic, not just clicks\r\n✅ Hassle-free setup in minutes\r\n\r\n������ Register Now Her: https://foremedia.pro/CU4W6 and start monetizing your traffic today!\r\n\r\nBest,\r\nThe ForeMedia Team', '2025-03-09 13:26:02', '1', NULL, '', 0),
(337, 'Claudine Morton', 'info@globalwidepr.com', '12345678', 'Rare Free Opportunity: Digital J', 'Hi,\r\n\r\nYour brand deserves to stand out, and we’re here to help.\r\n\r\nAt Global Wide PR, we specialize in connecting businesses with top media platforms to increase visibility and credibility. As a gesture to get started, we’re offering a free article on Digital Journal—a great way to showcase your business to a wider audience.\r\n\r\nFor those looking to maximize exposure, we can also feature your brand on affiliates of FOX, NBC, CBS, ABC, and 300+ other sites for just $297. These placements can help you build trust and attract new customers.\r\n\r\nTo take advantage of this opportunity, click the link below to sign up on our site, and we’ll get back to you ASAP:\r\nhttps://bit.ly/globalwidpr\r\n\r\nLooking forward to helping your brand shine!\r\n\r\nBest regards,\r\nClaudine\r\nGlobal Wide PR\r\n\r\n\r\nWe respect that you might prefer not to receive our updates. To stop receiving communications from us, please submit the form here with your website address: bit. ly/unsubscribemeurl', '2025-03-14 08:27:22', '1', NULL, '', 0),
(338, 'IslaPoics', 'duqotayowud23@gmail.com', '87473891158', 'Hello  i am write about   the pr', 'Hi, kam dashur të di çmimin tuaj', '2025-03-14 09:40:46', '1', NULL, '', 0),
(339, 'Mike Pedro Girard\r\n', 'info@strictlydigital.net', '83179144837', 'Semrush links for parvamconsulte', 'Greetings, \r\n \r\nReceiving some set of links redirecting to parvamconsultech.com may result in zero worth or negative impact for your business. \r\n \r\nIt really makes no difference the total backlinks you have, what matters is the number of keywords those domains rank for. \r\n \r\nThat is the key factor. \r\nNot the fake third-party metrics or Domain Rating. \r\nAnyone can manipulate those. \r\nBUT the amount of ranking keywords the sites that send backlinks to you have. \r\nThat’s what really matters. \r\n \r\nMake sure these backlinks redirect to your site and you will ROCK! \r\n \r\nWe are providing this powerful offer here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nNeed more details, or want to know more, message us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nSincerely, \r\nMike Pedro Girard\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-03-15 12:23:59', '1', NULL, '', 0),
(340, 'Mike Maxime Van de Berg\r\n', 'info@speed-seo.net', '82724776392', 'Unlock Your parvamconsultech.com', 'Greetings, \r\n \r\nInterested in how your online presence is doing? \r\nLearn its areas of improvement with our No-Cost SEO Check Tool! \r\n \r\nIn just 2 minutes, you’ll get a comprehensive analysis of your search performance and steps to help improve your search position. \r\n \r\nTake the first step towards higher rankings and online authority. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked optimization problems hold you back. \r\nImprove your site today and stay ahead in your industry! \r\n \r\nNeed more info? Whatsapp with a SEO expert: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Maxime Van de Berg\r\n \r\nSpeed SEO \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-03-17 12:00:51', '1', NULL, '', 0),
(341, 'OscarPoics', 'duqotayowud23@gmail.com', '86972374449', 'Hallo  i writing about     price', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2025-03-18 08:33:30', '1', NULL, '', 0),
(342, 'Nate Rubeo', 'nate.rubeo@gmail.com', '574624459', 'question', 'Boost Your Business with Google Reviews! ⭐\r\n\r\nLooking to grow your online reputation and attract more customers? Google reviews build trust, improve your search ranking, and make your business stand out. Positive reviews can be the deciding factor for potential clients choosing between you and a competitor. Don’t wait — strengthen your credibility today!\r\n\r\nYour success starts with what people see online: https://www.websboost.com/order/googlereviews.php', '2025-03-19 01:28:44', '1', NULL, '', 0),
(343, 'Mike Luca Smith\r\n', 'info@professionalseocleanup.com', '82874729818', 'Improve your website`s ranks tot', 'Hi there, \r\n \r\nWhile checking your parvamconsultech.com for its ranks, I have noticed that \r\nthere are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nAsk us how we do it: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nRegards \r\nMike Luca Smith\r\n \r\nPhone: +1 (855) 221-7591', '2025-03-24 15:47:15', '1', NULL, '', 0),
(344, 'Merri Venable', 'venable.merri@gmail.com', '2506293683', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > \r\n\r\nhttps://shorturl.at/C2Nl9\r\n\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-03-25 11:47:16', '1', NULL, '', 0),
(345, 'Mike Florian Lefevre\r\n', 'mike@monkeydigital.co', '82752429972', 'Collaboration Request', 'Hi, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am reaching out to discuss a mutual opportunity. \r\n \r\nHow would you like to show our promotions on your site and link back via your personalized affiliate link towards high-demand services from our platform? \r\n \r\nThis way, you earn a solid 35% commission, month after month from any purchases that are made from your site. \r\n \r\nThink about it, most website owners benefit from SEO, so this is a big opportunity. \r\n \r\nWe already have thousands of affiliates and our payouts are sent on time. \r\nLast month, we reached a significant amount in payouts to our partners. \r\n \r\nIf you want in, kindly message us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr register today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers, \r\nMike Florian Lefevre\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-03-27 13:35:34', '1', NULL, '', 0),
(346, 'Elizbeth Wu', 'wu.elizbeth@yahoo.com', '749978191', 'i have an inquiry', 'Get your message in front of millions! We deliver your ad text directly to website contact forms, ensuring it’s seen by real people. One flat rate—no per-click fees, just maximum exposure.  \r\n\r\nInterested? Get in touch for a free consultation.  \r\n\r\nRegards,  \r\nElizbeth Wu  \r\nEmail: Elizbeth.Wu@freshnewleads.my  \r\nWebsite: https://getnewclients.top  \r\n', '2025-03-28 18:47:18', '1', NULL, '', 0),
(347, 'Theda Winter', 'theda.winter@gmail.com', '194017784', 'Urgent: Can you help?', 'Want high-quality videos and content fast? Try these 3 Amazing AI Tools for: \r\n**Easy video creation  \r\n**Quick content generation  \r\n**Text-to-speech conversion  \r\nStart now and create like a pro! http://3amazingaitools.top/\r\n', '2025-03-28 18:49:03', '1', NULL, '', 0),
(348, 'Sondra Lenehan', 'sondra.lenehan@gmail.com', '2165045296', 'To the parvamconsultech.com Webm', 'Hi,\r\nWe’re really interested in building a long-term business relationship with a company like yours. Could you please share your offerings and prices? Let’s connect on WhatsApp: +48 883 859 091', '2025-03-28 19:25:19', '1', NULL, '', 0),
(349, 'Van Gurt', 'vangurt@emailcheka.com', '86711264957', 'Your Project Funding', 'Dear Sir, \r\n \r\nWe are a Financial services provider. \r\n \r\nWe assist companies with loans/funds to expand their already existing businesses or companies. We also provide funds for new projects that meet our funding requirements. \r\n \r\nIf our services mean anything to you, Kindly contact us: van.gurt111@gmail.com \r\n \r\nVan Gurt \r\nvan.gurt111@gmail.com', '2025-04-02 09:01:51', '1', NULL, '', 0),
(350, 'IslaPoics', 'zekisuquc419@gmail.com', '85573228592', 'Aloha, i writing about your the ', 'Hi, roeddwn i eisiau gwybod eich pris.', '2025-04-02 09:08:39', '1', NULL, '', 0),
(351, 'Hyman Kotter', 'kotter.hyman@gmail.com', '261125937', 'question', '������ Fast & Reliable Business Loans – No Upfront Fees!\r\nLooking for a hassle-free way to finance your business project? We offer customized loan packages to fit your needs—with notary approval only.\r\n\r\n������ Apply now: info@financeworldwidehk.com\r\n', '2025-04-03 22:13:17', '1', NULL, '', 0),
(352, 'Mike Swen Fischer\r\n', 'info@digital-x-press.com', '85812892336', 'Sustainable SEO – Our Strategy  ', 'Hello, \r\n \r\nI know that many have difficulty to grasp that organic ranking growth takes patience and a strategic ongoing investment. \r\n \r\nUnfortunately, very few webmasters have the willingness to witness the gradual yet powerful trends that can transform their business. \r\n \r\nWith constant search engine updates, a steady, ongoing optimization plan is critical for achieving a sustainable profit. \r\n \r\nIf you see this as the right strategy, work with us! \r\n \r\nExplore Our Monthly SEO Services \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nReach Out on WhatsApp \r\nhttps://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe deliver measurable growth for your SEO spend, and you won’t regret choosing us as your growth partner. \r\n \r\nLooking forward, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-04-05 23:17:49', '1', NULL, '', 0),
(353, 'OscarPoics', 'zekisuquc419@gmail.com', '87767466737', 'Aloha  i am wrote about your the', 'Hej, jeg ønskede at kende din pris.', '2025-04-08 23:27:22', '1', NULL, '', 0),
(354, 'Samantha Nisbett', 'samantha.nisbett@msn.com', '732460154', 'question for you', 'Get your message in front of millions! We deliver your ad text directly to website contact forms, ensuring it’s seen by real people. One flat rate—no per-click fees, just maximum exposure.  \r\n\r\nLet’s talk! Reach out via the contact info below.  \r\n\r\nRegards,  \r\nSamantha Nisbett  \r\nEmail: Samantha.Nisbett@freshnewleads.my  \r\nWebsite: https://getnewclients.top  \r\n', '2025-04-09 12:20:59', '1', NULL, '', 0),
(355, 'Dylan Beard', 'sowden.rosemarie@msn.com', '4119661166', 'The Secret to Getting More Socia', 'Get more clients with Authentic Social Media Advertising!\r\n\r\nOur team of 6 Social Media creators (USA, UK, South Africa) delivers real, relatable content that drives new customers and sales to your site!\r\n\r\n- 20-second Stories or 60-second polished videos\r\n\r\n- Pro editing, voiceovers, and scripts\r\n\r\n- Budget-friendly packages (Starter, Growth, Premium)\r\n\r\nLet’s get you more clients! \r\nCheck our services at https://ugccontentcreator.net/\r\n', '2025-04-10 15:40:22', '1', NULL, '', 0),
(356, 'Gerardo Nation', 'gerardo.nation@gmail.com', '787298670', 'ask', 'Get your message in front of millions! We deliver your ad text directly to website contact forms, ensuring it’s seen by real people. One flat rate—no per-click fees, just maximum exposure.  \r\n\r\nContact me today to learn how this can boost your business.  \r\n\r\nRegards,  \r\nGerardo Nation  \r\nEmail: Gerardo.Nation@freshnewleads.my  \r\nWebsite: https://getnewclients.top  \r\n', '2025-04-11 05:52:37', '1', NULL, '', 0),
(357, 'Mike Jan-Olof De Jong\r\n', 'info@strictlydigital.net', '88767598885', 'Semrush links for parvamconsulte', 'Hello, \r\n \r\nReceiving some set of links linking to parvamconsultech.com may result in 0 value or negative impact for your site. \r\n \r\nIt really makes no difference the number of inbound links you have, what matters is the number of search terms those websites appear in search for. \r\n \r\nThat is the most important thing. \r\nNot the meaningless third-party metrics or SEO score. \r\nThat anyone can do these days. \r\nBUT the number of high-traffic search terms the domains that link to you rank for. \r\nThat’s what really matters. \r\n \r\nHave such links redirect to your site and your rankings will skyrocket! \r\n \r\nWe are introducing this special SEO package here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nHave questions, or need more information, chat with us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards, \r\nMike Jan-Olof De Jong\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-04-12 17:54:04', '1', NULL, '', 0),
(358, 'Kerstin Bayly', 'kerstin.bayly@msn.com', '3735279715', 'investigation', 'Want a better way to attract customers? Instead of running ads, get featured in Forbes, BBC, and USA Today. See how: http://superchargeyourprandmarketing.top/\r\n', '2025-04-13 00:33:21', '1', NULL, '', 0),
(359, 'Toni Hume', 'toni.hume@gmail.com', '6889508330', 'need to know', 'Ads cost money every day, but media coverage keeps working for you. Get featured in major outlets and make your brand unforgettable: http://superchargeyourprandmarketing.top/\r\n', '2025-04-14 06:51:14', '1', NULL, '', 0),
(360, 'Julius Airey', 'nedryaga@chantellegribbon.com', '8442180130', 'investigation', 'Your audience is waiting. We send your message to millions of website contact forms, ensuring it’s read. No per-click fees—just one flat rate for massive reach. Let’s get started!  \r\n\r\nHave questions? Let’s connect—contact me below.  \r\n\r\nRegards,  \r\nJulius Airey  \r\nEmail: Julius.Airey@freshnewleads.my  \r\nWebsite: https://adstocontactforms.top  \r\n', '2025-04-14 08:14:12', '1', NULL, '', 0),
(361, 'Ira McDonell', 'nedryaga@chantellegribbon.com', '631433902', 'question for you', 'Let’s put your business in inboxes—just like this message landed in yours. Reach out today.\r\n\r\n\r\nCurious how this works? Contact me today for details.  \r\n\r\nRegards,  \r\nIra McDonell  \r\nEmail: Ira.McDonell@reachout2me.pro  \r\nWebsite: https://getnewclientswithformads.biz\r\n\r\n', '2025-04-15 13:56:18', '1', NULL, '', 0),
(362, 'Brian And Dee Laffer', 'mia.laffer@yahoo.com', '3505803674', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://shorturl.at/so4jb\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2025-04-15 18:40:22', '1', NULL, '', 0),
(363, 'Ahmed Abdulla', 'ahmed.abdulla00175@gmail.com', '87131414268', 'Business Mandate', 'Dear Sir/ma, \r\n \r\nWe are a financial services and advisory company mandated by our investors to seek business opportunities and projects for possible funding and debt capital financing. \r\n \r\nPlease note that our investors are from the Gulf region. They intend to invest in viable business ventures or projects that you are currently executing or intend to embark upon as a means of expanding your (their) global portfolio. \r\n \r\nWe are eager to have more discussions on this subject in any way you believe suitable. \r\n \r\nPlease contact me on my direct email: ahmed.abdulla@dejlaconsulting.com \r\n \r\nLooking forward to working with you. \r\n \r\nYours faithfully, \r\nAhmed Abdulla \r\nfinancial advisor \r\nDejla Consulting LLC', '2025-04-18 08:17:53', '1', NULL, '', 0),
(364, 'Birgit Harries', 'harries.birgit@googlemail.com', '792681202', 'i have a question', 'Want to save time and get more done? Try these 3 Amazing AI Tools: \r\n**Create high-quality videos effortlessly  \r\n**Generate fresh content in no time  \r\n**Convert text to speech seamlessly  \r\nDon’t let content creation slow you down! http://3amazingaitools.top/\r\n', '2025-04-18 21:21:22', '1', NULL, '', 0),
(365, 'Louie Forrest', 'forrest.louie@gmail.com', '9431683803', 'question', ' Increase Sales & Build Trust—For Free!  \r\n\r\nCustomers want to know they’re hiring a reliable business.  \r\nShow off your credentials and win more clients with a **100% free listing** at https://vettedprobusiness.my/  \r\n\r\n  \r\n', '2025-04-19 04:14:52', '1', NULL, '', 0),
(366, 'Claudine Burgess', 'info@globalwidepr.com', '12345678', 'Get Your Brand Recognized on Dig', 'Hi,\r\n\r\nYour brand deserves to stand out, and we’re here to help.\r\n\r\nAt Global Wide PR, we specialize in connecting businesses with top media platforms to increase visibility and credibility. As a gesture to get started, we’re offering a free article on Digital Journal—a great way to showcase your business to a wider audience.\r\n\r\nFor those looking to maximize exposure, we can also feature your brand on affiliates of FOX, NBC, CBS, ABC, and 300+ other sites for just $297. These placements can help you build trust and attract new customers.\r\n\r\nTo take advantage of this opportunity, click the link below to sign up on our site, and we’ll get back to you ASAP:\r\nhttps://bit.ly/gwidepressrelease\r\n\r\nLooking forward to helping your brand shine!\r\n\r\nBest regards,\r\nClaudine\r\nGlobal Wide PR\r\n\r\n\r\nWe respect that you might prefer not to receive our updates. To unsubscribe from our list, please complete the form here with your website address: bit. ly/unsubscribemeurl', '2025-04-19 05:42:10', '1', NULL, '', 0),
(367, 'Vasily Kichigin Ringrose', 'ringrose.taj@outlook.com', '47939899', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2025-04-19 16:57:20', '1', NULL, '', 0),
(368, 'Mike Kenneth Jones\r\n', 'info@speed-seo.net', '89154795171', 'Find parvamconsultech.com SEO Is', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Kenneth Jones\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-04-19 18:16:53', '1', NULL, '', 0),
(369, 'Omar Spearman', 'spearman.leta@hotmail.com', '451392508', 'How to send bulk X  ( twitter) f', 'Hi ,\r\nStart Send bulk X (twitter) Dm 500 dm /day Free  in Simple 3 step system\r\n\r\n1- sign up & create  your account  with this link : https://shorturl.at/EYhaw\r\n2-Tell the tool about your self\r\n3-connect your X account \r\n\r\nAnd happy bulk sending \r\n', '2025-04-20 18:41:08', '1', NULL, '', 0),
(370, 'Mike Alexander Mercier\r\n', 'mike@monkeydigital.co', '83342671572', 'Collaboration Request', 'Hi, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am contacting you to discuss a exciting business deal. \r\n \r\nHow would you like to feature our promotions on your site and connect via your unique affiliate link towards hot-selling SEO solutions from our platform? \r\n \r\nThis way, you receive a 35% profit share, every month from any transactions that are made from your website. \r\n \r\nThink about it, everyone need SEO, so this is a big opportunity. \r\n \r\nWe already have thousands of affiliates and our commissions are sent every month. \r\nRecently, we distributed over $27,000 in payouts to our promoters. \r\n \r\nIf you want in, kindly message us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr register today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nLooking forward, \r\nMike Alexander Mercier\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-04-26 03:33:22', '1', NULL, '', 0),
(371, 'Mike George Taylor\r\n', 'info@hilkom-digital.com', '81789141445', 'Last Remaining SEO Spots Left – ', 'Hi, \r\n \r\nIf you’re ready to boost your rankings, you need an ongoing SEO strategy. \r\n \r\nAt Hilkom Digital, we focus on sustainable growth through tailored SEO strategies. Our monthly plans are crafted with care and perfect for brands that want impactful ROI — not just vanity metrics. \r\n \r\nDue to increased interest and our commitment to quality, we can only take on a limited number of clients each month. This ensures we maintain quality service for every client. \r\n \r\n______________ \r\nWhat’s Included: \r\n•	Complete technical & content SEO \r\n•	Strong domain authority links \r\n•	Keyword targeting & monthly progress reports \r\n•	Toxic link cleanup & disavow file handling \r\n•	Paid indexing for faster rankings \r\n•	Multilingual SEO support (DE, ES, FR, EN) \r\n______________ \r\n \r\nSpots are limited — reserve your monthly SEO plan now: \r\nhttps://www.hilkom-digital.com/seo-services/ \r\n \r\nHave questions? Chat with an SEO expert here: \r\nhttps://www.hilkom-digital.com/whatsapp-us/ \r\n \r\nLet’s grow your visibility, bring leads, and grow your business — the smart way. \r\n \r\nBest regards, \r\nMike George Taylor\r\n \r\nHilkom Digital \r\nPhone/WhatsApp: +1 (855) 221-7591 \r\nsupport@hilkom-digital.com', '2025-04-26 06:32:09', '1', NULL, '', 0),
(372, 'Jacquetta Mackellar', 'jacquetta.mackellar@yahoo.com', '3864654026', 'Hi parvamconsultech.com Admin!', 'We are currently seeking companies like yours for a potential long-term partnership. Could you kindly share your product offerings along with pricing details? Please  contact me on WhatsApp: +48 508 705 801', '2025-04-26 08:22:18', '1', NULL, '', 0),
(373, 'Ava Daniels', 'virgil.shears@googlemail.com', '148065567', 'The jaw-dropping tactic that wor', 'Send your message to 100M contact forms instantly.\r\n\r\n++ Visit https://bit.ly/formsubmitnow \r\n\r\nAs you read this, millions of others will be receiving your message.\r\n\r\nAdvanced Targeted outreach at scale at affordable rates.\r\n\r\n- Reach out to businesses at scale  \r\n- Drive sales, leads, and partnerships  \r\n- Reach millions of inboxes starting at just $22  \r\n\r\nSkyrocket your business now!  \r\n++ Visit https://bit.ly/formsubmitnow now\r\n\r\n\r\n\r\n\r\n\r\nWhenever you choose to opt-out of subsequent emails from this address, feel free to use the provided link: bit. ly/plsremovefrom\r\n12 Place Du Jeu De Paume, Vigneux-Sur-Seine, CA, USA, 91270', '2025-04-27 23:22:14', '1', NULL, '', 0),
(374, 'Mike Jacob Kristiansen\r\n', 'info@digital-x-press.com', '86841955273', 'SEO Takes Time? Try Our Approach', 'Greetings, \r\n \r\nI understand that many find it challenging to grasp that SEO takes patience and a well-planned ongoing investment. \r\n \r\nThe reality is, very few businesses have the determination to wait for the gradual yet powerful results that can elevate their company. \r\n \r\nWith Google’s evolving algorithms, a reliable, long-term strategy is critical for securing a positive ROI. \r\n \r\nIf you agree this as the right approach, give us a try! \r\n \r\nDiscover Our Custom SEO Plans \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nContact Us on Live Support \r\nhttps://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe deliver measurable growth for your SEO spend, and you will appreciate choosing us as your SEO partner. \r\n \r\nThank you, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-04-28 22:44:11', '1', NULL, '', 0),
(375, 'Kandis Yancy', 'yancy.kandis@outlook.com', '228796086', 'To the parvamconsultech.com Owne', 'Dear Sir/Madam,\r\nWe are exploring long-term business collaborations and found your company of interest. May we kindly request your product catalog and pricing? You may contact me via WhatsApp: +44 739 495 7438', '2025-04-29 14:31:27', '1', NULL, '', 0),
(376, 'Claudine Nunez', 'info@globalwidepr.com', '12345678', 'Amplify Your Brand with a No-Cos', 'Hi,\r\n\r\nYour brand deserves to stand out, and we’re here to help.\r\n\r\nAt Global Wide PR, we specialize in connecting businesses with top media platforms to increase visibility and credibility. As a gesture to get started, we’re offering a free article on Digital Journal—a great way to showcase your business to a wider audience.\r\n\r\nFor those looking to maximize exposure, we can also feature your brand on affiliates of FOX, NBC, CBS, ABC, and 300+ other sites for just $297. These placements can help you build trust and attract new customers.\r\n\r\nTo take advantage of this opportunity, click the link below to sign up on our site, and we’ll get back to you ASAP:\r\n\r\n++ Visit now: https://bit.ly/glopressrelease\r\n\r\nLooking forward to helping your brand shine!\r\n\r\nBest regards,\r\nClaudine\r\nGlobal Wide PR\r\n\r\n\r\nWe value your preferences and understand that you might prefer not to receive our updates. To unsubscribe from our list, please fill out the unsubscribe form with your website address: bit. ly/unsubscribemeurl', '2025-05-02 19:14:56', '1', NULL, '', 0),
(377, 'Vasily Kichigin Bigelow', 'bigelow.junior@msn.com', '568085678', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2025-05-02 19:29:53', '1', NULL, '', 0),
(378, 'Alexandra Poidevin', 'prince@stopformspam.xyz', '4356029058', 'hey', 'Hey there, Times are tough, so I’m offering a free outreach blast to 50,000 contact forms to help you stay visible. No strings attached. This is the same system I use to generate leads for my clients, and I’m offering it to help businesses stay visible during the slowdown. Want to claim your free spot? Simply head to https://free50ksubmissionsoffer.my and I’ll take care of everything for you. No strings attached. Just a way to support your business during tough times.\r\n', '2025-05-03 23:36:55', '1', NULL, '', 0),
(379, 'Chase Morrison', 'chew.carina@yahoo.com', '6888452180', 'This is real life: Reach out to ', 'Connect with 100 Million web forms right away.\r\n\r\nAs you received this message and are viewing it right now, numerous website owners and managers will obtain your message.\r\n\r\n-> Visit: https://bit.ly/cformblasters \r\n\r\nInnovative Targeted marketing on a large scale with cost-effective pricing.\r\n\r\n- Engage with businesses on a large scale\r\n- Boost profits, inquiries, agreements\r\n- Deliver to the inboxes of millions for $22\r\n\r\nBoost your company instantly!\r\n\r\n-> Check out: https://bit.ly/cformblasters now\r\n\r\n\r\n\r\n\r\n\r\nWhen you wish to stop getting any more communications from me, simply follow the following link: bit. ly/plsremovefrom\r\nHolzschachen 77, Ottendorf, CA, USA, 3314', '2025-05-04 19:49:57', '1', NULL, '', 0),
(380, 'CharlieWaw', 'charlie.djs@gmail.com', '83766677273', 'New FLAC music', 'Hello, \r\n \r\nExclusive promo quality music for DJs https://sceneflac.blogspot.com \r\nMP3/FLAC, label, music videos. Fans giving you full access to exclusive electronic, rap, rock, trance, dance... music. \r\n \r\n0day team.', '2025-05-05 03:07:36', '1', NULL, '', 0),
(381, 'Kevin Hopwood', 'hopwood.kevin@yahoo.com', '4648146', 'Dear parvamconsultech.com Webmas', 'Dear Sir/Madam,\r\nWe are exploring long-term business collaborations and found your company of interest. May we kindly request your product catalog and pricing? You may contact me via WhatsApp: +44 740 591 7429', '2025-05-05 16:32:28', '1', NULL, '', 0),
(382, 'Vasily Kichigin Mulvany', 'hans.mulvany@yahoo.com', '523571551', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://shorturl.at/p9jus\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2025-05-06 10:18:12', '1', NULL, '', 0),
(383, 'DjohnPoics', 'aferinohis056@gmail.com', '81767324277', 'Hi,   writing about     prices', 'Sveiki, aš norėjau sužinoti jūsų kainą.', '2025-05-08 01:37:22', '1', NULL, '', 0),
(384, 'Madeline Nelson', 'dupre.tosha@gmail.com', '4598280641', 'I Tried This Casino Trick and Wo', 'Roll the Dice! Experience the top-tier crypto-powered casino at GoPlay, where exciting slots, live dealer games, and special bonuses are ready for your first spin. Benefit from lightning-fast deposits and withdrawals in cryptocurrency while you go after jaw-dropping jackpots. Want to hit it big? \r\nVisit https://goplay.se\r\n\r\nLike us on Facebook at https://www.facebook.com/goplay.se, and follow us on Instagram at https://www.instagram.com/goplay.se to begin playing now', '2025-05-08 06:11:07', '1', NULL, '', 0),
(385, 'GeorgePoics', 'xiceruxuk02@gmail.com', '84769644841', 'Hallo  i am write about   the pr', 'Szia, meg akartam tudni az árát.', '2025-05-09 00:28:14', '1', NULL, '', 0),
(386, 'Mike Stian Taylor\r\n', 'info@strictlydigital.net', '87214116199', 'Semrush links for parvamconsulte', 'Hi there, \r\n \r\nHaving some collection of links redirecting to parvamconsultech.com might bring no value or harmful results for your business. \r\n \r\nIt really isn’t important how many inbound links you have, what is key is the amount of keywords those websites rank for. \r\n \r\nThat is the most important factor. \r\nNot the fake third-party metrics or Domain Rating. \r\nAnyone can manipulate those. \r\nBUT the volume of high-traffic search terms the domains that send backlinks to you contain. \r\nThat’s it. \r\n \r\nMake sure these backlinks point to your website and your site will see real growth! \r\n \r\nWe are introducing this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nNeed more details, or want to know more, reach out here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nSincerely, \r\nMike Stian Taylor\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-05-09 14:51:29', '1', NULL, '', 0),
(387, 'Earnestine Holtermann', 'holtermann.earnestine@msn.com', '4630558695', 'Dear parvamconsultech.com Admini', 'Dear Sir/Madam,\r\nWe are exploring long-term business collaborations and found your company of interest. May we kindly request your product catalog and pricing? You may contact me via WhatsApp: +44 730 709 4746', '2025-05-11 22:20:28', '1', NULL, '', 0),
(388, 'Everette Huskey', 'everette.huskey@gmail.com', '7982493789', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > \r\n\r\nhttps://shorturl.at/C2Nl9\r\n\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-05-12 09:24:00', '1', NULL, '', 0),
(389, 'boanergas', 'boanergas.parvam@gmail.com', '9945047055', 'regarding internship', 'i need internship for fullstack', '2025-05-12 10:23:51', '1', NULL, '', 0),
(390, 'Simonnuats', 'aferinohis056@gmail.com', '82249236882', 'Hi,   writing about your the pri', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', '2025-05-12 17:07:04', '1', NULL, '', 0),
(391, 'SimonPoics', 'aferinohis056@gmail.com', '89255944358', 'Hi, i am writing about your   pr', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2025-05-12 17:07:05', '1', NULL, '', 0),
(392, 'Mike Maxime Claes\r\n', 'info@speed-seo.net', '83713985668', 'Find parvamconsultech.com SEO Is', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Maxime Claes\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-05-13 18:15:48', '1', NULL, '', 0),
(393, 'LeePoics', 'zekisuquc419@gmail.com', '89369131294', 'Hi, i am writing about your the ', 'Hi, kam dashur të di çmimin tuaj', '2025-05-13 22:59:08', '1', NULL, '', 0),
(394, 'Leenuats', 'zekisuquc419@gmail.com', '84381119926', 'Aloha  i writing about   the pri', 'Ciao, volevo sapere il tuo prezzo.', '2025-05-13 22:59:08', '1', NULL, '', 0),
(395, 'LeslieNex', 'ecoeats@mail.ru', '81129254987', 'service unavailable 503', 'service unavailable 503 \r\n \r\nУвеличьте прибыль вашего бизнеса за счет роста конверсии сайта. \r\n \r\nSource: \r\n \r\n<a href=https://t.me/perekup>service unavailable 503</a> \r\n', '2025-05-13 23:50:36', '1', NULL, '', 0),
(396, 'Georgenuats', 'aferinohis056@gmail.com', '89191172949', 'Aloha  i am wrote about     pric', 'Hi, ego volo scire vestri pretium.', '2025-05-14 13:30:25', '1', NULL, '', 0),
(397, 'GeorgePoics', 'aferinohis056@gmail.com', '81512754827', 'Aloha, i am write about your the', 'Sveiki, es gribēju zināt savu cenu.', '2025-05-14 13:30:25', '1', NULL, '', 0),
(398, 'GeorgePoics', 'aferinohis056@gmail.com', '85622696414', 'Aloha    write about   the price', 'Hi, I wanted to know your price.', '2025-05-14 14:50:08', '1', NULL, '', 0),
(399, 'Georgenuats', 'aferinohis056@gmail.com', '82256782858', 'Aloha  i am write about your the', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', '2025-05-14 14:50:08', '1', NULL, '', 0),
(400, 'Apple Inc. 2025. All rights rese', 'e.x.pan.s.euyo.ra.cl.e.71@gmail.', 'Apple Inc. 2025. All rights rese', 'Apple Inc. 2025. All rights rese', '', '2025-05-15 08:48:18', '1', NULL, '', 0),
(401, 'Larrychoip', 'socpeakbot@gmail.com', '83342294767', 'Grow Your social media Fast — Wi', 'Are you looking to increase your visibility on Instagram, TikTok, or other platforms? \r\nWith Socpeak.fun, you can instantly boost your followers, likes, views, and more — safely and affordably. \r\nWhy choose Socpeak.fun? \r\n•	 Fast delivery \r\n•	 Real & organic-looking growth \r\n•	 Custom packages based on your goals \r\n•	 Trusted by influencers, brands & startups \r\n•	 Emails Campaign… and a lot more ! \r\nVisit us now: http://www.socpeak.fun/ \r\nStart building your audience today — and get noticed. \r\nGot questions or want a custom offer? \r\nJust email us at info@socpeak.net — and ask about your free welcome gift!', '2025-05-15 13:11:19', '1', NULL, '', 0),
(402, 'Lakeisha Madsen', 'm2z25s@xcd8dg.com', '661644411', 'xcncre', '\r\n������ Real Human Traffic for Free. Your website deserves visitors — we’re giving them away. Apply now before it closes: https://freewebsitetrafficforever.top\r\n', '2025-05-16 11:01:43', '1', NULL, '', 0),
(403, 'Georgenuats', 'aferinohis056@gmail.com', '83943474851', 'Hallo    writing about your   pr', 'Прывітанне, я хацеў даведацца Ваш прайс.', '2025-05-18 01:46:26', '1', NULL, '', 0),
(404, 'GeorgePoics', 'aferinohis056@gmail.com', '85858565565', 'Hallo,   write about your the pr', 'Hai, saya ingin tahu harga Anda.', '2025-05-18 01:46:26', '1', NULL, '', 0),
(405, 'GeorgePoics', 'aferinohis056@gmail.com', '86843315111', 'Hallo  i write about your the pr', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', '2025-05-18 01:46:39', '1', NULL, '', 0),
(406, 'Georgenuats', 'aferinohis056@gmail.com', '84615665519', 'Hallo,   wrote about your   pric', 'Salam, qiymətinizi bilmək istədim.', '2025-05-18 01:46:39', '1', NULL, '', 0),
(407, 'Emily Klein', 'seal.walker@outlook.com', '7983522674', 'The Ultimate Hack for Cold Outre', 'The data engines behind Fortune-level campaigns start with breadth and accuracy—exactly what you get in our Massive USA B2B Database.\r\n\r\nSourced from maps, directories, trade-shows and web crawls, the list spans 12 M contacts and 7,900 verticals, last checked April 2025.\r\n\r\n**Massive USA B2B Data. Lifetime updates.**\r\n\r\nThis same dataset powers agencies and SaaS unicorns to run outbound and account-based campaigns. Skip the subscription: $99 and it’s yours forever.\r\n\r\n- grab your free sample: https://bit.ly/usdatasets', '2025-05-19 00:13:02', '1', NULL, '', 0),
(408, 'Simonnuats', 'aferinohis056@gmail.com', '87249153286', 'Aloha, i wrote about your   pric', 'Hi, roeddwn i eisiau gwybod eich pris.', '2025-05-19 02:40:12', '1', NULL, '', 0),
(409, 'Ellie Coleman', 'caleb.abate@googlemail.com', '740316794', 'Stop reading if you love losing ', 'Every delayed hour benefits your competition. Imagine tomorrow’s sales report if today you reached 500,000 sites with one click. Now imagine explaining to your boss why you didn’t. Elude the remorse\r\n\r\n-> Grab it here:  https://bit.ly/submittersform', '2025-05-20 04:01:58', '1', NULL, '', 0),
(410, 'Mike Mikael Michel\r\n', 'info@digital-x-press.com', '88175123257', 'Add AEO to your SEO strategies t', 'Hi, \r\nI realize that most website owners struggle grasping that Answer Engine Optimization (AEO) is a long-term game and a well-planned regular commitment. \r\n \r\nSadly, very few businesses have the dedication to wait for the incremental yet significant benefits that can completely boost their online presence. \r\n \r\nWith regular search engine updates, a consistent, continuous SEO strategy including Answer Engine Optimization (AEO) is critical for achieving a positive ROI. \r\n \r\nIf you see this as the right strategy, partner with us! \r\n \r\nDiscover Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nTalk to Us on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe deliver exceptional outcomes for your resources, and you will value choosing us as your growth partner. \r\n \r\nWarm regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-05-20 09:02:04', '1', NULL, '', 0),
(411, 'CharliePoics', 'yawiviseya67@gmail.com', '83937314269', 'Aloha, i writing about     price', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-05-20 10:11:49', '1', NULL, '', 0),
(412, 'SimonPoics', 'aferinohis056@gmail.com', '82128347848', 'Hello    wrote about     prices', 'Hallo, ek wou jou prys ken.', '2025-05-20 16:11:58', '1', NULL, '', 0),
(413, 'Lenora Gibson', 'gibson.lenora3@hotmail.com', '3767064939', 'i need to ask you something', 'Every message you don’t send is a customer you don’t reach. We get your ad seen—sent via contact forms, just like this one.\r\n\r\nLet’s connect—contact me today for more information.  \r\n\r\nRegards,  \r\nLenora Gibson  \r\nEmail: Lenora.Gibson@reachout2me.top  \r\nWebsite: https://getnewclientswithformads.biz\r\n\r\n', '2025-05-20 20:02:49', '1', NULL, '', 0),
(414, 'Apple Inc. 2025. All rights rese', 'expan.se.uy.o.ra.c.l.e.7.1@gmail', 'Apple Inc. 2025. All rights rese', 'Apple Inc. 2025. All rights rese', '', '2025-05-20 20:06:32', '1', NULL, '', 0),
(415, 'Mike Jacob Leroy\r\n', 'info@hilkom-digital.com', '81648613618', 'Answer Engine Optimization (AEO)', 'Hi, \r\nIf you’re looking to grow your search traffic, you need an ongoing SEO strategy. \r\n \r\nAt Hilkom Digital, we focus on results-driven growth through tailored SEO strategies, including advanced Answer Engine Optimization (AEO). AEO ensures your content is optimized specifically for AI-driven search platforms and featured snippets, significantly increasing your online visibility. \r\n \r\nOur monthly plans are engineered for results and designed for businesses that want impactful ROI — not just vanity metrics. \r\n \r\nDue to strong client interest and our dedicated workflow, we can only work with a limited number of clients each month. This ensures you get our full expertise. \r\n \r\n______________ \r\nYour SEO Plan Covers: \r\n* Complete technical & content SEO \r\n* Strong domain authority links \r\n* Keyword targeting & monthly progress reports \r\n* Link profile audit & clean-up \r\n* Paid indexing for faster rankings \r\n* Advanced AEO strategies for AI-driven searches \r\n* Multilingual SEO support (DE, ES, FR, EN) \r\n______________ \r\n \r\nSpots are limited — secure your monthly SEO plan now: https://www.hilkom-digital.com/seo-services/ \r\nWant to talk first? Chat with an SEO expert here: https://www.hilkom-digital.com/whatsapp-us/ \r\n \r\nLet’s grow your visibility, drive traffic, and build your success — the sustainable way. \r\n \r\nBest regards, \r\nMike Jacob Leroy\r\n \r\nHilkom Digital Phone/WhatsApp: \r\n+1 (855) 221-7591 \r\nsupport@hilkom-digital.com', '2025-05-21 12:36:02', '1', NULL, '', 0),
(416, 'Leenuats', 'aferinohis056@gmail.com', '86859797589', 'Hi,   write about     price for ', 'Hola, quería saber tu precio..', '2025-05-21 19:54:50', '1', NULL, '', 0),
(417, 'Charlienuats', 'yawiviseya67@gmail.com', '83872647791', 'Hello, i wrote about     prices', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', '2025-05-23 01:24:08', '1', NULL, '', 0),
(418, 'Vasily Kichigin Tracey', 'tracey.rae@gmail.com', '4185857959', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2025-05-23 22:32:43', '1', NULL, '', 0),
(419, 'Mike George Evans\r\n', 'mike@monkeydigital.co', '87973579631', 'Collaboration Request', 'Hi, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am getting in touch to discuss a great business deal. \r\n \r\nHow would you like to feature our ads on your website and connect via your custom affiliate link towards high-demand services from our business? \r\n \r\nThis way, you earn a solid 35% residual income, every month from any sales that are made from your audience. \r\n \r\nThink about it, most website owners benefit from SEO, so this is a big opportunity. \r\n \r\nWe already have over 12,000 affiliates and our payouts are paid out every month. \r\nRecently, we reached over $27,000 in commissions to our promoters. \r\n \r\nIf this sounds good, kindly contact us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr join us today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nBest Regards, \r\nMike George Evans\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-05-24 15:24:51', '1', NULL, '', 0),
(420, 'Georgenuats', 'xiceruxuk02@gmail.com', '89956523582', 'Hallo, i writing about     price', 'Dia duit, theastaigh uaim do phraghas a fháil.', '2025-05-25 10:53:29', '1', NULL, '', 0),
(421, 'GeorgePoics', 'xiceruxuk02@gmail.com', '84947952166', 'Hi, i am write about your   pric', 'Salam, qiymətinizi bilmək istədim.', '2025-05-25 10:53:29', '1', NULL, '', 0),
(422, 'LeePoics', 'zekisuquc419@gmail.com', '84386799313', 'Hallo, i am write about     pric', 'Hallo, ek wou jou prys ken.', '2025-05-25 19:37:41', '1', NULL, '', 0),
(423, 'Twesige Selegio', 'wilmafoxchildrenprojects@gmail.c', '84739456417', 'Re:Partnership', 'Greetings from Uganda. \r\n \r\nI am Twesige Selegio, Director of Wilma Fox Child Development Centre Uganda, a non-profit organization dedicated to supporting orphans and vulnerable children in Uganda. We provide essential services including education, healthcare, and emotional support. \r\n \r\nWe are excited to explore potential partnership opportunities with your organization. A collaboration could enhance our impact and better serve the children we care for. We are interested in exploring partnerships in the following areas: \r\n \r\n1. Nutrition Programs: Providing nutritious meals and promoting healthy habits. \r\n2. Education and Development: Supporting early childhood development, education, and vocational training. \r\n3. Community Outreach: Empowering communities to promote health, education, and well-being. \r\n \r\nBy partnering together, we can leverage our strengths and experience to create lasting change. I would be honored to discuss this opportunity further and explore how we can work together. \r\nhttps://www.globalgiving.org/donate/104179/wilma-fox-child-development-centre/ you can see more of our projects. \r\nPlease feel free to contact me to schedule a call or meeting. I can be reached via WhatsApp at +256785521916. \r\n \r\nBest Regards, \r\nTwesige Selegio \r\nDirector, Wilma Fox Child Development Centre Uganda', '2025-05-25 21:38:09', '1', NULL, '', 0),
(424, 'Carry Johnson', 'carryjohnson@nimapinfotech.net', '593772474', 'To the parvamconsultech.com Owne', 'Loved the UI of your website!\r\n\r\nWe deliver enterprise software services, mobile app development, and remote developer hiring.\r\n\r\nWe’d love to connect to see how we can help.\r\n\r\nhttps://bit.ly/3H9OujU', '2025-05-26 14:00:08', '1', NULL, '', 0);
INSERT INTO `contact_us` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_subject`, `contact_message`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(425, 'Leenuats', 'zekisuquc419@gmail.com', '84968963449', 'Hello,   write about your   pric', 'Salut, ech wollt Äre Präis wëssen.', '2025-05-27 03:58:44', '1', NULL, '', 0),
(426, 'Georgenuats', 'xiceruxuk02@gmail.com', '81977187295', 'Hello,   writing about     price', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', '2025-05-27 10:00:09', '1', NULL, '', 0),
(427, 'GeorgePoics', 'xiceruxuk02@gmail.com', '84534496386', 'Hi    write about your the price', 'Hi, roeddwn i eisiau gwybod eich pris.', '2025-05-27 10:00:09', '1', NULL, '', 0),
(428, 'Charlienuats', 'xiceruxuk02@gmail.com', '84632482612', 'Hi,   wrote about     price', 'Kaixo, zure prezioa jakin nahi nuen.', '2025-05-27 19:18:57', '1', NULL, '', 0),
(429, 'CharliePoics', 'xiceruxuk02@gmail.com', '82963384113', 'Hello  i am write about your the', 'Прывітанне, я хацеў даведацца Ваш прайс.', '2025-05-28 14:43:50', '1', NULL, '', 0),
(430, 'ConnieTut', 'nomin.momin+324o8@mail.ru', '85337117929', 'Yfhwhdiwj jifjiwjdwihfuwfhuw hid', 'Gwhduwdjiwhduwh uhiwdjiwjdeufhu jikodwfiewfiwjdjw jidwjosqdijwifi jiwdowidqoiowufeugewi uiwjdiwurfuwyruewiai fwhuwhwhfuwhduwijdw parvamconsultech.com', '2025-05-29 23:55:06', '1', NULL, '', 0),
(431, 'Twesige Selegio', 'wilmafoxchildrenprojects@gmail.c', '87576572338', 'Re:Partnership', 'Greetings from Uganda. \r\n \r\nI am Twesige Selegio, Director of Wilma Fox Child Development Centre Uganda, a non-profit organization dedicated to supporting orphans and vulnerable children in Uganda. We provide essential services including education, healthcare, and emotional support. \r\n \r\nWe are excited to explore potential partnership opportunities with your organization. A collaboration could enhance our impact and better serve the children we care for. We are interested in exploring partnerships in the following areas: \r\n \r\n1. Nutrition Programs: Providing nutritious meals and promoting healthy habits. \r\n2. Education and Development: Supporting early childhood development, education, and vocational training. \r\n3. Community Outreach: Empowering communities to promote health, education, and well-being. \r\n \r\nBy partnering together, we can leverage our strengths and experience to create lasting change. I would be honored to discuss this opportunity further and explore how we can work together. \r\nhttps://www.globalgiving.org/donate/104179/wilma-fox-child-development-centre/ you can see more of our projects. \r\nPlease feel free to contact me to schedule a call or meeting. I can be reached via WhatsApp at +256785521916. \r\n \r\nBest Regards, \r\nTwesige Selegio \r\nDirector, Wilma Fox Child Development Centre Uganda', '2025-05-30 01:27:39', '1', NULL, '', 0),
(432, 'ConnieHef', 'nomin.momin+141j5@mail.ru', '88469234677', 'Yfhwhdiwj jifjiwjdwihfuwfhuw hid', 'Gwhduwdjiwhduwh uhiwdjiwjdeufhu jikodwfiewfiwjdjw jidwjosqdijwifi jiwdowidqoiowufeugewi uiwjdiwurfuwyruewiai fwhuwhwhfuwhduwijdw parvamm.com', '2025-05-30 03:58:31', '1', NULL, '', 0),
(433, 'Angelimamp', 'info@amerilancer.com', '86284628888', 'Sign Up Today – Don’t Delay', 'Welcome to http://amerilancer.com/ \r\n \r\nThe Great American Freelancer Platform \r\nAt AmeriLancer.com, we connect American companies with the best freelancer talent—all proudly based in the USA. Whether you’re looking for a creative designer, skilled developer, or expert consultant, you’ll find the perfect match right here. \r\nWhy Choose AmeriLancer.com ? \r\n•	American Talent, Only: We exclusively feature KYC Verified freelancers who reside in the United States, ensuring top-quality, local expertise. \r\n•	Support Local Businesses: Hiring through AmeriLancer.com means investing in American talent and strengthening the U.S. economy. \r\n•	Reliable & Transparent: Guaranteed KYC Verified profiles and a secure platform for smooth collaboration. \r\nFor American Employers: \r\nFind and hire skilled professionals who understand your needs, time zones, and market. Post a job today and get matched with the best in the business. \r\nFor American Freelancers: \r\nJoin a community that values your talent and connects you with companies that appreciate local expertise. \r\nLet’s Build Together \r\nWhether you’re launching a project, scaling your business, or searching for new opportunities, AmeriLancer.com is here to help you succeed. \r\nSign Up Now – Don’t Delay and experience the AmeriLancer.com difference! \r\nAmeriLancer.com - https://www.youtube.com/@AmeriLancer', '2025-05-30 14:29:18', '1', NULL, '', 0),
(434, 'Mike Eric Schmidt\r\n', 'info@strictlydigital.net', '88359798597', 'Semrush links for parvamm.com', 'Hi there, \r\n \r\nGetting some bunch of links redirecting to parvamm.com could have 0 value or negative impact for your site. \r\n \r\nIt really makes no difference how many external links you have, what is key is the total of keywords those websites are optimized for. \r\n \r\nThat is the most important element. \r\nNot the fake third-party metrics or Domain Rating. \r\nAnyone can manipulate those. \r\nBUT the amount of ranking keywords the websites that link to you rank for. \r\nThat’s it. \r\n \r\nGet these quality links redirect to your site and your rankings will skyrocket! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nHave questions, or need more information, message us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards, \r\nMike Eric Schmidt\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-05-31 11:00:28', '1', NULL, '', 0),
(435, 'Mike Peder Rouxson\r\n', 'info@digital-x-press.com', '85847948538', 'Add AEO to your SEO strategies t', 'Hi, \r\nI realize that some companies struggle understanding that organic ranking growth is a continuous effort and a strategically planned regular commitment. \r\n \r\nUnfortunately, very few businesses have the willingness to recognize the incremental yet significant benefits that can completely change their online presence. \r\n \r\nWith Google’s evolving algorithms, a stable, ongoing approach including Answer Engine Optimization (AEO) is essential for securing a strong return on investment. \r\n \r\nIf you see this as the best method, collaborate with us! \r\n \r\nCheck out Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nChat With Us on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe provide unbeatable outcomes for your investment, and you will value choosing us as your digital marketing ally. \r\n \r\nBest regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-05-31 19:33:55', '1', NULL, '', 0),
(436, 'Mike Andreas Andersson\r\n', 'mike@monkeydigital.co', '85985555558', 'Collaboration Request', 'Hi, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am reaching out to discuss a exciting business deal. \r\n \r\nHow would you like to place our promotions on your website and link back via your personalized affiliate link towards hot-selling products from our platform? \r\n \r\nThis way, you receive a solid 35% profit share, continuously from any sales that generate from your audience. \r\n \r\nThink about it, everyone benefit from SEO, so this is a huge opportunity. \r\n \r\nWe already have over 12,000 affiliates and our commissions are sent monthly. \r\nLast month, we distributed $27280 in commissions to our affiliates. \r\n \r\nIf this sounds good, kindly message us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nBest Regards, \r\nMike Andreas Andersson\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-05-31 21:18:01', '1', NULL, '', 0),
(437, 'Brian And Dee Hauk', 'hauk.abby97@googlemail.com', '607867392', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/dwhm8ebp\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2025-06-01 05:37:09', '1', NULL, '', 0),
(438, 'Simonnuats', 'yawiviseya67@gmail.com', '85568351154', 'Hello,   wrote about your   pric', 'Hej, jeg ønskede at kende din pris.', '2025-06-02 03:37:53', '1', NULL, '', 0),
(439, 'SimonPoics', 'yawiviseya67@gmail.com', '89695458719', 'Hallo  i am wrote about your the', 'Dia duit, theastaigh uaim do phraghas a fháil.', '2025-06-02 03:37:54', '1', NULL, '', 0),
(440, 'Mike Paul Williams\r\n', 'info@speed-seo.net', '83284987944', 'Find parvamm.com SEO Issues tota', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Paul Williams\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-06-04 22:46:01', '1', NULL, '', 0),
(441, 'Lori Shultz', 'vinhgrowth@gmail.com', '4167308166', '������ YouTube Promotion: Grow your ', 'Hi. We run a YouTube growth service, which increases your number of subscribers both safety and practically.\r\n\r\n- We guarantee to gain you new 700+ subscribers per month\r\n- People subscribe because they are interested in your videos/channel, increasing video likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any bots.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately. If you are interested and would like to see some of our previous work, let me know and we can discuss further.\r\n\r\nKind Regards,\r\n\r\nTo Unsubscribe, reply with the word unsubscribe in the subject.', '2025-06-05 06:57:57', '1', NULL, '', 0),
(442, 'Mike Tiaqo Karlsson\r\n', 'info@strictlydigital.net', '81459469782', 'Semrush links for parvamconsulte', 'Hi there, \r\n \r\nReceiving some set of links pointing to parvamconsultech.com might bring 0 value or worse for your website. \r\n \r\nIt really doesn’t matter the total external links you have, what is key is the number of search terms those platforms are optimized for. \r\n \r\nThat is the most important thing. \r\nNot the overrated Domain Authority or SEO score. \r\nThat anyone can do these days. \r\nBUT the amount of high-traffic search terms the sites that link to you have. \r\nThat’s the bottom line. \r\n \r\nGet these quality links link to your domain and you will ROCK! \r\n \r\nWe are providing this powerful SEO package here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nHave questions, or want clarification, chat with us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards, \r\nMike Tiaqo Karlsson\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-06-05 17:08:07', '1', NULL, '', 0),
(443, 'Rico Seder', 'seder.rico@gmail.com', '7742688083', 'To the parvamconsultech.com Admi', ' Your website stands out with a clean design and clear information about your services — great job! \r\n\r\n Nimap Infotech provides reliable IT outsourcing, full-cycle software development, mobile apps, and intelligent automation services.\r\n\r\n We’d be happy to connect if you need a trusted partner for your tech projects. \r\n\r\n Excited about the possibility of connecting! \r\n\r\nhttps://bit.ly/3H9OujU', '2025-06-06 15:51:56', '1', NULL, '', 0),
(444, 'RaymondFlief', 'raymondIngend@gmail.com', '82612943846', 'An extraordinary new way of adve', 'Good morning! parvamconsultech.com \r\n \r\nIt is possible to send corporate offers securely and in a completely legal way, without worrying about spam filters. \r\nWhen these messages are submitted, no private details are processed, and communications are delivered to official inquiry forms intended for business communication. \r\nMessages submitted through Contact Forms are treated as significant, so they rarely end up in spam. \r\nEnjoy a free trial and discover its potential. \r\nOur service lets you deliver up to 50,000 messages to your audience. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2025-06-06 18:09:29', '1', NULL, '', 0),
(445, 'Simonnuats', 'yawiviseya67@gmail.com', '88756173465', 'Hallo, i wrote about your   pric', 'Salut, ech wollt Äre Präis wëssen.', '2025-06-07 04:48:29', '1', NULL, '', 0),
(446, 'Michael Baptiste', 'skywebaisolutions@gmail.com', '9177897323', 'This AI doesn’t just talk — it c', 'Hey there,\r\n\r\nYou and your team are really doing well in your industry. Are you open to a complimentary AI SMS + Voice agent demo that helps you automate 24/7 sales appointment booking, along with a free report estimating your potential lost revenue to reveal how much you might be leaving on the table without AI?\r\n\r\nBest regards,  \r\nMichael Baptiste  \r\nAI & Digital Marketing Expert\r\n\r\nTrusted by clients worldwide  \r\n15 years in digital marketing and 4 years in AI\r\n\r\nAs featured on Fox News, The Think and Grow Rich International Mastermind show, The Les Brown podcast, Disrupt Magazine, Voyage MIA, MyCorporation, & others\r\n\r\nhttps://bit.ly/skywebai', '2025-06-07 16:18:40', '1', NULL, '', 0),
(447, 'CharliePoics', 'yawiviseya67@gmail.com', '87485879622', 'Hi, i writing about   the price ', 'Sveiki, aš norėjau sužinoti jūsų kainą.', '2025-06-08 08:04:15', '1', NULL, '', 0),
(448, 'Charlienuats', 'yawiviseya67@gmail.com', '82665683611', 'Hello, i wrote about   the price', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-06-10 16:34:29', '1', NULL, '', 0),
(449, 'Leenuats', 'yawiviseya67@gmail.com', '83989292496', 'Hallo, i wrote about your the pr', 'Hej, jeg ønskede at kende din pris.', '2025-06-12 07:51:22', '1', NULL, '', 0),
(450, 'Oscar Billson', 'billson.oscar@yahoo.com', '7023756147', 'To the parvamconsultech.com Admi', ' I recently visited your website and found the layout and content very impressive — nicely done! \r\n\r\nI’m with Nimap Infotech, and we specialize in IT outsourcing, software & mobile app development, staff augmentation, and AI automation. \r\n\r\n Should you need support from a dependable IT team, we’re here to help.\r\n\r\n Hope we get a chance to work together! \r\n\r\nhttps://bit.ly/3H9OujU', '2025-06-12 12:52:11', '1', NULL, '', 0),
(451, 'Mike Jens Janssens\r\n', 'info@speed-seo.net', '87933158833', 'Find parvamconsultech.com SEO Is', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Jens Janssens\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-06-12 15:02:45', '1', NULL, '', 0),
(452, 'Georgenuats', 'yawiviseya67@gmail.com', '84789293587', 'Hi  i writing about your the pri', 'Здравейте, исках да знам цената ви.', '2025-06-12 19:17:42', '1', NULL, '', 0),
(453, 'SimonPoics', 'yawiviseya67@gmail.com', '89752984163', 'Hallo, i am write about your the', 'Здравейте, исках да знам цената ви.', '2025-06-14 00:25:11', '1', NULL, '', 0),
(454, 'Leenuats', 'zekisuquc419@gmail.com', '82768865421', 'Aloha  i am write about   the pr', 'Прывітанне, я хацеў даведацца Ваш прайс.', '2025-06-14 05:19:06', '1', NULL, '', 0),
(455, 'LeePoics', 'zekisuquc419@gmail.com', '83951757375', 'Hi    writing about   the price ', 'Hola, volia saber el seu preu.', '2025-06-14 05:19:06', '1', NULL, '', 0),
(456, 'CharliePoics', 'yawiviseya67@gmail.com', '84346982928', 'Hi  i wrote about   the price', 'Salut, ech wollt Äre Präis wëssen.', '2025-06-14 13:53:15', '1', NULL, '', 0),
(457, 'Mike Arthur Fischer\r\n', 'info@professionalseocleanup.com', '86389264643', 'Urgent: Toxic Links Found on par', 'Hi, \r\nWhile reviewing parvamm.com, we spotted toxic backlinks that could put your site at risk of a Google penalty. \r\n \r\nWe can clean up your link profile and protect your rankings — all for just $5. \r\n \r\nFix it now before Google does: \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nNeed help or questions? Chat here: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nBest, \r\nMike Arthur Fischer\r\n \r\n+1 (855) 221-7591 \r\ninfo@professionalseocleanup.com', '2025-06-14 16:32:05', '1', NULL, '', 0),
(458, 'Charlienuats', 'yawiviseya67@gmail.com', '82868133237', 'Hi, i am wrote about   the price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', '2025-06-14 18:34:42', '1', NULL, '', 0),
(459, 'Vonnie Geoghegan', 'info@professionalseocleanup.com', '', 'Toxic Links Found on parvamm.com', 'Hi,\r\nWhile reviewing parvamm.com, we spotted toxic backlinks that could put your site at risk of a Google penalty.\r\nWe can clean up your link profile and protect your rankings — all for just $5.\r\n\r\nFix it now before Google does:\r\nhttps://www.professionalseocleanup.com/\r\n\r\nNeed help or questions? Chat here:\r\nhttps://www.professionalseocleanup.com/whatsapp/\r\n\r\n\r\nRegards,\r\nMike Geoghegan\r\n+1 (855) 221-7591\r\ninfo@professionalseocleanup.com', '2025-06-14 20:40:27', '1', NULL, '', 0),
(460, 'Lamont Sellwood', 'lamont.sellwood@gmail.com', '614065993', 'Hello parvamconsultech.com Admin', 'We are interested in your products and services, please send me your pricing and portfolio on our Whatsapp: https://wa.me/48794973356?text=hello', '2025-06-15 18:49:38', '1', NULL, '', 0),
(461, 'GeorgePoics', 'yawiviseya67@gmail.com', '87873322239', 'Aloha    writing about your the ', 'Dia duit, theastaigh uaim do phraghas a fháil.', '2025-06-16 05:11:08', '1', NULL, '', 0),
(462, 'SimonPoics', 'yawiviseya67@gmail.com', '86623728339', 'Hi  i am write about your the pr', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', '2025-06-16 06:47:36', '1', NULL, '', 0),
(463, 'Carry Johnson', 'carryjohnson@nimapinfotech.net', '647985105', 'To the parvamconsultech.com Admi', 'Impressive design on your site!\r\n\r\nWe specialize in full-cycle software development, mobile app development, and tech team extension.\r\n\r\nReach out to us to grow your development team.\r\n\r\nhttps://bit.ly/3H9OujU', '2025-06-16 11:49:07', '1', NULL, '', 0),
(464, 'Eric Jones', 'ericjonesmyemail@gmail.com', '555-555-1212', 'Cool website!', 'Hello to the Parvamconsultech Owner,\r\n\r\nMy name’s Eric, and I recently came across your site, Parvamconsultech, while browsing online. Your site showed up near the top of the search results, so whatever you’re doing for visibility seems effective.\r\n\r\nIf I may ask: after someone like me finds Parvamconsultech, what typically happens?\r\n\r\nIs your site generating valuable inquiries for your business?\r\n\r\nMany visitors view a website and then leave without taking the next step. Research suggests that a majority of visitors exit quickly, leaving no contact information.\r\n\r\nConsider this idea: What if there was a straightforward way for each visitor to indicate they’d like a call from you right when they arrive?\r\n\r\nYou can make this happen.\r\n\r\nWeb Visitor is a tool that works on your site, ready to securely gather a visitor’s name, email, and phone number. It alerts you immediately, so you can speak with that person while they are still viewing your site.\r\n\r\nPlease visit:  \r\nhttps://trustedleadgeneration.com  \r\nto see a live demonstration of Web Visitor and observe precisely how it works.\r\n\r\nActing promptly matters when it comes to building connections. The difference between engaging with someone within a few minutes, versus waiting longer, can be substantial.\r\n\r\nOur new SMS Text With Lead feature allows you to begin a text conversation as soon as you have their number. Even if they aren’t ready right now, you can keep in touch with updates, offers, and helpful information.\r\n\r\nPlease visit the link above to learn what Web Visitor can do for your business. You might be surprised at how much more interest you can capture.\r\n\r\nEric\r\n\r\nP.S. Web Visitor offers a 14-day evaluation period and includes the ability to reach out internationally. Interested individuals may be ready to speak with you now, so please don’t miss out.  \r\nhttps://trustedleadgeneration.com\r\n\r\nWant to receive less emails, or none whatsoever? Update your email preferences by clicking here. https://trustedleadgeneration.com/unsubscribe.aspx?d=parvamconsultech.com', '2025-06-16 17:48:46', '1', NULL, '', 0),
(465, 'LeePoics', 'zekisuquc419@gmail.com', '86661961297', 'Aloha, i am write about   the pr', 'Salam, qiymətinizi bilmək istədim.', '2025-06-17 07:38:09', '1', NULL, '', 0),
(466, 'Brian And Dee Kohl', 'andrew.kohl@gmail.com', '6374262048', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/dwhm8ebp\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2025-06-17 15:16:33', '1', NULL, '', 0),
(467, 'SimonPoics', 'yawiviseya67@gmail.com', '81928949286', 'Aloha, i write about your the pr', 'Hola, quería saber tu precio..', '2025-06-19 21:43:44', '1', NULL, '', 0),
(468, 'Mike Aleksander Smith\r\n', 'info@professionalseocleanup.com', '86711979133', 'Urgent: Toxic Links Found on par', 'Hi, \r\nWhile reviewing parvamconsultech.com, we spotted toxic backlinks that could put your site at risk of a Google penalty. \r\n \r\nWe can clean up your link profile and protect your rankings — all for just $5. \r\n \r\nFix it now before Google does: \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nNeed help or questions? Chat here: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nBest, \r\nMike Aleksander Smith\r\n \r\n+1 (855) 221-7591 \r\ninfo@professionalseocleanup.com', '2025-06-19 22:49:12', '1', NULL, '', 0),
(469, 'Leenuats', 'zekisuquc419@gmail.com', '89585685274', 'Hallo    wrote about     price f', 'Hi, I wanted to know your price.', '2025-06-20 07:26:35', '1', NULL, '', 0),
(470, 'MD ANWARUL HAQUE', 'Officialmdanwarulhaque@gmail.com', '8791233565', 'Experienced Python Full Stack De', 'I am looking for a challenging Python developer position/internship where I can leverage my  Python skills, e.g., Django, Restfull APi and contribute to impactful software solutions.', '2025-06-20 13:10:07', '1', NULL, '', 0),
(471, 'Simonnuats', 'yawiviseya67@gmail.com', '85276255673', 'Hallo, i writing about your   pr', 'Hi, roeddwn i eisiau gwybod eich pris.', '2025-06-21 09:28:38', '1', NULL, '', 0),
(472, 'Mike Philippe De Vries\r\n', 'mike@monkeydigital.co', '82577967355', 'Collaboration Request', 'Hey, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am getting in touch regarding a great business deal. \r\n \r\nHow would you like to show our banners on your website and link back via your unique affiliate link towards hot-selling products from our website? \r\n \r\nThis way, you receive a recurring 35% profit share, every month from any transactions that generate from your website. \r\n \r\nThink about it, everyone benefit from SEO, so this is a big opportunity. \r\n \r\nWe already have over 12,000 affiliates and our payments are sent on time. \r\nLast month, we paid out a significant amount in commissions to our partners. \r\n \r\nIf this sounds good, kindly contact us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr join us today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers, \r\nMike Philippe De Vries\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-06-21 10:36:24', '1', NULL, '', 0),
(473, 'Mike Jacob Andersson\r\n', 'info@digital-x-press.com', '82511773833', 'Add AEO to your SEO strategies t', 'Hi, \r\nI understand that many businesses find it challenging understanding that Answer Engine Optimization (AEO) is a continuous effort and a carefully organized ongoing investment. \r\n \r\nUnfortunately, very few businesses have the patience to observe the progressive yet significant improvements that can completely change their online presence. \r\n \r\nWith constant algorithm changes, a reliable, continuous SEO strategy including Answer Engine Optimization (AEO) is vital for getting a profitable outcome. \r\n \r\nIf you see this as the ideal strategy, collaborate with us! \r\n \r\nExplore Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nReach Out on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe provide remarkable outcomes for your budget, and you will enjoy choosing us as your SEO partner. \r\n \r\nKind regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-06-21 21:48:13', '1', NULL, '', 0),
(474, 'Vasily Kichigin McClean', 'prince.mcclean@gmail.com', '3501166956', 'I will be your social media cont', 'Hi,\r\n\r\nHey! My name is Vasily Kichigin, and I am excited to connect with you , Since 2015, I have worked with over 14,000 customers and completed more than 26,000 orders to help growth and mange socil Media accounts for \r\nMy clients , I am super passionate about Instagram and eager to help you with every aspect of it. \r\n\r\nOver the years, I have worked with a diverse range of creators, small businesses, celebrities, and Fortune 500 companies here on Fiverr.\r\n\r\n If you have any questions, please feel free to send me a message via the link below , and I will be happy to help you! ������\r\nClick here to Chat ====> https://shorturl.at/hAu84\r\n\r\nSee you there\r\n\r\nRegards\r\n\r\nVasily Kichigin\r\n\r\n', '2025-06-22 04:52:02', '1', NULL, '', 0),
(475, 'Theda Martinovich', 'martinovich.theda@gmail.com', '3606123760', 'Hi parvamconsultech.com Owner!', 'We are interested in your products and services, for long term cooperation,  please send me your pricing and portfolio on our Whatsapp: https://wa.me/16722701947', '2025-06-22 05:14:41', '1', NULL, '', 0),
(476, 'Leenuats', 'yawiviseya67@gmail.com', '86426647462', 'Aloha, i am wrote about your the', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-06-22 05:24:39', '1', NULL, '', 0),
(477, 'Eric Jones', 'ericjonesmyemail@gmail.com', '555-555-1212', 'Cool website!', 'Hello to the Parvamconsultech Owner,\r\n\r\nMy name’s Eric, and I recently came across your site, Parvamconsultech, while browsing online. Your site showed up near the top of the search results, so whatever you’re doing for visibility seems effective.\r\n\r\nIf I may ask: after someone like me finds Parvamconsultech, what typically happens?\r\n\r\nIs your site generating valuable inquiries for your business?\r\n\r\nMany visitors view a website and then leave without taking the next step. Research suggests that a majority of visitors exit quickly, leaving no contact information.\r\n\r\nConsider this idea: What if there was a straightforward way for each visitor to indicate they’d like a call from you right when they arrive?\r\n\r\nYou can make this happen.\r\n\r\nWeb Visitor is a tool that works on your site, ready to securely gather a visitor’s name, email, and phone number. It alerts you immediately, so you can speak with that person while they are still viewing your site.\r\n\r\nPlease visit:  \r\nhttps://trustedleadgeneration.com  \r\nto see a live demonstration of Web Visitor and observe precisely how it works.\r\n\r\nActing promptly matters when it comes to building connections. The difference between engaging with someone within a few minutes, versus waiting longer, can be substantial.\r\n\r\nOur new SMS Text With Lead feature allows you to begin a text conversation as soon as you have their number. Even if they aren’t ready right now, you can keep in touch with updates, offers, and helpful information.\r\n\r\nPlease visit the link above to learn what Web Visitor can do for your business. You might be surprised at how much more interest you can capture.\r\n\r\nEric\r\n\r\nP.S. Web Visitor offers a 14-day evaluation period and includes the ability to reach out internationally. Interested individuals may be ready to speak with you now, so please don’t miss out.  \r\nhttps://trustedleadgeneration.com\r\n\r\nWant to receive less emails, or none whatsoever? Update your email preferences by clicking here. https://trustedleadgeneration.com/unsubscribe.aspx?d=parvamconsultech.com', '2025-06-22 09:15:53', '1', NULL, '', 0),
(478, 'Seth Mclaughlin', 'busey.hershel@hotmail.com', '08205893016', 'Businesses Skipped Our Cold Outr', 'Cutting-edge Targeted outreach in bulk for low cost.\r\n\r\n- Reach out to companies in bulk\r\n- Generate profits, prospects, business deals\r\n- Land in the inboxes of countless for just $22\r\n\r\nSkyrocket your business instantly!\r\n\r\n* Check out: https://bit.ly/formorbits now\r\n\r\nContact 100M websites today.\r\n\r\nForm Orbits\r\nhello@formorbits.com\r\n167-169 Great Portland Street, London, England, W1W 5PF, UK\r\n\r\n\r\nIn case you prefer not to get subsequent emails from us, just visit the attached link: bit. ly/RemoveUs', '2025-06-22 21:52:38', '1', NULL, '', 0),
(479, 'Mike Stephan David\r\n', 'info@strictlydigital.net', '82337995364', 'Semrush links for parvamm.com', 'Hi there, \r\n \r\nGetting some collection of links pointing to parvamm.com may result in no value or worse for your website. \r\n \r\nIt really doesn’t matter the number of inbound links you have, what matters is the total of search terms those websites appear in search for. \r\n \r\nThat is the most important element. \r\nNot the overrated Domain Authority or SEO score. \r\nThat anyone can do these days. \r\nBUT the amount of Google-ranked terms the sites that link to you rank for. \r\nThat’s it. \r\n \r\nHave such links link to your domain and your site will see real growth! \r\n \r\nWe are introducing this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nNeed more details, or want clarification, reach out here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards, \r\nMike Stephan David\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-06-24 14:33:24', '1', NULL, '', 0),
(480, 'LeePoics', 'dinanikolskaya99@gmail.com', '81782869779', 'Hi    write about     prices', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-06-24 22:36:21', '1', NULL, '', 0),
(481, 'CharliePoics', 'yawiviseya67@gmail.com', '82449954794', 'Aloha  i am writing about     pr', 'Salam, qiymətinizi bilmək istədim.', '2025-06-25 01:28:04', '1', NULL, '', 0),
(482, 'Jyoti Arun Sakhare', 'jyotisakhare9767@gmail.com', '9767252025', 'Inquiry Regarding MCA Openings ', 'I hope this message finds you well. I am writing to inquire about any current or upcoming openings for MCA graduates at your esteemed organization. I would appreciate any information you can provide regarding available roles or the application process.', '2025-06-25 16:07:03', '1', NULL, '', 0),
(483, 'Mike Nathan Nilsson\r\n', 'mike@monkeydigital.co', '82838736225', 'Collaboration Request', 'Hey, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am contacting you about a great business deal. \r\n \r\nHow would you like to show our banners on your platform and link back via your unique affiliate link towards popular SEO solutions from our platform? \r\n \r\nThis way, you earn a recurring 35% commission, continuously from any transactions that come in from your website. \r\n \r\nThink about it, most website owners need SEO, so this is a big opportunity. \r\n \r\nWe already have over 12,000 affiliates and our commissions are sent monthly. \r\nRecently, we reached $27280 in payouts to our partners. \r\n \r\nIf this sounds good, kindly chat with us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nLooking forward, \r\nMike Nathan Nilsson\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-06-27 00:24:27', '1', NULL, '', 0),
(484, 'JesseFog', 'jamesecook25@yahoo.com', '83525123884', 'URGENT! $199,335.08 Alert: Close', 'URGENT MESSAGE! TIME SENSITIVE: COLLECT YOUR $199,355.97 JACKPOT https://script.google.com/macros/s/AKfycbxmOj0A7EEB7EvAlRGk5xxtzWTuknZhNu0zV4WeJ72kivsZdJUzurlWEJAP9e6rtFg8iQ/exec/9s5b0g1i/6t6y/j/qe/0v9b0k1y/7x0f/h/3u/7v4b8s2t/3u9t/r/22', '2025-06-27 01:32:41', '1', NULL, '', 0),
(485, 'mariademidova530', 'atendimento@investindotoledo.com', '84896533459', 'Personalized Contact Data Extrac', 'Is your business ready to grow? IвЂ™ll help you collect contacts from local companies to fuel your success. https://telegra.ph/Personalized-Contact-Data-Extraction-from-Google-Maps-10-03 (or telegram: @chamerion)', '2025-06-27 03:59:06', '1', NULL, '', 0),
(486, 'MariaDesign', 'office@stroimash.bg', '89743928718', 'Personalized Contact Data Extrac', 'Tired of wasting time searching for businesses? IвЂ™ll extract all the relevant contacts from Google Maps for you! https://telegra.ph/Personalized-Contact-Data-Extraction-from-Google-Maps-10-03 (or telegram: @chamerion)', '2025-06-27 03:59:06', '1', NULL, '', 0),
(487, 'Siddharth Das', 'contact@wowcreative.co', '9740009178', 'Scale Your SaaS Brand with Unfor', 'Dear ParvaM Software Solutions Team,\r\n\r\nI’m reaching out on behalf of WowCreative, where strategy meets standout storytelling. We specialize in helping high-growth SaaS brands like yours break through digital noise and build memorable brand equity.\r\nFrom GTM strategy and explainer videos to full-funnel content, we bring together performance, design, and messaging to help you:\r\n\r\nGenerate qualified leads with targeted campaigns.\r\nElevate your product positioning and UX storytelling.\r\nBuild customer trust with high-impact design and communication.\r\n\r\nOur team works as your creative growth partner, not just a vendor. Let’s chat about how we can help you win more mindshare—and market share.\r\nLet’s make your product unforgettable.\r\n\r\nWarm regards,\r\nSiddharth Das\r\nMobile No: + 91 9740009178\r\nFounder, WowCreative\r\nwww.wowcreative.co\r\n ', '2025-06-27 08:44:36', '1', NULL, '', 0),
(488, 'Charlienuats', 'yawiviseya67@gmail.com', '88946591815', 'Hi    writing about   the prices', 'Hej, jeg ønskede at kende din pris.', '2025-06-27 14:55:59', '1', NULL, '', 0),
(489, 'Georgenuats', 'yawiviseya67@gmail.com', '89987685246', 'Aloha  i write about     price', 'Hi, I wanted to know your price.', '2025-06-28 05:03:53', '1', NULL, '', 0),
(490, 'Mike Jacob Brown\r\n', 'info@digital-x-press.com', '87572444526', 'Add AEO to your SEO strategies t', 'Hi, \r\nI realize that most website owners find it challenging recognizing that SEO is a gradual process and a carefully organized ongoing investment. \r\n \r\nUnfortunately, very few marketers have the dedication to observe the incremental yet impactful results that can completely transform their online presence. \r\n \r\nWith constant algorithm changes, a consistent, ongoing approach including Answer Engine Optimization (AEO) is essential for securing a profitable outcome. \r\n \r\nIf you agree this as the right strategy, work with us! \r\n \r\nDiscover Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nReach Out on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe provide exceptional outcomes for your investment, and you will appreciate choosing us as your digital marketing ally. \r\n \r\nBest regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-06-28 09:45:07', '1', NULL, '', 0),
(491, 'Raj Laiya', 'rajlaiya2017@gmail.com', '6355705208', 'joining for Remote job Or remote', 'hello....\r\n\r\nDue to current financial and medical difficulties, I unable to attend the in-person interview or office work.\r\n\r\nI am genuinely interested in joining your team as a front-end developer and would be grateful if you could consider me for a paid internship or remote/online interview opportunity. I am confident that my skills in web development and my passion for learning can add value to your organization.\r\n\r\nI have sent you an email. Please check. Please let me know if there is any possibility of proceeding further with an online internship or remote opportunity.\r\n\r\nWarm regards,\r\nRaj Laiya\r\n6355705208\r\nrajlaiya2017@gmail.com\r\n\r\n', '2025-06-28 10:30:18', '1', NULL, '', 0),
(492, 'Raymondtam', 'raymondTeex@gmail.com', '88925767218', 'A sophisticated system of email ', 'Hey there! parvamm.com \r\n \r\nYou can send commercial messages securely and in a completely legal way, ensuring high deliverability. \r\nThis method adheres to legal data privacy standards, making it a safe and effective way to reach potential clients. \r\nSending via Contact Forms increases the chances of message visibility unlike regular email campaigns. \r\nGet a free sample and discover its potential. \r\nWe can dispatch up to 50,000 messages on your behalf. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis letter is automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2025-06-28 18:29:31', '1', NULL, '', 0),
(493, 'JeffreyFough', 'frlchr2014@gmail.com', '87512864614', 'IMPORTANT! LIMITED AVAILABILITY:', 'IMPORTANT! TIME IS TICKING: $199,835.40 READY FOR WITHDRAWAL—SECURE YOUR SHARE! https://script.google.com/macros/s/AKfycbzxtGXoqBNd4H3yURUor8WkoDGQl4-lqy0hIoPma-AB7wvgOrjN43b0QFDjA6x4pNbChQ/exec/5z5l9h5y/7t5g/r/eu/8s5p6k4y/3q9d/n/ae/4d1h9g3q/3z6s/y/v9', '2025-06-29 00:32:34', '1', NULL, '', 0),
(494, 'JesseFog', 'feliciadaigle5@gmail.com', '84947567517', 'URGENT! Don’t Delay! Your $199,4', 'IMPORTANT! Act Fast: $199,835.37 Earned—Withdrawal Instructions Await! https://script.google.com/macros/s/AKfycbwaInUQUVYo9Os6XI8vDiGkV6q2w2rx44YHX8PgTfL0fNKBcX5mKOy6jhI_4qFQ5Ez6/exec/4r0k9l4o/6z8t/f/mi/6s2g7h2u/3x9g/9/26/7f5k6h2e/4c7r/q/ku', '2025-06-29 02:53:29', '1', NULL, '', 0),
(495, 'LeePoics', 'dinanikolskaya99@gmail.com', '85561144981', 'Aloha  i writing about   the pri', 'Kaixo, zure prezioa jakin nahi nuen.', '2025-06-30 01:33:26', '1', NULL, '', 0),
(496, 'LeePoics', 'dinanikolskaya99@gmail.com', '84145918153', 'Hello,   wrote about     price f', 'Hi, roeddwn i eisiau gwybod eich pris.', '2025-06-30 21:50:42', '1', NULL, '', 0),
(497, 'Leenuats', 'dinanikolskaya99@gmail.com', '85759867648', 'Aloha,   writing about     price', 'Kaixo, zure prezioa jakin nahi nuen.', '2025-07-01 05:31:37', '1', NULL, '', 0),
(498, 'Charlienuats', 'yawiviseya67@gmail.com', '87591827261', 'Hello  i write about   the price', 'Hallo, ek wou jou prys ken.', '2025-07-01 13:12:04', '1', NULL, '', 0),
(499, 'JesseFog', 'nikkibuys0@gmail.com', '82521523934', 'URGENT MESSAGE! URGENT REMINDER:', 'URGENT! FINAL REMINDER: $199,825.65 WITHDRAWAL DEADLINE TONIGHT https://script.google.com/macros/s/AKfycbwXCet_MNIATuuvrVzgngsSIv1liHWJ9KrSyjsUzk8ioRJPgCUThfkeHjshdMskQ0jg-Q/exec/9z1n8h4u/5q0m/f/1p/6v9l8f1y/4b0f/4/ur/3r6l9l1t/3v0d/6/p1', '2025-07-01 13:38:00', '1', NULL, '', 0),
(500, 'CharliePoics', 'yawiviseya67@gmail.com', '88671116591', 'Aloha  i writing about your the ', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', '2025-07-01 20:06:26', '1', NULL, '', 0),
(501, 'GeorgePoics', 'yawiviseya67@gmail.com', '85651662438', 'Hello, i writing about your   pr', 'Здравейте, исках да знам цената ви.', '2025-07-02 02:09:08', '1', NULL, '', 0),
(502, 'Leenuats', 'dinanikolskaya99@gmail.com', '83931488365', 'Hi  i am write about your   pric', 'Hi, ego volo scire vestri pretium.', '2025-07-02 04:01:21', '1', NULL, '', 0),
(503, 'Freddy Altman', 'altman.freddy@gmail.com', '883487385', 'Hi parvamconsultech.com Administ', ' I checked out your site and loved how professionally you present your services — well executed!\r\n\r\n At Nimap Infotech, we deliver IT services including outsourcing, mobile and web development, AI automation, and skilled resource augmentation. \r\n\r\n Should you need support from a dependable IT team, we’re here to help.\r\n\r\nLooking forward to the opportunity! \r\n\r\nhttps://bit.ly/3H9OujU', '2025-07-03 03:34:41', '1', NULL, '', 0),
(504, 'JeffreyFough', 'tturcotte6406@gmail.com', '84786153852', 'IMPORTANT! Collect Your $199,275', 'IMPORTANT! COLLECT YOUR $199,905.35 PRIZE: ACT WITHOUT DELAY https://script.google.com/macros/s/AKfycbyqor6iP4N4oklDc4qAmziaLwUNAiaU9vz6ox_n2mjw1bcRFbEZPv11v64FvYIQQYMibg/exec/8w0h8k1i/6v9t/8/jo/0x1p0l1t/4u5r/x/4u/1f4n6d3p/3m6g/u/g8', '2025-07-03 04:38:30', '1', NULL, '', 0),
(505, 'Leenuats', 'dinanikolskaya99@gmail.com', '86363867169', 'Hi, i wrote about your   price f', 'Hai, saya ingin tahu harga Anda.', '2025-07-03 16:37:30', '1', NULL, '', 0),
(506, 'RaymondFlief', 'raymondIngend@gmail.com', '86813823375', 'Do you wish to draw in more cust', 'Howdy! parvamconsultech.com \r\n \r\nHave you heard that it is possible to lawfully and successfully send official requests directly through direct communication portals? \r\nThis method adheres to legal data privacy standards, ensuring legitimate and transparent outreach. \r\nAs Contact Forms prioritize real messages, submissions made through them are handled differently than bulk emails. \r\nTake advantage of our free trial—no hidden fees! \r\nYou can count on us to send up to 50,000 messages reliably. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2025-07-03 20:38:11', '1', NULL, '', 0),
(507, 'Williamwam', 'victoryolly1975@gmail.com', '82613756511', 'You have accumulated $144,000 on', 'Google Ads intends to pay you $144,000 for viewing ads on Google services - http://mfmportlaoise.org/?wptouch_switch=desktop&redirect=https%3A%2F%2Ftelegra.ph%2Fgmt-06-12%3F1737', '2025-07-04 00:50:56', '1', NULL, '', 0),
(508, 'Jimmieelilm', 'tintincardo@gmail.com', '86664475525', 'You have accumulated $144,000 on', 'Google Ads intends to pay you $144,000 for viewing ads on Google services - https://javfiles.net/view/aHR0cHM6Ly90ZWxlZ3JhLnBoL2dtdC0wNi0xMj83NDk2', '2025-07-04 03:07:02', '1', NULL, '', 0),
(509, 'LeePoics', 'irinademenkova86@gmail.com', '87118761563', 'Hi  i write about   the price', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', '2025-07-04 15:53:29', '1', NULL, '', 0),
(510, 'Edwina Lapsley', 'lapsley.edwina@gmail.com', '631001269', 'Dear parvamconsultech.com Admin.', 'Hello\r\nCan you send me youroffer list with full  pricing ? Please send me it on my Whatsapp +1 672 270 1674', '2025-07-05 17:09:33', '1', NULL, '', 0),
(511, 'LeePoics', 'irinademenkova86@gmail.com', '87971639513', 'Aloha  i write about your the pr', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', '2025-07-05 18:30:17', '1', NULL, '', 0),
(512, 'JesseFog', 'tommyboy68.416@gmail.com', '84114892861', 'URGENT MESSAGE! Time Sensitive: ', 'IMPORTANT MESSAGE! Flash Deal: $199,515.90 is Yours! https://script.google.com/macros/s/AKfycbx81D2WzT0b4T88jCNQmv8vTnwQRVuqJS0v31IyP6fCDfemMBhyY5auSK36dtMLDfFttw/exec/5q8i0s4t/3b7r/w/l1/9e6i9j4y/3r0y/m/11/1d9t0g5p/7b8y/3/ot', '2025-07-05 20:13:41', '1', NULL, '', 0),
(513, 'Simonnuats', 'irinademenkova86@gmail.com', '83935983254', 'Hi    wrote about your   prices', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-07-06 14:42:20', '1', NULL, '', 0),
(514, 'Mike Louis Evans\r\n', 'info@speed-seo.net', '88811122183', 'Find parvamm.com SEO Issues tota', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Louis Evans\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-07-06 16:10:18', '1', NULL, '', 0),
(515, 'LeePoics', 'dinanikolskaya99@gmail.com', '84364236454', 'Hi, i am writing about your   pr', 'Zdravo, htio sam znati vašu cijenu.', '2025-07-06 22:13:33', '1', NULL, '', 0),
(516, 'Maira Parris', 'prince@stopformspam.xyz', '449257488', 'hey', 'Hello, Things are rough for many businesses right now, which is why I’m offering a one-time, no-strings-attached outreach blast to 50,000 contact forms, completely free. This is the same method I use for my paying clients to generate leads fast, and I’m offering it free to help businesses during this downturn. If you’d like to claim one of the free spots, just visit https://free50ksubmissionsoffer.my, and I’ll handle everything for you. No cost, no commitment. Just an opportunity to help you get noticed in tough times.\r\n', '2025-07-07 01:08:22', '1', NULL, '', 0),
(517, 'Leenuats', 'irinademenkova86@gmail.com', '81541439894', 'Hi, i am wrote about your   pric', 'Hallo, ek wou jou prys ken.', '2025-07-07 14:01:01', '1', NULL, '', 0),
(518, 'LeePoics', 'zekisuquc419@gmail.com', '88988784146', 'Hello    writing about your the ', 'Hallo, ek wou jou prys ken.', '2025-07-07 18:25:38', '1', NULL, '', 0),
(519, 'Leenuats', 'dinanikolskaya99@gmail.com', '87477542763', 'Hi,   writing about   the price', 'Hola, volia saber el seu preu.', '2025-07-08 03:30:51', '1', NULL, '', 0),
(520, 'JeffreyFough', 'kgoode66@yahoo.com', '81182629194', 'YOUR $200,845.53 IS ALMOST GONE!', 'Your Fortune Awaits: $200,825.06 Earned—Withdrawal Instructions Inside! https://snoqualmiefalls.com/cgi-bin/link.cgi?telegra.ph%2Fnfs-06-11%3F3229', '2025-07-08 05:29:13', '1', NULL, '', 0),
(521, 'JesseFog', 'khallode46@yahoo.com', '88848864399', 'You’ve Won $200,555.08 – Redeem ', '$200,025.81 Prize – 24 Hours Only! http://www.designmask.net/lpat-hutago/jump.cgi?https://telegra.ph/nfs-06-11?9497', '2025-07-08 07:48:09', '1', NULL, '', 0),
(522, 'Georgenuats', 'irinademenkova86@gmail.com', '86943676884', 'Hi  i writing about your the pri', 'Sveiki, es gribēju zināt savu cenu.', '2025-07-08 09:34:41', '1', NULL, '', 0),
(523, 'Leandra Venegas', 'venegas.leandra@gmail.com', '267008487', 'Do you have enough  customers?', 'Do you need targeted Customers emails and phone numbers , so I am here to help you check out  my Fiverr 5 stares profile serving over 880 happy customers\r\n contact me here and tell me what you need  ===== > \r\n\r\nhttps://shorturl.at/C2Nl9\r\n\r\nSee you there\r\n\r\nRegards\r\nAwals\r\n', '2025-07-08 15:42:35', '1', NULL, '', 0),
(524, 'Leenuats', 'zekisuquc419@gmail.com', '88435261348', 'Hallo, i am write about your   p', 'Hola, volia saber el seu preu.', '2025-07-08 16:17:18', '1', NULL, '', 0),
(525, 'Mike Charles De Jong\r\n', 'info@speed-seo.net', '82298775483', 'Find parvamconsultech.com SEO Is', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Charles De Jong\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-07-08 20:23:34', '1', NULL, '', 0),
(526, 'Gavin Torpy', 'rw589g@tc76jc.com', '9056599291', 'n69urg', 'We’re offering free website traffic to site owners as part of a promotion. There’s no cost, no signup — just real visitors to help boost your site.\r\nhttps://trafficboosterhub.top\r\n', '2025-07-09 07:30:33', '1', NULL, '', 0),
(527, 'Carry Johnson', 'carryjohnson@nimapinfotech.net', '6802476804', 'Hi parvamconsultech.com Admin!', 'Your website looks great!\r\n\r\nWe specialize in custom software solutions, mobile solutions, and tech team extension.\r\n\r\nLet’s connect to support your tech needs.\r\n\r\nhttps://bit.ly/3H9OujU', '2025-07-09 18:15:16', '1', NULL, '', 0),
(528, 'JesseFog', 'robertaevans2017@gmail.com', '85274251362', 'ACT FAST! YOUR $200,665.87 CASHO', 'BIG BUCKS ALERT: $200,265.89 READY FOR WITHDRAWAL—CLAIM YOURS NOW! https://script.google.com/macros/s/AKfycbzHTogAJ3rfY7SoVU2y8Mugz4w4QKFVXFDZM94EXCjUxNjmQc4UQJVyBqENPxrtahNw/exec/3x7y0s2p/5c8r/i/d9/5w5u7s3w/5z5t/j/l2/9e3p7d2q/7r6y/o/c1', '2025-07-10 00:49:53', '1', NULL, '', 0),
(529, 'SimonPoics', 'irinademenkova86@gmail.com', '83315379289', 'Hi  i wrote about     price', 'Szia, meg akartam tudni az árát.', '2025-07-11 05:28:07', '1', NULL, '', 0);
INSERT INTO `contact_us` (`contact_id`, `contact_name`, `contact_email`, `contact_phone`, `contact_subject`, `contact_message`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(530, 'SimonPoics', 'irinademenkova86@gmail.com', '88739912932', 'Hallo  i writing about     price', 'Sveiki, es gribēju zināt savu cenu.', '2025-07-11 07:02:39', '1', NULL, '', 0),
(531, 'LeePoics', 'dinanikolskaya99@gmail.com', '87112379228', 'Hello,   write about your   pric', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', '2025-07-11 19:46:59', '1', NULL, '', 0),
(532, 'Dong Hutchings', 'qs96ne@rsx6pc.com', '3843380411', 'rs9qdsva7k7a', 'hotanal.com', '2025-07-11 23:51:38', '1', NULL, '', 0),
(533, 'JeffreyFough', 'buti16_06@btinternet.com', '82887278455', 'IMPORTANT! LIMITED TIME: SECURE ', 'IMPORTANT! $200,985.26 WITHDRAWAL ENDS – ACT NOW! https://www.obertaeva.com/include/get.php?go=https%3A%2F%2Ftelegra.ph%2Fnfs-06-11%3F0280', '2025-07-12 07:47:50', '1', NULL, '', 0),
(534, 'JesseFog', 'berylgwenllian@btinternet.com', '87397229523', 'URGENT MESSAGE! Claim Your $200,', 'IMPORTANT! FINAL CALL: CLAIM YOUR $200,605.14 PRIZE TODAY https://bigopt.com/en/site-url/go/?url=https%3A%2F%2Ftelegra.ph%2Fnfs-06-11%3F0350', '2025-07-12 10:05:29', '1', NULL, '', 0),
(535, 'GeorgePoics', 'irinademenkova86@gmail.com', '89467771748', 'Hi,   writing about your the pri', 'Hi, kam dashur të di çmimin tuaj', '2025-07-12 14:25:06', '1', NULL, '', 0),
(536, 'Simonnuats', 'irinademenkova86@gmail.com', '85269929996', 'Aloha    wrote about   the price', 'Здравейте, исках да знам цената ви.', '2025-07-12 15:20:30', '1', NULL, '', 0),
(537, 'Mike Louis Smith\r\n', 'info@professionalseocleanup.com', '86133993811', 'Urgent: Toxic Links Found on par', 'Hi, \r\nWhile reviewing parvamm.com, we spotted toxic backlinks that could put your site at risk of a Google penalty. \r\n \r\nWe can clean up your link profile and protect your rankings — all for just $5. \r\n \r\nFix it now before Google does: \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nNeed help or questions? Chat here: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nBest, \r\nMike Louis Smith\r\n \r\n+1 (855) 221-7591 \r\ninfo@professionalseocleanup.com', '2025-07-13 02:43:01', '1', NULL, '', 0),
(538, 'Vasily Kichigin Seifert', 'seifert.laverne@msn.com', '9459513385', 'Instagram Professional and Moder', 'Social media marketing boosts your business by capturing your target audience with contemporary, stylish content. \r\n\r\nLet me do for you Modern designs for Instagram, Facebook post design, Twitter, LinkedIn, Pinterest, TikTok, Shopify, and your website with captivating social media post designs.\r\n\r\nI can help you to Make your Social Media more glowing \r\n\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out  and lets start work together  ===== > https://tinyurl.com/3ny7zvde\r\n\r\nSee you there!\r\nRegards\r\nRonny', '2025-07-14 13:49:32', '1', NULL, '', 0),
(539, 'Alex Amin', 'alexamin4x4@gmail.com', '83973965156', 'Exclusive Investment Opportunity', 'Greetings, \r\n \r\nI hope you’re doing well. We are reaching out to explore potential partnerships with business executives interested in exclusive, high-value investment opportunities. \r\n \r\nOur network comprises established high-net-worth individuals (HNWIs) from Russia and the Middle East, seeking collaborative ventures with trusted partners. The specifics of the opportunity, including investment size and terms, can be shared upon further discussion under strict confidentiality. \r\n \r\nWe would welcome the chance to discuss further at your convenience. \r\n \r\nBest regards, \r\nAlex Amin \r\nEmail: infinitycapitalmru@gmail.com', '2025-07-14 21:33:38', '1', NULL, '', 0),
(540, 'Brian And Dee Hynes', 'alycia.hynes@googlemail.com', '6326474259', 'Do you Have Tiktok account?', 'The TikTok social media platform has seen explosive growth over the last two years. It now has 500\r\nmillion users that are desperate for fun and exciting content and this is a massive opportunity for you\r\nto promote your business.\r\n\r\nI can help you to grow and promote your tiktok account organically\r\nvisit my 5 star profile and join over 3000 happy customer\r\n\r\nClick here to check out   ===== > https://tinyurl.com/dwhm8ebp\r\n\r\nSee you there!\r\nRegards\r\nBrian And Dee\r\n\r\n', '2025-07-15 02:47:22', '1', NULL, '', 0),
(541, 'Leenuats', 'irinademenkova86@gmail.com', '86584745553', 'Hi    write about     prices', 'Hai, saya ingin tahu harga Anda.', '2025-07-15 04:37:37', '1', NULL, '', 0),
(542, 'Mike William Leroy\r\n', 'mike@monkeydigital.co', '88128598852', 'Collaboration Request', 'Hey, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am contacting you regarding a exciting collaboration. \r\n \r\nHow would you like to place our promotions on your site and link back via your personalized referral link towards hot-selling services from our platform? \r\n \r\nThis way, you receive a recurring 35% profit share, every month from any sales that generate from your audience. \r\n \r\nThink about it, all businesses benefit from SEO, so this is a big opportunity. \r\n \r\nWe already have over 12,000 affiliates and our payouts are processed on time. \r\nIn the past month, we reached over $27,000 in affiliate earnings to our partners. \r\n \r\nIf this sounds good, kindly contact us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr register today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers, \r\nMike William Leroy\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-07-15 06:57:42', '1', NULL, '', 0),
(543, 'Tonya Robeson', 'tonya.robeson@msn.com', '257513780', 'To the parvamconsultech.com Admi', ' I recently visited your website and found the layout and content very impressive — nicely done! \r\n\r\n At Nimap Infotech, we deliver IT services including outsourcing, mobile and web development, AI automation, and skilled resource augmentation. \r\n\r\n Should you need support from a dependable IT team, we’re here to help.\r\n\r\nLooking forward to the opportunity!  https://bit.ly/3H9OujU\r\n\r\n', '2025-07-15 16:31:14', '1', NULL, '', 0),
(544, 'Mike Jiirqen Svensson\r\n', 'info@digital-x-press.com', '87546856342', 'Add AEO to your SEO strategies t', 'Hi, \r\nI realize that most website owners struggle grasping that organic ranking growth is a long-term game and a well-planned monthly initiative. \r\n \r\nSadly, very few website owners have the willingness to observe the incremental yet significant benefits that can completely boost their online presence. \r\n \r\nWith Google’s evolving algorithms, a reliable, continuous SEO strategy including Answer Engine Optimization (AEO) is vital for getting a strong return on investment. \r\n \r\nIf you see this as the ideal approach, work with us! \r\n \r\nDiscover Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nChat With Us on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe provide exceptional results for your budget, and you will value choosing us as your growth partner. \r\n \r\nBest regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-07-16 12:22:10', '1', NULL, '', 0),
(545, 'Leenuats', 'dinanikolskaya99@gmail.com', '82145961774', 'Hi  i write about your   prices', 'Hola, quería saber tu precio..', '2025-07-17 04:43:46', '1', NULL, '', 0),
(546, 'Parishath B', 'pavan.parvam@gmail.com', '7090052770', 'Bussiness ideas', 'tre=iou', '2025-07-17 05:56:05', '1', NULL, '', 0),
(547, 'Parishath B', 'pavan.parvam@gmail.com', '7090052770', 'Bussiness ideas', 'sdfsdf', '2025-07-17 05:56:34', '1', NULL, '', 0),
(548, 'Georgenuats', 'irinademenkova86@gmail.com', '84888252524', 'Hello, i writing about     price', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', '2025-07-18 15:29:21', '1', NULL, '', 0),
(549, 'Jessica Maltby', 'info@speed-seo.net', '3450046762', 're: negative SEO from speed seo', 'Hit them back\r\nhttps://www.speed-seo.net/product/negative-seo-service/\r\n\r\nwhatsapp: +1 (833) 454-8622', '2025-07-18 21:53:30', '1', NULL, '', 0),
(550, 'Moses Puglisi', 'agricangaudreau@gmail.com', '2506293683', 'Dear parvamm.com Administrator!U', 'Discover B2B emails and professional contacts in seconds with Tomba.io’s intuitive search engine: streamline lead discovery, verify accurate emails instantly, and accelerate sales pipelines effortlessly. Get started now at https://tomba.io?via=HRS171kuXQXE\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2025-07-19 15:36:56', '1', NULL, '', 0),
(551, 'Mike Charles Williams\r\n', 'mike@monkeydigital.co', '87387335768', 'Collaboration Request', 'Hey, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am getting in touch regarding a mutual collaboration. \r\n \r\nHow would you like to feature our promotions on your website and connect via your unique affiliate link towards popular SEO solutions from our platform? \r\n \r\nThis way, you earn a recurring 35% residual income, continuously from any purchases that come in from your audience. \r\n \r\nThink about it, everyone require SEO, so this is a big opportunity. \r\n \r\nWe already have 12k+ affiliates and our commissions are paid out every month. \r\nRecently, we reached over $27,000 in affiliate earnings to our partners. \r\n \r\nIf this sounds good, kindly chat with us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr register today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nBest Regards, \r\nMike Charles Williams\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-07-21 18:44:31', '1', NULL, '', 0),
(552, 'Leenuats', 'dinanikolskaya99@gmail.com', '87999835448', 'Hi,   wrote about   the prices', 'Hola, volia saber el seu preu.', '2025-07-23 05:34:35', '1', NULL, '', 0),
(553, 'Mike James Smit\r\n', 'info@strictlydigital.net', '86522272666', 'Semrush links for parvamm.com', 'Hi there, \r\n \r\nGetting some set of links linking to parvamm.com may result in zero worth or negative impact for your site. \r\n \r\nIt really isn’t important the number of external links you have, what is crucial is the amount of keywords those domains appear in search for. \r\n \r\nThat is the most important thing. \r\nNot the overrated Domain Authority or ahrefs DR score. \r\nThese can be faked easily. \r\nBUT the volume of high-traffic search terms the sites that send backlinks to you have. \r\nThat’s what really matters. \r\n \r\nMake sure these backlinks link to your domain and your site will see real growth! \r\n \r\nWe are offering this powerful SEO package here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nNeed more details, or want to know more, message us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nBest regards, \r\nMike James Smit\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-07-26 14:33:22', '1', NULL, '', 0),
(554, ' >>> https://t.me/+5vqk8jb  #Lol', 'hru10@kirzzioh.store\r\n', ' >>> https://t.me/+0neo3fq  #Lol', ' >>> https://t.me/+o5awozi  #Lol', '', '2025-07-27 11:43:33', '1', NULL, '', 0),
(555, 'Georgenuats', 'irinademenkova86@gmail.com', '87172794734', 'Aloha, i wrote about   the price', 'Dia duit, theastaigh uaim do phraghas a fháil.', '2025-07-29 03:52:08', '1', NULL, '', 0),
(556, 'Simonnuats', 'irinademenkova86@gmail.com', '85522799199', 'Hi  i am write about your the pr', 'Ciao, volevo sapere il tuo prezzo.', '2025-07-30 16:11:15', '1', NULL, '', 0),
(557, 'Leenuats', 'dinanikolskaya99@gmail.com', '85984911887', 'Hi,   wrote about   the price fo', 'Hola, volia saber el seu preu.', '2025-07-31 17:33:18', '1', NULL, '', 0),
(558, 'Mike Ralf Smith\r\n', 'info@speed-seo.net', '81775322199', 'Find parvamm.com SEO Issues tota', 'Hi, \r\nWorried about hidden SEO issues on your website? Let us help — completely free. \r\nRun a 100% free SEO check and discover the exact problems holding your site back from ranking higher on Google. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nOr chat with us and our agent will run the report for you: https://www.speed-seo.net/whatsapp-with-us/ \r\n \r\nBest regards, \r\n \r\n \r\nMike Ralf Smith\r\n \r\nSpeed SEO Digital \r\nEmail: info@speed-seo.net \r\nPhone/WhatsApp: +1 (833) 454-8622', '2025-08-02 13:31:23', '1', NULL, '', 0),
(559, 'Leenuats', 'zekisuquc419@gmail.com', '82572135656', 'Hi, i am wrote about   the price', 'Здравейте, исках да знам цената ви.', '2025-08-03 21:20:02', '1', NULL, '', 0),
(560, 'Simonnuats', 'irinademenkova86@gmail.com', '82117878373', 'Aloha, i write about your the pr', 'Szia, meg akartam tudni az árát.', '2025-08-05 23:29:58', '1', NULL, '', 0),
(561, 'Mark Wints', 'markwints39@gmail.com', '313-555-6738', 'Still waiting on your COVID mone', 'Hi,\r\nDid your U.S. business file for the ERC (Employee Retention Tax Credit) during COVID?\r\n\r\nIf you already filed and still haven’t been paid, you may not have to wait anymore.\r\nI help business owners like you get their money now instead of later.\r\n\r\n\r\nTo get started, I just need 2 things from you:\r\n\r\n1. Reply and say: “Get my money now”\r\n\r\n2. Include your phone number so I can call and explain how it works\r\n\r\n\r\nThat’s it. If you already filed, I may be able to help.\r\n\r\nThanks,\r\nMark\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n201 N Main St, Phoenix, AZ 85003\r\nUnsubscribe:\r\nhttps://aiandcompanybest.com/?info=parvamm.com', '2025-08-06 01:01:32', '1', NULL, '', 0),
(562, 'Alex Amin', 'alexamin4x4@gmail.com', '86977562711', 'Exclusive Investment Opportunity', 'Greetings, \r\n \r\nI hope you’re doing well. We are reaching out to explore potential partnerships with business executives interested in exclusive, high-value investment opportunities. \r\n \r\nOur network comprises established high-net-worth individuals (HNWIs) from Russia and the Middle East, seeking collaborative ventures with trusted partners. The specifics of the opportunity, including investment size and terms, can be shared upon further discussion under strict confidentiality. \r\n \r\nWe would welcome the chance to discuss further at your convenience. \r\n \r\nBest regards, \r\nAlex Amin \r\nEmail: infinitycapitalmru@gmail.com', '2025-08-07 14:43:09', '1', NULL, '', 0),
(563, 'Leenuats', 'irinademenkova86@gmail.com', '85359412735', 'Hi    wrote about your the price', 'Hallo, ek wou jou prys ken.', '2025-08-07 22:59:05', '1', NULL, '', 0),
(564, 'Mike Helmuth Jones\r\n', 'info@professionalseocleanup.com', '82443349798', 'Urgent: Toxic Links Found on par', 'Hi, \r\nWhile reviewing parvamm.com, we spotted toxic backlinks that could put your site at risk of a Google penalty. \r\n \r\nWe can clean up your link profile and protect your rankings — all for just $5. \r\n \r\nFix it now before Google does: \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nNeed help or questions? Chat here: \r\nhttps://www.professionalseocleanup.com/whatsapp/ \r\n \r\nBest, \r\nMike Helmuth Jones\r\n \r\n+1 (855) 221-7591 \r\ninfo@professionalseocleanup.com', '2025-08-07 23:43:30', '1', NULL, '', 0),
(565, 'Leenuats', 'zekisuquc419@gmail.com', '82671784355', 'Hallo, i write about your the pr', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-08-08 05:28:25', '1', NULL, '', 0),
(566, 'Leenuats', 'dinanikolskaya99@gmail.com', '82197127667', 'Aloha, i am writing about     pr', 'Ola, quería saber o seu prezo.', '2025-08-09 00:22:53', '1', NULL, '', 0),
(567, 'Leenuats', 'zekisuquc419@gmail.com', '89872516921', 'Hi  i am writing about your the ', 'Sawubona, bengifuna ukwazi intengo yakho.', '2025-08-09 05:16:19', '1', NULL, '', 0),
(568, 'Georgenuats', 'irinademenkova86@gmail.com', '84244249896', 'Hi    wrote about your   price', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', '2025-08-09 15:38:50', '1', NULL, '', 0),
(569, 'Leenuats', 'dinanikolskaya99@gmail.com', '89186873272', 'Hallo, i writing about your   pr', 'Прывітанне, я хацеў даведацца Ваш прайс.', '2025-08-09 15:46:37', '1', NULL, '', 0),
(570, 'Leenuats', 'zekisuquc419@gmail.com', '89781657916', 'Aloha, i am writing about     pr', 'Xin chào, tôi muốn biết giá của bạn.', '2025-08-12 04:31:59', '1', NULL, '', 0),
(571, 'Leenuats', 'dinanikolskaya99@gmail.com', '81854849178', 'Hi, i writing about   the price ', 'Hej, jeg ønskede at kende din pris.', '2025-08-13 21:33:08', '1', NULL, '', 0),
(572, 'Sonali Vijaykumar Kulkarni', 'sk7021456@gmail.com', '9021547344', 'Frontend Developer ', 'Hello sir ,\r\nI am Sonali Kulkarni, interested in applying for the Frontend Developer position at your company. I have skills in HTML, CSS, JavaScript, and React.js, and experience in creating responsive, user-friendly websites. Please let me know if I can share my resume for your review.', '2025-08-14 14:11:14', '1', NULL, '', 0),
(573, 'Leenuats', 'irinademenkova86@gmail.com', '88256181335', 'Hello, i write about your   pric', 'Xin chào, tôi muốn biết giá của bạn.', '2025-08-15 06:27:40', '1', NULL, '', 0),
(574, 'Mike Paul Mercier\r\n', 'info@digital-x-press.com', '84734645711', 'Add AEO to your SEO strategies t', 'Hi, \r\nI recognize that most website owners have difficulties understanding that organic ranking growth is a continuous effort and a well-planned monthly initiative. \r\n \r\nThe reality is, very few website owners have the willingness to recognize the incremental yet significant improvements that can completely transform their online presence. \r\n \r\nWith Google’s evolving algorithms, a stable, ongoing approach including Answer Engine Optimization (AEO) is vital for securing a positive ROI. \r\n \r\nIf you recognize this as the ideal method, work with us! \r\n \r\nDiscover Our Monthly SEO Services https://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nChat With Us on Instant Messaging https://www.digital-x-press.com/whatsapp-us/ \r\n \r\nWe provide remarkable outcomes for your resources, and you will value choosing us as your SEO partner. \r\n \r\nBest regards, \r\nDigital X SEO Experts \r\nPhone/WhatsApp: +1 (844) 754-1148', '2025-08-17 11:56:59', '1', NULL, '', 0),
(575, 'ThomasGably', 'linfieldapereal@gmail.com', '82777455989', 'URGENT! YOUR BANK BALANCE JUST S', 'URGENT! YOUR $213,355.16 REWARD AWAITS: CLAIM NOW https://script.google.com/macros/s/AKfycbywoxtDzJ0_BKymuBirOSN2peYodRnPB-BppfPIOkQ09cImr__IEmwu-KcYoTf_2Fik/exec/1a1m8k5q/6v9q/5/55/1e3m8l5i/5e7g/0/kq/6x9b7l4q/5z6f/7/49', '2025-08-18 05:57:33', '1', NULL, '', 0),
(576, 'Georgenuats', 'irinademenkova86@gmail.com', '87366694474', 'Hi  i am wrote about   the price', 'Hola, volia saber el seu preu.', '2025-08-18 18:12:45', '1', NULL, '', 0),
(577, 'Simonnuats', 'irinademenkova86@gmail.com', '81269344555', 'Hallo  i writing about     price', 'Zdravo, htio sam znati vašu cijenu.', '2025-08-19 19:13:06', '1', NULL, '', 0),
(578, 'Leenuats', 'zekisuquc419@gmail.com', '84221847474', 'Hello    write about your the pr', 'Hi, ego volo scire vestri pretium.', '2025-08-20 03:05:52', '1', NULL, '', 0),
(579, 'ThomasGably', 'fortalizamelchor55@gmail.com', '84119629798', 'IMPORTANT! CASH BONANZA: $213,35', 'IMPORTANT! Collect Your $213,505.39 Jackpot Urgently https://script.google.com/macros/s/AKfycbyDfwJlVz5Ex81PIYbFsTuI1kM0CDvYe3NcDivUvHTd9DwZtY7Re8MMm2Fo8bUpD8RO/exec/2z3l8d3p/5b5r/f/c8/3x0b6f2q/3x6y/3/q8/0e8y6j3t/4r6r/u/a1', '2025-08-20 04:25:40', '1', NULL, '', 0),
(580, 'Georgina Sturgeon', 'info@hilkom-digital.com', '+1 (855) 221-7591', 'Professional Links clean up from', 'Hi,\r\nWhile reviewing parvamm.com, we spotted toxic backlinks that could put your site at risk of a Google penalty.\r\nWe can clean up your link profile and protect your rankings — all for just $5.\r\n\r\nFix it now before Google does:\r\nhttps://www.hilkom-digital.com/product/backlinks-clean-up/\r\n\r\nNeed help or questions? Chat here:\r\nhttps://www.hilkom-digital.com/whatsapp-us/\r\n\r\n\r\nRegards,\r\nMike Sturgeon\r\n+1 (855) 221-7591\r\ninfo@hilkom-digital.com', '2025-08-20 16:30:39', '1', NULL, '', 0),
(581, 'Leenuats', 'dinanikolskaya99@gmail.com', '89154379493', 'Hi, i am write about   the price', 'Salut, ech wollt Äre Präis wëssen.', '2025-08-21 08:25:25', '1', NULL, '', 0),
(582, 'Robertagove', 'wojtynekt@gmail.com', '82117747245', 'Withdraw your $213,495.23 urgent', 'Hello. \r\nYou have 24 hours left to withdraw your money $213,495.23 - https://script.google.com/macros/s/AKfycbxD3-AMyYVAhfD0AmJRLupY3XXux9MsDvuHDNpvVwfT44ObKrrXgUOAHTcm_i0l5tR4/exec/5d1h6f1i/5r0r/7/pp/4w2g7k3p/3y7z/c/c7/8x1j0j1u/4w9r/b/42 \r\nAfter 24 hours, your balance in our system will be reset.', '2025-08-22 09:09:13', '1', NULL, '', 0),
(583, 'jeevan aloor', 'jeevanaloor500@gmail.com', '9606328379', 'looking for job', 'Hello im looking for developer job is their any vacancy ?', '2025-08-22 11:57:12', '1', NULL, '', 0),
(584, 'Mike Joshua Williams\r\n', 'mike@monkeydigital.co', '83164828119', 'Collaboration Request', 'Hey, \r\n \r\nThis is Mike from Monkey Digital, \r\nI am getting in touch about a exciting collaboration. \r\n \r\nHow would you like to place our ads on your platform and connect via your personalized tracking link towards popular products from our business? \r\n \r\nThis way, you receive a recurring 35% commission, month after month from any sales that are made from your site. \r\n \r\nThink about it, everyone require SEO, so this is a big opportunity. \r\n \r\nWe already have 12k+ affiliates and our payments are paid out every month. \r\nIn the past month, we paid out $27280 in affiliate earnings to our affiliates. \r\n \r\nIf you want in, kindly message us here: \r\nhttps://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: \r\nhttps://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers, \r\nMike Joshua Williams\r\n \r\nPhone/whatsapp: +1 (775) 314-7914', '2025-08-23 08:21:22', '1', NULL, '', 0),
(585, 'Mike Christophe Durand\r\n', 'info@strictlydigital.net', '84482586773', 'Semrush links for parvamm.com', 'Hello, \r\n \r\nGetting some bunch of links redirecting to parvamm.com could have no value or negative impact for your site. \r\n \r\nIt really doesn’t matter how many external links you have, what is key is the amount of search terms those platforms appear in search for. \r\n \r\nThat is the critical element. \r\nNot the fake Moz DA or Domain Rating. \r\nThat anyone can do these days. \r\nBUT the amount of ranking keywords the websites that point to your site have. \r\nThat’s the bottom line. \r\n \r\nMake sure these backlinks point to your website and your site will see real growth! \r\n \r\nWe are introducing this exclusive SEO package here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubt, or need more information, message us here: \r\nhttps://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards, \r\nMike Christophe Durand\r\n \r\nstrictlydigital.net \r\nPhone/WhatsApp: +1 (877) 566-3738', '2025-08-23 18:01:36', '1', NULL, '', 0),
(586, 'ThomasGably', 'rbfreeman1966@gmail.comr', '82184912287', 'IMPORTANT MESSAGE! You’ve Won $2', 'IMPORTANT MESSAGE! Your Bank Balance Just Skyrocketed: $213,185.35 Ready for Withdrawal! https://script.google.com/macros/s/AKfycbxTBxkcxGf5INweeIDLtO1A-VsAAA3Qbf-hT_Fd3oIG-FhS3JyLprCFagaXgQKJJQ-w/exec/7e8m9s2w/5n9z/p/lp/0x8p9d2q/7x6d/l/my/1z3p9g2p/5r5d/7/et', '2025-08-23 22:13:02', '1', NULL, '', 0),
(587, 'Leenuats', 'zekisuquc419@gmail.com', '81567878156', 'Aloha  i am write about     pric', 'Hi, ego volo scire vestri pretium.', '2025-08-23 23:29:33', '1', NULL, '', 0),
(588, 'Leenuats', 'dinanikolskaya99@gmail.com', '84391132659', 'Hello  i wrote about your the pr', 'Szia, meg akartam tudni az árát.', '2025-08-26 20:29:52', '1', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Web Development', '2023-09-25 06:20:53', '2023-09-25 06:20:57', NULL),
(2, 'HR', '2023-09-25 07:36:57', '2023-09-25 07:36:57', NULL),
(3, 'QA', '2023-10-03 07:44:12', '2023-10-03 07:44:12', NULL),
(4, 'Web Development & QA', '2023-10-09 10:34:08', '2023-10-09 10:34:08', NULL),
(5, 'Director', '2023-10-20 11:40:38', '2023-10-20 11:40:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `department_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Web Developer', 1, '2023-09-25 06:20:18', '2023-09-25 06:20:18', NULL),
(2, 'HR', 2, '2023-09-25 07:37:20', '2023-09-25 07:37:20', NULL),
(3, 'Quality Analyst', 3, '2023-10-03 07:44:24', '2023-10-03 07:44:24', NULL),
(4, 'Web Developer & Quality Analyst', 4, '2023-10-09 10:35:11', '2023-10-09 10:35:11', NULL),
(5, 'Director & CTO', 5, '2023-10-20 11:40:53', '2023-10-20 11:40:53', NULL),
(6, 'Web Designer', 1, '2023-11-29 10:02:02', '2023-11-29 10:02:02', NULL),
(7, 'Director', 5, '2024-01-04 07:13:24', '2024-01-04 07:13:24', NULL),
(8, 'Director & CEO', 5, '2024-01-04 07:13:39', '2024-01-04 07:13:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `join_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_additional_details`
--

CREATE TABLE `employee_additional_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `residential_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `aadhaar_no` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `emp_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `primary_contact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `secondary_contact` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `bank_ac_number` varchar(255) DEFAULT NULL,
  `bank_ifsc` varchar(255) DEFAULT NULL,
  `pan_number` varchar(255) DEFAULT NULL,
  `educational_details_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `educational_details_2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `educational_details_3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `educational_details_4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_additional_details`
--

INSERT INTO `employee_additional_details` (`id`, `user_id`, `dob`, `blood_group`, `residential_address`, `permanent_address`, `aadhaar_no`, `nationality`, `religion`, `marital_status`, `emp_id`, `created_at`, `updated_at`, `deleted_at`, `primary_contact`, `secondary_contact`, `bank_name`, `branch_name`, `bank_ac_number`, `bank_ifsc`, `pan_number`, `educational_details_1`, `educational_details_2`, `educational_details_3`, `educational_details_4`) VALUES
(9, 1, '2001-05-15', 'O+ve', '#1 Vittala Nivasa,Opp to Anjaneya Temple, Kereguddadahalli Chikkabanavara\r\nKereguddadahalli', '#1 Vittala Nivasa,Opp to Anjaneya Temple, Kereguddadahalli Chikkabanavara\r\nKereguddadahalli', '636968884422', 'Indian', 'Hindu', 'Unmarried', NULL, '2023-04-22 01:06:48', '2024-01-04 07:21:10', NULL, NULL, '', 'Paytm Payments Bank Ltd', 'none branch', '918217751123', 'PYTM012341', 'DJVPA8421E', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendances`
--

CREATE TABLE `employee_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `checkin` varchar(255) DEFAULT NULL,
  `checkout` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `checkout_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` bigint(20) UNSIGNED DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `uuid`, `user_id`, `role`, `firstname`, `lastname`, `gender`, `joining_date`, `email`, `phone`, `company`, `department_id`, `designation_id`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PM-001', 1, 1, 'Manoj', 'K', 'Male', NULL, 'manoj@gmail.com', '8217751523', 'ParvaM', 1, 1, '1756452831.webp', '2023-09-25 09:49:07', '2025-08-29 07:33:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendances`
--

CREATE TABLE `emp_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `checkin_time` datetime DEFAULT NULL,
  `checkout_time` datetime DEFAULT NULL,
  `checkin_status` varchar(255) DEFAULT NULL,
  `checkout_status` varchar(255) DEFAULT NULL,
  `attendance_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchased_from` varchar(255) DEFAULT NULL,
  `purchased_date` varchar(255) DEFAULT '2022-08-12',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `amount` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption1` varchar(255) NOT NULL,
  `caption2` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `title`, `caption1`, `caption2`, `image_path`) VALUES
(1, 'Technical Training & Workshops', 'IoT Workshop', 'SLN College, Raichur', 'uploads/20230418_111731.jpg'),
(2, 'Technical Training & Workshops', 'IoT Workshop', 'SLN College, Raichur', 'uploads/20230418_111839.jpg'),
(3, 'Technical Training & Workshops', 'IoT Workshop', 'SLN College, Raichur', 'uploads/20230418_11212898.jpg'),
(4, 'Technical Training & Workshops', 'IoT Workshop', 'NIT College, Raichur', 'uploads/20230419_111311.jpg'),
(5, 'Technical Training & Workshops', 'IoT Workshop', 'NIT College, Raichur', 'uploads/20230419_111713.jpg'),
(6, 'Technical Training & Workshops', 'IoT Workshop', 'NIT College, Raichur', 'uploads/20230419_11195353.jpg'),
(7, 'Technical Training & Workshops', 'IoT Workshop', 'RRIT College, Bengaluru', 'uploads/20230428_100001.jpg'),
(8, 'Technical Training & Workshops', 'IoT Workshop', 'RRIT College, Bengaluru', 'uploads/20230428_100027.jpg'),
(9, 'Technical Training & Workshops', 'IoT Workshop', 'RRIT College, Bengaluru', 'uploads/20230428_100132.jpg'),
(10, 'Technical Training & Workshops', 'IoT Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20230502_154342.jpg'),
(11, 'Technical Training & Workshops', 'IoT Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20230502_163135.jpg'),
(12, 'Technical Training & Workshops', 'IoT Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20230502_170224.jpg'),
(13, 'Technical Training & Workshops', 'VueJS Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20231016_105416.jpg'),
(14, 'Technical Training & Workshops', 'VueJS Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20231016_105435.jpg'),
(15, 'Technical Training & Workshops', 'VueJS Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20231016_154137.jpg'),
(16, 'Technical Training & Workshops', 'AngularJS Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20240131_104329.jpg'),
(17, 'Technical Training & Workshops', 'AngularJS Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20240131_104341.jpg'),
(18, 'Technical Training & Workshops', 'AngularJS Workshop', 'Government Engineering College, Talakal Koppal', 'uploads/20240131_160656.jpg'),
(22, 'Technical Training & Workshops', 'Mobile App Development Workshop', 'Malnad College of Engineering, Hassan', 'uploads/20240220_100326.jpg'),
(23, 'Technical Training & Workshops', 'Mobile App Development Workshop', 'Malnad College of Engineering, Hassan', 'uploads/20240220_10370303.jpg'),
(24, 'Technical Training & Workshops', 'Mobile App Development Workshop', 'Malnad College of Engineering, Hassan', 'uploads/20240220_17451020.jpg'),
(25, 'Technical Training & Workshops', 'AngularJS Workshop', 'Rural Engineering College - Hulkoti, Gadag', 'uploads/20240625_111424.jpg'),
(26, 'Technical Training & Workshops', 'AngularJS Workshop', 'Rural Engineering College - Hulkoti, Gadag', 'uploads/20240625_111524.jpg'),
(27, 'Technical Training & Workshops', 'AngularJS Workshop', 'Rural Engineering College - Hulkoti, Gadag', 'uploads/20240625_161504.jpg'),
(28, 'Placement Drive', 'Placement Drive', 'SJMIT, Chitradurga', 'uploads/SJMIT Drive.png'),
(29, 'Placement Drive', 'Placement Drive', 'SJMIT, Chitradurga', 'uploads/SJMIT Drive1.png'),
(30, 'Placement Drive', 'Placement Drive', 'SJMIT, Chitradurga', 'uploads/SJMIT Drive2.png'),
(31, 'Placement Drive', 'Placement Drive', 'NIT, Raichur', 'uploads/NIT - 2.png'),
(32, 'Placement Drive', 'Placement Drive', 'NIT, Raichur', 'uploads/NIT - 3.png'),
(33, 'Placement Drive', 'Placement Drive', 'NIT, Raichur', 'uploads/NIT.png'),
(34, 'Placement Drive', 'Placement Drive', 'Government Engineering College - Talakal, Koppal', 'uploads/GECT - 2.png'),
(35, 'Placement Drive', 'Placement Drive', 'Government Engineering College - Talakal, Koppal', 'uploads/GECT - 3.png'),
(36, 'Placement Drive', 'Placement Drive', 'Government Engineering College - Talakal, Koppal', 'uploads/GECT.png'),
(37, 'Placement Drive', 'Placement Drive', 'Government Engineering College, Haveri', 'uploads/GEC Haveri - 2.png'),
(38, 'Placement Drive', 'Placement Drive', 'Government Engineering College, Haveri', 'uploads/GEC Haveri.png'),
(39, 'Placement Drive', 'Placement Drive', 'Rajeev Institute of Technology, Hassan', 'uploads/RIT Hassan - 2.png'),
(40, 'Placement Drive', 'Placement Drive', 'Rajeev Institute of Technology, Hassan', 'uploads/RIT Hassan.png'),
(44, 'Placement Drive', 'Placement Drive', 'NIT College, Raichur', 'uploads/Placement Drive at NIT, Raichur For Honda & Wistron Companies (11).png'),
(45, 'Placement Drive', 'Placement Drive', 'SLN College, Raichur', 'uploads/Placement Drive at NIT, Raichur For Honda & Wistron Companies (12).png'),
(46, 'Placement Drive', 'Placement Drive', 'RRIT College, Bengaluru', 'uploads/20230410_121234.jpg'),
(47, 'Placement Drive', 'Placement Drive', 'RRIT College, Bengaluru', 'uploads/20230410_121338.jpg'),
(48, 'Placement Drive', 'Placement Drive', 'RRIT College, Bengaluru', 'uploads/20230410_121409.jpg'),
(49, 'Placement Drive', 'Placement Drive', 'ParvaM Office, AGB Layout Branch', 'uploads/20230908_112546.jpg'),
(50, 'Placement Drive', 'Placement Drive', 'ParvaM Office, AGB Layout Branch', 'uploads/20230908_115517.jpg'),
(51, 'Placement Drive', 'Placement Drive', 'ParvaM Office, AGB Layout Branch', 'uploads/20230908_115546.jpg'),
(52, 'Placement Drive', 'Placement Drive', 'ParvaM Office, AGB Layout Branch', 'uploads/20230908_145543.jpg'),
(53, 'Placement Drive', 'Placement Drive', 'ParvaM Office, AGB Layout Branch', 'uploads/20230908_145733.jpg'),
(54, 'Placement Drive', 'Placement Drive', 'ParvaM Office, AGB Layout Branch', 'uploads/20230908_154044.jpg'),
(55, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_093647.jpg'),
(56, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_101923.jpg'),
(57, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_104844.jpg'),
(58, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_095445.jpg'),
(59, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_101641.jpg'),
(60, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_101711.jpg'),
(61, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_110913.jpg'),
(62, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_113543.jpg'),
(63, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_113925.jpg'),
(64, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_110218.jpg'),
(65, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_11364884.jpg'),
(66, 'Internships', 'ParvaM Internship 2.0', 'IIHR Visit, Hesaraghatta', 'uploads/20231110_12084040.jpg'),
(82, 'Internships', 'ParvaM Internship 2.0', 'Atal Incubation Center Visit - Dayanand Sagar University', 'uploads/20231111_112126.jpg'),
(83, 'Internships', 'ParvaM Internship 2.0', 'Atal Incubation Center Visit - Dayanand Sagar University', 'uploads/20231111_115038 (1).jpg'),
(84, 'Internships', 'ParvaM Internship 2.0', 'Atal Incubation Center Visit - Dayanand Sagar University', 'uploads/20231111_123700.jpg'),
(85, 'Internships', 'ParvaM Internship 2.0', 'Atal Incubation Center Visit - Dayanand Sagar University', 'uploads/20231111_125827 (1).jpg'),
(86, 'Internships', 'ParvaM Internship 2.0', 'Atal Incubation Center Visit - Dayanand Sagar University', 'uploads/20231111_12404884.jpg'),
(87, 'Internships', 'ParvaM Internship 2.0', 'Atal Incubation Center Visit - Dayanand Sagar University', 'uploads/20231111_12570880.jpg'),
(88, 'Internships', 'ParvaM Internship 2.0', 'Entrepreneurs Success Story', 'uploads/20231108_105719.jpg'),
(89, 'Internships', 'ParvaM Internship 2.0', 'Entrepreneurs Success Story', 'uploads/20231109_123429.jpg'),
(90, 'Internships', 'ParvaM Internship 2.0', 'Entrepreneurs Success Story', 'uploads/20231109_125520.jpg'),
(91, 'Technical Training & Workshops', 'VueJS Workshop', 'AMC Engineering College, Bengaluru', 'uploads/20240129_105433.jpg'),
(92, 'Technical Training & Workshops', 'VueJS Workshop', 'AMC Engineering College, Bengaluru', 'uploads/20240129_140704.jpg'),
(93, 'Technical Training & Workshops', 'VueJS Workshop', 'AMC Engineering College, Bengaluru', 'uploads/20240129_162654_remastered.jpg'),
(94, 'Internships', 'Full Stack Web Development Internship', 'ParvaM Office, Chikkabanavara Branch', 'uploads/20220829_10374334.jpg'),
(95, 'Internships', 'Full Stack Web Development Internship', 'ParvaM Office, Chikkabanavara Branch', 'uploads/Internship - SLN, Racihur.jpg'),
(96, 'Internships', 'Full Stack Web Development Internship', 'ParvaM Office, Chikkabanavara Branch', 'uploads/Internship - SLN, Raichur.jpg'),
(97, 'Internships', 'Python & Machine Learning Internship', 'ParvaM Office, Chikkabanavara Branch', 'uploads/20221011_115835.jpg'),
(98, 'Internships', 'Python & Machine Learning Internship', 'ParvaM Office, Chikkabanavara Branch', 'uploads/20221011_115931.jpg'),
(100, 'Internships', 'Python & Machine Learning Internship', 'ParvaM Office, Chikkabanavara Branch', 'uploads/20221011_120054.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goal_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `progress` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `priority` varchar(255) NOT NULL,
  `applied_to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_types`
--

CREATE TABLE `goal_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goal_types`
--

INSERT INTO `goal_types` (`id`, `type`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Goal 1', 'test', '2023-11-29 10:13:01', '2023-11-29 10:13:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `holiday_date` date NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `name`, `holiday_date`, `completed`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Makara Sankranthi', '2023-01-15', 0, '2023-09-27 05:01:45', '2023-09-27 05:01:45', NULL),
(2, 'Republic day', '2023-01-26', 0, '2023-09-27 05:02:14', '2023-09-27 05:02:36', NULL),
(3, 'Maha Shivaratri', '2023-02-18', 0, '2023-09-27 05:03:45', '2023-09-27 05:03:45', NULL),
(4, 'Ugadi', '2023-03-22', 0, '2023-09-27 05:04:14', '2023-09-27 05:04:14', NULL),
(5, 'Good Friday', '2023-04-07', 0, '2023-09-27 05:04:45', '2023-09-27 05:04:45', NULL),
(6, 'Dr.Ambedkar Jayanthi', '2023-04-14', 0, '2023-09-27 05:05:19', '2023-09-27 05:05:19', NULL),
(7, 'Ramzan', '2023-04-22', 0, '2023-09-27 05:05:42', '2023-09-27 05:05:42', NULL),
(8, 'Basavajayanthi', '2023-04-23', 0, '2023-09-27 05:06:09', '2023-09-27 05:06:09', NULL),
(9, 'May Day', '2023-05-01', 0, '2023-09-27 05:06:59', '2023-09-27 05:06:59', NULL),
(10, 'Bakrid', '2023-06-29', 0, '2023-09-27 05:07:20', '2023-09-27 05:07:20', NULL),
(11, 'Muharram', '2023-07-29', 0, '2023-09-27 05:07:43', '2023-09-27 05:07:43', NULL),
(12, 'Independence Day', '2023-08-15', 0, '2023-09-27 05:08:12', '2023-09-27 05:08:12', NULL),
(13, 'Ganesh Chaturti', '2023-09-18', 0, '2023-09-27 05:08:44', '2023-09-27 05:08:44', NULL),
(14, 'Eid-Milad', '2023-09-28', 0, '2023-09-27 05:09:22', '2023-09-27 05:09:22', NULL),
(15, 'Gandhi Jayanthi', '2023-10-02', 0, '2023-09-27 05:09:40', '2023-09-27 05:09:40', NULL),
(16, 'Mahalaya Amavasya', '2023-10-14', 0, '2023-09-27 05:10:08', '2023-09-27 05:10:08', NULL),
(17, 'Ayudhapooja', '2023-10-23', 0, '2023-09-27 05:10:34', '2023-09-27 05:10:34', NULL),
(18, 'Vijaya Dashami', '2023-10-24', 0, '2023-09-27 05:10:59', '2023-09-27 05:10:59', NULL),
(19, 'Maharshi Valmiki Jayanthi', '2023-10-28', 0, '2023-09-27 05:11:31', '2023-09-27 05:11:31', NULL),
(20, 'Kannada Rajyothstava', '2023-11-01', 1, '2023-09-27 05:11:56', '2023-10-05 10:00:36', NULL),
(21, 'Naraka Chaturdashi', '2023-11-12', 0, '2023-09-27 05:12:27', '2023-09-27 05:12:27', NULL),
(22, 'Balipadyami', '2023-11-14', 0, '2023-09-27 05:12:49', '2023-09-27 05:12:49', NULL),
(23, 'Kanakadasa Jayanthi', '2023-11-30', 0, '2023-09-27 05:13:10', '2023-09-27 05:13:10', NULL),
(24, 'Christmas', '2023-12-25', 0, '2023-09-27 05:13:36', '2023-09-27 05:13:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inv_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `invoice_date` varchar(255) DEFAULT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `vacancies` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `salary_from` varchar(255) DEFAULT NULL,
  `salary_to` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `description` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `department_id`, `location`, `vacancies`, `experience`, `age`, `salary_from`, `salary_to`, `type`, `status`, `start_date`, `expire_date`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Java Developer', 1, 'America', 5, 5, 25, '50000', '60000', 'Full Time', 'Open', '2023-04-01', '2023-04-28', '<p>Apply for Job here</p>', NULL, '2023-04-06 09:41:28', '2023-04-06 09:41:28'),
(2, 'Software Developer', 4, 'Bangalore', 5, 3, 27, '70000', '80000', 'Full Time', 'Closed', '2023-02-01', '2023-02-28', 'software Engineer', NULL, '2023-02-11 01:32:26', '2023-02-14 00:52:06'),
(3, 'PHP Developer', 5, 'Bangalore', 4, 2, 30, '50000', '60000', 'Full Time', 'Open', '2023-02-01', '2023-02-28', 'Laravel technolgy', NULL, '2023-02-11 01:33:36', '2023-02-11 01:36:42'),
(4, 'Software developer', 5, 'Bangalore', 5, 3, 27, '50000', '80000', 'Full Time', 'Closed', '2023-02-01', '2023-02-14', 'Need PHP developer', '2023-02-11 22:54:10', '2023-02-11 22:53:41', '2023-02-11 22:54:10'),
(5, 'Java Developer', 5, 'America', 5, 5, 25, '50000', '60000', 'Full Time', 'Open', '2023-04-05', '2023-04-07', 'Just Apply', NULL, '2023-04-06 09:27:18', '2023-04-06 09:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `job_applicants`
--

CREATE TABLE `job_applicants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cv` varchar(255) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applicants`
--

INSERT INTO `job_applicants` (`id`, `job_id`, `name`, `email`, `cv`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Sanu', 'sanu@gmail.com', '1676034767.pdf', 'looking for an job', '2023-02-11 01:42:47', '2023-02-11 01:42:47', ''),
(2, NULL, 'Pranitha', 'pranitha@test.com', '1680772604.pdf', 'I want this job', '2023-04-06 09:16:44', '2023-04-06 09:16:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_id` bigint(20) UNSIGNED NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `reason` text NOT NULL,
  `leaves_left` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `leave_type_id`, `from_date`, `to_date`, `reason`, `leaves_left`, `status`, `created_at`, `updated_at`, `deleted_at`, `no_of_days`) VALUES
(1, 7, 1, '2024-01-05', '2024-01-05', 'I need Leave for Personal Work', 7, 'Approved', '2024-01-04 07:39:35', '2024-01-04 07:39:43', '2024-01-04 12:30:14', 1),
(2, 7, 1, '2024-01-08', '2024-01-08', 'I need leave', 6, 'Rejected', '2024-01-04 07:47:05', '2024-01-04 07:47:22', '2024-01-04 12:30:19', 1),
(3, 7, 4, '2024-01-08', '2024-01-08', 'I\'ll not be feeling Well', 3, 'pending', '2024-01-04 07:51:10', '2024-01-04 07:51:10', '2024-01-04 12:30:22', 1),
(4, 11, 1, '2024-01-08', '2024-01-08', 'Need Leave', 11, 'Rejected', '2024-01-05 05:28:26', '2024-01-05 05:29:12', NULL, 1),
(5, 11, 6, '2024-01-08', '2024-01-08', 'I need Leave urgent', NULL, 'Approved', '2024-01-05 05:29:35', '2024-01-05 05:30:05', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `days` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `type`, `days`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Casual Leave', '12', '2023-02-01 19:16:10', '2024-01-04 09:47:20', NULL),
(4, 'Sick Leave', '6', '2023-03-07 22:15:56', '2024-01-04 09:47:11', '2024-01-04 09:47:11'),
(6, 'Unpaid Leave - LOP', NULL, '2023-05-23 11:52:37', '2024-01-04 09:45:43', NULL),
(7, 'Unplanned leave', NULL, '2023-11-29 10:02:38', '2024-01-04 09:45:32', '2024-01-04 09:45:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_09_094543_create_settings_table', 1),
(5, '2021_05_27_162331_add_username_and_avatar_to_users_table', 1),
(6, '2021_05_27_182017_create_holidays_table', 1),
(7, '2021_05_28_000808_create_departments_table', 1),
(8, '2021_05_28_041837_create_designations_table', 1),
(9, '2021_05_29_065207_create_contacts_table', 1),
(10, '2021_06_01_014651_create_leave_types_table', 1),
(11, '2021_06_01_114130_create_policies_table', 1),
(12, '2021_06_06_194204_create_clients_table', 1),
(13, '2021_06_06_205649_create_employees_table', 1),
(14, '2021_06_09_133439_create_leaves_table', 1),
(15, '2021_06_22_230535_create_jobs_table', 1),
(16, '2021_06_22_233427_create_notifications_table', 1),
(17, '2021_07_14_112605_make_contact_status_nullable', 1),
(18, '2021_07_17_225505_create_job_applicants_table', 1),
(19, '2021_07_19_194902_create_goal_types_table', 1),
(20, '2021_07_19_202741_create_goals_table', 1),
(21, '2021_07_19_222643_give_goal_progress_default_value', 1),
(22, '2021_07_20_152013_create_assets_table', 1),
(23, '2021_07_22_085751_rename_asset_id_to_uuid', 1),
(24, '2021_07_22_102455_add_supplier_to_assets_table', 1),
(25, '2021_12_07_005142_create_permission_tables', 1),
(26, '2021_12_26_151320_add_uuid_to_employees_table', 1),
(27, '2022_05_01_033105_create_company_settings', 1),
(28, '2022_05_01_053041_create_theme_settings', 1),
(29, '2022_05_01_054943_create_invoice_settings', 1),
(30, '2022_05_01_061804_create_attendance_settings', 1),
(31, '2022_06_10_011115_create_taxes_table', 1),
(32, '2022_06_10_024847_create_provident_funds_table', 1),
(33, '2022_06_10_034418_create_expenses_table', 1),
(34, '2022_06_12_053852_create_overtimes_table', 1),
(35, '2022_06_12_060800_create_projects_table', 1),
(36, '2022_06_12_232122_create_employee_attendances_table', 1),
(37, '2022_06_19_175933_create_tickets_table', 1),
(38, '2022_06_25_015552_create_invoices_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `overtimes`
--

CREATE TABLE `overtimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `overtime_date` varchar(255) NOT NULL,
  `hours` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `files` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `description`, `department_id`, `files`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Maternity Leave', 'Review and Amendments:\r\n\r\na)	This policy will be reviewed periodically by the company and may be amended as and when required.\r\nb)	Any changes to the policy will be communicated to employees in a timely manner.', 2, '[\"1695796546.pdf\"]', '2023-09-27 06:35:46', '2024-01-23 12:32:44', '2024-01-23 12:32:44'),
(2, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1695797447.pdf\"]', '2023-09-27 06:50:47', '2024-01-11 06:01:34', '2024-01-11 06:01:34'),
(3, 'WORK PLACE STANDARDS', 'Employees are expected to adhere to these guidelines and show responsibility in managing their working hours and time off requests. Any questions or concerns regarding these guidelines can be addressed to the HR department.', 2, '[\"1695799009.pdf\"]', '2023-09-27 07:16:49', '2024-01-23 12:30:09', '2024-01-23 12:30:09'),
(4, 'Office Rules & Regulations', 'These guidelines have been put in place to protect the interests of both the company and employees. We expect all employees to familiarize themselves with these rules and regulations and follow them at all times.', 2, '[\"1695800368.pdf\"]', '2023-09-27 07:39:28', '2024-01-23 12:29:14', '2024-01-23 12:29:14'),
(5, 'COMPENSATORY OFF', 'Comp off also known as compensatory off is a type of leave that avail for employees who work on a holiday or a non-working day.', 2, '[\"1695807021.pdf\"]', '2023-09-27 09:30:21', '2024-01-23 12:28:07', '2024-01-23 12:28:07'),
(6, 'Miss Punch', NULL, 2, '[\"1696483942.pdf\"]', '2023-10-05 05:32:22', '2023-10-05 05:32:22', NULL),
(7, 'INTERVIEW ASSESSMENT SHEET', NULL, 2, '[\"1696485394.pdf\"]', '2023-10-05 05:56:34', '2023-10-05 05:56:34', NULL),
(8, 'Leave Format', NULL, 2, '[\"1696492316.pdf\"]', '2023-10-05 07:51:56', '2023-10-05 07:51:56', NULL),
(9, 'On duty Format', NULL, 2, '[\"1696492510.pdf\"]', '2023-10-05 07:55:10', '2023-10-05 07:55:10', NULL),
(10, 'Self Appraisal', NULL, 2, '[\"1696494253.pdf\"]', '2023-10-05 08:24:13', '2023-10-05 08:24:13', NULL),
(11, 'Compensatory off', 'Compensatory off needs to be taken within 2 months before where they were required to work. There is no provision for giving salary in place of compensatory off.', 2, '[\"1704278839.pdf\"]', '2024-01-03 10:47:19', '2024-01-10 06:56:59', '2024-01-10 06:56:59'),
(12, 'Holiday List -2024', '5 days of compulsory holidays are predetermined by the company. Restricted holidays can be selected by the employees based on their personal beliefs and cultural practices.', 2, '[\"1704868362.pdf\"]', '2024-01-10 06:32:42', '2024-01-23 12:25:47', '2024-01-23 12:25:47'),
(13, 'Parvam working Calendar-2024', 'HR has the authority to modify it as needed, depending on the business requirements and other factors. Please follow the working calendar and plan your work accordingly.', 2, '[\"1704868844.pdf\"]', '2024-01-10 06:40:44', '2024-01-23 12:20:48', '2024-01-23 12:20:48'),
(14, 'Compensatory Off CUM Sanction form', 'If you do not use your leave within two months, it will be forfeited and you will lose this benefit. You will receive an email from HR if there are any updates to this policy.', 2, '[\"1704870670.pdf\"]', '2024-01-10 07:11:11', '2024-01-23 12:14:59', '2024-01-23 12:14:59'),
(15, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1704952940.pdf\"]', '2024-01-11 06:02:20', '2024-01-12 10:45:32', '2024-01-12 10:45:32'),
(16, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1704952940.pdf\"]', '2024-01-11 06:02:20', '2024-01-11 11:25:47', '2024-01-11 11:25:47'),
(17, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1705056350.pdf\"]', '2024-01-12 10:45:50', '2024-01-23 12:13:52', '2024-01-23 12:13:52'),
(18, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1706012055.pdf\"]', '2024-01-23 12:14:15', '2024-01-23 12:16:34', '2024-01-23 12:16:34'),
(19, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1706012302.pdf\"]', '2024-01-23 12:18:23', '2024-01-23 12:19:40', '2024-01-23 12:19:40'),
(20, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1706012421.pdf\"]', '2024-01-23 12:20:21', '2024-01-23 12:35:25', '2024-01-23 12:35:25'),
(21, 'Parvam working Calendar-2024', 'HR has the authority to modify it as needed, depending on the business requirements and other factors. Please follow the working calendar and plan your work accordingly.', 2, '[\"1706012500.pdf\"]', '2024-01-23 12:21:40', '2024-01-23 12:21:40', NULL),
(22, 'Holiday List -2024', '5 days of compulsory holidays are predetermined by the company. Restricted holidays can be selected by the employees based on their personal beliefs and cultural practices.', 2, '[\"1706012768.pdf\"]', '2024-01-23 12:26:08', '2024-01-23 12:31:23', '2024-01-23 12:31:23'),
(23, 'COMPENSATORY OFF POLICY', 'Comp off also known as compensatory off is a type of leave that avail for employees who work on a holiday or a non-working day.', 2, '[\"1706012911.pdf\"]', '2024-01-23 12:28:31', '2024-01-23 12:28:31', NULL),
(24, 'Office Rules & Regulations', 'These guidelines have been put in place to protect the interests of both the company and employees. We expect all employees to familiarize themselves with these rules and regulations and follow them at all times.', 2, '[\"1706012978.pdf\"]', '2024-01-23 12:29:38', '2024-01-23 12:29:38', NULL),
(25, 'WORK PLACE STANDARDS', 'Employees are expected to adhere to these guidelines and show responsibility in managing their working hours and time off requests. Any questions or concerns regarding these guidelines can be addressed to the HR department.', 2, '[\"1706013033.pdf\"]', '2024-01-23 12:30:33', '2024-01-23 12:30:33', NULL),
(26, 'Maternity Leave', 'Review and Amendments: a) This policy will be reviewed periodically by the company and may be amended as and when required. b) Any changes to the policy will be communicated to employees in a timely manner.', 2, '[\"1706013235.pdf\"]', '2024-01-23 12:33:55', '2024-01-23 12:33:55', NULL),
(27, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1706013347.pdf\"]', '2024-01-23 12:35:47', '2024-01-23 12:37:46', '2024-01-23 12:37:46'),
(28, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1706013581.pdf\"]', '2024-01-23 12:39:41', '2024-01-23 12:39:41', NULL),
(29, 'Leave Policy', 'Leave is granted to employees with the good intention of providing rest, recuperation of health and for fulfilling social obligations. This provides for a healthy and efficient staff for the company.', 2, '[\"1706013675.pdf\"]', '2024-01-23 12:41:15', '2024-01-23 12:41:43', '2024-01-23 12:41:43'),
(30, 'LOP Policy', 'If an employee fails to provide prior notice and takes an unapproved leave, it will be considered as LOP and will not be paid for the duration of absence.', 2, '[\"1706013852.pdf\"]', '2024-01-23 12:44:12', '2024-01-23 12:44:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(270) NOT NULL,
  `project_fullname` varchar(52) NOT NULL,
  `project_category_id` int(11) NOT NULL,
  `year` varchar(270) NOT NULL,
  `project_type` varchar(270) NOT NULL,
  `project_description` text NOT NULL,
  `client_name` varchar(270) NOT NULL,
  `project_technology` varchar(32) NOT NULL,
  `project_image` varchar(270) NOT NULL,
  `project_link_live` varchar(255) NOT NULL,
  `project_status_live` varchar(32) NOT NULL,
  `project_link_qa` varchar(255) NOT NULL,
  `project_status_qa` varchar(32) NOT NULL,
  `project_status` varchar(32) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `project_fullname`, `project_category_id`, `year`, `project_type`, `project_description`, `client_name`, `project_technology`, `project_image`, `project_link_live`, `project_status_live`, `project_link_qa`, `project_status_qa`, `project_status`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 'MODULEIGTT', 'INTERIOR<br> WEBSITE', 1, '2019', 'Construction Enterprise Resource Planning', 'We will work with you and help you to create your design. We will also help you in incorporating your existing furniture, if any, into your design. We will provide our expertise be it comprehensive home design, piecing elements together or single design.\n\nThe best part is your design will match your budget and lifestyle, reflecting your personality. We will bring your design to life once you are 100% satisfied with the designModuleigtt Website is a comprehensive platform designed for the construction and interior design industry, offering detailed quotation services. It simplifies the process of generating accurate and customized quotes for various interior design projects. Users can input project details, choose from a range of options, and receive precise cost estimates in a user-friendly format. The website aims to streamline project planning and budgeting, making it an essential tool for designers and contractors alike.', 'Moduleigtt', 'Core PHP, Javascript,HTML,CSS', 'modulete.PNG', '', 'Active', '', 'Active', 'Active', '2023-04-12 12:05:05', '', NULL, '', 0),
(2, 'CPL\n', 'CRICKET<br> APPLICATION', 1, '2019', 'Cricket Bidding Application', 'CPL (Chikkabanavara Premier League) is an auction-based application designed for managing player and team details. The app allows for the updating of player profiles and team rosters based on auction results. Users can assign players to specific teams through the auction process and view the final team compositions and results. This platform provides an engaging and organized way to conduct player auctions and manage league information.', 'rakesh', 'Core PHP, Javascript,HTML,CSS', 'cpl-2022.PNG', '', 'Inactive', 'https://parvamconsultech.com/QA/ParvaMwebsite/V_1.1/index.php', '', 'Active', '2023-04-12 12:05:05', '', NULL, '', 0),
(3, 'QP 1', 'QUOTATION<br> PLATFORM 1', 3, '2019', 'Construction Enterprise Resource Planning', 'QP1 is a sophisticated quotation generator designed for the construction industry. It produces detailed quotations based on the quality and quantity of items required for specific construction projects. The application calculates the necessary quantities and items, ensuring accuracy in cost estimation. Additionally, it includes distributor details, providing a comprehensive tool for managing and sourcing construction materials effectively.', 'pranitha', 'CodeIgniter, Javascript,HTML,CSS', 'webmaster dashboard.PNG', '', 'Active', '', '', 'Active', '2023-04-13 12:05:05', '', NULL, '', 0),
(4, 'Switch direction\r\n', 'SWITCH<br> DIRECTION', 4, '2019', 'Customer relationship management', 'Switchdirection is an advanced dashboard designed to streamline sales and customer management. It offers a comprehensive view of customer details, payment information, lead tracking, and order management. Additionally, the dashboard includes features for call tracking, payment tracking, and monitoring sales agent attendance. This all-in-one solution enhances operational efficiency by providing real-time insights and analytics, helping teams manage and optimize their sales processes effectively.', 'pranitha', 'Angular, codeIgniter, Javascript', 'aerp.PNG', '', '', '', '', 'Active', '2023-04-12 12:05:05', '', NULL, '', 0),
(5, 'RCC', 'CONSTRUCTION <br>WEBSITE', 1, '2019', 'Construction Enterprise Resource Planning', 'RCC Website is a professional platform showcasing the company\'s team, services, and project portfolio. It provides detailed information about the services offered, highlights completed and ongoing projects, and outlines various packages available. Additionally, the website includes contact details for inquiries and further engagement. This site aims to present a comprehensive view of RCC’s capabilities and offerings to potential clients and partners.', 'pranitha', '', 'rcc.png', '', 'Inactive', '', 'Active', 'Active', '2023-04-12 12:05:05', '', NULL, '', 0),
(6, 'FITCARE\r\n', 'GYM WEBSITE', 1, '2019', '', 'project desc', 'pranitha', '', 'fitcare.png', '', '', '', '', '', '2023-04-12 12:05:05', '', NULL, '', 0),
(7, 'DPL', ' DASARAHALLI <br>PREMIER<br> LEAGUE', 1, '2019', 'Cricket Bidding Application', 'DPL (Dasarahalli Premier League) is an auction-style application for managing player and team details within the league. The platform facilitates the updating of player profiles and team assignments based on auction outcomes. Users can track the allocation of players to teams and view the final team rosters and results. This application streamlines the auction process and provides an efficient way to manage and oversee league activities.', 'Rakshitha', 'Core PHP, Javascript,HTML,CSS', 'dpl.PNG', '', '', '', '', 'Active', '2023-04-13 12:05:05', '', NULL, '', 0),
(8, 'GROCERY\r\n', 'ONLINE<br> SHOPPING <br>APPLICATION', 2, '2019', '', 'project desc', 'pranitha', '', 'grocessery.jpg', '', '', '', '', '', '2023-04-12 12:05:05', '', NULL, '', 0),
(9, 'CPL', 'CRICKET<br> APPLICATION', 2, '2018', 'Cricket Bidding Application', 'CPL (Chikkabanavara Premier League) is an auction-based application designed for managing player and team details. The app allows for the updating of player profiles and team rosters based on auction results. Users can assign players to specific teams through the auction process and view the final team compositions and results. This platform provides an engaging and organized way to conduct player auctions and manage league information.', 'CPL', 'Core PHP, Javascript,HTML,CSS', 'cpl.jpg', '', 'Active', '', 'Inactive', '', NULL, '', NULL, '', 0),
(10, 'VEHICLE TICKETING', 'PARKING<br> BOOKING <br>APPLICATION', 2, '', '', '', '', '', 'vehicleticketing.jpg', '', '', '', '', '', NULL, '', NULL, '', 0),
(11, 'BOUNCER', 'EVENT <br>APPLICATION', 2, '', '', '', '', '', 'boncer.jpg', '', '', '', '', '', NULL, '', NULL, '', 0),
(12, 'DINOZ', 'E-COMMERCE<br> APPLICATION', 2, '', '', '', '', '', 'dinoz.jpg', '', '', '', '', '', NULL, '', NULL, '', 0),
(13, 'QP2', 'QUOTATION<br> PLATFORM 2', 3, '', 'Construction Enterprise Resource Planning', 'QP2 is a sophisticated quotation generator designed for the construction industry. It produces detailed quotations based on the quality and quantity of items required for specific construction projects. The application calculates the necessary quantities and items, ensuring accuracy in cost estimation. Additionally, it includes distributor details, providing a comprehensive tool for managing and sourcing construction materials effectively.', '', 'CodeIgniter, Javascript,HTML,CSS', 'qp02.PNG', '', '', '', '', 'Active', NULL, '', NULL, '', 0),
(14, 'QP3', 'QUOTATION<br> PLATFORM 3', 3, '', 'Construction Enterprise Resource Planning', 'QP3 is a sophisticated quotation generator designed for the construction industry. It produces detailed quotations based on the quality and quantity of items required for specific construction projects. The application calculates the necessary quantities and items, ensuring accuracy in cost estimation. Additionally, it includes distributor details, providing a comprehensive tool for managing and sourcing construction materials effectively.', '', 'CodeIgniter, Javascript,HTML,CSS', 'qp03.PNG', '', '', '', '', 'Active', NULL, '', NULL, '', 0),
(15, 'ANANYA PUBLIC SCHOOL', 'School ERP', 3, '', 'Acadamic Administration', 'Ananya School ERP is a comprehensive educational management system designed to handle various administrative and academic tasks. It manages student lists based on their grades, tracks payment and academic details, and stores teacher information. Teachers can update student marks and attendance, while subjects, announcements, and parent requests from the parent app are efficiently managed. The system also allows for the assignment of teachers to subjects, streamlining the overall administrative workflow and enhancing communication within the school community.', '', 'Core PHP, Javascript,HTML,CSS', 'schoolerp.png', '', '', '', '', 'Active', NULL, '', NULL, '', 0),
(16, 'ANANYA PUBLIC SCHOOL', 'School Website', 5, '', 'Acadamic Website', 'APS Website is an informative platform showcasing the school\'s offerings, including facilities, curriculum, admissions, and infrastructure. While most pages are static, the site features dynamic sections such as Results, Gallery, Contact Us, and Careers, all managed through a user-friendly dashboard. These dynamic pages provide up-to-date information on student achievements, visual highlights, contact details, and job vacancies with application forms. The website aims to present a comprehensive view of the school, enhancing engagement with prospective students, parents, and job applicants.', '', 'Core PHP, Javascript,HTML,CSS', 'school landing.jpeg', '', '', '', '', 'Active', NULL, '', NULL, '', 1),
(17, 'HR PORTAL', 'HR<br> MANAGEMENT<br> SYSTEM', 5, '', 'Enterprise Resource Planning', 'HR Portal is a comprehensive application designed to manage all employee-related information, including education, bank details, and work experience. It tracks check-in and check-out times, leave records, and project details, while also documenting employees\' skills and roles in the IT field. The portal serves both HR and employees, allowing staff to check in or out, apply for leave, track project progress, and view leave history. Additionally, it provides access to all company policies, ensuring transparent communication and efficient management within the organization.', '', 'Laravel,Core PHP, Javascript,HTM', 'HR portal (1).png', '', '', '', '', 'Active', NULL, '', NULL, '', 0),
(18, 'ADMISSION <br>MANAGEMENT<br> SYSTEM', '', 5, '', '', '', '', '', 'sri.jpg', '', '', '', '', '', NULL, '', NULL, '', 0),
(19, 'VEHICLE TICKETING', 'PARKING <br>BOOKING APPLICATION', 5, '', '', '', '', '', 'vehicleticketing.jpg', '', '', '', '', '', NULL, '', NULL, '', 0),
(20, 'WEF', '', 1, '', 'Conference Management System', 'Women Economic Forum is a dynamic website dedicated to showcasing and organizing global events focused on women\'s economic empowerment. It features a comprehensive list of upcoming events hosted in various countries, allowing users to explore and select relevant forums. The site includes a registration form for both speakers and attendees, facilitating easy sign-ups and participation. By connecting women across the globe, the forum aims to foster dialogue, networking, and collaboration on economic and social issues.', '', 'Core PHP, Javascript,HTML,CSS', 'weff landing.jpeg', '', '', '', '', 'Active', '2024-07-08 10:54:47', '', NULL, '', 0),
(21, 'GeeKayBee Website', '', 1, '', 'Construction Enterprise Resource Planning', 'GeeKayBee Website is a construction-focused platform showcasing the company’s services, team, and contact information. It provides detailed insights into the construction services offered, introduces the team behind the projects, and includes essential contact details for inquiries. The site aims to present a clear and professional overview of GeeKayBee’s expertise and facilitate easy communication with potential clients.', '', 'Core PHP, Javascript,HTML,CSS', 'code landing.png', '', '', '', '', 'Active', '2024-07-08 10:58:04', '', NULL, '', 0),
(22, 'CCS World ', '', 1, '', ' Educational Consulting Website', 'CCS World Website is an education consultancy platform designed to guide students in selecting the right colleges for their courses across India. It provides detailed information on various colleges and the programs they offer, helping students make informed decisions about their education. The website aims to simplify the college selection process by offering comprehensive insights and recommendations tailored to individual academic interests and career goals.', '', 'Core PHP, Javascript,HTML,CSS', 'css landing.jpeg', '', '', '', '', 'Active', '2024-07-08 10:58:04', '', NULL, '', 0),
(23, 'MetaTreat ', '', 1, '', 'water treatment website', 'MetaTreat Website is a single-page platform dedicated to waste water treatment. It provides detailed information about the wastewater treatment processes used by the company, showcasing their methods and technologies. The site also includes a contact form for inquiries, allowing users to reach out for more information or services. The focus of the website is on delivering clear, concise details about their treatment solutions and facilitating easy communication with potential clients.', '', 'Core PHP, Javascript,HTML,CSS', 'MetaTreat3.png', '', '', '', '', 'Active', '2024-07-08 11:35:25', '', NULL, '', 0),
(24, 'Reliflex ', '', 1, '', 'Trade Services Website', 'Reliflex Website is a trading platform focused on import and export processes. It provides essential information about the company’s trading operations and services. The site includes a form for customers to initiate import or export requests, facilitating the process of handling product transactions. The website aims to offer clear details about their trading services while providing a straightforward way for customers to engage with their import and export offerings.', '', 'Core PHP, Javascript,HTML,CSS', 'reliflex3.png', '', '', '', '', 'Active', NULL, '', NULL, '', 0),
(25, 'HomeLyncs', '', 1, '', 'Service Directory and Booking Website', 'HomeLyncs is a service-based website offering pest control, home cleaning, and home painting solutions. It allows users to explore and book various services while capturing detailed customer information to facilitate service delivery. The platform efficiently gathers customer details, including contact information and service requirements, to ensure a smooth scheduling process and personalized service. HomeLyncs aims to streamline home maintenance by combining easy booking with comprehensive customer data management.', '', 'Core PHP, Javascript,HTML,CSS', 'homelyncs landing.png', '', '', '', '', 'Active', '2024-07-08 12:00:13', '', NULL, '', 0),
(26, 'HomeLyncs ', 'Admin Dash Borad', 4, '', 'Service Directory and Booking Website Admin Dashboard', 'HomeLyncs Dashboard is a robust management tool for overseeing various aspects of the service-based website. It features functionalities for managing services, packages, and blog content, as well as handling leads, FAQs, team information, reviews, and brand details. The dashboard provides a centralized view of the website\'s operations and captures leads generated from service inquiries. This platform aims to streamline administration and enhance overall efficiency by integrating key management features in one accessible interface.', '', 'Core PHP, Javascript,HTML,CSS', 'admin landing.png', '', '', '', '', 'Active', '2024-07-08 12:00:13', '', NULL, '', 0),
(27, 'Esvee Stationers ', '', 1, '', 'Stationery E-commerce Website', 'EsveeStationary Website is an online platform specializing in a wide range of stationery products. It features detailed listings of various items, including office supplies, writing tools, and organizational materials. The website offers an easy-to-navigate interface for browsing and purchasing stationery, with comprehensive product descriptions and images. It aims to provide a convenient shopping experience for both individuals and businesses seeking high-quality stationery solutions.', '', 'Core PHP, Javascript,HTML,CSS', 'esv landing.png', '', '', '', '', 'Active', '2024-07-03 12:11:29', '', NULL, '', 0),
(28, 'PU College ', '', 1, '', 'Acadamic Website', 'PU College Admin is a management tool designed to oversee student information and academic performance. It provides administrators with the ability to view and manage student marks, access a comprehensive list of students, and monitor their attendance records. This platform helps streamline administrative tasks by consolidating key academic data and attendance information, ensuring efficient management and tracking of student performance throughout their courses.', '', 'Core PHP, Javascript,HTML,CSS', 'puc landing.png', '', '', '', '', 'Active', '2024-07-08 12:11:18', '', NULL, '', 0),
(29, 'ITF', '', 1, '', 'Agriculture Event Management System', 'ITF is a versatile application designed for managi...', '', 'Core PHP, Javascript,HTML,CSS', 'itf landing.png', '', '', '', '', 'Active', '2024-07-09 04:50:52', '', NULL, '', 0),
(30, 'ITF ', 'Admin Dash Borad', 4, '', 'Agriculture Event Management System admin Dashboard', 'ITF is a versatile application designed for managing registrations and bookings for various agricultural events. It includes forms for Millet Walkathon, Exhibition, B2B Buyer and Seller registrations, Conference, Farmer Workshops, Public Registration, and Paid Food Stalls. Users can fill out these forms to register for different event categories and also select and book specific stall areas for setting up. This application streamlines the event management process, making it easy to handle registrations and stall reservations efficiently.', '', 'Core PHP, Javascript,HTML,CSS', 'itfa landing.png', '', '', '', '', 'Active', '2024-07-09 04:50:52', '', NULL, '', 0),
(31, 'Enabling Ventures ', '', 1, '', 'Mental Health Management System', 'Enabling Ventures is a website dedicated to helping individuals embark on a journey of self-awareness through the Enneagram system. It engages users with a series of questions designed to uncover their thoughts and insights. Based on their responses, the website generates a detailed graph that visually represents their self-awareness journey. This graph is then provided to a counseling agent, who uses it to offer personalized guidance and support to each individual.', '', 'Core PHP, Javascript,HTML,CSS', 'ena landing.png', '', '', '', '', 'Active', '2024-07-09 05:06:17', '', NULL, '', 0),
(32, 'Enabling Ventures', 'Admin Dash Borad', 4, '', 'Mental Health Management System Admin Dashboard', 'Enabling Ventures Admin Dashboard is a robust management tool for overseeing attendee interactions and assessment activities. It displays comprehensive metrics, including all attendees, total assessments, partial assessments, and the total number of booked sessions. The dashboard features options to view data across various timeframes—monthly, last 7 days, today, and current year. Additionally, it provides a detailed list of booked sessions organized by date and showcases the most recent five completed test records. This centralized view helps administrators efficiently track and manage all aspects of the assessment process.', '', 'Core PHP, Javascript,HTML,CSS', 'enabling landing.png', '', '', '', '', 'Active', '2024-07-09 05:06:17', '', NULL, '', 0),
(33, 'Martin Realtors', '', 1, '', 'Real estate Enterprise Resource Planning', 'Martin Realtors is a comprehensive real estate website offering detailed information on various properties, including villas, apartments, land, and plots. Users can log in to save their favorite listings and make inquiries about specific properties. The site provides extensive details such as sale price, specifications, amenities, and location data, alongside contact information and reasons for selling. This platform aims to facilitate informed decision-making and efficient property management for potential buyers and investors.', '', 'Core PHP, Javascript,HTML,CSS', 'marting landing.png', '', '', '', '', 'Active', '2024-07-09 05:29:40', '', NULL, '', 0),
(34, 'Bric2Bric', '', 1, '', 'Construction Enterprise Resource Planning', 'Bric2Bric is a construction-oriented website that provides comprehensive information about the company\'s services and projects. It features detailed descriptions of the services offered, insights into ongoing and completed projects, and contact information for further inquiries. The platform aims to showcase the company\'s expertise and facilitate easy communication with potential clients.', '', 'Core PHP, Javascript,HTML,CSS', 'bric landing.png', '', '', '', '', 'Active', '2024-07-09 05:29:40', '', NULL, '', 0),
(35, 'Bric2Bric', 'Admin Dash Board', 4, '', 'Construction Enterprise Resource Planning Admin dashboard', 'Bric2Bric Admin Dashboard is a robust management tool designed for overseeing various aspects of the construction business. It includes features for tracking customer leads, adding and managing staff and departments, and overseeing renovation projects and building materials. The dashboard also facilitates call tracking and managing package details, providing a comprehensive overview of operations and enhancing administrative efficiency.', '', 'Core PHP, Javascript,HTML,CSS', 'bricadmin landing.png', '', '', '', '', 'Active', '0000-00-00 00:00:00', '', NULL, '', 0),
(36, 'Moduleigtt ', 'Admin Dash Board', 4, '', 'Construction Enterprise Resource Planning Admin Dashboard', 'Moduleigtt Website features a robust dashboard for managing registered customers from the quotation system. This intuitive dashboard allows users to view and track customer details, including their quotation history and project preferences. It provides a centralized interface to manage customer interactions, follow up on quotes, and update project information. The dashboard enhances operational efficiency by offering clear insights into customer data and streamlining communication between design professionals and clients.', '', 'Core PHP, Javascript,HTML,CSS', 'dashboard.jpeg', '', '', '', '', 'Active', NULL, '', NULL, '', 0),
(37, 'Ananya Public School', 'Admin Dash Board', 4, '', 'Acadamic Website Admin Dashboard', 'APS Website Admin Dashboard is a powerful tool for managing and updating various aspects of the school\'s website. It includes features to track enquiry and applicant counts, manage the home page banner, announce holidays, and change curriculum content. Additionally, the dashboard allows for updating results, gallery images, admission information, testimonials, and job vacancies. This comprehensive dashboard ensures that the school\'s online presence is always current and engaging.', '', 'Core PHP, Javascript,HTML,CSS', 'apsa landing.png', '', '', '', '', 'Active', '2024-07-09 10:54:34', '', NULL, '', 0),
(38, 'Qleaps', '', 1, '', 'Business Ideology Website', 'QLeaps Website is a single-page static site designed to highlight the company’s core values, strengths, and a range of services, including business advisory, start-ups, training, recruitment, research, and wealth advisory. It features a dedicated section for introducing the team and provides a contact form for inquiries. The website aims to offer a clear and concise overview of QLeaps\' offerings and facilitate easy communication with potential clients.', '', 'Core PHP, Javascript,HTML,CSS', 'qleaps landing.png', '', '', '', '', 'Active', '2024-07-09 11:24:35', '', NULL, '', 0),
(39, 'Homestay ', '', 1, '', 'Residential Features Website', 'Homestay is a user-friendly platform designed to connect travelers with comfortable and personalized lodging options. It features detailed listings of available homestay accommodations, including property descriptions, amenities, and booking information. Users can browse various homestay options, view images, and make reservations directly through the platform. The site aims to provide a unique and home-like experience for travelers seeking a more intimate stay.', '', 'Core PHP, Javascript,HTML,CSS', 'hs lading.png', '', '', '', '', 'Active', '2024-07-09 11:30:55', '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `rate_type` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `leader` bigint(20) UNSIGNED DEFAULT NULL,
  `team` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

CREATE TABLE `project_category` (
  `project_category_id` int(11) NOT NULL,
  `project_category` varchar(270) NOT NULL,
  `project_category_status` varchar(32) NOT NULL,
  `project_remarks` text NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_category`
--

INSERT INTO `project_category` (`project_category_id`, `project_category`, `project_category_status`, `project_remarks`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 'WEBSITE', 'Active', '', NULL, '', NULL, '', 0),
(2, 'MOBILE-APPS', 'Active', '', NULL, '', NULL, '', 0),
(3, 'ERP', 'Active', '', NULL, '', NULL, '', 0),
(4, 'CRM', 'Active', '', NULL, '', NULL, '', 0),
(5, 'PRODUCTS', 'Active', '', NULL, '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_image`
--

CREATE TABLE `project_image` (
  `project_image_id` int(11) NOT NULL,
  `project_image` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_category_id` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_image`
--

INSERT INTO `project_image` (`project_image_id`, `project_image`, `project_id`, `project_category_id`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 'landing page.jpeg', 1, 1, NULL, '', NULL, '', 0),
(2, 'modulite.png', 1, 1, NULL, '', NULL, '', 0),
(3, 'about company.jpeg', 1, 1, NULL, '', NULL, '', 0),
(4, 'order.jpeg', 4, 4, NULL, '', NULL, '', 0),
(7, 'switchattendence.jpeg', 4, 4, NULL, '', NULL, '', 0),
(8, 'Wardrobe2.jpg', 2, 1, NULL, '', NULL, '', 1),
(9, 'cpl landing.jpeg', 2, 1, NULL, '', NULL, '', 0),
(10, 'form.jpeg', 2, 1, NULL, '', NULL, '', 0),
(11, 'Walkinward2.jpg', 2, 1, NULL, '', NULL, '', 1),
(12, 'switchlanding.jpeg', 4, 4, NULL, '', NULL, '', 0),
(13, 'qp1qotation.jpeg', 3, 1, NULL, '', NULL, '', 0),
(14, 'qp1 landing.jpeg', 3, 1, NULL, '', NULL, '', 0),
(15, 'qp1 projects.jpeg', 3, 1, NULL, '', NULL, '', 0),
(16, 'rcc landing.jpeg', 5, 1, NULL, '', NULL, '', 0),
(17, 'about.jpeg', 5, 1, NULL, '', NULL, '', 0),
(18, 'rcc projects.jpeg', 5, 1, NULL, '', NULL, '', 0),
(19, 'Walkinward2.jpg', 5, 1, NULL, '', NULL, '', 1),
(21, 'Island2B.jpg', 6, 1, NULL, '', NULL, '', 0),
(22, 'modulete.PNG', 6, 1, NULL, '', NULL, '', 0),
(23, 'Walkinward2.jpg', 6, 1, NULL, '', NULL, '', 0),
(24, 'dpl details.jpeg', 7, 1, NULL, '', NULL, '', 0),
(25, 'dpl landing.jpeg', 7, 1, NULL, '', NULL, '', 0),
(26, 'dpl lists.jpeg', 7, 1, NULL, '', NULL, '', 0),
(27, 'Walkinward2.jpg', 8, 2, NULL, '', NULL, '', 0),
(28, 'Wardrobe2.jpg', 8, 2, NULL, '', NULL, '', 0),
(29, 'Island2B.jpg', 8, 2, NULL, '', NULL, '', 0),
(30, 'modulete.PNG', 8, 2, NULL, '', NULL, '', 0),
(31, 'Walkinward2.jpg', 9, 2, NULL, '', NULL, '', 0),
(32, 'Wardrobe2.jpg', 9, 2, NULL, '', NULL, '', 0),
(33, 'modulete.PNG', 9, 2, NULL, '', NULL, '', 0),
(34, 'Walkinward2.jpg', 10, 2, NULL, '', NULL, '', 0),
(35, 'Wardrobe2.jpg', 10, 2, NULL, '', NULL, '', 0),
(36, 'Island2B.jpg', 10, 2, NULL, '', NULL, '', 0),
(37, 'modulete.PNG', 11, 2, NULL, '', NULL, '', 0),
(38, 'Walkinward2.jpg', 11, 2, NULL, '', NULL, '', 0),
(39, 'Wardrobe2.jpg', 11, 2, NULL, '', NULL, '', 0),
(40, 'modulete.PNG', 12, 2, NULL, '', NULL, '', 0),
(41, 'Walkinward2.jpg', 12, 2, NULL, '', NULL, '', 0),
(42, 'Wardrobe2.jpg', 12, 2, NULL, '', NULL, '', 0),
(43, 'qp2 brand.jpeg', 13, 3, NULL, '', NULL, '', 0),
(44, 'qp2 login.jpeg', 13, 3, NULL, '', NULL, '', 0),
(45, 'qp2 purchase.jpeg', 13, 3, NULL, '', NULL, '', 0),
(46, 'Wardrobe2.jpg', 13, 3, NULL, '', NULL, '', 1),
(47, 'qp3 landing.jpeg', 14, 3, NULL, '', NULL, '', 0),
(48, 'qp3 quotation.jpeg', 14, 3, NULL, '', NULL, '', 0),
(49, 'qp3 quotationsokgreat.jpeg\n', 14, 3, NULL, '', NULL, '', 0),
(50, 'Wardrobe2.jpg', 14, 3, NULL, '', NULL, '', 1),
(51, 'erp data.jpeg', 15, 3, NULL, '', NULL, '', 0),
(52, 'erp landing.jpeg', 15, 3, NULL, '', NULL, '', 0),
(53, 'nicee.jpeg', 15, 3, NULL, '', NULL, '', 0),
(54, 'Wardrobe2.jpg', 15, 3, NULL, '', NULL, '', 1),
(55, 'school landing.jpeg', 16, 5, NULL, '', NULL, '', 0),
(56, 'school result.jpeg', 16, 5, NULL, '', NULL, '', 0),
(57, 'school video.jpeg', 16, 5, NULL, '', NULL, '', 0),
(58, 'Wardrobe2.jpg', 16, 5, NULL, '', NULL, '', 1),
(59, 'hr attendance.jpeg', 17, 5, NULL, '', NULL, '', 0),
(60, 'hr holiday.jpeg', 17, 5, NULL, '', NULL, '', 0),
(61, 'hr landing.jpeg', 17, 5, NULL, '', NULL, '', 0),
(62, 'Wardrobe2.jpg', 18, 5, NULL, '', NULL, '', 0),
(63, 'modulete.PNG', 18, 5, NULL, '', NULL, '', 0),
(64, 'Walkinward2.jpg', 18, 5, NULL, '', NULL, '', 0),
(65, 'Wardrobe2.jpg', 19, 5, NULL, '', NULL, '', 0),
(66, 'Wardrobe2.jpg', 19, 5, NULL, '', NULL, '', 0),
(67, 'modulete.PNG', 19, 5, NULL, '', NULL, '', 0),
(68, 'Walkinward2.jpg', 19, 5, NULL, '', NULL, '', 0),
(69, 'Wardrobe2.jpg', 18, 5, NULL, '', NULL, '', 0),
(70, 'weff landing.jpeg', 20, 1, '2024-07-09 05:49:47', '', NULL, '', 0),
(71, 'wef about.jpeg', 20, 1, NULL, '', NULL, '', 0),
(72, 'artcle.jpeg', 20, 1, NULL, '', NULL, '', 0),
(73, 'code landing.png', 21, 1, NULL, '', NULL, '', 0),
(74, 'code service.png', 21, 1, NULL, '', NULL, '', 0),
(75, 'contact.png', 21, 1, NULL, '', NULL, '', 0),
(76, 'css landing.jpeg', 22, 1, NULL, '', NULL, '', 0),
(77, 'css services.jpeg', 22, 1, NULL, '', NULL, '', 0),
(78, 'css destination.jpeg', 22, 1, NULL, '', NULL, '', 0),
(79, 'MetaTreat3.png', 23, 1, NULL, '', NULL, '', 0),
(80, 'MetaTreat2.png', 23, 1, NULL, '', NULL, '', 0),
(81, 'MetaTreat.png', 23, 1, NULL, '', NULL, '', 0),
(82, 'reliflex3.png', 24, 1, NULL, '', NULL, '', 0),
(83, 'reliflex.png', 24, 1, NULL, '', NULL, '', 0),
(84, 'reliflex1.png', 24, 1, NULL, '', NULL, '', 0),
(85, 'homelyncs landing.png', 25, 1, NULL, '', NULL, '', 0),
(86, 'homelyncs map.png', 25, 1, NULL, '', NULL, '', 0),
(87, 'homelyncs getaquote.png', 25, 1, NULL, '', NULL, '', 0),
(88, 'esv landing.png', 27, 1, NULL, '', NULL, '', 0),
(89, 'esv bestselling.png', 27, 1, NULL, '', NULL, '', 0),
(90, 'esv stationary.png', 27, 1, NULL, '', NULL, '', 0),
(91, 'puc landing.png', 28, 1, NULL, '', NULL, '', 0),
(92, 'puc proceed.png', 28, 1, NULL, '', NULL, '', 0),
(93, 'itf landing.png', 29, 1, NULL, '', NULL, '', 0),
(94, 'millets.png', 29, 1, NULL, '', NULL, '', 0),
(95, 'tft publications.png', 29, 1, NULL, '', NULL, '', 0),
(96, 'itfa landing.png', 30, 4, NULL, '', NULL, '', 0),
(97, 'itfa best.png', 30, 4, NULL, '', NULL, '', 0),
(98, 'itfa walktjon.png', 30, 4, NULL, '', NULL, '', 0),
(99, 'ena landing.png', 31, 1, NULL, '', NULL, '', 0),
(100, 'ena  form.png', 31, 1, NULL, '', NULL, '', 0),
(101, 'registration.png', 31, 1, NULL, '', NULL, '', 0),
(102, 'enabling landing.png', 32, 4, NULL, '', NULL, '', 0),
(103, 'enabling assesment.png', 32, 4, NULL, '', NULL, '', 0),
(104, 'details.png', 32, 4, NULL, '', NULL, '', 0),
(105, 'marting landing.png', 33, 1, NULL, '', NULL, '', 0),
(106, 'martin profile.png', 33, 1, NULL, '', NULL, '', 0),
(107, 'martin blog.png', 33, 1, NULL, '', NULL, '', 0),
(108, 'bric landing.png', 34, 1, NULL, '', NULL, '', 0),
(109, 'bric projects.png', 34, 1, NULL, '', NULL, '', 0),
(110, 'bric get.png', 34, 1, NULL, '', NULL, '', 0),
(111, 'bricadmin landing.png', 35, 4, NULL, '', NULL, '', 0),
(112, 'bricadmin leads.png', 35, 4, NULL, '', NULL, '', 0),
(113, 'bricadmin insertion.png', 35, 4, NULL, '', NULL, '', 0),
(114, 'dashboard.jpeg', 36, 4, '2024-07-09 10:38:52', '', NULL, '', 0),
(115, 'login page.jpeg', 36, 4, NULL, '', NULL, '', 0),
(116, 'apsa landing.png', 37, 4, NULL, '', NULL, '', 0),
(117, 'apsa banner.png', 37, 4, NULL, '', NULL, '', 0),
(118, 'apsa categery.png', 37, 4, NULL, '', NULL, '', 0),
(119, 'qleaps landing.png', 38, 1, NULL, '', NULL, '', 0),
(120, 'qleaps about.png', 38, 1, NULL, '', NULL, '', 0),
(121, 'qleaps responsibility.png', 38, 1, NULL, '', NULL, '', 0),
(122, 'hs lading.png', 39, 1, NULL, '', NULL, '', 0),
(123, 'hs check.png', 39, 1, NULL, '', NULL, '', 0),
(124, 'hs contact.png', 39, 1, NULL, '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provident_funds`
--

CREATE TABLE `provident_funds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `employee_share_amount` varchar(255) DEFAULT NULL,
  `org_share_amount` varchar(255) DEFAULT NULL,
  `employee_share_percent` varchar(255) DEFAULT NULL,
  `org_share_percent` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `salary` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles_for_login`
--

CREATE TABLE `roles_for_login` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_for_login`
--

INSERT INTO `roles_for_login` (`id`, `role_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', '2023-03-31 05:26:14', '2023-03-31 05:26:14', NULL),
(2, 'HR', '2023-03-31 05:26:24', '2023-03-31 05:26:24', NULL),
(3, 'Employee', '2023-03-31 05:26:31', '2023-03-31 05:26:31', NULL),
(4, 'Guest', '2023-03-31 05:26:39', '2023-04-25 07:24:01', '2023-04-25 07:24:01'),
(5, 'Ghost1', '2023-04-04 05:18:57', '2023-04-04 05:19:43', '2023-04-24 14:21:35'),
(6, 'Super Admin', '2023-04-28 07:59:35', '2023-05-05 11:07:19', '2023-05-05 11:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `service_title` varchar(32) NOT NULL,
  `service_list_img` varchar(255) NOT NULL,
  `service_desc` text NOT NULL,
  `service_shrt_desc` text NOT NULL,
  `service_image` varchar(255) NOT NULL,
  `service_status` varchar(32) NOT NULL,
  `service_features` varchar(32) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `service_title`, `service_list_img`, `service_desc`, `service_shrt_desc`, `service_image`, `service_status`, `service_features`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 'Web Design & Development', 'Web-Design.jpg', 'PARVAM designs & develops websites which leads to increased online presence and it will have an impact on your business ahead of your competitors. We have over 100+ satisfied website clients across Karnataka & globally.\n<br>\n<br>\nOver years of experience as a website designing company in Bangalore, We deliver user-friendly mobile responsive designs. \n<br>\n<br>\nOur expert team is proficient in the latest designing & development tools with operating environments. Even if you have a website and want to upgrade or redesign ParvaM will do it.', 'Elevate your digital brand, engage your audience, and achieve your business goals with a website that\'s as unique as your company.', 'Web-Design.jpg', 'Active', '', NULL, '', NULL, '', 0),
(2, 'Digital Marketing', 'AdobeStock_211888174-scaled-1-1024x683.jpeg', 'Our Digital Marketing Team is committed in setting up your business promotion through SEO & SMM which boosts online traffic and visibility of your website, It eventually more revenue for your business.\n\nPARVAM is one of the leading SEO services providers in Bangalore with a full-service approach to search engine marketing.', 'We\'re dedicated to helping you connect with your audience, increase brand visibility, and achieve tangible results in the online world.', 'AdobeStock.jpg', 'Active', '', NULL, '', NULL, '', 0),
(3, 'Mobile Apps', 'mobile.jpg', 'At PARVAM We develop Mobile Apps which suit & are compatible for iOS and Android run on various platforms. We are the leaders in Mobile App Development in Bangalore that work across many platforms, It improves the convenience and adoptable for the speed for users access. We\'re committed to providing our customers with the highest possible standard of mobile application development.\n<br>\n<br>\nWe adopt the agile app development approach to keep your business flow transparent at every level of alterations.\n<br>\n<br>\nCustom mobile app development services: \n<br>\n<br>\n<b>iOS Mobile App Development</b>\n<br>\nParvaM is the leading iOS app development IT firm with expertise in Apple User Interface guidelines & latest apple app frameworks like Swift UI, Adaptivity & Notifications.\n<br>\n<br>\n<b>Android Mobile App Development</b>\n<br>\nAndroid is almost used by 80% mobile platform that powers a number of smartphones and devices users, Understanding the user’s demand with today’s business needs android application is the much needed.\n<br>\n<br>\n<b>Hybrid Mobile App Development</b>\n<br>\nAs a leading Hybrid App Development service provider in india, We transform all the shapes and sizes of businesses. ParvaM will be the right choie to experience the most robust, reliable, and scalable hybrid mobile app development strategy.', 'Our Mobile Apps service is dedicated to turning your app concept into a reality, delivering seamless and captivating experiences to your users.', 'mobile.jpg', 'Active', '', NULL, '', NULL, '', 0),
(4, 'Custom Software', 'software-development-24.jpg', 'We\'re dedicated to crafting bespoke digital solutions that precisely match your company\'s distinct requirements, goals, and challenges.\n<br>\n<br>\nHere\'s how our Custom Software service can revolutionize your business:\n<br>\n<br>\n<b>Personalized Solutions:</b> We don\'t believe in generic solutions. Our team collaborates closely with you to understand your needs and creates software that\'s tailor-made to address your specific challenges.\n<br>\n<br>\n<b>Efficiency and Productivity:</b> Our custom software streamlines your processes, enhancing efficiency and productivity within your organization.\n<br>\n<br>\n<b>Scalability:</b> As your business evolves, so can your software. We design scalable solutions that can adapt to your changing needs without requiring a complete overhaul.\n<br>\n<br>\n<b>Cost-Efficiency:</b> Custom software can often be more cost-effective in the long run than off-the-shelf alternatives, as it eliminates unnecessary features and licenses.\n<br>\n<br>\n<b>Seamless Integration:</b> We ensure that your custom software integrates seamlessly with your existing systems and technologies, minimizing disruption to your operations.\n<br>\n<br>\n<b>User Experience:</b> Our focus on user-centered design ensures that your software is intuitive and easy to use, resulting in higher user satisfaction and adoption.\n<br>\n<br>\n<b>Continuous Support:</b> We\'re with you every step of the way, providing ongoing support, updates, and enhancements to keep your custom software running smoothly.', 'Experience the power of custom software, tailored to your company\'s unique perspective and requirements.', 'software-development-24.jpg', 'Active', '', NULL, '', NULL, '', 0),
(5, 'Graphic Designing', 'Free-Latest-Graphic-Designing-Software.jpg', 'Unlock the potential of exceptional graphic design to enhance your brand, captivate your audience, and outshine your competitors.\n<br>\n<br>\nHere\'s how our Graphic Designing service can breathe life into your visual communication:\n<br>\n<br>\n<b>Creative Mastery:</b> Our team of talented designers combines creativity and expertise to craft designs that stand out in a crowded visual landscape.\n<br>\n<br>\n<b>Brand Consistency:</b> We ensure that every design element, from logos to marketing materials, aligns seamlessly with your brand identity, fostering recognition and trust.\n<br>\n<br>\n<b>Custom Artistry:</b> Your vision is unique, and so are our designs. We create bespoke solutions that cater specifically to your business needs and goals.\n<br>\n<br>\n<b>Versatile Solutions:</b> From print to digital, we design for various mediums, ensuring your message remains impactful and consistent across all platforms.\n<br>\n<br>\n<b>User-Centric Approach:</b> We prioritize the user\'s experience, creating designs that are intuitive, user-friendly, and focused on achieving your desired outcomes.\n<br>\n<br>\n<b>Effective Communication:</b> We use design to tell your brand story, convey complex ideas, and communicate messages effectively, leaving a lasting impact on your audience.\n<br>\n<br>\n<b>Attention to Detail:</b> Every pixel and element is carefully considered to ensure precision and excellence in every design project we undertake.', 'Unlock the potential of exceptional graphic design to enhance your brand, captivate your audience, and outshine your competitors.', 'Free-Latest.jpg', 'Active', '', NULL, '', NULL, '', 0),
(6, 'Content Writing', 'content-writer.jpeg', 'Predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of overcombined', 'Our expert content writing team will focus on picking apt Keywords & contents which enhances getting more organic traffic to your online platforms.', 'content-writer.jpeg', 'Active', '', NULL, '', NULL, '', 0),
(7, 'IT Staffing', 'recruitment-agency.jpg', 'Predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of overcombined', 'We help you to identify the apt candidates based on the companies manpower recruitment.', 'recruitment-agency.jpg', 'Active', '', NULL, '', NULL, '', 0),
(8, 'Training & Internships', 'header-internships02.jpg', 'Predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of overcombined', 'We offer a comprehensive Training & Internship service that provides invaluable learning experiences for aspiring professionals.', 'header-internships02.jpg', 'Active', '', NULL, '', NULL, '', 0),
(9, 'Research & Development', 'header-internships02.jpg', '{\"Technical Training & Workshops\": \"Comprehensive programs designed to enhance technical skills through in-depth knowledge and practical experience across various technologies.\", \"Placement Drive\": \"Organized events connecting job seekers with potential employers, facilitating interviews and job placements in diverse industries.\", \"Internships\": \"Structured programs offering hands-on learning and professional exposure, enabling participants to gain valuable industry knowledge and skills.\"}', 'We offer a comprehensive Training & Internship service that provides invaluable learning experiences for aspiring professionals.', '{\"Technical Training & Workshops\": \"Training.jpg\",\"Placement Drive\": \"Placement.png\",\"Internships\": \"Internship.jpg\"}', 'Active', '', NULL, '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `locked`, `payload`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'company', 'company_name', 0, '\"ParvaM Consultech Private Limited\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(2, 'company', 'contact_person', 0, '\"santhosh\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(3, 'company', 'address', 0, '\"#117, New Extension, Chikkabanavara, Heseraghatta Main road, Bangalore - 560090\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(4, 'company', 'country', 0, '\"India\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(5, 'company', 'city', 0, '\"Bangalore\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(6, 'company', 'province', 0, '\"Karnataka\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(7, 'company', 'postal_code', 0, '\"560090\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(8, 'company', 'email', 0, '\"support@parvamm.com\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(9, 'company', 'phone', 0, '\"9483032047\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(10, 'company', 'mobile', 0, '\"9483032047\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(11, 'company', 'fax', 0, '\"123456789\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(12, 'company', 'website_url', 0, '\"https:\\/\\/www.parvamm.com\"', '2022-11-24 11:46:59', '2023-09-21 12:26:59', NULL),
(13, 'theme', 'site_name', 0, '\"HR Portal\"', '2022-11-24 11:46:59', '2023-09-22 05:38:29', NULL),
(14, 'theme', 'logo', 0, '\"1695361109.png\"', '2022-11-24 11:46:59', '2023-09-22 05:38:29', NULL),
(15, 'theme', 'favicon', 0, '\"1695361109.png\"', '2022-11-24 11:46:59', '2023-09-22 05:38:29', NULL),
(16, 'theme', 'currency_symbol', 0, '\"\\u20b9\"', '2022-11-24 11:46:59', '2023-09-22 05:38:29', NULL),
(17, 'theme', 'currency_code', 0, '\"Rupees\"', '2022-11-24 11:46:59', '2023-09-22 05:38:29', NULL),
(18, 'invoice', 'logo', 0, '\"1682675768.png\"', '2022-11-24 11:46:59', '2023-04-28 09:56:08', NULL),
(19, 'invoice', 'prefix', 0, '\"INV-666\"', '2022-11-24 11:46:59', '2023-04-28 09:56:08', NULL),
(20, 'attendance', 'checkin_time', 0, '\"9:30\"', '2022-11-24 11:46:59', '2022-11-24 11:46:59', NULL),
(21, 'attendance', 'checkout_time', 0, '\"6:30\"', '2022-11-24 11:46:59', '2022-11-24 11:46:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tag_master`
--

CREATE TABLE `tag_master` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(32) NOT NULL,
  `tag_desc` text NOT NULL,
  `tag_code` varchar(32) NOT NULL,
  `tag_status` varchar(32) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `modified_on` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(32) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tag_master`
--

INSERT INTO `tag_master` (`tag_id`, `tag_name`, `tag_desc`, `tag_code`, `tag_status`, `created_on`, `created_by`, `modified_on`, `modified_by`, `delete_status`) VALUES
(1, 'Javascript', 'Javascript desc', '', 'Active', NULL, '', NULL, '', 0),
(2, 'Android Development', 'Android Development desc', '', 'Active', NULL, '', NULL, '', 0),
(3, 'Quiz App', 'Quiz App desc', '', 'Active', NULL, '', NULL, '', 0),
(4, 'Temperature converter App', 'Temperature converter App desc', '', 'Active', NULL, '', NULL, '', 0),
(5, 'Restaurant website', 'Restaurant website desc', '', 'Active', NULL, '', NULL, '', 0),
(6, 'Basic Portfolio Website', 'Basic Portfolio Website desc', '', 'Active', NULL, '', NULL, '', 0),
(7, 'Covid Awareness', 'covid awareness desc', '', 'Active', NULL, '', NULL, '', 0),
(8, 'Github explorer', 'Github explorer desc', '', 'Active', NULL, '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `followers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `visible_password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `username`, `email_verified_at`, `password`, `visible_password`, `avatar`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Manoj', 'demo@gmail.com', 'Manoj', NULL, '$2y$10$3HNqWHKsGWrKiVyzVl7HBOtBu.Q/xJHwHYAQvIQlSP903ymHddGaC', 'akshayarao@1551', NULL, NULL, '2023-09-25 10:00:05', '2025-08-29 07:33:51', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`);

--
-- Indexes for table `blog_cat_child`
--
ALTER TABLE `blog_cat_child`
  ADD PRIMARY KEY (`blog_cat_child_id`);

--
-- Indexes for table `blog_master`
--
ALTER TABLE `blog_master`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `blog_tag_child`
--
ALTER TABLE `blog_tag_child`
  ADD PRIMARY KEY (`blog_tag_child_id`);

--
-- Indexes for table `category_master`
--
ALTER TABLE `category_master`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_meetings`
--
ALTER TABLE `client_meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_meetings_employee_detail_id_foreign` (`employee_detail_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_department_id_foreign` (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_designation_id_foreign` (`designation_id`);

--
-- Indexes for table `employee_additional_details`
--
ALTER TABLE `employee_additional_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_additional_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_attendances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_details_email_unique` (`email`),
  ADD UNIQUE KEY `employee_details_user_id_unique` (`user_id`),
  ADD KEY `employee_details_department_id_foreign` (`department_id`),
  ADD KEY `employee_details_designation_id_foreign` (`designation_id`),
  ADD KEY `employee_details_role_foreign` (`role`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_types`
--
ALTER TABLE `goal_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_project_id_foreign` (`project_id`),
  ADD KEY `invoices_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_department_id_foreign` (`department_id`);

--
-- Indexes for table `job_applicants`
--
ALTER TABLE `job_applicants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_applicants_job_id_foreign` (`job_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_requests_user_id_foreign` (`user_id`),
  ADD KEY `leave_requests_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `overtimes`
--
ALTER TABLE `overtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `overtimes_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policies_department_id_foreign` (`department_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `fk2` (`project_category_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_leader_foreign` (`leader`);

--
-- Indexes for table `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`project_category_id`);

--
-- Indexes for table `project_image`
--
ALTER TABLE `project_image`
  ADD PRIMARY KEY (`project_image_id`);

--
-- Indexes for table `provident_funds`
--
ALTER TABLE `provident_funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provident_funds_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles_for_login`
--
ALTER TABLE `roles_for_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_group_index` (`group`);

--
-- Indexes for table `tag_master`
--
ALTER TABLE `tag_master`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_employee_id_foreign` (`employee_id`),
  ADD KEY `tickets_client_id_foreign` (`client_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_foreign` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `blog_cat_child`
--
ALTER TABLE `blog_cat_child`
  MODIFY `blog_cat_child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_master`
--
ALTER TABLE `blog_master`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blog_tag_child`
--
ALTER TABLE `blog_tag_child`
  MODIFY `blog_tag_child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_master`
--
ALTER TABLE `category_master`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_meetings`
--
ALTER TABLE `client_meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_additional_details`
--
ALTER TABLE `employee_additional_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_types`
--
ALTER TABLE `goal_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_applicants`
--
ALTER TABLE `job_applicants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `overtimes`
--
ALTER TABLE `overtimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_category`
--
ALTER TABLE `project_category`
  MODIFY `project_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_image`
--
ALTER TABLE `project_image`
  MODIFY `project_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `provident_funds`
--
ALTER TABLE `provident_funds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles_for_login`
--
ALTER TABLE `roles_for_login`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tag_master`
--
ALTER TABLE `tag_master`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_meetings`
--
ALTER TABLE `client_meetings`
  ADD CONSTRAINT `client_meetings_employee_detail_id_foreign` FOREIGN KEY (`employee_detail_id`) REFERENCES `employee_details` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`);

--
-- Constraints for table `employee_additional_details`
--
ALTER TABLE `employee_additional_details`
  ADD CONSTRAINT `employee_additional_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  ADD CONSTRAINT `employee_attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_applicants`
--
ALTER TABLE `job_applicants`
  ADD CONSTRAINT `job_applicants_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `overtimes`
--
ALTER TABLE `overtimes`
  ADD CONSTRAINT `overtimes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `policies`
--
ALTER TABLE `policies`
  ADD CONSTRAINT `policies_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_leader_foreign` FOREIGN KEY (`leader`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `provident_funds`
--
ALTER TABLE `provident_funds`
  ADD CONSTRAINT `provident_funds_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_foreign` FOREIGN KEY (`role`) REFERENCES `roles_for_login` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
