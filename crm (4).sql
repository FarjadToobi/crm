-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2022 at 11:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `url`, `status`, `created_at`, `updated_at`, `logo`, `auth_key`, `phone`, `phone_tel`, `email`, `address`, `address_link`, `sign`) VALUES
(1, 'Design Gene Pro', 'https://www.designgene.com/', 1, '2022-07-15 13:44:28', '2022-07-25 10:28:58', '202207251528beni6.png', NULL, '09900900', '098908', 'design@gmail.com', 'nndkk dkskd alsk', 'https://www.kfcpakistan.com/', NULL),
(2, 'Design Cotton', 'https://laravel.com/', 1, '2022-07-18 13:28:09', '2022-07-18 13:28:09', '202207181828beni1.png', NULL, '990009', '39949999', 'design@cotton.com', 'A-20023 sec 5-3 sdk', 'https://laravel.com/', NULL),
(3, 'The Web Planet', 'https://laravel.com/', 1, '2022-07-18 13:30:49', '2022-07-18 13:30:49', '202207181830port8.png', NULL, '09809890', '9080809', 'web@planet.com', 'A-2993 ske nkkka', 'https://laravel.com/', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brand_users`
--

CREATE TABLE `brand_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_project`
--

CREATE TABLE `category_project` (
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_project`
--

INSERT INTO `category_project` (`project_id`, `category_id`, `created_at`, `updated_at`) VALUES
(17, 4, '2022-08-08 13:20:58', '2022-08-08 13:20:58'),
(16, 3, '2022-08-08 13:35:59', '2022-08-08 13:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `category_users`
--

CREATE TABLE `category_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_users`
--

INSERT INTO `category_users` (`user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 4, '2022-08-08 09:10:09', '2022-08-08 09:10:09'),
(7, 3, '2022-08-08 05:14:13', '2022-08-08 05:14:13'),
(8, 1, '2022-08-08 05:19:55', '2022-08-08 05:19:55'),
(9, 1, '2022-08-08 05:21:27', '2022-08-08 05:21:27'),
(10, 1, '2022-08-08 05:22:30', '2022-08-08 05:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `last_name`, `email`, `contact`, `created_at`, `updated_at`, `user_id`, `status`, `brand_id`, `url`, `subject`, `service`, `message`) VALUES
(1, 'Test', 'test', 'test@vomoto.com', '090909', '2022-07-15 13:46:19', '2022-07-29 01:41:00', NULL, 2, 3, NULL, NULL, NULL, NULL),
(2, 'Ronke', 'Ronke', 'ronke@ronke.com', '009920290', '2022-07-18 13:31:44', '2022-07-18 13:31:44', NULL, 1, 1, NULL, NULL, NULL, NULL),
(3, 'Zandara', 'Danis', 'zandara@danis.com', '029199288', '2022-07-18 13:32:18', '2022-07-18 13:32:18', NULL, 1, 2, NULL, NULL, NULL, NULL),
(4, 'Stacy', 'Gabel', 'stacy@gabel.com', '039090909', '2022-07-18 13:32:41', '2022-07-18 13:32:41', NULL, 1, 3, NULL, NULL, NULL, NULL),
(5, 'Rubbie', 'King', 'rubie@king.com', '0212929', '2022-07-18 13:33:12', '2022-07-18 13:33:12', NULL, 1, 3, NULL, NULL, NULL, NULL),
(6, 'Robert', 'Paul', 'robert@paul.com', '0299280129', '2022-07-18 13:33:35', '2022-07-18 13:33:35', NULL, 1, 3, NULL, NULL, NULL, NULL),
(7, 'New', 'make', 'new@make.com', '098093804', '2022-07-25 11:47:52', '2022-07-25 11:47:52', NULL, 1, 2, NULL, NULL, NULL, NULL),
(8, 'user', 'check', 'user@check.om', '098098', '2022-07-27 13:47:40', '2022-07-27 13:50:50', NULL, 1, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_files`
--

CREATE TABLE `client_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_check` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_files`
--

INSERT INTO `client_files` (`id`, `path`, `name`, `status`, `task_id`, `created_at`, `updated_at`, `user_id`, `user_check`) VALUES
(1, 'D:\\xampp\\htdocs\\coding\\laravel\\crm\\public\\files', '166004762660.jpg', 1, 1, '2022-08-09 07:20:26', '2022-08-09 07:20:26', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `create_categories`
--

CREATE TABLE `create_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` bigint(11) UNSIGNED DEFAULT NULL,
  `status` bigint(4) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `create_categories`
--

INSERT INTO `create_categories` (`id`, `name`, `service_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Logo', 3, 1, '2022-07-18 12:27:38', '2022-07-18 12:54:42'),
(3, 'Web Desiging', 1, 2, '2022-07-18 12:54:53', '2022-07-29 01:40:38'),
(4, 'Packaging', 3, 1, '2022-07-29 01:39:42', '2022-07-29 01:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `short_name`, `sign`, `created_at`, `updated_at`) VALUES
(1, 'Dollar', 'USD', '$', '2022-07-15 13:43:39', '2022-07-15 13:43:39');

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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` bigint(20) UNSIGNED DEFAULT NULL,
  `service` bigint(20) UNSIGNED DEFAULT NULL,
  `package` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_number` int(11) NOT NULL,
  `invoice_date` date NOT NULL DEFAULT current_timestamp(),
  `sales_agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_package` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `name`, `email`, `contact`, `brand`, `service`, `package`, `currency`, `client_id`, `invoice_number`, `invoice_date`, `sales_agent_id`, `description`, `amount`, `payment_status`, `payment_type`, `custom_package`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 'Test test', 'test@vomoto.com', '090909', 1, 1, 1, 1, 1, 4161010, '2022-07-15', 1, NULL, 2000, 1, 'one_time_payment', 'Test Package', NULL, '2022-07-15 13:48:26', '2022-07-22 13:26:40'),
(2, 'Ronke', 'ronke@ronke.com', '009920290', 1, 3, 2, 1, 2, 7075247, '2022-07-22', 1, NULL, 2002, 0, 'one_time_payment', 'test', NULL, '2022-07-22 13:13:36', '2022-07-27 13:29:54'),
(3, 'New', 'new@make.com', '098093804', 3, 4, 2, 1, 7, 8467264, '2022-07-25', 1, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.', 2000, 0, 'one_time_payment', 'Pro Pack', NULL, '2022-07-25 11:53:40', '2022-07-27 13:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `logo_forms`
--

CREATE TABLE `logo_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slogan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagery` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desired_design` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors_visual` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intended_use` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_overview` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_audience` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logo_forms`
--

INSERT INTO `logo_forms` (`id`, `logo_name`, `slogan`, `imagery`, `desired_design`, `colors_visual`, `intended_use`, `business_overview`, `target_audience`, `filesname`, `additional_information`, `user_id`, `invoice_id`, `agent_id`, `created_at`, `updated_at`) VALUES
(1, 'KFC', 'Taste Delight', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '16587762526.png', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 2, 1, 1, '2022-07-25 14:10:52', '2022-07-25 14:10:52'),
(2, 'Nick', 'Quality Matters', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', '[\"165877710674.png\",\"165877710691.png\"]', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 2, 1, 1, '2022-07-25 14:25:06', '2022-07-25 14:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL DEFAULT 0,
  `reciver_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `message`, `sender_id`, `reciver_id`, `created_at`, `updated_at`) VALUES
(1, 'farjad', 'Test', 1, 0, '2022-07-25 10:21:25', '2022-07-25 10:21:25'),
(2, 'farjad', 'test', 1, 0, '2022-07-25 10:39:51', '2022-07-25 10:39:51'),
(3, 'farjad', 'admin tes', 1, 0, '2022-07-25 10:41:41', '2022-07-25 10:41:41'),
(4, 'farjad', 'sadasd', 1, 0, '2022-07-25 10:42:11', '2022-07-25 10:42:11'),
(5, 'farjad', 'mys asdkljaslkd', 1, 0, '2022-07-25 10:45:38', '2022-07-25 10:45:38'),
(6, 'farjad', 'new test file', 1, 0, '2022-07-25 10:48:28', '2022-07-25 10:48:28'),
(7, 'farjad', 'new test file', 1, 0, '2022-07-25 10:48:47', '2022-07-25 10:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `message_files`
--

CREATE TABLE `message_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_files`
--

INSERT INTO `message_files` (`id`, `file`, `message_id`, `created_at`, `updated_at`) VALUES
(1, '165876248525.png', 1, '2022-07-25 10:21:25', '2022-07-25 10:21:25'),
(2, '165876248556.png', 1, '2022-07-25 10:21:25', '2022-07-25 10:21:25'),
(3, '165876373126.png', 4, '2022-07-25 10:42:11', '2022-07-25 10:42:11'),
(4, '165876412768.png', 7, '2022-07-25 10:48:47', '2022-07-25 10:48:47');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_04_26_085235_add_is_employee_in_users_table', 1),
(6, '2021_04_30_053839_add_paid_to_users_table', 1),
(7, '2021_04_30_063838_add_seller__registration__colums_to_users', 1),
(8, '2021_04_30_222006_add_status_and_block_to_users_table', 1),
(9, '2021_05_15_085430_create_categories_table', 1),
(10, '2021_05_15_114723_create_brands_table', 1),
(11, '2021_05_17_021212_removing_extra_cols_from_users_table', 1),
(12, '2021_05_17_021442_add_brand_id_to_users_table', 1),
(13, '2021_05_17_050739_create_category_users_table', 1),
(14, '2021_05_17_221242_create_projects_table', 1),
(15, '2021_05_17_224857_create_clients_table', 1),
(16, '2021_05_18_231609_add_user_id_to_clients_table', 1),
(17, '2021_05_18_235551_add_status_id_to_clients_table', 1),
(18, '2021_05_30_023444_add_cost_to_projects_table', 1),
(19, '2021_05_30_023757_add_client_id_to_projects_table', 1),
(20, '2021_06_02_153024_create_category_project_table', 1),
(21, '2021_06_02_154432_add_updated_at_to_category_project_table', 1),
(22, '2021_06_02_155205_add_brand_id_to_projects_table', 1),
(23, '2021_06_02_174646_create_tasks_table', 1),
(24, '2021_06_02_175212_add_status_to_tasks_table', 1),
(25, '2021_06_03_125327_create_client_files_table', 1),
(26, '2021_06_03_143047_add_user_id_to_tasks_table', 1),
(27, '2021_06_04_150205_add_brand_id_to_tasks_table', 1),
(28, '2021_06_04_175834_create_sub_task_table', 1),
(29, '2021_06_04_181801_add_user_id_to_sub_task_table', 1),
(30, '2021_07_10_044235_add_logo_and_auth_key_to_brands_table', 1),
(31, '2021_07_10_052315_add_phone_and_email_and_address_to_brands_table', 1),
(32, '2021_07_10_061447_add_image_to_users_table', 1),
(33, '2021_07_12_134410_add_sign_to_brands_table', 1),
(34, '2021_07_12_144124_create_services_table', 1),
(35, '2021_07_12_194309_add_brand_id_to_clients_table', 1),
(36, '2021_07_12_222433_add_url_and_subject_and_services_and_message_to_clients_table', 1),
(37, '2021_07_12_230717_remove_unique_from_email_to_clients_table', 1),
(38, '2021_09_26_014422_create_brand_users_table', 1),
(39, '2021_09_26_053725_add_duedate_to_tasks_table', 1),
(40, '2021_09_26_062003_add_duedate_to_sub_task_table', 1),
(41, '2021_09_27_050444_add_user_id_status_to_client_files_table', 1),
(42, '2021_10_03_044823_create_packages_table', 1),
(43, '2021_10_03_055711_add_paid_status_packages_table', 1),
(44, '2021_10_03_062735_create_currencies_table', 1),
(45, '2021_10_03_065724_add_sign_to_packages_table', 1),
(46, '2021_10_04_221625_create_notifications_table', 1),
(47, '2022_07_12_191237_create_invoices_table', 1),
(48, '2022_07_15_155515_laratrust_setup_tables', 1),
(49, '2022_07_22_124127_create_statuses_table', 2),
(50, '2022_07_22_212017_create_messages_table', 3),
(51, '2022_07_25_173107_create_logo_forms_table', 4),
(52, '2022_07_25_193417_create_website_forms_table', 5),
(53, '2022_09_03_205724_laratrust_setup_tables', 6),
(54, '2022_08_02_150049_laratrust_setup_teams', 7);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actual_price` decimal(65,2) DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cut_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_selling` tinyint(4) DEFAULT 0,
  `on_landing` tinyint(4) DEFAULT 0,
  `is_combo` tinyint(4) DEFAULT 0,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` bigint(11) UNSIGNED DEFAULT 1,
  `currencies_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `slug`, `actual_price`, `price`, `cut_price`, `details`, `addon`, `description`, `best_selling`, `on_landing`, `is_combo`, `brand_id`, `service_id`, `created_at`, `updated_at`, `status`, `currencies_id`) VALUES
(1, 'graphic', 'graphic', '2000.00', '2000', '1800', 'test', 'test', 'this is testing pakcaage', 1, 1, 1, 1, 3, '2022-07-15 13:46:00', '2022-07-18 13:36:32', 1, 1),
(2, 'Web', 'web', '20000.00', '20000', '18000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'lorem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', 1, 1, 1, 3, 1, '2022-07-18 13:36:10', '2022-07-18 13:36:53', 1, 1),
(3, 'Extra Pack', NULL, NULL, '18000', NULL, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 0, 0, 0, 3, 1, '2022-07-29 02:25:51', '2022-07-29 02:27:56', 1, 1);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'users-create', 'Create Users', 'Create Users', '2022-08-06 09:57:05', '2022-08-06 09:57:05'),
(2, 'users-read', 'Read Users', 'Read Users', '2022-08-06 09:57:05', '2022-08-06 09:57:05'),
(3, 'users-update', 'Update Users', 'Update Users', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(4, 'users-delete', 'Delete Users', 'Delete Users', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(5, 'payments-create', 'Create Payments', 'Create Payments', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(6, 'payments-read', 'Read Payments', 'Read Payments', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(7, 'payments-update', 'Update Payments', 'Update Payments', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(8, 'payments-delete', 'Delete Payments', 'Delete Payments', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(9, 'profile-read', 'Read Profile', 'Read Profile', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(10, 'profile-update', 'Update Profile', 'Update Profile', '2022-08-06 09:57:06', '2022-08-06 09:57:06'),
(11, 'profile-create', 'Create Profile', 'Create Profile', '2022-08-06 09:57:08', '2022-08-06 09:57:08'),
(12, 'profile-delete', 'Delete Profile', 'Delete Profile', '2022-08-06 09:57:08', '2022-08-06 09:57:08'),
(13, 'client-access', 'Client Access', 'Client Access', '2022-08-06 09:59:30', '2022-08-06 09:59:30'),
(14, 'lead-access', 'Lead Access', 'Lead Access', '2022-08-06 10:00:02', '2022-08-06 10:00:02'),
(15, 'add-client', 'Add Client', 'Add Client', '2022-08-06 10:01:04', '2022-08-06 10:01:04'),
(16, 'show-client', 'Show Client', 'Show Client', '2022-08-06 10:01:26', '2022-08-06 10:01:26'),
(17, 'edit-client', 'Edit Client', 'Edit Client', '2022-08-06 10:01:45', '2022-08-06 10:01:45'),
(18, 'register-client', 'Register Client', 'Register Client', '2022-08-06 10:02:03', '2022-08-06 10:02:03'),
(19, 'show-lead', 'Show Lead', 'Show Lead', '2022-08-06 10:02:26', '2022-08-06 10:02:26'),
(20, 'create-lead', 'Create Lead', 'Create Lead', '2022-08-06 10:02:51', '2022-08-06 10:02:51'),
(22, 'edit-lead', 'Edit Lead', 'Edit Lead', '2022-08-06 10:03:35', '2022-08-09 01:12:54'),
(23, 'edit-task', 'Edit Task', 'Edit Task', '2022-08-09 06:19:08', '2022-08-09 06:19:08'),
(24, 'view-task', 'View Task', 'View Task', '2022-08-09 06:19:38', '2022-08-09 06:19:38'),
(25, 'delete-task', 'Delete Task', 'Delete Task', '2022-08-09 06:19:55', '2022-08-09 06:19:55'),
(26, 'task-access', 'Task Access', 'Task Access', '2022-08-09 06:20:37', '2022-08-09 06:20:37'),
(27, 'edit-project', 'Edit Project', 'Edit Project', '2022-08-09 06:21:43', '2022-08-09 06:21:43'),
(28, 'project-access', 'Project Access', 'Project Access', '2022-08-09 06:22:07', '2022-08-09 06:22:07'),
(29, 'messages-access', 'Messages Access', 'Messages Access', '2022-08-09 06:22:31', '2022-08-09 06:22:31'),
(30, 'reply-message', 'Reply Message', 'Reply Message', '2022-08-09 06:25:54', '2022-08-09 06:25:54'),
(31, 'general-access', 'General Access', 'General Access', '2022-08-09 06:28:30', '2022-08-09 06:28:30'),
(32, 'breif-access', 'Breif Access', 'Breif Access', '2022-08-09 06:29:40', '2022-08-09 06:29:40'),
(33, 'show-breif', 'Show Breif', 'Show Breif', '2022-08-09 06:30:01', '2022-08-09 06:30:01'),
(34, 'edit-breif', 'Edit Breif', 'Edit Breif', '2022-08-09 06:30:21', '2022-08-09 06:34:18'),
(35, 'subtask-access', 'Subtask Access', 'Subtask Access', '2022-08-09 08:23:37', '2022-08-09 08:23:37'),
(36, 'create-subtask', 'Create Subtask', 'Create Subtask', '2022-08-09 08:27:38', '2022-08-09 08:27:38'),
(37, 'add-breif', 'Add Breif', 'Add Breif', '2022-08-09 08:29:06', '2022-08-09 08:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(2, 2),
(2, 4),
(3, 1),
(3, 2),
(3, 4),
(4, 1),
(4, 2),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(18, 1),
(18, 4),
(19, 1),
(19, 4),
(20, 1),
(20, 4),
(22, 1),
(22, 4),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` int(10) UNSIGNED DEFAULT NULL
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
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `product_status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `status`, `product_status`, `user_id`, `created_at`, `updated_at`, `cost`, `client_id`, `brand_id`) VALUES
(15, 'test 1', '2832751', 1, 1, 1, '2022-07-27 13:29:03', '2022-07-27 13:29:03', '$2002', 2, NULL),
(16, 'test 2', '7075247', 0, 0, 1, '2022-07-27 13:29:10', '2022-07-27 13:29:54', '$2002', 2, NULL),
(17, 'Test 3', 'Testing project', 1, 1, 1, '2022-07-27 14:03:25', '2022-07-27 14:03:25', '$2000', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2022-08-06 09:57:05', '2022-08-06 09:57:05'),
(2, 'sales', 'Sales', 'Sales', '2022-08-06 09:57:07', '2022-08-06 09:57:07'),
(3, 'production', 'Production', 'Production', '2022-08-06 09:57:07', '2022-08-06 09:57:07'),
(4, 'client', 'Client', 'Client', '2022-08-06 09:57:07', '2022-08-06 09:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`, `team_id`) VALUES
(1, 1, 'App\\Models\\User', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `form`, `created_at`, `updated_at`) VALUES
(1, 'Web Development', NULL, '2022-07-15 13:27:30', '2022-07-15 13:29:16'),
(3, 'Graphic', NULL, '2022-07-18 13:34:38', '2022-07-18 13:34:50'),
(4, '2D/3D animation', NULL, '2022-07-18 13:35:06', '2022-07-18 13:35:06'),
(5, 'Software development', NULL, '2022-07-18 13:35:19', '2022-07-18 13:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Active', '2022-07-22 15:36:15', '2022-07-22 15:36:15'),
(2, 'Deactive', '2022-07-22 15:36:15', '2022-07-22 15:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `sub_task`
--

CREATE TABLE `sub_task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duedate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `project_id`, `category_id`, `description`, `created_at`, `updated_at`, `status`, `user_id`, `brand_id`, `duedate`) VALUES
(1, 17, 1, 'This is pending task', '2022-07-29 07:25:53', '2022-08-09 06:34:42', 2, 1, 1, '2022-07-30'),
(6, 17, 3, 'lorem ipsum', '2022-08-09 05:14:49', '2022-08-09 05:14:49', 0, 1, 1, '2022-08-25');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_employee` tinyint(1) DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_employee`, `last_name`, `contact`, `status`, `block`, `brand_id`, `image`) VALUES
(1, 'farjad', 'farjad.akbar@toobitech.com', NULL, '$2y$10$tAurgOk49RQj1y2JVbBhXODyDntD2LMo3W9bomzVwe4amycKjFtR.', NULL, '2022-07-15 13:25:10', '2022-07-15 13:25:10', NULL, NULL, '03449349', 1, 0, 2, NULL),
(2, 'Test', 'test@vomoto.com', NULL, '$2y$10$tAurgOk49RQj1y2JVbBhXODyDntD2LMo3W9bomzVwe4amycKjFtR.', NULL, '2022-07-18 10:27:32', '2022-07-22 11:11:29', 1, NULL, '03449349', 1, 0, 1, NULL),
(3, 'Agent', 'sales@agent.com', NULL, '$2y$10$3mhN/hdtBxJq3sI3pyIA8OkIcKmLmQqLAWODfyiNO9tQ6kPB6XE3C', NULL, '2022-07-19 11:18:17', '2022-07-19 11:18:17', 1, NULL, '03449349', 1, 0, 2, NULL),
(4, 'Agent', 'new@agent.com', NULL, '$2y$10$tAurgOk49RQj1y2JVbBhXODyDntD2LMo3W9bomzVwe4amycKjFtR.', NULL, '2022-07-19 11:51:18', '2022-07-19 11:51:18', 1, NULL, '03449349', 1, 0, 3, NULL),
(5, 'Ronke', 'ronke@ronke.com', NULL, '$2y$10$tAurgOk49RQj1y2JVbBhXODyDntD2LMo3W9bomzVwe4amycKjFtR.', NULL, '2022-07-22 11:11:18', '2022-07-22 11:15:02', 1, NULL, NULL, 1, 0, NULL, NULL),
(6, 'user', 'user@check.om', NULL, '$2y$10$2i.MAQx3zp.pnd7pDhbgfOy10Ip1ZJwKrt7d6utC/WDM5wYTpqN12', NULL, '2022-07-27 13:47:40', '2022-07-27 13:47:40', NULL, 'check', '098098', 1, 0, 2, NULL),
(7, 'test', 'test@test.com', NULL, '$2y$10$dJfHP56qzxH8eYhCOOydw.C.OP6KT4C5.Et5tHqYVXeZIcElz/PsG', NULL, '2022-08-08 05:14:13', '2022-08-08 05:14:13', NULL, NULL, NULL, 1, 0, NULL, NULL),
(8, 'roletest', 'role@test.cp', NULL, '$2y$10$r5VPyq5r7YCoH1RA3tMBOeWnihEiLDdVYdJ3pYU4n.UgUvLYKvnqm', NULL, '2022-08-08 05:19:55', '2022-08-08 05:19:55', NULL, NULL, NULL, 1, 0, NULL, NULL),
(9, 'lksd', 'lksd@gmail.com', NULL, '$2y$10$4fygifU2GP/52wxhZYAKk.BQI49Iual0BRs7OQPACc5WC9vnoMU4O', NULL, '2022-08-08 05:21:27', '2022-08-08 05:21:27', NULL, NULL, NULL, 1, 0, NULL, NULL),
(10, 'kasdj', 'kasdj@gmail.com', NULL, '$2y$10$1YquqtHGfKfu9p.x641jYeegYRPDUmmj2cBLgFgJH4lAbD6oA7dzq', NULL, '2022-08-08 05:22:30', '2022-08-08 05:22:30', NULL, NULL, NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `website_forms`
--

CREATE TABLE `website_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objective` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_target` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_target` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desired_reaction` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `competitor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `design` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `functionality` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postive_aspects` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negative_aspects` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `traffic_levels` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_performance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currrent_hosting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negative_hosting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_forms`
--

INSERT INTO `website_forms` (`id`, `website_title`, `purpose`, `objective`, `project_target`, `brand_target`, `desired_reaction`, `competitor`, `design`, `functionality`, `postive_aspects`, `negative_aspects`, `traffic_levels`, `current_performance`, `currrent_hosting`, `negative_hosting`, `filesname`, `additional_information`, `user_id`, `invoice_id`, `agent_id`, `created_at`, `updated_at`) VALUES
(1, 'ssd', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', NULL, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', NULL, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', '[\"165878201094.png\",\"165878201073.png\"]', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknownLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknownLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 2, 1, 1, '2022-07-25 15:46:50', '2022-07-25 15:46:50'),
(2, 'dsfas', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', NULL, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', NULL, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', '[\"165878296731.png\",\"165878296712.png\",\"165878296772.png\"]', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknownLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknownLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 2, 1, 1, '2022-07-25 16:02:47', '2022-07-25 16:02:47'),
(3, 'dsfas', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', NULL, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', NULL, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', '[\"165878307437.png\",\"165878307478.png\",\"165878307421.png\"]', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknownLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknownLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown', 2, 1, 1, '2022-07-25 16:04:34', '2022-07-25 16:04:34'),
(4, 'sd', 'sad', 'sd', NULL, 'sd', 'asd', 'sd', 'asd', NULL, 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', '[\"165893650087.png\"]', 'asd', 2, 1, 1, '2022-07-27 10:41:40', '2022-07-27 10:41:40'),
(5, 'Testing project', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', NULL, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', NULL, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '[]', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 1, 1, 1, '2022-07-27 14:03:25', '2022-07-27 14:03:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_status_foreign` (`status`);

--
-- Indexes for table `brand_users`
--
ALTER TABLE `brand_users`
  ADD KEY `brand_users_user_id_foreign` (`user_id`),
  ADD KEY `brand_users_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `category_project`
--
ALTER TABLE `category_project`
  ADD KEY `category_project_project_id_foreign` (`project_id`),
  ADD KEY `category_project_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_users`
--
ALTER TABLE `category_users`
  ADD KEY `category_users_user_id_foreign` (`user_id`),
  ADD KEY `category_users_category_id_foreign` (`category_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id_foreign` (`user_id`),
  ADD KEY `clients_brand_id_foreign` (`brand_id`),
  ADD KEY `clients_status_id_foreign` (`status`);

--
-- Indexes for table `client_files`
--
ALTER TABLE `client_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_files_task_id_foreign` (`task_id`),
  ADD KEY `client_files_user_id_foreign` (`user_id`);

--
-- Indexes for table `create_categories`
--
ALTER TABLE `create_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_service_id` (`service_id`),
  ADD KEY `category_status_id` (`status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_brand_foreign` (`brand`),
  ADD KEY `invoices_service_foreign` (`service`),
  ADD KEY `invoices_package_foreign` (`package`),
  ADD KEY `invoices_currency_foreign` (`currency`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_sales_agent_id_foreign` (`sales_agent_id`);

--
-- Indexes for table `logo_forms`
--
ALTER TABLE `logo_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_files`
--
ALTER TABLE `message_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_message_id` (`message_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_brand_id_foreign` (`brand_id`),
  ADD KEY `packages_service_id_foreign` (`service_id`),
  ADD KEY `packages_currencies_id_foreign` (`currencies_id`),
  ADD KEY `packages_status_id_foreign` (`status`);

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
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD UNIQUE KEY `permission_user_user_id_permission_id_user_type_team_id_unique` (`user_id`,`permission_id`,`user_type`,`team_id`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_user_team_id_foreign` (`team_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_user_id_foreign` (`user_id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD UNIQUE KEY `role_user_user_id_role_id_user_type_team_id_unique` (`user_id`,`role_id`,`user_type`,`team_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_team_id_foreign` (`team_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_task`
--
ALTER TABLE `sub_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_task_task_id_foreign` (`task_id`),
  ADD KEY `sub_task_user_id_foreign` (`user_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_category_id_foreign` (`category_id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teams_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `website_forms`
--
ALTER TABLE `website_forms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `client_files`
--
ALTER TABLE `client_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `create_categories`
--
ALTER TABLE `create_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logo_forms`
--
ALTER TABLE `logo_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `message_files`
--
ALTER TABLE `message_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_task`
--
ALTER TABLE `sub_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `website_forms`
--
ALTER TABLE `website_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brand_status_foreign` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `brand_users`
--
ALTER TABLE `brand_users`
  ADD CONSTRAINT `brand_users_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_project`
--
ALTER TABLE `category_project`
  ADD CONSTRAINT `category_project_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `create_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_users`
--
ALTER TABLE `category_users`
  ADD CONSTRAINT `category_users_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `create_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `clients_status_id_foreign` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `client_files`
--
ALTER TABLE `client_files`
  ADD CONSTRAINT `client_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `client_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `create_categories`
--
ALTER TABLE `create_categories`
  ADD CONSTRAINT `category_service_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `category_status_id` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `invoices_currency_foreign` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoices_package_foreign` FOREIGN KEY (`package`) REFERENCES `packages` (`id`),
  ADD CONSTRAINT `invoices_sales_agent_id_foreign` FOREIGN KEY (`sales_agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoices_service_foreign` FOREIGN KEY (`service`) REFERENCES `services` (`id`);

--
-- Constraints for table `message_files`
--
ALTER TABLE `message_files`
  ADD CONSTRAINT `file_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_currencies_id_foreign` FOREIGN KEY (`currencies_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_status_id_foreign` FOREIGN KEY (`status`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_task`
--
ALTER TABLE `sub_task`
  ADD CONSTRAINT `sub_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `sub_task_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `tasks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `create_categories` (`id`),
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
