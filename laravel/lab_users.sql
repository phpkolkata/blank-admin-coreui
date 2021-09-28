-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2021 at 11:45 AM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `db` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `centre_admin_id` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `center_name`, `center_mobile`, `center_city`, `center_address`, `email_verified_at`, `password`, `db`, `centre_admin_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Suman Roy', 'demo', 'R.B Diagnostics', '9062400555', 'Kolkata', 'N.S Road, 1st floor, coal bhawan.', NULL, '$2y$10$N40FeXKHzENefXbYVZe6LexnmSuyvajUPXm1fG.325.CH8SarSp5i', 'lab_demo', 1, NULL, NULL, NULL),
(2, 'Mr. Kuldeep Sen', 'woodland', 'WOODLAND Diagnostics', 'Contact No. : 8145639933', 'JHARGRAM, W.B. Pin : 721507', 'Main Road, RAGHUNATHPUR ( Opposite Allahabad Bank )', NULL, '$2y$10$gtiDEonU25JFKfxAXSX4nOabtCGl89HvpFi1M2v1TuxYtAJk2UPo2', 'lab_woodland', 1, NULL, NULL, NULL),
(3, 'Mr. abc', 'spdc', 'SPDC LAB', '', '', '', NULL, '$2y$12$2umhD9pARTxmq5Gjk7JXg.bNzivQOafNZ9I/fG7HkxqFAI/WFvOj2', 'lab_spdc', 1, NULL, NULL, NULL),
(4, 'Admin', 'admin', 'Admin LAB', '', '', '', NULL, '$2y$12$JVtLwWfIm7OOWFrrNBCc5utsNG8h.mOqjCUlJf1AXnBU0T8YIYzTW', 'lab_admin', 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
