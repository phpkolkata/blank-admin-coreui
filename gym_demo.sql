-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 28, 2021 at 07:13 PM
-- Server version: 8.0.26-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient_billing_discount_cause`
--

CREATE TABLE `patient_billing_discount_cause` (
  `id` int NOT NULL,
  `patient_bill_id` int NOT NULL,
  `discount_cause_id` int NOT NULL,
  `discount_name` varchar(200) NOT NULL,
  `payment_style` enum('percent','flat') NOT NULL,
  `amount` int NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_billing_discount_cause`
--

INSERT INTO `patient_billing_discount_cause` (`id`, `patient_bill_id`, `discount_cause_id`, `discount_name`, `payment_style`, `amount`, `created_at`) VALUES
(1, 11, 9, 'relative', 'percent', 10, '2021-04-17'),
(2, 22, 5, 'Known Person', 'flat', 20, '2021-04-22'),
(3, 47, 8, 'discount 3', 'percent', 3, '2021-05-11');

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `id` int NOT NULL,
  `mode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`id`, `mode`) VALUES
(1, 'Online'),
(2, 'Neft'),
(3, 'Cash'),
(4, 'Credit Card'),
(5, 'Paytm'),
(6, 'Phone Pay'),
(7, 'UPI'),
(8, 'IMPS'),
(9, 'Google Pay'),
(10, 'Debit Card'),
(12, 'asdf'),
(13, 'as'),
(14, 'rtrt');

-- --------------------------------------------------------

--
-- Table structure for table `service_charge`
--

CREATE TABLE `service_charge` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `payment_style` enum('flat','percent') NOT NULL,
  `amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_charge`
--

INSERT INTO `service_charge` (`id`, `name`, `payment_style`, `amount`) VALUES
(1, 'Home Collection', 'flat', 20),
(2, 'Home Delivery', 'flat', 20),
(3, 'Fast Delivery', 'flat', 10),
(4, 'GST', 'percent', 5),
(5, 'GST2', 'percent', 10),
(6, 'GST3', 'flat', 20),
(38, 'Others', 'percent', 23),
(39, 'Service Tax', 'percent', 5);

-- --------------------------------------------------------

--
-- Table structure for table `todolist`
--

CREATE TABLE `todolist` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `todolist`
--

INSERT INTO `todolist` (`id`, `title`, `time`) VALUES
(2, '18 tarikh er list', '2021-06-18 00:00:00'),
(6, 'My new task', '2021-06-11 16:56:09'),
(7, 'Another task', '2021-09-28 18:53:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient_billing_discount_cause`
--
ALTER TABLE `patient_billing_discount_cause`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_charge`
--
ALTER TABLE `service_charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todolist`
--
ALTER TABLE `todolist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient_billing_discount_cause`
--
ALTER TABLE `patient_billing_discount_cause`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_charge`
--
ALTER TABLE `service_charge`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `todolist`
--
ALTER TABLE `todolist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
