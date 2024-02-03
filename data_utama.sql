-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 03, 2024 at 10:18 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_utama`
--

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_02_113323_create_products_table', 2),
(10, '2024_02_02_134828_create_transactions_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'DATAUTAMA', 'a0fcc9bb63b602d5c16b8aa22555aea31d1e1f5ce6c273cfbbb3e8bb862636f9', '[\"*\"]', NULL, NULL, '2024-02-02 03:58:54', '2024-02-02 03:58:54'),
(2, 'App\\Models\\User', 1, 'MyAuthApp', '0dac1bda34731ef4718bd23c044b970eae8e8fa14d3916026ce4b01242ef7435', '[\"*\"]', NULL, NULL, '2024-02-02 04:02:17', '2024-02-02 04:02:17'),
(3, 'App\\Models\\User', 1, 'MyAuthApp', '603277dd8e9e07ac527c5fde473988ede2c37dea99aee2599ec6242498c80f49', '[\"*\"]', '2024-02-03 02:29:13', NULL, '2024-02-02 05:14:57', '2024-02-03 02:29:13'),
(4, 'App\\Models\\User', 1, 'MyAuthApp', 'e4b4001c11792cafe1ed5555c98b53db2056e4e5a67a6bf71f2e0d978250c224', '[\"*\"]', NULL, NULL, '2024-02-02 05:19:16', '2024-02-02 05:19:16'),
(5, 'App\\Models\\User', 2, 'Budi DATAUTAMA', '830b3497e626ecf21efeb96270cc0098b54d28ede868182563bce8e0c6963616', '[\"*\"]', NULL, NULL, '2024-02-02 11:43:49', '2024-02-02 11:43:49'),
(6, 'App\\Models\\User', 3, 'Budi DATAUTAMA', '8d76a71bb9a3e490ddd16c4cb0f94b2a0dc47bf8417141a8b554ec6f1f0c91d0', '[\"*\"]', NULL, NULL, '2024-02-02 11:46:25', '2024-02-02 11:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Pencil 3', 7000, 7, 'Tools to write somethingggg', '2024-02-02 06:40:32', '2024-02-03 02:29:17'),
(4, 'Baju', 100000, 15, 'Kemeja Lengan Panjang', '2024-02-02 21:29:26', '2024-02-03 02:53:07'),
(6, 'Lemari Pakaian', 1500000, 4, 'Lemari pakaian sehari-hari', '2024-02-02 21:29:28', '2024-02-03 02:54:16'),
(7, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:28', '2024-02-02 21:29:28'),
(8, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:29', '2024-02-02 21:29:29'),
(9, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:30', '2024-02-02 21:29:30'),
(10, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:31', '2024-02-02 21:29:31'),
(11, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:31', '2024-02-02 21:29:31'),
(12, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:32', '2024-02-02 21:29:32'),
(13, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:33', '2024-02-02 21:29:33'),
(14, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:34', '2024-02-02 21:29:34'),
(15, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:34', '2024-02-02 21:29:34'),
(16, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:35', '2024-02-02 21:29:35'),
(17, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:36', '2024-02-02 21:29:36'),
(18, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:37', '2024-02-02 21:29:37'),
(19, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:37', '2024-02-02 21:29:37'),
(20, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:38', '2024-02-02 21:29:38'),
(21, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:39', '2024-02-02 21:29:39'),
(22, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:39', '2024-02-02 21:29:39'),
(23, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:40', '2024-02-02 21:29:40'),
(24, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:41', '2024-02-02 21:29:41'),
(25, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:42', '2024-02-02 21:29:42'),
(26, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:42', '2024-02-02 21:29:42'),
(27, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:43', '2024-02-02 21:29:43'),
(28, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:44', '2024-02-02 21:29:44'),
(29, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:45', '2024-02-02 21:29:45'),
(30, 'Pencil 2', 5000, 10, 'Tools to write something', '2024-02-02 21:29:45', '2024-02-02 21:29:45'),
(31, 'Sepatu', 100000, 14, 'Sneakers', '2024-02-02 22:16:51', '2024-02-02 22:16:51');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `payment_amount` double NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `reference_no`, `quantity`, `price`, `payment_amount`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 'INV20240202143804231', 2, 2000, 4000, 2, '2024-02-02 07:38:07', '2024-02-02 07:38:07'),
(3, 'INV20240203040307442', 2, 2000, 4000, 2, '2024-02-02 21:03:09', '2024-02-02 21:03:09'),
(4, 'INV20240203040349822', 2, 2000, 4000, 2, '2024-02-02 21:03:51', '2024-02-02 21:03:51'),
(5, 'INV20240203040534284', 2, 2000, 4000, 2, '2024-02-02 21:05:37', '2024-02-02 21:05:37'),
(6, 'INV20240203092917441', 3, 7000, 21000, 2, '2024-02-03 02:29:17', '2024-02-03 02:29:17'),
(7, 'INV20240203095416701', 1, 1500000, 1500000, 6, '2024-02-03 02:54:16', '2024-02-03 02:54:16');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'fulanss', 'fulanass@gmail.com', NULL, '$2y$12$FOCN4A0JaSGL6MQM.RmxVuCkH/Y4hHM3TwJbggyv3ShHgLJf0NsKi', NULL, '2024-02-02 03:58:54', '2024-02-02 03:58:54'),
(4, 'budi', 'budi@gmail.com', NULL, '$2y$12$BHlxy6ubC.tj77xbEJ61BOC6Vr2hM02qbIgbU6V9m/VuF3cLivT9m', NULL, '2024-02-02 11:47:22', '2024-02-02 11:47:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
