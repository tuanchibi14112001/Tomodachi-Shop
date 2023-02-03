-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2023 at 06:55 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 0, 'Category', 'fa-bookmark-o', '/category', '*', '2023-01-17 02:10:25', '2023-01-17 02:10:25'),
(9, 0, 0, 'FoodItem', 'fa-ship', '/food-items', '*', '2023-01-18 09:31:49', '2023-01-18 09:41:15');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 02:09:11', '2023-01-17 02:09:11'),
(2, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:09:52', '2023-01-17 02:09:52'),
(3, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:09:55', '2023-01-17 02:09:55'),
(4, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Category\",\"icon\":\"fa-bookmark-o\",\"uri\":\"\\/category\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"xfqSyFy0cyuKI6kZfxygfHBGhroaxyXR1n1zSai8\"}', '2023-01-17 02:10:25', '2023-01-17 02:10:25'),
(5, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-17 02:10:25', '2023-01-17 02:10:25'),
(6, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:10:27', '2023-01-17 02:10:27'),
(7, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 02:10:28', '2023-01-17 02:10:28'),
(8, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 02:14:13', '2023-01-17 02:14:13'),
(9, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 02:14:34', '2023-01-17 02:14:34'),
(10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:14:41', '2023-01-17 02:14:41'),
(11, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:14:46', '2023-01-17 02:14:46'),
(12, 1, 'admin/auth/menu/8', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:14:57', '2023-01-17 02:14:57'),
(13, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2023-01-17 02:14:57', '2023-01-17 02:14:57'),
(14, 1, 'admin/auth/menu/8', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:15:05', '2023-01-17 02:15:05'),
(15, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2023-01-17 02:15:05', '2023-01-17 02:15:05'),
(16, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2023-01-17 02:15:11', '2023-01-17 02:15:11'),
(17, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Category\",\"icon\":\"fa-bookmark-o\",\"uri\":\"\\/category\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"xfqSyFy0cyuKI6kZfxygfHBGhroaxyXR1n1zSai8\",\"_method\":\"PUT\"}', '2023-01-17 02:15:22', '2023-01-17 02:15:22'),
(18, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-17 02:15:23', '2023-01-17 02:15:23'),
(19, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 02:15:48', '2023-01-17 02:15:48'),
(20, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:20:55', '2023-01-17 02:20:55'),
(21, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:21:00', '2023-01-17 02:21:00'),
(22, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:22:10', '2023-01-17 02:22:10'),
(23, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 02:22:14', '2023-01-17 02:22:14'),
(24, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:22:16', '2023-01-17 02:22:16'),
(25, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:22:18', '2023-01-17 02:22:18'),
(26, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-17 02:25:08', '2023-01-17 02:25:08'),
(27, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-17 02:26:34', '2023-01-17 02:26:34'),
(28, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 02:27:29', '2023-01-17 02:27:29'),
(29, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:27:31', '2023-01-17 02:27:31'),
(30, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:27:40', '2023-01-17 02:27:40'),
(31, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:28:00', '2023-01-17 02:28:00'),
(32, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 02:28:28', '2023-01-17 02:28:28'),
(33, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-17 02:28:28', '2023-01-17 02:28:28'),
(34, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 02:31:35', '2023-01-17 02:31:35'),
(35, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:31:41', '2023-01-17 02:31:41'),
(36, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:31:45', '2023-01-17 02:31:45'),
(37, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Nguy\\u1ec5n Kim B\\u1ea3o\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 02:31:55', '2023-01-17 02:31:55'),
(38, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-17 02:31:55', '2023-01-17 02:31:55'),
(39, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-17 02:35:40', '2023-01-17 02:35:40'),
(40, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\"}', '2023-01-17 02:35:50', '2023-01-17 02:35:50'),
(41, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 02:35:51', '2023-01-17 02:35:51'),
(42, 1, 'admin/category/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:36:14', '2023-01-17 02:36:14'),
(43, 1, 'admin/category/5', 'PUT', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 02:36:30', '2023-01-17 02:36:30'),
(44, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 02:36:30', '2023-01-17 02:36:30'),
(45, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 02:41:30', '2023-01-17 02:41:30'),
(46, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 02:41:37', '2023-01-17 02:41:37'),
(47, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:41:39', '2023-01-17 02:41:39'),
(48, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:49:28', '2023-01-17 02:49:28'),
(49, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 02:49:38', '2023-01-17 02:49:38'),
(50, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 02:49:38', '2023-01-17 02:49:38'),
(51, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"5\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 02:50:01', '2023-01-17 02:50:01'),
(52, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 02:50:02', '2023-01-17 02:50:02'),
(53, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:00:58', '2023-01-17 03:00:58'),
(54, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:01:05', '2023-01-17 03:01:05'),
(55, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Nguyen Kim Bao\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:01:14', '2023-01-17 03:01:14'),
(56, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:01:15', '2023-01-17 03:01:15'),
(57, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:01:30', '2023-01-17 03:01:30'),
(58, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:01:32', '2023-01-17 03:01:32'),
(59, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"a\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:01:39', '2023-01-17 03:01:39'),
(60, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:01:40', '2023-01-17 03:01:40'),
(61, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"6\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:01:45', '2023-01-17 03:01:45'),
(62, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:01:45', '2023-01-17 03:01:45'),
(63, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"7\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:01:50', '2023-01-17 03:01:50'),
(64, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:01:51', '2023-01-17 03:01:51'),
(65, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"8\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:01:55', '2023-01-17 03:01:55'),
(66, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:01:55', '2023-01-17 03:01:55'),
(67, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:06:30', '2023-01-17 03:06:30'),
(68, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Nguy\\u1ec5n Kim B\\u1ea3o\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:06:38', '2023-01-17 03:06:38'),
(69, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:06:39', '2023-01-17 03:06:39'),
(70, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:06:51', '2023-01-17 03:06:51'),
(71, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:06:56', '2023-01-17 03:06:56'),
(72, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:06:56', '2023-01-17 03:06:56'),
(73, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 03:07:06', '2023-01-17 03:07:06'),
(74, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:07:08', '2023-01-17 03:07:08'),
(75, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"9\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:07:12', '2023-01-17 03:07:12'),
(76, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:07:12', '2023-01-17 03:07:12'),
(77, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"10\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:07:17', '2023-01-17 03:07:17'),
(78, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:07:18', '2023-01-17 03:07:18'),
(79, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:07:20', '2023-01-17 03:07:20'),
(80, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:07:27', '2023-01-17 03:07:27'),
(81, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:07:27', '2023-01-17 03:07:27'),
(82, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:08:08', '2023-01-17 03:08:08'),
(83, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:08:11', '2023-01-17 03:08:11'),
(84, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Nguy\\u1ec5n Kim B\\u1ea3o\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:08:17', '2023-01-17 03:08:17'),
(85, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:08:17', '2023-01-17 03:08:17'),
(86, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 03:10:56', '2023-01-17 03:10:56'),
(87, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:10:58', '2023-01-17 03:10:58'),
(88, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:11:01', '2023-01-17 03:11:01'),
(89, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:11:06', '2023-01-17 03:11:06'),
(90, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:11:06', '2023-01-17 03:11:06'),
(91, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"11\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:13:21', '2023-01-17 03:13:21'),
(92, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:13:22', '2023-01-17 03:13:22'),
(93, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"12\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:13:26', '2023-01-17 03:13:26'),
(94, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:13:26', '2023-01-17 03:13:26'),
(95, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"13\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:13:30', '2023-01-17 03:13:30'),
(96, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:13:30', '2023-01-17 03:13:30'),
(97, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:14:08', '2023-01-17 03:14:08'),
(98, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:14:20', '2023-01-17 03:14:20'),
(99, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:14:20', '2023-01-17 03:14:20'),
(100, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:25:29', '2023-01-17 03:25:29'),
(101, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:25:35', '2023-01-17 03:25:35'),
(102, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"14\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:26:06', '2023-01-17 03:26:06'),
(103, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:26:07', '2023-01-17 03:26:07'),
(104, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:26:11', '2023-01-17 03:26:11'),
(105, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:26:18', '2023-01-17 03:26:18'),
(106, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:26:18', '2023-01-17 03:26:18'),
(107, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:28:11', '2023-01-17 03:28:11'),
(108, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-17 03:28:14', '2023-01-17 03:28:14'),
(109, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:28:16', '2023-01-17 03:28:16'),
(110, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:28:16', '2023-01-17 03:28:16'),
(111, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:28:19', '2023-01-17 03:28:19'),
(112, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:28:25', '2023-01-17 03:28:25'),
(113, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:28:26', '2023-01-17 03:28:26'),
(114, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:28:48', '2023-01-17 03:28:48'),
(115, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:29:32', '2023-01-17 03:29:32'),
(116, 1, 'admin/category/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:29:37', '2023-01-17 03:29:37'),
(117, 1, 'admin/category/16', 'PUT', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:30:07', '2023-01-17 03:30:07'),
(118, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:30:08', '2023-01-17 03:30:08'),
(119, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:30:44', '2023-01-17 03:30:44'),
(120, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:30:51', '2023-01-17 03:30:51'),
(121, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Nguy\\u1ec5n Kim B\\u1ea3o\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:30:57', '2023-01-17 03:30:57'),
(122, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:30:57', '2023-01-17 03:30:57'),
(123, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:31:00', '2023-01-17 03:31:00'),
(124, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":null,\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:31:06', '2023-01-17 03:31:06'),
(125, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-17 03:31:07', '2023-01-17 03:31:07'),
(126, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\"}', '2023-01-17 03:31:17', '2023-01-17 03:31:17'),
(127, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:31:18', '2023-01-17 03:31:18'),
(128, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"15\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:32:01', '2023-01-17 03:32:01'),
(129, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:32:01', '2023-01-17 03:32:01'),
(130, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"16\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:32:05', '2023-01-17 03:32:05'),
(131, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:32:05', '2023-01-17 03:32:05'),
(132, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"17\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:32:10', '2023-01-17 03:32:10'),
(133, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:32:11', '2023-01-17 03:32:11'),
(134, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"18\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:32:14', '2023-01-17 03:32:14'),
(135, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:32:14', '2023-01-17 03:32:14'),
(136, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"App_Models_Category\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-17 03:32:23', '2023-01-17 03:32:23'),
(137, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:32:24', '2023-01-17 03:32:24'),
(138, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:32:52', '2023-01-17 03:32:52'),
(139, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:32:56', '2023-01-17 03:32:56'),
(140, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:32:57', '2023-01-17 03:32:57'),
(141, 1, 'admin/category/19/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 03:33:01', '2023-01-17 03:33:01'),
(142, 1, 'admin/category/19', 'PUT', '127.0.0.1', '{\"name\":\"Juice\",\"_token\":\"b9fKr08MoncBnrXn7HvnEkvAJ7Kvg3rKoOSLGGUz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 03:33:06', '2023-01-17 03:33:06'),
(143, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 03:33:06', '2023-01-17 03:33:06'),
(144, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 16:05:44', '2023-01-17 16:05:44'),
(145, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 16:09:38', '2023-01-17 16:09:38'),
(146, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Juicea\",\"_token\":\"PhyvrodynBCWeproJqAeiTJP2ACUfGf7VRKLKvN9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 16:09:51', '2023-01-17 16:09:51'),
(147, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-17 16:09:56', '2023-01-17 16:09:56'),
(148, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 16:10:11', '2023-01-17 16:10:11'),
(149, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 16:10:13', '2023-01-17 16:10:13'),
(150, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-17 16:14:39', '2023-01-17 16:14:39'),
(151, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Food\",\"_token\":\"PhyvrodynBCWeproJqAeiTJP2ACUfGf7VRKLKvN9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-17 16:15:00', '2023-01-17 16:15:00'),
(152, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-17 16:15:00', '2023-01-17 16:15:00'),
(153, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-18 02:59:03', '2023-01-18 02:59:03'),
(154, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 02:59:09', '2023-01-18 02:59:09'),
(155, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:36:08', '2023-01-18 06:36:08'),
(156, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:36:22', '2023-01-18 06:36:22'),
(157, 1, 'admin/category/1', 'PUT', '127.0.0.1', '{\"name\":\"fast food\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-18 06:36:30', '2023-01-18 06:36:30'),
(158, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:36:30', '2023-01-18 06:36:30'),
(159, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"20\",\"_model\":\"App_Models_Category\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-18 06:36:45', '2023-01-18 06:36:45'),
(160, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:36:45', '2023-01-18 06:36:45'),
(161, 1, 'admin/category/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:37:03', '2023-01-18 06:37:03'),
(162, 1, 'admin/category/2', 'PUT', '127.0.0.1', '{\"name\":\"main dishes\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-18 06:37:08', '2023-01-18 06:37:08'),
(163, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:37:08', '2023-01-18 06:37:08'),
(164, 1, 'admin/category/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:37:16', '2023-01-18 06:37:16'),
(165, 1, 'admin/category/3', 'PUT', '127.0.0.1', '{\"name\":\"drinks\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-18 06:37:20', '2023-01-18 06:37:20'),
(166, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:37:20', '2023-01-18 06:37:20'),
(167, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"19\",\"_model\":\"App_Models_Category\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-01-18 06:37:28', '2023-01-18 06:37:28'),
(168, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:37:28', '2023-01-18 06:37:28'),
(169, 1, 'admin/category/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:37:57', '2023-01-18 06:37:57'),
(170, 1, 'admin/category/3', 'PUT', '127.0.0.1', '{\"name\":\"drinks\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-18 06:38:02', '2023-01-18 06:38:02'),
(171, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:38:03', '2023-01-18 06:38:03'),
(172, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:39:10', '2023-01-18 06:39:10'),
(173, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:39:11', '2023-01-18 06:39:11'),
(174, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:39:43', '2023-01-18 06:39:43'),
(175, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:39:47', '2023-01-18 06:39:47'),
(176, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:48:34', '2023-01-18 06:48:34'),
(177, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2023-01-18 06:48:39', '2023-01-18 06:48:39'),
(178, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:52:20', '2023-01-18 06:52:20'),
(179, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:52:21', '2023-01-18 06:52:21'),
(180, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:52:42', '2023-01-18 06:52:42'),
(181, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:54:06', '2023-01-18 06:54:06'),
(182, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:54:15', '2023-01-18 06:54:15'),
(183, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:54:17', '2023-01-18 06:54:17'),
(184, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-18 06:54:42', '2023-01-18 06:54:42'),
(185, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:54:45', '2023-01-18 06:54:45'),
(186, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:54:45', '2023-01-18 06:54:45'),
(187, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:54:47', '2023-01-18 06:54:47'),
(188, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:55:48', '2023-01-18 06:55:48'),
(189, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:55:53', '2023-01-18 06:55:53'),
(190, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2023-01-18 06:56:28', '2023-01-18 06:56:28'),
(191, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:56:37', '2023-01-18 06:56:37'),
(192, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:56:40', '2023-01-18 06:56:40'),
(193, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-18 06:56:52', '2023-01-18 06:56:52'),
(194, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-18 06:57:05', '2023-01-18 06:57:05'),
(195, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-18 06:57:08', '2023-01-18 06:57:08'),
(196, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-18 06:58:42', '2023-01-18 06:58:42'),
(197, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-18 06:58:56', '2023-01-18 06:58:56'),
(198, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-18 06:58:59', '2023-01-18 06:58:59'),
(199, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:59:03', '2023-01-18 06:59:03'),
(200, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 06:59:10', '2023-01-18 06:59:10'),
(201, 1, 'admin/category/1', 'PUT', '127.0.0.1', '{\"name\":\"fast food\",\"updated_at\":\"2023-01-18 04:00:00\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-18 06:59:32', '2023-01-18 06:59:32'),
(202, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 06:59:33', '2023-01-18 06:59:33'),
(203, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 07:00:11', '2023-01-18 07:00:11'),
(204, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 07:00:23', '2023-01-18 07:00:23'),
(205, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"1\"}', '2023-01-18 07:01:03', '2023-01-18 07:01:03'),
(206, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 07:02:17', '2023-01-18 07:02:17'),
(207, 1, 'admin/category', 'GET', '127.0.0.1', '{\"id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2023-01-18 07:13:14', '2023-01-18 07:13:14'),
(208, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 07:13:18', '2023-01-18 07:13:18'),
(209, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-18 07:23:04', '2023-01-18 07:23:04'),
(210, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 07:23:06', '2023-01-18 07:23:06'),
(211, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 07:36:11', '2023-01-18 07:36:11'),
(212, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-18 07:36:22', '2023-01-18 07:36:22'),
(213, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 07:37:09', '2023-01-18 07:37:09'),
(214, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"Cakes\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-01-18 07:37:22', '2023-01-18 07:37:22'),
(215, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 07:37:22', '2023-01-18 07:37:22'),
(216, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-18 09:16:21', '2023-01-18 09:16:21'),
(217, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,image,name,updated_at\",\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:19:33', '2023-01-18 09:19:33'),
(218, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:19:40', '2023-01-18 09:19:40'),
(219, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:29:49', '2023-01-18 09:29:49'),
(220, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"FoodItem\",\"icon\":\"fa-sharp\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\"}', '2023-01-18 09:31:49', '2023-01-18 09:31:49'),
(221, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-18 09:31:49', '2023-01-18 09:31:49'),
(222, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:31:53', '2023-01-18 09:31:53'),
(223, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"FoodItem\",\"icon\":\"fa-sharp\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}', '2023-01-18 09:32:00', '2023-01-18 09:32:00'),
(224, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-18 09:32:00', '2023-01-18 09:32:00'),
(225, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:32:04', '2023-01-18 09:32:04'),
(226, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"FoodItem\",\"icon\":\"fa-light\",\"uri\":\"\\/food-items\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}', '2023-01-18 09:35:43', '2023-01-18 09:35:43'),
(227, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-18 09:35:43', '2023-01-18 09:35:43'),
(228, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:35:47', '2023-01-18 09:35:47'),
(229, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"FoodItem\",\"icon\":\"fa-burger\",\"uri\":\"\\/food-items\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}', '2023-01-18 09:36:29', '2023-01-18 09:36:29'),
(230, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-18 09:36:30', '2023-01-18 09:36:30'),
(231, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:36:36', '2023-01-18 09:36:36'),
(232, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"FoodItem\",\"icon\":\"fa-ship\",\"uri\":\"\\/food-items\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}', '2023-01-18 09:41:15', '2023-01-18 09:41:15'),
(233, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-18 09:41:15', '2023-01-18 09:41:15'),
(234, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-18 09:41:20', '2023-01-18 09:41:20'),
(235, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:41:24', '2023-01-18 09:41:24'),
(236, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-18 09:46:57', '2023-01-18 09:46:57'),
(237, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-18 09:49:20', '2023-01-18 09:49:20'),
(238, 1, 'admin/food-items/1', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"delicious pizza 01\",\"quantity\":\"2\",\"description\":\"ngon lam\",\"price\":\"100000\",\"_token\":\"o8AsTuqRXxfhIsS6IYAITpyiucUXjPRLD1Z7MAuH\",\"_method\":\"PUT\"}', '2023-01-18 09:49:31', '2023-01-18 09:49:31'),
(239, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-18 09:49:32', '2023-01-18 09:49:32'),
(240, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-19 06:08:53', '2023-01-19 06:08:53'),
(241, 1, 'admin/food-items/1', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"delicious pizza 01\",\"quantity\":\"2\",\"description\":\"ngon lam\",\"price\":\"100000\",\"_token\":\"a30hX4OOq06Y6AjbvcKa004BEoD4sM092TsaxVvA\",\"_method\":\"PUT\"}', '2023-01-19 06:09:14', '2023-01-19 06:09:14'),
(242, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-19 06:09:15', '2023-01-19 06:09:15'),
(243, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '[]', '2023-01-19 06:10:12', '2023-01-19 06:10:12'),
(244, 1, 'admin/food-items/1', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"delicious pizza 01\",\"quantity\":\"2\",\"description\":\"ngon lam\",\"price\":\"100000\",\"_token\":\"a30hX4OOq06Y6AjbvcKa004BEoD4sM092TsaxVvA\",\"_method\":\"PUT\"}', '2023-01-19 06:10:36', '2023-01-19 06:10:36'),
(245, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-19 06:10:36', '2023-01-19 06:10:36'),
(246, 1, 'admin/food-items/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-19 06:10:50', '2023-01-19 06:10:50'),
(247, 1, 'admin/food-items/2', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"delicious pizza 01\",\"quantity\":\"2\",\"description\":\"ngon lam\",\"price\":\"100000\",\"_token\":\"a30hX4OOq06Y6AjbvcKa004BEoD4sM092TsaxVvA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-01-19 06:10:55', '2023-01-19 06:10:55'),
(248, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-19 06:10:55', '2023-01-19 06:10:55'),
(249, 1, 'admin/food-items/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-19 06:13:28', '2023-01-19 06:13:28'),
(250, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-19 06:13:31', '2023-01-19 06:13:31'),
(251, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-01-20 01:14:18', '2023-01-20 01:14:18'),
(252, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 01:14:23', '2023-01-20 01:14:23'),
(253, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-20 01:14:40', '2023-01-20 01:14:40'),
(254, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-01-20 06:57:35', '2023-01-20 06:57:35'),
(255, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 06:57:38', '2023-01-20 06:57:38'),
(256, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 06:57:50', '2023-01-20 06:57:50'),
(257, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 06:57:51', '2023-01-20 06:57:51'),
(258, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:00:28', '2023-01-20 07:00:28'),
(259, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:00:32', '2023-01-20 07:00:32'),
(260, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:00:34', '2023-01-20 07:00:34'),
(261, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:00:50', '2023-01-20 07:00:50'),
(262, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:00:54', '2023-01-20 07:00:54'),
(263, 1, 'admin/category/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:00:57', '2023-01-20 07:00:57'),
(264, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:01:01', '2023-01-20 07:01:01'),
(265, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:01:03', '2023-01-20 07:01:03'),
(266, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-20 07:01:23', '2023-01-20 07:01:23'),
(267, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:01:28', '2023-01-20 07:01:28'),
(268, 1, 'admin/food-items/1', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"delicious pizza 01\",\"quantity\":\"2\",\"description\":\"ngon lam\",\"price\":\"100000\",\"updated_at\":\"2023-01-19 06:10:36\",\"_token\":\"qiSjW0Oht95A1urSDYc9N7qhpJqjJwPBsGBouQZV\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-01-20 07:02:39', '2023-01-20 07:02:39'),
(269, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-20 07:02:40', '2023-01-20 07:02:40'),
(270, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:08:09', '2023-01-20 07:08:09'),
(271, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"Hambeger Beo\",\"quantity\":\"3\",\"description\":\"Phu hop voi nguoio an\",\"price\":\"50\",\"_token\":\"qiSjW0Oht95A1urSDYc9N7qhpJqjJwPBsGBouQZV\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-01-20 07:08:37', '2023-01-20 07:08:37'),
(272, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-20 07:08:38', '2023-01-20 07:08:38'),
(273, 1, 'admin/food-items/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:09:20', '2023-01-20 07:09:20'),
(274, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:09:25', '2023-01-20 07:09:25'),
(275, 1, 'admin/food-items/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:09:28', '2023-01-20 07:09:28'),
(276, 1, 'admin/food-items/2', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"delicious pizza 01\",\"quantity\":\"2\",\"description\":\"ngon lam\",\"price\":\"100000\",\"updated_at\":\"2023-01-19 06:10:55\",\"_token\":\"qiSjW0Oht95A1urSDYc9N7qhpJqjJwPBsGBouQZV\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-01-20 07:10:08', '2023-01-20 07:10:08'),
(277, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-20 07:10:08', '2023-01-20 07:10:08'),
(278, 1, 'admin/food-items/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:10:57', '2023-01-20 07:10:57'),
(279, 1, 'admin/food-items/3', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"Hambeger Beo\",\"quantity\":\"3\",\"description\":\"Phu hop voi nguoio an\",\"price\":\"50\",\"updated_at\":\"2023-01-20 07:08:38\",\"_token\":\"qiSjW0Oht95A1urSDYc9N7qhpJqjJwPBsGBouQZV\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-01-20 07:11:08', '2023-01-20 07:11:08'),
(280, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-20 07:11:08', '2023-01-20 07:11:08'),
(281, 1, 'admin/food-items/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:11:40', '2023-01-20 07:11:40'),
(282, 1, 'admin/food-items/3', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"Hambeger Beo\",\"quantity\":\"3\",\"description\":\"Phu hop voi nguoio an\",\"price\":\"50\",\"updated_at\":\"2023-01-20 14:08:38\",\"_token\":\"qiSjW0Oht95A1urSDYc9N7qhpJqjJwPBsGBouQZV\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-01-20 07:12:05', '2023-01-20 07:12:05'),
(283, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-20 07:12:05', '2023-01-20 07:12:05'),
(284, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-01-20 07:13:09', '2023-01-20 07:13:09'),
(285, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-20 07:16:53', '2023-01-20 07:16:53'),
(286, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-01-20 07:17:01', '2023-01-20 07:17:01'),
(287, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:17:15', '2023-01-20 07:17:15'),
(288, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:17:18', '2023-01-20 07:17:18'),
(289, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:17:31', '2023-01-20 07:17:31'),
(290, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-01-20 07:17:34', '2023-01-20 07:17:34'),
(291, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-02-03 09:34:48', '2023-02-03 09:34:48'),
(292, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:35:43', '2023-02-03 09:35:43'),
(293, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:35:47', '2023-02-03 09:35:47'),
(294, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:35:49', '2023-02-03 09:35:49'),
(295, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:35:54', '2023-02-03 09:35:54'),
(296, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:35:56', '2023-02-03 09:35:56'),
(297, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:36:02', '2023-02-03 09:36:02'),
(298, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:36:11', '2023-02-03 09:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2023-01-17 02:06:44', '2023-01-17 02:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$UEBeVI/7153I/ndmzYYuj.6/0FVhsYVO0Qs9S1bRCgKzkUMCCD6jy', 'Administrator', NULL, 'uyh11UzRcg2Ae7NTMFTG1HifqoAOr8ozii1E1KbDJ3iN9foCUwe1qcnnDU2O', '2023-01-17 02:06:44', '2023-01-17 02:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'fast food', 'images/cat-1.png'),
(2, 'main dishes', 'images/cat-2.png'),
(3, 'drinks', 'images/cat-3.png'),
(4, 'desserts', 'images/cat-4.png');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `dob` date DEFAULT NULL,
  `phone_num` varchar(50) NOT NULL,
  `url` text DEFAULT NULL,
  `point` int(11) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `dob`, `phone_num`, `url`, `point`, `address`) VALUES
(19, 'Xuan Nang', '2001-07-30', '0333501404', 'https://www.facebook.com/xuan.nang.9404', 0, 'Xa quynh Long, huyen quynh luu, tinh nghe an'),
(20, 'Tran Xuan Nang', '2017-01-23', '0333501404', 'https://www.facebook.com/xuan.nang.9404', 0, 'Xa quynh Long, huyen quynh luu, tinh nghe an'),
(21, 'Hoang Manh Hung', '2023-02-02', '0355860850', NULL, 0, '357 Tam Trinh'),
(22, 'Hoàng Mạnh Hùng', NULL, '55555', NULL, 0, 'Trần Khát Trân');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fooditem`
--

CREATE TABLE `fooditem` (
  `id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `url` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fooditem`
--

INSERT INTO `fooditem` (`id`, `cate_id`, `name`, `quantity`, `description`, `price`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'delicious pizza 01', 2, 'ngon lam', 100000, 'images/burger-1.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00'),
(2, 1, 'delicious pizza 01', 2, 'ngon lam', 100000, 'images/burger-2.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00'),
(3, 2, 'delicious pizza 01', 2, 'ngon lam', 100000, 'images/burger-2.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00'),
(4, 2, 'delicious pizza 01', 2, 'ngon lam', 100000, 'images/burger-2.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00'),
(5, 2, 'delicious pizza 01', 2, 'ngon lam', 100000, 'images/burger-2.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00'),
(6, 2, 'delicious pizza 01', 2, 'ngon lam', 100000, 'images/burger-2.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00'),
(7, 2, 'delicious pizza 01', 2, 'ngon lam', 100000, 'images/burger-2.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00'),
(8, 2, 'delicious pizza 02', 2, 'ngon lam', 100000, 'images/burger-2.png', '2023-01-15 17:00:00', '2023-01-15 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `foodorder`
--

CREATE TABLE `foodorder` (
  `id` int(11) NOT NULL,
  `cs_id` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `foodorder`
--

INSERT INTO `foodorder` (`id`, `cs_id`, `total_price`, `note`, `created_at`, `status`) VALUES
(1, 21, 200000, 'k an cay', '2023-02-03 23:04:44', 0),
(2, 21, 500000, 'dsdfss', '2023-02-03 23:12:39', 0),
(3, 19, 100000, '', '2023-02-04 00:22:46', 0),
(4, 22, 300000, '', '2023-02-04 00:28:19', 0),
(5, 22, 100000, '', '2023-02-04 00:29:29', 0),
(6, 22, 100000, '', '2023-02-04 00:42:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `food_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`food_id`, `order_id`, `quantity`) VALUES
(1, 1, 1),
(2, 1, 1),
(1, 2, 5),
(8, 3, 1),
(1, 4, 2),
(2, 4, 1),
(1, 5, 1),
(3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `cs_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `cs_id`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(19, 19, 'nang3007@gmail.com', '$2y$10$lyJLaWCz6tX6A1KfnHslfud/hffy1u0fRmPip4GQEWnNyvllzcjrm', 1, '2023-01-28 08:21:56', '2023-01-28 01:21:56'),
(20, 20, 'nang.tx194633@sis.hust.edu.vn', '$2y$10$YdZhrq.YxAjlktckHr9a1OGG.febmuu3ZvXvCITrJLdlmndFLiJWC', 1, '2023-01-28 09:12:49', '2023-01-28 02:12:49'),
(21, 21, 'manhhung0601nd@gmail.com', '$2y$10$lluWdoDPSgQmhdUTaJgAfu5aVAHQr0Wyswxuacb4XYJFfARPpqX5.', 1, '2023-02-03 21:20:20', '2023-02-03 14:20:20'),
(22, 22, 'hung@gmail.com', '$2y$10$9W.cbBTWDcjqS7tDz6YJdulxGdEuPgYaCIWNnbmbExw2yRSctDsjm', 1, '2023-02-04 00:27:17', '2023-02-03 17:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_fk` (`cate_id`);

--
-- Indexes for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cs_id_fk` (`cs_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`order_id`,`food_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `cs_id` (`cs_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fooditem`
--
ALTER TABLE `fooditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `foodorder`
--
ALTER TABLE `foodorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD CONSTRAINT `cate_fk` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foodorder`
--
ALTER TABLE `foodorder`
  ADD CONSTRAINT `cs_id_fk` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `fooditem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `foodorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
