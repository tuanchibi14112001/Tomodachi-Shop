-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 05, 2023 lúc 02:29 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `food_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` int(4) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `name`, `email`, `address`, `phone`) VALUES
(1, 'Hoang Manh', 'hung01@gmail.com', '33 Trần Khát Trân', '0355860850'),
(2, 'Hoàng Mạnh Hùng', 'hung@gmail.com', 'Ha Noi', '555556'),
(3, 'Hoàng Mạnh Hùng', 'hung@gmail.com', 'Trần Khát Trân', '0971528594'),
(4, 'Hoàng Mạnh Hùng', 'hung@gmail.com', 'Trần Khát Trân', '0971528594'),
(5, 'Nguyễn Kim Bảo', 'kimbaoksqp@gmail.com', '189 phố Vọng, Hai Bà Trưng, Hà Nội', '0343684430');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_menu`
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
-- Đang đổ dữ liệu cho bảng `admin_menu`
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
(9, 0, 0, 'FoodItem', 'fa-ship', '/food-items', '*', '2023-01-18 09:31:49', '2023-01-18 09:41:15'),
(10, 0, 0, 'Customer', 'fa-user-plus', '/user', NULL, '2023-02-05 13:20:59', '2023-02-05 13:20:59'),
(11, 0, 0, 'Order Information', 'fa-cart-plus', '/food-orders', NULL, '2023-02-05 13:21:56', '2023-02-05 13:21:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_operation_log`
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
-- Đang đổ dữ liệu cho bảng `admin_operation_log`
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
(298, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-03 09:36:11', '2023-02-03 09:36:11'),
(299, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-02-05 09:12:54', '2023-02-05 09:12:54'),
(300, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:04', '2023-02-05 09:13:04'),
(301, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:14', '2023-02-05 09:13:14'),
(302, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:20', '2023-02-05 09:13:20'),
(303, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:24', '2023-02-05 09:13:24'),
(304, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:28', '2023-02-05 09:13:28'),
(305, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:35', '2023-02-05 09:13:35'),
(306, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:42', '2023-02-05 09:13:42'),
(307, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:44', '2023-02-05 09:13:44'),
(308, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:50', '2023-02-05 09:13:50'),
(309, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:51', '2023-02-05 09:13:51'),
(310, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:56', '2023-02-05 09:13:56'),
(311, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:58', '2023-02-05 09:13:58'),
(312, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:13:59', '2023-02-05 09:13:59'),
(313, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:14:00', '2023-02-05 09:14:00'),
(314, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:14:13', '2023-02-05 09:14:13'),
(315, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:14:16', '2023-02-05 09:14:16'),
(316, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:14:18', '2023-02-05 09:14:18'),
(317, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:15:16', '2023-02-05 09:15:16'),
(318, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:15:18', '2023-02-05 09:15:18'),
(319, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:16:43', '2023-02-05 09:16:43'),
(320, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:16:45', '2023-02-05 09:16:45'),
(321, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:16:52', '2023-02-05 09:16:52'),
(322, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:16:59', '2023-02-05 09:16:59'),
(323, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:17:02', '2023-02-05 09:17:02'),
(324, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:17:04', '2023-02-05 09:17:04'),
(325, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:17:09', '2023-02-05 09:17:09'),
(326, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:17:11', '2023-02-05 09:17:11'),
(327, 1, 'admin/food-orders', 'GET', '127.0.0.1', '[]', '2023-02-05 09:17:48', '2023-02-05 09:17:48'),
(328, 1, 'admin/food-orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:05', '2023-02-05 09:18:05'),
(329, 1, 'admin/food-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:08', '2023-02-05 09:18:08'),
(330, 1, 'admin/food-orders/38', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:13', '2023-02-05 09:18:13'),
(331, 1, 'admin/food-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:18', '2023-02-05 09:18:18'),
(332, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:26', '2023-02-05 09:18:26'),
(333, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:27', '2023-02-05 09:18:27'),
(334, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:29', '2023-02-05 09:18:29'),
(335, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:30', '2023-02-05 09:18:30'),
(336, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:34', '2023-02-05 09:18:34'),
(337, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:39', '2023-02-05 09:18:39'),
(338, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:18:42', '2023-02-05 09:18:42'),
(339, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:19:04', '2023-02-05 09:19:04'),
(340, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:19:12', '2023-02-05 09:19:12');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(341, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:20:17', '2023-02-05 09:20:17'),
(342, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:20:26', '2023-02-05 09:20:26'),
(343, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:20:28', '2023-02-05 09:20:28'),
(344, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:20:30', '2023-02-05 09:20:30'),
(345, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:20:32', '2023-02-05 09:20:32'),
(346, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:20:52', '2023-02-05 09:20:52'),
(347, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:20:54', '2023-02-05 09:20:54'),
(348, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"vegetable\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/category\"}', '2023-02-05 09:22:10', '2023-02-05 09:22:10'),
(349, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-02-05 09:22:10', '2023-02-05 09:22:10'),
(350, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:22:35', '2023-02-05 09:22:35'),
(351, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:22:37', '2023-02-05 09:22:37'),
(352, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:22:44', '2023-02-05 09:22:44'),
(353, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:22:47', '2023-02-05 09:22:47'),
(354, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 09:22:49', '2023-02-05 09:22:49'),
(355, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"5\",\"name\":\"vegetable-1\",\"quantity\":\"15\",\"description\":\"tuoi sach\",\"price\":\"2000\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 09:23:46', '2023-02-05 09:23:46'),
(356, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 09:23:46', '2023-02-05 09:23:46'),
(357, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-02-05 10:01:42', '2023-02-05 10:01:42'),
(358, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:01:48', '2023-02-05 10:01:48'),
(359, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:01:57', '2023-02-05 10:01:57'),
(360, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:02:00', '2023-02-05 10:02:00'),
(361, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:02:05', '2023-02-05 10:02:05'),
(362, 1, 'admin/food-items/1,2,3,4,5,6,7,8,9', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"NRn3knWUBmAGQhPQdTD5nBH5tQGaz5JWVZ0WocJ8\"}', '2023-02-05 10:02:27', '2023-02-05 10:02:27'),
(363, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:02:27', '2023-02-05 10:02:27'),
(364, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:02:30', '2023-02-05 10:02:30'),
(365, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:02:31', '2023-02-05 10:02:31'),
(366, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:05:55', '2023-02-05 10:05:55'),
(367, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:05:56', '2023-02-05 10:05:56'),
(368, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:05:59', '2023-02-05 10:05:59'),
(369, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-02-05 10:13:07', '2023-02-05 10:13:07'),
(370, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:13:20', '2023-02-05 10:13:20'),
(371, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:15:54', '2023-02-05 10:15:54'),
(372, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:15:56', '2023-02-05 10:15:56'),
(373, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:16:04', '2023-02-05 10:16:04'),
(374, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:16:05', '2023-02-05 10:16:05'),
(375, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:16:07', '2023-02-05 10:16:07'),
(376, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"burger-1\",\"quantity\":\"99\",\"description\":\"ngon l\\u1eafm\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:16:52', '2023-02-05 10:16:52'),
(377, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:16:52', '2023-02-05 10:16:52'),
(378, 1, 'admin/food-items/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:18:07', '2023-02-05 10:18:07'),
(379, 1, 'admin/food-items/10', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"burger-1\",\"quantity\":\"0\",\"description\":\"ngon l\\u1eafm\",\"price\":\"20\",\"updated_at\":\"2023-02-05 17:16:52\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:18:51', '2023-02-05 10:18:51'),
(380, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:18:52', '2023-02-05 10:18:52'),
(381, 1, 'admin/food-items/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:19:15', '2023-02-05 10:19:15'),
(382, 1, 'admin/food-items/10', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"beef burger\",\"quantity\":\"99\",\"description\":\"ngon l\\u1eafm\",\"price\":\"20\",\"updated_at\":\"2023-02-05 17:16:52\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:19:35', '2023-02-05 10:19:35'),
(383, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:19:36', '2023-02-05 10:19:36'),
(384, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:19:43', '2023-02-05 10:19:43'),
(385, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"chicken burger\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:20:40', '2023-02-05 10:20:40'),
(386, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:20:41', '2023-02-05 10:20:41'),
(387, 1, 'admin/food-items/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:20:44', '2023-02-05 10:20:44'),
(388, 1, 'admin/food-items/10', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"beef burger\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"updated_at\":\"2023-02-05 17:16:52\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:20:51', '2023-02-05 10:20:51'),
(389, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:20:51', '2023-02-05 10:20:51'),
(390, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:21:08', '2023-02-05 10:21:08'),
(391, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"cheese burger\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:21:55', '2023-02-05 10:21:55'),
(392, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:21:56', '2023-02-05 10:21:56'),
(393, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:22:03', '2023-02-05 10:22:03'),
(394, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"lamb burger\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":null,\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:23:14', '2023-02-05 10:23:14'),
(395, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:23:14', '2023-02-05 10:23:14'),
(396, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"lamb burger\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\"}', '2023-02-05 10:23:29', '2023-02-05 10:23:29'),
(397, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:23:30', '2023-02-05 10:23:30'),
(398, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"12\",\"_model\":\"App_Models_FoodItem\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-02-05 10:24:26', '2023-02-05 10:24:26'),
(399, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:24:27', '2023-02-05 10:24:27'),
(400, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:24:29', '2023-02-05 10:24:29'),
(401, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:24:32', '2023-02-05 10:24:32'),
(402, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:24:34', '2023-02-05 10:24:34'),
(403, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:24:39', '2023-02-05 10:24:39'),
(404, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"2\",\"name\":\"spaghetti\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:25:50', '2023-02-05 10:25:50'),
(405, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:25:50', '2023-02-05 10:25:50'),
(406, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"2\",\"name\":\"seafood spaghetti\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\"}', '2023-02-05 10:27:12', '2023-02-05 10:27:12'),
(407, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:27:12', '2023-02-05 10:27:12'),
(408, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"2\",\"name\":\"pasta\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\"}', '2023-02-05 10:28:11', '2023-02-05 10:28:11'),
(409, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:28:11', '2023-02-05 10:28:11'),
(410, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"2\",\"name\":\"beef spaghetti\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\"}', '2023-02-05 10:29:18', '2023-02-05 10:29:18'),
(411, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:29:18', '2023-02-05 10:29:18'),
(412, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:30:10', '2023-02-05 10:30:10'),
(413, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:30:12', '2023-02-05 10:30:12'),
(414, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:30:14', '2023-02-05 10:30:14'),
(415, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"3\",\"name\":\"orange juice\",\"quantity\":\"99\",\"description\":\"good juice\",\"price\":\"2\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:31:10', '2023-02-05 10:31:10'),
(416, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:31:10', '2023-02-05 10:31:10'),
(417, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"3\",\"name\":\"coffee\",\"quantity\":\"20\",\"description\":\"good coffee\",\"price\":\"2\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\"}', '2023-02-05 10:32:37', '2023-02-05 10:32:37'),
(418, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:32:38', '2023-02-05 10:32:38'),
(419, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"3\",\"name\":\"lemonade\",\"quantity\":\"20\",\"description\":\"low sugar lemonade\",\"price\":\"2\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\"}', '2023-02-05 10:33:40', '2023-02-05 10:33:40'),
(420, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:33:40', '2023-02-05 10:33:40'),
(421, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:33:44', '2023-02-05 10:33:44'),
(422, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"3\",\"name\":\"Strawberry juice\",\"quantity\":\"20\",\"description\":\"very sweet\",\"price\":\"3\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:34:32', '2023-02-05 10:34:32'),
(423, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:34:32', '2023-02-05 10:34:32'),
(424, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:34:56', '2023-02-05 10:34:56'),
(425, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:34:59', '2023-02-05 10:34:59'),
(426, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:35:05', '2023-02-05 10:35:05'),
(427, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"4\",\"name\":\"Strawberry ice-cream\",\"quantity\":\"20\",\"description\":\"very sweet\",\"price\":\"3\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:36:13', '2023-02-05 10:36:13'),
(428, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:36:13', '2023-02-05 10:36:13'),
(429, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"5\",\"name\":\"chocolate cake\",\"quantity\":\"99\",\"description\":\"there\'s wine in the cake\",\"price\":\"4\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\"}', '2023-02-05 10:38:13', '2023-02-05 10:38:13'),
(430, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:38:13', '2023-02-05 10:38:13'),
(431, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:38:35', '2023-02-05 10:38:35'),
(432, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:38:47', '2023-02-05 10:38:47'),
(433, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:38:49', '2023-02-05 10:38:49'),
(434, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:38:52', '2023-02-05 10:38:52'),
(435, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"4\",\"name\":\"cream strawberry cake\",\"quantity\":\"99\",\"description\":\"cream strawberry cake\",\"price\":\"4\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:40:31', '2023-02-05 10:40:31'),
(436, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:40:31', '2023-02-05 10:40:31'),
(437, 1, 'admin/food-items/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:41:13', '2023-02-05 10:41:13'),
(438, 1, 'admin/food-items/24', 'PUT', '127.0.0.1', '{\"cate_id\":\"3\",\"name\":\"cream strawberry cake\",\"quantity\":\"99\",\"description\":\"cream strawberry cake\",\"price\":\"4\",\"updated_at\":\"2023-02-05 17:40:31\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:41:18', '2023-02-05 10:41:18'),
(439, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:41:18', '2023-02-05 10:41:18'),
(440, 1, 'admin/food-items/23/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:41:47', '2023-02-05 10:41:47'),
(441, 1, 'admin/food-items/23', 'PUT', '127.0.0.1', '{\"cate_id\":\"4\",\"name\":\"chocolate cake\",\"quantity\":\"99\",\"description\":\"there\'s wine in the cake\",\"price\":\"4\",\"updated_at\":\"2023-02-05 17:38:13\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:41:52', '2023-02-05 10:41:52'),
(442, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:41:52', '2023-02-05 10:41:52'),
(443, 1, 'admin/food-items/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:42:00', '2023-02-05 10:42:00'),
(444, 1, 'admin/food-items/24', 'PUT', '127.0.0.1', '{\"cate_id\":\"4\",\"name\":\"cream strawberry cake\",\"quantity\":\"99\",\"description\":\"cream strawberry cake\",\"price\":\"4\",\"updated_at\":\"2023-02-05 17:40:31\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:42:05', '2023-02-05 10:42:05'),
(445, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:42:05', '2023-02-05 10:42:05'),
(446, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:42:16', '2023-02-05 10:42:16'),
(447, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"5\",\"_model\":\"App_Models_Category\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-02-05 10:42:25', '2023-02-05 10:42:25'),
(448, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:42:25', '2023-02-05 10:42:25'),
(449, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:42:28', '2023-02-05 10:42:28'),
(450, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:42:30', '2023-02-05 10:42:30'),
(451, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"2\",\"name\":\"vegetable pizza\",\"quantity\":\"99\",\"description\":\"a lot of vegetable\",\"price\":\"20\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:43:25', '2023-02-05 10:43:25'),
(452, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:43:26', '2023-02-05 10:43:26'),
(453, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:43:40', '2023-02-05 10:43:40'),
(454, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"2\",\"name\":\"sausage pizza\",\"quantity\":null,\"description\":\"beef sausage\",\"price\":\"2\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:44:27', '2023-02-05 10:44:27'),
(455, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '[]', '2023-02-05 10:44:27', '2023-02-05 10:44:27'),
(456, 1, 'admin/food-items', 'POST', '127.0.0.1', '{\"cate_id\":\"2\",\"name\":\"sausage pizza\",\"quantity\":\"99\",\"description\":\"beef sausage\",\"price\":\"2\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\"}', '2023-02-05 10:44:41', '2023-02-05 10:44:41'),
(457, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:44:41', '2023-02-05 10:44:41'),
(458, 1, 'admin/food-items/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:45:09', '2023-02-05 10:45:09'),
(459, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:45:21', '2023-02-05 10:45:21'),
(460, 1, 'admin/food-items/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:46:32', '2023-02-05 10:46:32'),
(461, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:46:42', '2023-02-05 10:46:42'),
(462, 1, 'admin/food-items/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:51:08', '2023-02-05 10:51:08'),
(463, 1, 'admin/food-items/11', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"chicken burger\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"2\",\"updated_at\":\"2023-02-05 17:20:40\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:51:14', '2023-02-05 10:51:14'),
(464, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:51:14', '2023-02-05 10:51:14'),
(465, 1, 'admin/food-items/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 10:51:28', '2023-02-05 10:51:28'),
(466, 1, 'admin/food-items/11', 'PUT', '127.0.0.1', '{\"cate_id\":\"1\",\"name\":\"chicken burger\",\"quantity\":\"99\",\"description\":\"good food\",\"price\":\"20\",\"updated_at\":\"2023-02-05 17:20:40\",\"_token\":\"pLtIDamYe6mtWr92ORjBiIjOTN4qMy4hrNkgmkmL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/food-items\"}', '2023-02-05 10:51:32', '2023-02-05 10:51:32'),
(467, 1, 'admin/food-items', 'GET', '127.0.0.1', '[]', '2023-02-05 10:51:33', '2023-02-05 10:51:33'),
(468, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2023-02-05 13:19:54', '2023-02-05 13:19:54'),
(469, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:20:35', '2023-02-05 13:20:35'),
(470, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Customer\",\"icon\":\"fa-user-plus\",\"uri\":\"\\/user\",\"roles\":[null],\"permission\":null,\"_token\":\"OcKOJCQWe20SZVh4NzzD3p8QZ2KXNKd7TClrNeGy\"}', '2023-02-05 13:20:59', '2023-02-05 13:20:59'),
(471, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-02-05 13:20:59', '2023-02-05 13:20:59'),
(472, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-02-05 13:21:02', '2023-02-05 13:21:02'),
(473, 1, 'admin/user', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:21:11', '2023-02-05 13:21:11'),
(474, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:21:15', '2023-02-05 13:21:15'),
(475, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Order Information\",\"icon\":\"fa-cart-plus\",\"uri\":\"\\/food-orders\",\"roles\":[null],\"permission\":null,\"_token\":\"OcKOJCQWe20SZVh4NzzD3p8QZ2KXNKd7TClrNeGy\"}', '2023-02-05 13:21:56', '2023-02-05 13:21:56'),
(476, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-02-05 13:21:56', '2023-02-05 13:21:56'),
(477, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-02-05 13:22:00', '2023-02-05 13:22:00'),
(478, 1, 'admin/food-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:22:02', '2023-02-05 13:22:02'),
(479, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-02-05 13:22:47', '2023-02-05 13:22:47'),
(480, 1, 'admin/user', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:22:49', '2023-02-05 13:22:49'),
(481, 1, 'admin/food-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:25:40', '2023-02-05 13:25:40'),
(482, 1, 'admin/food-items', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:26:22', '2023-02-05 13:26:22'),
(483, 1, 'admin/food-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:26:53', '2023-02-05 13:26:53'),
(484, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:26:55', '2023-02-05 13:26:55'),
(485, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-02-05 13:27:12', '2023-02-05 13:27:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_permissions`
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
-- Đang đổ dữ liệu cho bảng `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2023-01-17 02:06:44', '2023-01-17 02:06:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
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
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$UEBeVI/7153I/ndmzYYuj.6/0FVhsYVO0Qs9S1bRCgKzkUMCCD6jy', 'Administrator', NULL, 'uyh11UzRcg2Ae7NTMFTG1HifqoAOr8ozii1E1KbDJ3iN9foCUwe1qcnnDU2O', '2023-01-17 02:06:44', '2023-01-17 02:06:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'fast food', 'images/cat-1.png', '2023-02-05 15:08:49', NULL),
(2, 'main dishes', 'images/cat-2.png', '2023-02-05 15:08:49', NULL),
(3, 'drinks', 'images/cat-3.png', '2023-02-05 15:08:49', NULL),
(4, 'desserts', 'images/cat-4.png', '2023-02-05 15:08:49', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
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
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `dob`, `phone_num`, `url`, `point`, `address`) VALUES
(19, 'Xuan Nang', '2001-07-30', '0333501404', 'https://www.facebook.com/xuan.nang.9404', 0, 'Xa quynh Long, huyen quynh luu, tinh nghe an'),
(20, 'Tran Xuan Nang', '2017-01-23', '0333501404', 'https://www.facebook.com/xuan.nang.9404', 0, 'Xa quynh Long, huyen quynh luu, tinh nghe an'),
(21, 'Hoang Manh Hung', '2023-02-02', '0355860850', NULL, 0, '357 Tam Trinh'),
(22, 'Hoàng Mạnh Hùng', NULL, '0971528594', NULL, 0, 'Trần Khát Trân'),
(23, 'Nguyễn Kim Bảo', '2023-02-22', '0343684430', 'https://www.facebook.com/nguyenbao', 0, '189 phố Vọng, Hai Bà Trưng, Hà Nội');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `fooditem`
--

CREATE TABLE `fooditem` (
  `id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `url` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `fooditem`
--

INSERT INTO `fooditem` (`id`, `cate_id`, `name`, `quantity`, `description`, `price`, `url`, `created_at`, `updated_at`) VALUES
(10, 1, 'beef burger', 99, 'good food', 20, 'images/burger-1.png', '2023-02-05 11:16:52', '2023-02-05 10:16:52'),
(11, 1, 'chicken burger', 99, 'good food', 20, 'images/burger-2.png', '2023-02-05 11:20:40', '2023-02-05 10:20:40'),
(13, 1, 'lamb burger', 98, 'good food', 20, 'images/feff3b85a021fe7b0251f4cfe9c247b0.png', '2023-02-05 11:23:29', '2023-02-05 10:23:29'),
(14, 2, 'spaghetti', 99, 'good food', 20, 'images/dish-1.png', '2023-02-05 10:25:50', '2023-02-05 10:25:50'),
(15, 2, 'seafood spaghetti', 99, 'good food', 20, 'images/dish-2.png', '2023-02-05 10:27:12', '2023-02-05 10:27:12'),
(16, 2, 'pasta', 99, 'good food', 20, 'images/dish-3.png', '2023-02-05 10:28:11', '2023-02-05 10:28:11'),
(17, 2, 'beef spaghetti', 99, 'good food', 20, 'images/dish-4.png', '2023-02-05 10:29:18', '2023-02-05 10:29:18'),
(18, 3, 'orange juice', 98, 'good juice', 2, 'images/drink-1.png', '2023-02-05 10:31:10', '2023-02-05 10:31:10'),
(19, 3, 'coffee', 20, 'good coffee', 2, 'images/drink-2.png', '2023-02-05 10:32:37', '2023-02-05 10:32:37'),
(20, 3, 'lemonade', 20, 'low sugar lemonade', 2, 'images/drink-3.png', '2023-02-05 10:33:40', '2023-02-05 10:33:40'),
(21, 3, 'Strawberry juice', 20, 'very sweet', 3, 'images/drink-5.png', '2023-02-05 10:34:32', '2023-02-05 10:34:32'),
(22, 4, 'Strawberry ice-cream', 20, 'very sweet', 3, 'images/dessert-1.png', '2023-02-05 10:36:13', '2023-02-05 10:36:13'),
(23, 4, 'chocolate cake', 99, 'there\'s wine in the cake', 4, 'images/dessert-2.png', '2023-02-05 10:38:13', '2023-02-05 10:38:13'),
(24, 4, 'cream strawberry cake', 99, 'cream strawberry cake', 4, 'images/dessert-6.png', '2023-02-05 10:40:31', '2023-02-05 10:40:31'),
(25, 2, 'vegetable pizza', 98, 'a lot of vegetable', 20, 'images/pizza-1.png', '2023-02-05 10:43:25', '2023-02-05 10:43:25'),
(26, 2, 'sausage pizza', 99, 'beef sausage', 2, 'images/7170dbe0c99f54d03261ad2664ab3a3a.png', '2023-02-05 10:44:41', '2023-02-05 10:44:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foodorder`
--

CREATE TABLE `foodorder` (
  `id` int(11) NOT NULL,
  `cs_id` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `foodorder`
--

INSERT INTO `foodorder` (`id`, `cs_id`, `total_price`, `note`, `created_at`, `status`, `address_id`) VALUES
(42, 23, 42, '', '2023-02-05 20:25:21', 0, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `food_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`food_id`, `order_id`, `quantity`) VALUES
(13, 42, 1),
(18, 42, 1),
(25, 42, 1);

--
-- Bẫy `orderdetail`
--
DELIMITER $$
CREATE TRIGGER `check_qty_trigger` BEFORE INSERT ON `orderdetail` FOR EACH ROW UPDATE fooditem SET fooditem.quantity = fooditem.quantity-NEW.quantity WHERE fooditem.id = NEW.food_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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
-- Cấu trúc bảng cho bảng `user`
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
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `cs_id`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(19, 19, 'nang3007@gmail.com', '$2y$10$lyJLaWCz6tX6A1KfnHslfud/hffy1u0fRmPip4GQEWnNyvllzcjrm', 1, '2023-01-28 08:21:56', '2023-01-28 01:21:56'),
(20, 20, 'nang.tx194633@sis.hust.edu.vn', '$2y$10$YdZhrq.YxAjlktckHr9a1OGG.febmuu3ZvXvCITrJLdlmndFLiJWC', 1, '2023-01-28 09:12:49', '2023-01-28 02:12:49'),
(21, 21, 'manhhung0601nd@gmail.com', '$2y$10$lluWdoDPSgQmhdUTaJgAfu5aVAHQr0Wyswxuacb4XYJFfARPpqX5.', 1, '2023-02-03 21:20:20', '2023-02-03 14:20:20'),
(22, 22, 'hung@gmail.com', '$2y$10$9W.cbBTWDcjqS7tDz6YJdulxGdEuPgYaCIWNnbmbExw2yRSctDsjm', 1, '2023-02-04 00:27:17', '2023-02-03 17:27:17'),
(23, 23, 'kimbaoksqp@gmail.com', '$2y$10$LB6WlRG0DF4Djs7rZpMTAusg74UttKCejwIMBJ5xdlEZz1fKOMviG', 1, '2023-02-05 20:23:14', '2023-02-05 13:23:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Chỉ mục cho bảng `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Chỉ mục cho bảng `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Chỉ mục cho bảng `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `fooditem`
--
ALTER TABLE `fooditem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_fk` (`cate_id`);

--
-- Chỉ mục cho bảng `foodorder`
--
ALTER TABLE `foodorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cs_id_fk` (`cs_id`),
  ADD KEY `address_id_fk` (`address_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`order_id`,`food_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `cs_id` (`cs_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `fooditem`
--
ALTER TABLE `fooditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `foodorder`
--
ALTER TABLE `foodorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `fooditem`
--
ALTER TABLE `fooditem`
  ADD CONSTRAINT `cate_fk` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `foodorder`
--
ALTER TABLE `foodorder`
  ADD CONSTRAINT `address_id_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cs_id_fk` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `fooditem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `foodorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
