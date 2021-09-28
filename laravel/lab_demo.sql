-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2021 at 11:44 AM
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
-- Database: `lab_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `paid_to_id` int(11) DEFAULT NULL,
  `paid_to_name` varchar(50) DEFAULT NULL,
  `subject_type` varchar(50) NOT NULL,
  `received_by_id` int(11) DEFAULT NULL,
  `received_by_name` varchar(100) DEFAULT NULL,
  `billing_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `purpose` varchar(200) NOT NULL,
  `pay_type` enum('in','out','refund') NOT NULL,
  `payment_mode` varchar(30) NOT NULL DEFAULT 'cash',
  `payment_date` date NOT NULL,
  `editable` enum('y','n') NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `paid_to_id`, `paid_to_name`, `subject_type`, `received_by_id`, `received_by_name`, `billing_id`, `amount`, `purpose`, `pay_type`, `payment_mode`, `payment_date`, `editable`) VALUES
(43, 0, '', 'patient', 3, 'SUMAN ROY', 1, 200, 'bill-Mar20-001', 'in', 'cash', '2020-03-03', 'n'),
(44, 0, '', 'patient', 1, 'SUMAN ROY', 1, 300, 'bill-Mar20-001', 'in', 'cash', '2020-03-03', 'n'),
(45, 0, '', 'patient', 3, 'SUMAN ROY', 2, 1000, 'bill-Mar20-002', 'in', 'cash', '2020-03-05', 'n'),
(46, 0, 'CENTRE OWNER', 'Person', 0, '', 0, 1000, 'CASH HAND OVER', 'out', 'cash', '2020-03-05', 'y'),
(47, 0, '', 'patient', 4, 'ABCD', 3, 100, 'bill-Mar20-003', 'in', 'cash', '2020-03-06', 'n'),
(48, 0, '', 'patient', 5, 'RABINA KHATUN', 4, 100, 'bill-Mar20-004', 'in', 'cash', '2020-03-06', 'n'),
(49, 0, '', 'patient', 6, 'PAYEL DAS', 5, 100, 'bill-Mar20-005', 'in', 'Debit Card', '2020-03-06', 'n'),
(50, 0, '', 'patient', 8, 'SUNNY MONDAL', 7, 100, 'bill-Mar20-007', 'in', 'cash', '2020-03-06', 'n'),
(51, 0, '', 'patient', 9, 'SEKH SANIUL HAUQE', 8, 100, 'bill-Mar20-008', 'in', 'cash', '2020-03-06', 'n'),
(52, 0, '', 'patient', 10, 'SAMPLE DATA', 9, 500, 'bill-Mar20-009', 'in', 'cash', '2020-03-06', 'n'),
(53, 0, '', 'patient', 11, 'RAHUL PAL', 10, 100, 'bill-Mar20-010', 'in', 'cash', '2020-03-06', 'n'),
(54, 0, '', 'patient', 12, 'SAMIR DAS', 11, 100, 'bill-Mar20-011', 'in', 'cash', '2020-03-06', 'n'),
(55, 0, '', 'patient', 13, 'RANA PAL', 12, 100, 'bill-Mar20-012', 'in', 'cash', '2020-03-06', 'n'),
(56, 0, '', 'patient', 14, 'MOUMITA DAS', 13, 100, 'bill-Mar20-013', 'in', 'cash', '2020-03-06', 'n'),
(57, 0, '', 'patient', 15, 'SIMA DAS', 14, 100, 'bill-Mar20-014', 'in', 'cash', '2020-03-06', 'n'),
(58, 0, '', 'patient', 16, 'SUNIL DAS', 15, 100, 'bill-Mar20-015', 'in', 'cash', '2020-03-06', 'n'),
(59, 0, '', 'patient', 17, 'SHIBA PAL', 16, 100, 'bill-Mar20-016', 'in', 'cash', '2020-03-06', 'n'),
(60, 0, '', 'patient', 18, 'SUNNY DAS', 17, 100, 'bill-Mar20-017', 'in', 'cash', '2020-03-06', 'n'),
(61, 0, '', 'patient', 19, 'SOPON BERA', 18, 100, 'bill-Mar20-018', 'in', 'cash', '2020-03-06', 'n'),
(62, 0, '', 'patient', 20, 'BIPIN ADHIKARI', 19, 100, 'bill-Mar20-019', 'in', 'cash', '2020-03-06', 'n'),
(63, 0, '', 'patient', 21, 'VARUN KUMAR SINGH', 20, 100, 'bill-Mar20-020', 'in', 'cash', '2020-03-06', 'n'),
(64, 0, '', 'patient', 22, 'PARTHA DAS', 21, 100, 'bill-Mar20-021', 'in', 'cash', '2020-03-06', 'n'),
(65, 0, '', 'patient', 6, 'PAYEL DAS', 23, 100, 'bill-Mar20-023', 'in', 'cash', '2020-03-06', 'n'),
(66, 0, '', 'patient', 23, 'TECHSYS', 24, 410, 'bill-Mar20-024', 'in', 'cash', '2020-03-07', 'n'),
(67, 0, '', 'patient', 21, 'PARTHA DAS', 21, 0, 'bill-Mar20-021', 'in', 'cash', '2020-03-07', 'n'),
(68, 0, '', 'patient', 20, 'VARUN KUMAR SINGH', 20, 0, 'bill-Mar20-020', 'in', 'cash', '2020-03-07', 'n'),
(69, 0, '', 'patient', 24, 'SAMPLE PATIENT', 25, 500, 'bill-Mar20-025', 'in', 'cash', '2020-03-11', 'n'),
(70, 0, '', 'patient', 25, 'SAMPLE PATIENT', 25, 320, 'bill-Mar20-025', 'in', 'cash', '2020-03-12', 'n'),
(71, 0, '', 'patient', 25, 'SUMAN ROY', 26, 50, 'bill-Mar20-026', 'in', 'cash', '2020-03-12', 'n'),
(72, 0, '', 'patient', 28, 'SUMAN ROY', 29, 66, 'bill-Mar20-029', 'in', 'cash', '2020-03-12', 'n'),
(73, 25, 'SAMPLE PATIENT', 'patient', 0, '', 25, 820, 'refund bill-Mar20-025', 'out', 'cash', '2020-03-12', 'n'),
(74, 0, '', 'patient', 26, 'SUMAN ROY', 26, 0, 'bill-Mar20-026', 'in', 'cash', '2020-03-12', 'n'),
(75, 0, '', 'patient', 3, 'SUMAN ROY', 30, 100, 'bill-Mar20-030', 'in', 'cash', '2020-03-14', 'n'),
(76, 0, '', 'patient', 24, 'SAMPLE PATIENT', 31, 100, 'bill-Mar20-031', 'in', 'cash', '2020-03-14', 'n'),
(77, 0, '', 'patient', 23, 'TECHSYS', 32, 44, 'bill-200314001', 'in', 'cash', '2020-03-14', 'n'),
(78, 0, '', 'patient', 30, 'ddd', 33, 33, 'bill-200318001', 'in', 'cash', '2020-03-18', 'n'),
(79, 0, '', 'patient', 31, 'asdf', 34, 3, 'bill-200318001', 'in', 'cash', '2020-03-18', 'n'),
(80, 0, '', 'patient', 30, 'ddd', 35, 22, 'bill-200324001', 'in', 'cash', '2020-03-24', 'n'),
(81, 0, '', 'patient', 35, 'ddd', 35, 178, 'bill-200324001', 'in', 'cash', '2020-03-30', 'n'),
(82, 0, '', 'patient', 31, 'asdf', 36, 420, 'bill-200401001', 'in', 'cash', '2020-04-01', 'n'),
(83, 0, '', 'patient', 31, 'asdf', 37, 33, 'bill-200403001', 'in', 'cash', '2020-04-03', 'n'),
(84, 0, '', 'patient', 30, 'ddd', 38, 333, 'bill-200403001', 'in', 'cash', '2020-04-03', 'n'),
(85, 0, '', 'patient', 23, 'TECHSYS', 39, 33, 'bill-200403001', 'in', 'cash', '2020-04-03', 'n'),
(86, 0, '', 'patient', 31, 'asdf', 40, 33, 'bill-200403001', 'in', 'cash', '2020-04-03', 'n'),
(87, 0, '', 'patient', 24, 'SAMPLE PATIENT', 41, 33, 'bill-200403001', 'in', 'cash', '2020-04-03', 'n'),
(88, 0, '', 'patient', 31, 'asdf', 42, 33, 'bill-200403002', 'in', 'cash', '2020-04-03', 'n'),
(89, 0, '', 'patient', 29, 'ddd', 43, 24, 'bill-200403003', 'in', 'cash', '2020-04-03', 'n'),
(90, 0, '', 'patient', 24, 'SAMPLE PATIENT', 44, 111, 'bill-200403004', 'in', 'cash', '2020-04-03', 'n'),
(91, 0, '', 'patient', 29, 'ddd', 45, 32, 'bill-200403005', 'in', 'cash', '2020-04-03', 'n'),
(92, 0, '', 'patient', 23, 'TECHSYS', 46, 33, 'bill-200403006', 'in', 'cash', '2020-04-03', 'n'),
(93, 0, '', 'patient', 16, 'SUNIL DAS', 47, 435, 'bill-200403007', 'in', 'cash', '2020-04-03', 'n'),
(94, 0, '', 'patient', 16, 'SUNIL DAS', 48, 435, 'bill-200403008', 'in', 'cash', '2020-04-03', 'n'),
(95, 0, '', 'patient', 16, 'SUNIL DAS', 49, 435, 'bill-200403009', 'in', 'cash', '2020-04-03', 'n'),
(96, 0, '', 'patient', 16, 'SUNIL DAS', 50, 435, 'bill-200403010', 'in', 'cash', '2020-04-03', 'n'),
(97, 0, '', 'patient', 16, 'SUNIL DAS', 51, 435, 'bill-200403011', 'in', 'cash', '2020-04-03', 'n'),
(98, 0, '', 'patient', 29, 'ddd', 53, 44, 'bill-200403013', 'in', 'cash', '2020-04-03', 'n'),
(99, 0, '', 'patient', 24, 'SAMPLE PATIENT', 54, 33, 'bill-200410001', 'in', 'cash', '2020-04-10', 'n'),
(100, 0, '', 'patient', 23, 'TECHSYS', 55, 200, 'bill-200422001', 'in', 'cash', '2020-04-22', 'n'),
(101, NULL, NULL, 'patient', 55, 'TECHSYS', 55, 300, 'bill-200422001', 'in', 'cash', '2020-05-14', 'n'),
(102, NULL, NULL, 'patient', 54, 'SAMPLE PATIENT', 54, 440, 'bill-200410001', 'in', 'cash', '2020-05-14', 'n'),
(103, NULL, NULL, 'patient', 53, 'ddd', 53, 156, 'bill-200403013', 'in', 'cash', '2020-06-02', 'n'),
(104, NULL, 'ddd', 'Person', NULL, NULL, 0, 172, 'dfddd', 'out', 'cash', '2020-06-02', 'y'),
(105, NULL, NULL, 'patient', 30, 'ddd', 56, 33, 'bill-200617001', 'in', 'cash', '2020-06-17', 'n'),
(106, NULL, NULL, 'patient', 30, 'ddd', 57, 33, 'bill-200617002', 'in', 'cash', '2020-06-17', 'n'),
(107, NULL, NULL, 'patient', 24, 'SAMPLE PATIENT', 58, 33, 'bill-200617003', 'in', 'cash', '2020-06-17', 'n'),
(108, NULL, NULL, 'patient', 23, 'TECHSYS', 59, 33, 'bill-200617004', 'in', 'cash', '2020-06-17', 'n'),
(109, NULL, NULL, 'patient', 21, 'VARUN KUMAR SINGH', 60, 44, 'bill-200617005', 'in', 'cash', '2020-06-17', 'n'),
(110, NULL, NULL, 'patient', 20, 'BIPIN ADHIKARI', 61, 3, 'bill-200617006', 'in', 'cash', '2020-06-17', 'n'),
(111, NULL, NULL, 'patient', 23, 'TECHSYS', 62, 444, 'bill-200618001', 'in', 'cash', '2020-06-18', 'n'),
(112, NULL, NULL, 'patient', 18, 'SUNNY DAS', 63, 233, 'bill-200716001', 'in', 'cash', '2020-07-16', 'n'),
(113, NULL, NULL, 'patient', 1, 'Md Asif Iqbal', 64, 400, 'bill-200830001', 'in', 'cash', '2020-08-30', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `centre_admin`
--

CREATE TABLE `centre_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `centre_admin`
--

INSERT INTO `centre_admin` (`id`, `name`, `email`, `center_name`, `center_mobile`, `center_city`, `center_address`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Asif', 'test@test.com', 'SEBALAY DIAGNOSTIC CENTRE', '444', 'Kolkata', 'N.S Road, 1st floor, coal bhawan', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commission_group`
--

CREATE TABLE `commission_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commission_group`
--

INSERT INTO `commission_group` (`id`, `name`) VALUES
(2, 'Group 2'),
(5, 'Group 1'),
(6, 'Group 3');

-- --------------------------------------------------------

--
-- Table structure for table `commission_group_master`
--

CREATE TABLE `commission_group_master` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commission_group_master`
--

INSERT INTO `commission_group_master` (`id`, `name`) VALUES
(1, 'Gold'),
(2, 'Silver'),
(3, 'Bronze');

-- --------------------------------------------------------

--
-- Table structure for table `commission_group_master_relation`
--

CREATE TABLE `commission_group_master_relation` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_master_id` int(11) NOT NULL,
  `payment_style` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commission_group_master_relation`
--

INSERT INTO `commission_group_master_relation` (`id`, `group_id`, `group_master_id`, `payment_style`, `amount`) VALUES
(3, 5, 3, 'percent', 10),
(4, 2, 3, 'percent', 15),
(6, 6, 2, 'percent', 10),
(7, 6, 3, 'flat', 10),
(8, 5, 2, 'flat', 99);

-- --------------------------------------------------------

--
-- Table structure for table `discount_cause`
--

CREATE TABLE `discount_cause` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `payment_style` enum('flat','percent') NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount_cause`
--

INSERT INTO `discount_cause` (`id`, `name`, `payment_style`, `amount`) VALUES
(1, 'Sinior Citizen', 'percent', 10),
(2, 'Poor Family', 'percent', 15),
(3, 'Medical Staff', 'percent', 20),
(4, 'Doctor Ref', 'percent', 10),
(5, 'Known Person', 'flat', 20),
(7, 't4st', 'flat', 30),
(8, 'discount 3', 'percent', 3),
(9, 'relative', 'percent', 10);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `commission_group_id` int(5) DEFAULT NULL,
  `doc_name` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `degree` varchar(50) NOT NULL,
  `reg` varchar(50) NOT NULL,
  `working_area` varchar(30) DEFAULT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `commission_group_id`, `doc_name`, `age`, `gender`, `mobile`, `whatsapp`, `email`, `degree`, `reg`, `working_area`, `created_at`) VALUES
(1, 1, 'DR. Asish', 44, 'male', '987797987', '7797879789', 'test@test.com', 'MD', '123', 'kolkata', '2020-01-21'),
(2, 3, 'Dr. Suman Das', 87, 'male', '87987897', '78977978', 'sumandas@gmail.com', 'MD', '4323', 'howrah', '0000-00-00'),
(4, 2, 'asd', 0, 'male', 'k', 'kjh', 'jk', 'jkh', '654', 'jkh', '0000-00-00'),
(26, 3, 'rohit', 99, 'male', '98098908', '8900', 'asif@asif.com', 'md', '', 'adsf', '0000-00-00'),
(27, 3, 'jl', 23, 'male', '2343', '23', 'jkl@asf.co', 'jkl', '', 'jkj', '0000-00-00'),
(28, 3, 'aa', 88, 'male', '797', '798789', 'aa@aa.com', '80', '', '098', '0000-00-00'),
(29, 3, 'jalksdj', 8, 'male', '8080890', '89809', 'asdf@asf.com', '08', '34534', '080', '2020-06-05'),
(30, 3, 'xyz', 99, 'male', '7987897', '79878', 'xx@xx.com', 'jj', '97978', 'jj', '0000-00-00'),
(31, 3, 'Dr. Buman Das', 99, 'male', '87987897', '78977978', 'sumandas@gmail.com', 'MD', '420', 'howrah', '0000-00-00'),
(32, 3, 'Dr P. Dey', 33, 'male', '2423423432', '2342343', 'asd@test', 'md', '23432', 'asdf', '0000-00-00'),
(33, 3, 'date', 3, 'male', '23432423', '23423423', '23423', '234', '234', '234', '0000-00-00'),
(34, 3, 'dd', 34, 'female', '3534534543', '3534', '345', '345', '35', '345', '0000-00-00'),
(35, 3, 'asdf', 234, 'male', '2423432', '23432', '234', '234', '234', '234', '0000-00-00'),
(36, 3, 'jkk', 99, 'male', '2423432', '2432432', 'test@test.com', '234', '23432', '234', '2020-03-17'),
(37, 2, 'asdf', 234, 'male', '234', NULL, NULL, '234', '234', NULL, '2020-03-30'),
(38, 2, 'ggg', 23, 'male', '24234324', NULL, NULL, '234', '234', NULL, '2020-06-05'),
(39, 2, 'dr hello', 77, 'male', '9894494849', NULL, NULL, 'asdfas', '343432', NULL, '2020-06-05'),
(40, 3, 'dddd', 33, 'male', '2342342342', NULL, NULL, 'asdf', 'asdf', NULL, '2020-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_commission`
--

CREATE TABLE `doctor_commission` (
  `id` int(11) NOT NULL,
  `dr_id` int(11) NOT NULL,
  `dr_name` varchar(100) DEFAULT NULL,
  `patient_billing_id` int(11) DEFAULT NULL,
  `bill_total` int(11) DEFAULT NULL,
  `total_commission_amount` int(11) DEFAULT NULL,
  `actual_paid_commission` int(11) DEFAULT NULL,
  `comment` text,
  `payment_mode` varchar(30) DEFAULT NULL,
  `payment_status` enum('paid','due') DEFAULT 'due',
  `bill_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_commission`
--

INSERT INTO `doctor_commission` (`id`, `dr_id`, `dr_name`, `patient_billing_id`, `bill_total`, `total_commission_amount`, `actual_paid_commission`, `comment`, `payment_mode`, `payment_status`, `bill_date`, `payment_date`) VALUES
(17, 32, 'Dr P. Dey', 1, 0, 50, 0, '', '', 'paid', '2020-03-03', '2020-03-04'),
(18, 2, 'Dr. Suman Das', 24, 0, 40, 0, '', '', 'paid', '2020-03-07', '2020-03-12'),
(19, 32, 'Dr P. Dey', 29, 66, 8, 0, '', '', 'paid', '2020-03-12', '2020-03-14'),
(20, 32, 'Dr P. Dey', 55, 500, 0, NULL, NULL, NULL, 'due', '2020-04-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name_prefix` varchar(10) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `age` int(4) NOT NULL,
  `age_period` varchar(10) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `pin` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `local_area` varchar(20) NOT NULL,
  `city` varchar(30) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name_prefix`, `p_name`, `mobile`, `dob`, `age`, `age_period`, `gender`, `pin`, `email`, `local_area`, `city`, `address`, `created_at`) VALUES
(1, 'mr', 'Md Asif Iqbal', '9831109099', '0000-00-00', 33, 'year', 'male', '', '', '', '', '', '2020-01-26'),
(2, 'mr', 'Suman roy', '9062400555', '0000-00-00', 44, 'year', 'male', '8989889', '', 'shyambazar', 'kolkata', '', '2020-01-27'),
(3, 'mr', 'SUMAN ROY', '9831343208', '0000-00-00', 40, 'year', 'male', '700004', 'ABCD@123.COM', 'HATIBAGAN', 'KOLKATA', 'HATIBAGAN', '2020-02-28'),
(4, 'mrs', 'ABCD', '1234567890', '0000-00-00', 55, 'year', 'female', '', '', '', '', '', '2020-03-06'),
(5, 'mrs', 'RABINA KHATUN', '9875678765', '0000-00-00', 56, 'year', 'female', '756122', 'RABINA123@GMAIL.COM', 'HOOGHLY', 'CHANDANNAGAR', 'CHANDANNAGAR', '2020-03-06'),
(6, 'miss', 'PAYEL DAS', '1234567812', '0000-00-00', 34, 'year', 'female', '765345', 'PAYEL123@GMAIL.COM', 'CHINSURAH', 'CHINSURAH', 'WEST BENGAL', '2020-03-06'),
(7, 'mr', 'SUNNY MONDAL', '7865674567', '0000-00-00', 29, 'year', 'male', '712123', 'SUNNY MONDAL@GMAIL.COM', 'MUTHABERIA', 'SURI', 'JAMBUNI', '2020-03-06'),
(8, 'mr', 'SUNNY MONDAL', '7865674567', '0000-00-00', 29, 'year', 'male', '712123', 'SUNNY MONDAL@GMAIL.COM', 'MUTHABERIA', 'SURI', 'JAMBUNI', '2020-03-06'),
(9, 'mr', 'SEKH SANIUL HAUQE', '9876789876', '0000-00-00', 45, 'year', 'male', '765456', 'SANI1234@GMAIL.COM', 'SARNAPALLI', 'BANDEL', 'DEBANANDAPUR', '2020-03-06'),
(10, 'mr', 'SAMPLE DATA', '9999899998', '0000-00-00', 30, 'year', 'male', '', '', '', '', '', '2020-03-06'),
(11, 'mr', 'RAHUL PAL', '9434567896', '0000-00-00', 45, 'year', 'male', '', '', '', '', '', '2020-03-06'),
(12, 'mr', 'SAMIR DAS', '9781234561', '0000-00-00', 34, 'year', 'male', '', '', '', '', '', '2020-03-06'),
(13, 'mr', 'RANA PAL', '9567653456', '0000-00-00', 45, 'year', 'male', '', '', '', '', '', '2020-03-06'),
(14, 'mrs', 'MOUMITA DAS', '3246543457', '0000-00-00', 42, 'year', 'female', '', 'MOUMITA123@GMAIL.COM', '', '', '', '2020-03-06'),
(15, 'mrs', 'SIMA DAS', '9082345678', '0000-00-00', 56, 'year', 'female', '', 'SIMA123@GMAIL.COM', '', '', '', '2020-03-06'),
(16, 'mr', 'SUNIL DAS', '1234567897', '0000-00-00', 56, 'year', 'male', '', 'SUNIL123@GMAIL.COM', '', '', '', '2020-03-06'),
(17, 'mr', 'SHIBA PAL', '1287456523', '0000-00-00', 65, 'year', 'male', '', 'SHIBA123@GMAIL.COM', 'SAHAGANGE', '', '', '2020-03-06'),
(18, 'mr', 'SUNNY DAS', '9078456789', '0000-00-00', 56, 'year', 'male', '234432', 'SUNNY123@GMAIL.COM', 'SURI', 'BIRBUM', 'BIRBHUM', '2020-03-06'),
(19, 'mr', 'SOPON BERA', '098654321', '0000-00-00', 56, 'year', 'male', '', '', '', '', '', '2020-03-06'),
(20, 'mr', 'BIPIN ADHIKARI', '9876785678', '0000-00-00', 34, 'year', 'male', '543567', 'BIPIN123@GMAIL.COM', 'DUBRAJPUR', 'BIRBHUM', 'BIRBUM', '2020-03-06'),
(21, 'mr', 'VARUN KUMAR SINGH', '9834567892', '0000-00-00', 54, 'year', 'male', '765678', 'VARUN321@GMAIL.COM', 'BOLPUR', 'BIRBUM', 'SURI', '2020-03-06'),
(22, 'mr', 'PARTHA DAS', '9456787654', '0000-00-00', 40, 'year', 'male', '', 'PARTHA987@GMAIL.COM', '', '', '', '2020-03-06'),
(23, 'mr', 'TECHSYS', '9831343208', '0000-00-00', 0, 'year', 'male', '700136', '', '', 'KOLKATA', 'Debangan, Kalipark, P.O. R-GOPALPUR', '2020-03-07'),
(24, 'mrs', 'SAMPLE PATIENT', '9876543210', '0000-00-00', 33, 'year', 'female', '700135', 'ABCD@AB.COM', 'RANAGHAT', 'KOLKATA', 'B.C.CHATTERJEE STREET', '2020-03-11'),
(29, 'mr', 'ddd', '23423432423', '0000-00-00', 23232, 'year', 'male', '08080', 'test@test.com', 'j', 'kjad', 'asdf', '2020-03-17'),
(30, 'mr', 'ddd', '9898989898', '0000-00-00', 33, 'year', 'male', '', '', '', '', '', '2020-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `patient_billing`
--

CREATE TABLE `patient_billing` (
  `id` int(11) NOT NULL,
  `reg_id` varchar(50) NOT NULL,
  `bill_id` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `name_prefix` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `repeat_patient` enum('y','n') NOT NULL DEFAULT 'n',
  `ref_dr_id` int(5) NOT NULL,
  `ref_dr_name` varchar(50) NOT NULL,
  `commission_to` varchar(50) NOT NULL,
  `service_charge_total` int(11) NOT NULL,
  `discount_cause_total` int(11) NOT NULL,
  `flat_discount` int(11) NOT NULL,
  `test_total` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `advance_payment` int(11) NOT NULL DEFAULT '0',
  `total_paid` int(11) NOT NULL,
  `payment_mode` varchar(20) NOT NULL DEFAULT 'Cash',
  `dues` int(11) NOT NULL,
  `payment_status` enum('paid','due','refunded') NOT NULL DEFAULT 'due',
  `bill_date` date NOT NULL,
  `bill_due_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `report_status` enum('pending','completed','cancelled') NOT NULL DEFAULT 'pending',
  `comment` text NOT NULL,
  `bill_month_year` varchar(10) NOT NULL,
  `bill_monthly_serial` int(11) NOT NULL,
  `bill_daily_serial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_billing`
--

INSERT INTO `patient_billing` (`id`, `reg_id`, `bill_id`, `patient_id`, `mobile`, `name_prefix`, `name`, `repeat_patient`, `ref_dr_id`, `ref_dr_name`, `commission_to`, `service_charge_total`, `discount_cause_total`, `flat_discount`, `test_total`, `grand_total`, `advance_payment`, `total_paid`, `payment_mode`, `dues`, `payment_status`, `bill_date`, `bill_due_date`, `delivery_date`, `report_status`, `comment`, `bill_month_year`, `bill_monthly_serial`, `bill_daily_serial`) VALUES
(1, 'Mar20-001', '200303-001', 3, '9831343208', 'mr', 'SUMAN ROY', 'y', 32, 'Dr P. Dey', 'Dr P. Dey', 24, 0, 0, 476, 500, 200, 500, 'cash', 0, 'paid', '2020-03-03', '2020-03-05', '0000-00-00', 'completed', '', 'Mar20', 1, 1),
(2, 'Mar20-002', '200305-001', 3, '9831343208', 'mr', 'SUMAN ROY', 'y', 0, 'self', 'self', 0, 0, 100, 1600, 1500, 1000, 1000, 'cash', 500, 'due', '2020-03-05', '2020-03-06', '0000-00-00', 'pending', '', 'Mar20', 2, 1),
(3, 'Mar20-003', '200306-001', 4, '1234567890', 'mrs', 'ABCD', 'n', 31, 'Dr. Buman Das', 'Dr. Buman Das', 0, 0, 0, 300, 300, 100, 100, 'cash', 200, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 3, 1),
(4, 'Mar20-004', '200306-002', 5, '9875678765', 'mrs', 'RABINA KHATUN', 'n', 31, 'Dr. Buman Das', 'Dr. Buman Das', 15, 0, 0, 300, 315, 100, 100, 'cash', 215, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 4, 2),
(5, 'Mar20-005', '200306-003', 6, '1234567812', 'miss', 'PAYEL DAS', 'n', 2, 'Dr. Suman Das', 'Dr. Suman Das', 147, 20, 100, 2933, 2960, 100, 100, 'Debit Card', 2860, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', 'NO COMMENT', 'Mar20', 5, 3),
(6, 'Mar20-006', '200306-004', 7, '7865674567', 'mr', 'SUNNY MONDAL', 'n', 1, 'DR. Asish', 'DR. Asish', 30, 0, 0, 600, 630, 0, 0, 'cash', 630, 'due', '2020-03-06', '0000-00-00', '0000-00-00', 'pending', '', 'Mar20', 6, 4),
(7, 'Mar20-007', '200306-005', 8, '7865674567', 'mr', 'SUNNY MONDAL', 'n', 1, 'DR. Asish', 'DR. Asish', 30, 0, 0, 600, 630, 100, 100, 'cash', 530, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 7, 5),
(8, 'Mar20-008', '200306-006', 9, '9876789876', 'mr', 'SEKH SANIUL HAUQE', 'n', 32, 'Dr P. Dey', 'Dr P. Dey', 0, 72, 0, 720, 648, 100, 100, 'cash', 548, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 8, 6),
(9, 'Mar20-009', '200306-007', 10, '9999899998', 'mr', 'SAMPLE DATA', 'n', 0, 'SELF', 'SELF', 0, 0, 0, 900, 900, 500, 500, 'cash', 400, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 9, 7),
(10, 'Mar20-010', '200306-008', 11, '9434567896', 'mr', 'RAHUL PAL', 'n', 2, 'Dr. Suman Das', 'Dr. Suman Das', 0, 0, 0, 3300, 3300, 100, 100, 'cash', 3200, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 10, 8),
(11, 'Mar20-011', '200306-009', 12, '9781234561', 'mr', 'SAMIR DAS', 'n', 32, 'Dr P. Dey', 'Dr P. Dey', 32, 0, 0, 633, 665, 100, 100, 'cash', 565, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 11, 9),
(12, 'Mar20-012', '200306-010', 13, '9567653456', 'mr', 'RANA PAL', 'n', 31, 'Dr. Buman Das', 'Dr. Buman Das', 225, 135, 100, 4500, 4490, 100, 100, 'cash', 4390, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', 'NO COMMENT', 'Mar20', 12, 10),
(13, 'Mar20-013', '200306-011', 14, '3246543457', 'mrs', 'MOUMITA DAS', 'n', 1, 'DR. Asish', 'DR. Asish', 0, 0, 0, 1000, 1000, 100, 100, 'cash', 900, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 13, 11),
(14, 'Mar20-014', '200306-012', 15, '9082345678', 'mrs', 'SIMA DAS', 'n', 32, 'Dr P. Dey', 'Dr P. Dey', 34, 0, 0, 676, 710, 100, 100, 'cash', 610, 'due', '2020-03-06', '2020-03-08', '0000-00-00', 'pending', '', 'Mar20', 14, 12),
(15, 'Mar20-015', '200306-013', 16, '1234567897', 'mr', 'SUNIL DAS', 'n', 32, 'Dr P. Dey', 'Dr P. Dey', 0, 20, 100, 643, 523, 100, 100, 'cash', 423, 'due', '2020-03-06', '2020-03-08', '0000-00-00', 'pending', '', 'Mar20', 15, 13),
(16, 'Mar20-016', '200306-014', 17, '1287456523', 'mr', 'SHIBA PAL', 'n', 31, 'Dr. Buman Das', 'Dr. Buman Das', 20, 334, 100, 3333, 2919, 100, 100, 'cash', 2819, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 16, 14),
(17, 'Mar20-017', '200306-015', 18, '9078456789', 'mr', 'SUNNY DAS', 'n', 2, 'Dr. Suman Das', 'Dr. Suman Das', 168, 0, 0, 3343, 3511, 100, 100, 'cash', 3411, 'due', '2020-03-06', '2020-03-08', '0000-00-00', 'pending', '', 'Mar20', 17, 15),
(18, 'Mar20-018', '200306-016', 19, '098654321', 'mr', 'SOPON BERA', 'n', 31, 'Dr. Buman Das', 'Dr. Buman Das', 10, 33, 100, 3143, 3020, 100, 100, 'cash', 2920, 'due', '2020-03-06', '2020-03-08', '0000-00-00', 'pending', '', 'Mar20', 18, 16),
(19, 'Mar20-019', '200306-017', 20, '9876785678', 'mr', 'BIPIN ADHIKARI', 'n', 1, 'DR. Asish', 'DR. Asish', 42, 33, 0, 833, 842, 100, 100, 'cash', 742, 'due', '2020-03-06', '2020-03-08', '0000-00-00', 'pending', '', 'Mar20', 19, 17),
(20, 'Mar20-020', '200306-018', 21, '9834567892', 'mr', 'VARUN KUMAR SINGH', 'n', 1, 'DR. Asish', 'DR. Asish', 42, 0, 0, 833, 875, 100, 100, 'cash', 775, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 20, 18),
(21, 'Mar20-021', '200306-019', 22, '9456787654', 'mr', 'PARTHA DAS', 'n', 2, 'Dr. Suman Das', 'Dr. Suman Das', 50, 30, 100, 1000, 920, 100, 100, 'cash', 820, 'due', '2020-03-06', '2020-03-07', '0000-00-00', 'pending', '', 'Mar20', 21, 19),
(22, 'Mar20-022', '200306-020', 6, '1234567812', 'miss', 'PAYEL DAS', 'y', 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'cash', 0, 'paid', '2020-03-06', '0000-00-00', '0000-00-00', 'pending', '', 'Mar20', 22, 20),
(23, 'Mar20-023', '200306-021', 6, '1234567812', 'miss', 'PAYEL DAS', 'y', 0, '', '', 138, 0, 0, 2743, 2881, 100, 100, 'cash', 2781, 'due', '2020-03-06', '2020-03-08', '0000-00-00', 'pending', '', 'Mar20', 23, 21),
(24, 'Mar20-024', '200307-001', 23, '9831343208', 'mr', 'TECHSYS', 'n', 2, 'Dr. Suman Das', 'Dr. Suman Das', 10, 0, 0, 400, 410, 410, 410, 'cash', 0, 'paid', '2020-03-07', '2020-03-08', '0000-00-00', 'completed', 'by courrier', 'Mar20', 24, 1),
(25, 'Mar20-025', '200311-001', 24, '9876543210', 'mrs', 'SAMPLE PATIENT', 'n', 31, 'Dr. Buman Das', 'Dr. Buman Das', 0, 0, 0, 820, 820, 500, 820, 'cash', 0, 'refunded', '2020-03-11', '2020-03-12', '0000-00-00', 'cancelled', '', 'Mar20', 25, 1),
(26, 'Mar20-026', '200312-001', 25, '09831343208', 'mr', 'SUMAN ROY', 'n', 31, 'Dr. Buman Das', 'Dr. Buman Das', 0, 0, 0, 66, 66, 50, 50, 'cash', 16, 'due', '2020-03-12', '2020-03-14', '0000-00-00', 'pending', '', 'Mar20', 26, 1),
(27, 'Mar20-027', '200312-002', 26, '09831343208', 'mr', 'SUMAN ROY', 'n', 32, 'Dr P. Dey', 'Dr P. Dey', 0, 0, 0, 66, 66, 0, 0, 'cash', 66, 'due', '2020-03-12', '0000-00-00', '0000-00-00', 'pending', '', 'Mar20', 27, 2),
(28, 'Mar20-028', '200312-003', 27, '09831343208', 'mr', 'SUMAN ROY', 'n', 32, 'Dr P. Dey', 'Dr P. Dey', 0, 0, 0, 66, 66, 0, 0, 'cash', 66, 'due', '2020-03-12', '0000-00-00', '0000-00-00', 'pending', '', 'Mar20', 28, 3),
(29, 'Mar20-029', '200312-004', 28, '09831343208', 'mr', 'SUMAN ROY', 'n', 32, 'Dr P. Dey', 'Dr P. Dey', 0, 0, 0, 66, 66, 66, 66, 'cash', 0, 'paid', '2020-03-12', '2020-03-14', '0000-00-00', 'completed', '', 'Mar20', 29, 4),
(30, 'Mar20-030', '200314-001', 3, '9831343208', 'mr', 'SUMAN ROY', 'y', 0, '', '', 10, 0, 10, 200, 200, 100, 100, 'cash', 100, 'due', '2020-03-14', '2020-03-15', '0000-00-00', 'pending', '', 'Mar20', 30, 1),
(31, 'Mar20-031', '200314002', 24, '9876543210', 'mrs', 'SAMPLE PATIENT', 'y', 0, '', '', 10, 0, 11, 200, 199, 100, 100, 'cash', 99, 'due', '2020-03-14', '2020-03-15', '0000-00-00', 'pending', '', 'Mar20', 31, 2),
(32, 'Mar20-032', '200314001', 23, '9831343208', 'mr', 'TECHSYS', 'y', 0, '', '', 10, 0, 22, 200, 188, 44, 44, 'cash', 144, 'due', '2020-03-14', '2020-03-15', '0000-00-00', 'pending', '', 'Mar20', 32, 1),
(33, 'Mar20-033', '200318001', 30, '9898989898', 'mr', 'ddd', 'n', 0, 'dfd', 'dfd', 125, 0, 0, 2500, 2625, 33, 33, 'cash', 2592, 'due', '2020-03-18', '2020-03-19', '0000-00-00', 'pending', '', 'Mar20', 33, 1),
(34, 'Mar20-034', '200318001', 31, '999999999', 'mr', 'asdf', 'n', 0, 'asdf', 'asdf', 0, 0, 0, 2500, 2500, 3, 3, 'cash', 2497, 'due', '2020-03-18', '2020-03-19', '0000-00-00', 'pending', '', 'Mar20', 34, 1),
(35, 'Mar20-035', '200324001', 30, '9898989898', 'mr', 'ddd', 'y', 0, '', '', 0, 0, 0, 200, 200, 22, 200, 'cash', 0, 'paid', '2020-03-24', '2020-03-25', '0000-00-00', 'pending', '', 'Mar20', 35, 1),
(36, 'Apr20-001', '200401001', 31, '999999999', 'mr', 'asdf', 'y', 0, 'ggg', 'ggg', 20, 0, 0, 400, 420, 420, 420, 'cash', 0, 'paid', '2020-04-01', '2020-04-02', '0000-00-00', 'pending', '', 'Apr20', 1, 1),
(37, 'Apr20-002', '200403001', 31, '999999999', 'mr', 'asdf', 'y', 0, '', '', 0, 0, 0, 200, 200, 33, 33, 'cash', 167, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 2, 1),
(38, 'Apr20-003', '200403001', 30, '9898989898', 'mr', 'ddd', 'y', 0, '', '', 0, 0, 0, 2500, 2500, 333, 333, 'cash', 2167, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 3, 1),
(39, 'Apr20-004', '200403001', 23, '9831343208', 'mr', 'TECHSYS', 'y', 0, '', '', 0, 0, 0, 200, 200, 33, 33, 'cash', 167, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 4, 1),
(40, 'Apr20-005', '200403001', 31, '999999999', 'mr', 'asdf', 'y', 0, '', '', 0, 0, 0, 2500, 2500, 33, 33, 'cash', 2467, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 5, 1),
(41, 'Apr20-006', '200403001', 24, '9876543210', 'mrs', 'SAMPLE PATIENT', 'y', 0, '', '', 0, 0, 0, 200, 200, 33, 33, 'cash', 167, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 6, 1),
(42, 'Apr20-007', '200403002', 31, '999999999', 'mr', 'asdf', 'y', 0, '', '', 0, 0, 0, 200, 200, 33, 33, 'cash', 167, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 7, 2),
(43, 'Apr20-008', '200403003', 29, '23423432423', 'mr', 'ddd', 'y', 0, '', '', 0, 0, 0, 200, 200, 24, 24, 'cash', 176, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 8, 3),
(44, 'Apr20-009', '200403004', 24, '9876543210', 'mrs', 'SAMPLE PATIENT', 'y', 0, '', '', 0, 0, 0, 200, 200, 111, 111, 'cash', 89, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 9, 4),
(45, 'Apr20-010', '200403005', 29, '23423432423', 'mr', 'ddd', 'y', 0, '', '', 0, 0, 0, 200, 200, 32, 32, 'cash', 168, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 10, 5),
(46, 'Apr20-011', '200403006', 23, '9831343208', 'mr', 'TECHSYS', 'y', 0, '', '', 0, 0, 0, 200, 200, 33, 33, 'cash', 167, 'due', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 11, 6),
(47, 'Apr20-012', '200403007', 16, '1234567897', 'mr', 'SUNIL DAS', 'y', 0, '', '', 244, 0, 0, 4876, 5120, 435, 435, 'cash', 4685, 'due', '2020-04-03', '0000-00-00', '0000-00-00', 'pending', '', 'Apr20', 12, 7),
(48, 'Apr20-013', '200403008', 16, '1234567897', 'mr', 'SUNIL DAS', 'y', 0, '', '', 244, 0, 0, 4876, 5120, 435, 435, 'cash', 4685, 'due', '2020-04-03', '0000-00-00', '0000-00-00', 'pending', '', 'Apr20', 13, 8),
(49, 'Apr20-014', '200403009', 16, '1234567897', 'mr', 'SUNIL DAS', 'y', 0, '', '', 244, 0, 0, 4876, 5120, 435, 435, 'cash', 4685, 'due', '2020-04-03', '0000-00-00', '0000-00-00', 'pending', '', 'Apr20', 14, 9),
(50, 'Apr20-015', '200403010', 16, '1234567897', 'mr', 'SUNIL DAS', 'y', 0, '', '', 244, 0, 0, 4876, 5120, 435, 435, 'cash', 4685, 'due', '2020-04-03', '0000-00-00', '0000-00-00', 'pending', '', 'Apr20', 15, 10),
(51, 'Apr20-016', '200403011', 16, '1234567897', 'mr', 'SUNIL DAS', 'y', 0, '', '', 244, 0, 0, 4876, 5120, 435, 435, 'cash', 4685, 'due', '2020-04-03', '2020-04-05', '0000-00-00', 'pending', '', 'Apr20', 16, 11),
(52, 'Apr20-017', '200403012', 31, '999999999', 'mr', '', 'y', 0, '', '', 0, 0, 0, 200, 200, 44, 44, 'cash', 156, 'due', '2020-04-03', '0000-00-00', '0000-00-00', 'pending', '', 'Apr20', 17, 12),
(53, 'Apr20-018', '200403013', 29, '23423432423', 'mr', 'ddd', 'y', 0, '', '', 0, 0, 0, 200, 200, 44, 200, 'cash', 0, 'paid', '2020-04-03', '2020-04-04', '0000-00-00', 'pending', '', 'Apr20', 18, 13),
(54, 'Apr20-019', '200410001', 24, '9876543210', 'mrs', 'SAMPLE PATIENT', 'y', 0, 'SELF', 'SELF', 23, 0, 0, 450, 473, 33, 473, 'cash', 0, 'paid', '2020-04-10', '2020-04-11', '0000-00-00', 'completed', '', 'Apr20', 19, 1),
(55, 'Apr20-020', '200422001', 23, '9831343208', 'mr', 'TECHSYS', 'y', 32, 'Dr P. Dey', 'Dr P. Dey', 30, 20, 30, 520, 500, 200, 500, 'cash', 0, 'paid', '2020-04-22', '2020-04-23', '0000-00-00', 'completed', '', 'Apr20', 20, 1),
(56, 'Jun20-001', '200617001', 30, '9898989898', 'mr', 'ddd', 'y', 0, 'SELF', 'SELF', 23, 0, 0, 443, 466, 33, 33, 'cash', 433, 'due', '2020-06-17', '2020-06-19', '0000-00-00', 'pending', '', 'Jun20', 1, 1),
(57, 'Jun20-002', '200617002', 30, '9898989898', 'mr', 'ddd', 'y', 0, 'SELF', 'SELF', 23, 0, 0, 443, 466, 33, 33, 'cash', 433, 'due', '2020-06-17', '2020-06-19', '0000-00-00', 'pending', '', 'Jun20', 2, 2),
(58, 'Jun20-003', '200617003', 24, '9876543210', 'mrs', 'SAMPLE PATIENT', 'y', 0, 'SELF', 'SELF', 0, 0, 0, 200, 200, 33, 33, 'cash', 167, 'due', '2020-06-17', '2020-06-18', '0000-00-00', 'pending', '', 'Jun20', 3, 3),
(59, 'Jun20-004', '200617004', 23, '9831343208', 'mr', 'TECHSYS', 'y', 0, 'SELF', 'SELF', 0, 0, 0, 33, 33, 33, 33, 'cash', 0, 'paid', '2020-06-17', '2020-06-19', '0000-00-00', 'pending', '', 'Jun20', 4, 4),
(60, 'Jun20-005', '200617005', 21, '9834567892', 'mr', 'VARUN KUMAR SINGH', 'y', 0, 'SELF', 'SELF', 0, 0, 0, 200, 200, 44, 44, 'cash', 156, 'due', '2020-06-17', '2020-06-18', '0000-00-00', 'pending', '', 'Jun20', 5, 5),
(61, 'Jun20-006', '200617006', 20, '9876785678', 'mr', 'BIPIN ADHIKARI', 'y', 0, 'SELF', 'SELF', 0, 0, 0, 33, 33, 3, 3, 'cash', 30, 'due', '2020-06-17', '2020-06-18', '0000-00-00', 'pending', '', 'Jun20', 6, 6),
(62, 'Jun20-007', '200618001', 23, '9831343208', 'mr', 'TECHSYS', 'y', 0, 'SELF', 'SELF', 0, 0, 0, 800, 800, 444, 444, 'cash', 356, 'due', '2020-06-18', '2020-06-19', '0000-00-00', 'pending', '', 'Jun20', 7, 1),
(63, 'Jul20-001', '200716001', 18, '9078456789', 'mr', 'SUNNY DAS', 'y', 0, 'SELF', 'SELF', 351, 38, 0, 1250, 1563, 233, 233, 'cash', 1330, 'due', '2020-07-16', '2020-07-17', '0000-00-00', 'pending', '', 'Jul20', 1, 1),
(64, 'Aug20-001', '200830001', 1, '9831109099', 'mr', 'Md Asif Iqbal', 'y', 0, 'SELF', 'SELF', 0, 0, 0, 4340, 4340, 400, 400, 'cash', 3940, 'due', '2020-08-30', '2020-08-31', '0000-00-00', 'pending', '', 'Aug20', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_billing_discount_cause`
--

CREATE TABLE `patient_billing_discount_cause` (
  `id` int(11) NOT NULL,
  `patient_bill_id` int(11) NOT NULL,
  `discount_cause_id` int(5) NOT NULL,
  `discount_name` varchar(200) NOT NULL,
  `payment_style` enum('percent','flat') NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_billing_discount_cause`
--

INSERT INTO `patient_billing_discount_cause` (`id`, `patient_bill_id`, `discount_cause_id`, `discount_name`, `payment_style`, `amount`, `created_at`) VALUES
(1, 5, 5, 'Known Person', 'flat', 20, '2020-03-06'),
(2, 8, 4, 'Doctor Ref', 'percent', 10, '2020-03-06'),
(3, 12, 8, 'discount 3', 'percent', 3, '2020-03-06'),
(4, 15, 8, 'discount 3', 'percent', 3, '2020-03-06'),
(5, 16, 9, 'relative', 'percent', 10, '2020-03-06'),
(6, 18, 7, 't4st', 'flat', 33, '2020-03-06'),
(7, 19, 7, 't4st', 'flat', 33, '2020-03-06'),
(8, 21, 8, 'discount 3', 'percent', 3, '2020-03-06'),
(9, 55, 5, 'Known Person', 'flat', 20, '2020-04-22'),
(10, 63, 8, 'discount 3', 'percent', 3, '2020-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `patient_billing_service_charge`
--

CREATE TABLE `patient_billing_service_charge` (
  `id` int(11) NOT NULL,
  `patient_bill_id` int(11) NOT NULL,
  `service_charge_id` int(5) NOT NULL,
  `service_charge_name` varchar(200) NOT NULL,
  `payment_style` enum('percent','flat') NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_billing_service_charge`
--

INSERT INTO `patient_billing_service_charge` (`id`, `patient_bill_id`, `service_charge_id`, `service_charge_name`, `payment_style`, `amount`, `created_at`) VALUES
(1, 1, 4, 'GST', 'percent', 5, '2020-03-03'),
(2, 4, 4, 'GST', 'percent', 5, '2020-03-06'),
(3, 5, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(4, 7, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(5, 11, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(6, 12, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(7, 14, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(8, 16, 6, 'GST3', 'flat', 20, '2020-03-06'),
(9, 17, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(10, 18, 3, 'Fast Delivery', 'flat', 10, '2020-03-06'),
(11, 19, 4, 'GST', 'percent', 5, '2020-03-06'),
(12, 20, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(13, 21, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(14, 23, 39, 'Service Tax', 'percent', 5, '2020-03-06'),
(15, 24, 3, 'Fast Delivery', 'flat', 10, '2020-03-07'),
(16, 30, 39, 'Service Tax', 'percent', 5, '2020-03-14'),
(17, 31, 39, 'Service Tax', 'percent', 5, '2020-03-14'),
(18, 32, 4, 'GST', 'percent', 5, '2020-03-14'),
(19, 33, 39, 'Service Tax', 'percent', 5, '2020-03-18'),
(20, 36, 4, 'GST', 'percent', 5, '2020-04-01'),
(21, 51, 39, 'Service Tax', 'percent', 5, '2020-04-03'),
(22, 54, 39, 'Service Tax', 'percent', 5, '2020-04-10'),
(23, 55, 6, 'GST3', 'flat', 20, '2020-04-22'),
(24, 55, 3, 'Fast Delivery', 'flat', 10, '2020-04-22'),
(25, 56, 39, 'Service Tax', 'percent', 5, '2020-06-17'),
(26, 57, 39, 'Service Tax', 'percent', 5, '2020-06-17'),
(27, 63, 39, 'Service Tax', 'percent', 5, '2020-07-16'),
(28, 63, 38, 'Others', 'percent', 23, '2020-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `patient_test_collection`
--

CREATE TABLE `patient_test_collection` (
  `id` int(11) NOT NULL,
  `patient_bill_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `test_profile` enum('y','n') NOT NULL DEFAULT 'n',
  `sample_type` varchar(50) NOT NULL,
  `timeframe` varchar(30) NOT NULL,
  `price` int(20) NOT NULL,
  `sample_code` varchar(50) NOT NULL,
  `is_collected` enum('y','n') NOT NULL DEFAULT 'n',
  `group_id` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_test_collection`
--

INSERT INTO `patient_test_collection` (`id`, `patient_bill_id`, `patient_id`, `test_id`, `name`, `test_profile`, `sample_type`, `timeframe`, `price`, `sample_code`, `is_collected`, `group_id`, `created_at`) VALUES
(1, 1, 3, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-1', 'n', 0, '2020-03-03'),
(2, 1, 3, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-1', 'n', 0, '2020-03-03'),
(3, 1, 3, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-1', 'n', 3, '2020-03-03'),
(4, 1, 3, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-1', 'n', 3, '2020-03-03'),
(5, 2, 3, 341, 'WHOLE ABDOMEN', 'n', 'n/a', '1', 900, '341-2', 'n', 9, '2020-03-05'),
(6, 2, 3, 352, 'WHOLE ABDOMEN SCREEING', 'n', 'n/a', '1', 700, '352-2', 'n', 9, '2020-03-05'),
(7, 3, 4, 110, 'COMPLETE BLOOD COUNT', 'n', 'n/a', '1', 200, '110-3', 'n', 4, '2020-03-06'),
(8, 3, 4, 21, 'BLOOD UREA', 'n', 'n/a', '1', 100, '21-3', 'n', 1, '2020-03-06'),
(9, 4, 5, 110, 'COMPLETE BLOOD COUNT', 'n', 'n/a', '1', 200, '110-4', 'n', 4, '2020-03-06'),
(10, 4, 5, 20, 'BLOOD UREA NITROGEN', 'n', 'n/a', '1', 100, '20-4', 'n', 1, '2020-03-06'),
(11, 5, 6, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-5', 'n', 0, '2020-03-06'),
(12, 5, 6, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-5', 'n', 3, '2020-03-06'),
(13, 5, 6, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-5', 'n', 3, '2020-03-06'),
(14, 5, 6, 499, 'DIGITAL XRAY OF LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '499-5', 'n', 3, '2020-03-06'),
(15, 7, 8, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-7', 'n', 3, '2020-03-06'),
(16, 7, 8, 441, 'DIGITAL XRAY BOTH FOREARM WITH HAND AP/LAT', 'n', 'n/a', '1', 200, '441-7', 'n', 3, '2020-03-06'),
(17, 7, 8, 397, 'DIGITAL 3 LEFT HAND AP/LAT', 'n', 'n/a', '1', 200, '397-7', 'n', 3, '2020-03-06'),
(18, 8, 9, 293, 'BLOOD CULTURE', 'n', 'n/a', '1', 600, '293-8', 'n', 7, '2020-03-06'),
(19, 8, 9, 5, 'BLOOD SUGAR-FASTING & POSTPRANDIAL', 'n', 'n/a', '1', 80, '5-8', 'n', 1, '2020-03-06'),
(20, 8, 9, 2, 'BLOOD SUGAR- FASTING', 'n', 'n/a', '1', 40, '2-8', 'n', 1, '2020-03-06'),
(21, 9, 10, 504, 'DIGITAL XRAY LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '504-9', 'n', 3, '2020-03-06'),
(22, 9, 10, 352, 'WHOLE ABDOMEN SCREEING', 'n', 'n/a', '1', 700, '352-9', 'n', 9, '2020-03-06'),
(23, 10, 11, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-10', 'n', 3, '2020-03-06'),
(24, 10, 11, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-10', 'n', 3, '2020-03-06'),
(25, 10, 11, 293, 'BLOOD CULTURE', 'n', 'n/a', '1', 600, '293-10', 'n', 7, '2020-03-06'),
(26, 11, 12, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-11', 'n', 3, '2020-03-06'),
(27, 11, 12, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-11', 'n', 3, '2020-03-06'),
(28, 11, 12, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-11', 'n', 0, '2020-03-06'),
(29, 12, 13, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-12', 'n', 3, '2020-03-06'),
(30, 12, 13, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-12', 'n', 3, '2020-03-06'),
(31, 12, 13, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-12', 'n', 3, '2020-03-06'),
(32, 12, 13, 357, '9 RIGHT LEG', 'n', 'n/a', '1', 1200, '357-12', 'n', 9, '2020-03-06'),
(33, 12, 13, 410, 'DIGITAL 3 LEFT LEG AP/LAT', 'n', 'n/a', '1', 200, '410-12', 'n', 3, '2020-03-06'),
(34, 13, 14, 441, 'DIGITAL XRAY BOTH FOREARM WITH HAND AP/LAT', 'n', 'n/a', '1', 200, '441-13', 'n', 3, '2020-03-06'),
(35, 13, 14, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-13', 'n', 3, '2020-03-06'),
(36, 13, 14, 293, 'BLOOD CULTURE', 'n', 'n/a', '1', 600, '293-13', 'n', 7, '2020-03-06'),
(37, 14, 15, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-14', 'n', 3, '2020-03-06'),
(38, 14, 15, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-14', 'n', 0, '2020-03-06'),
(39, 14, 15, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-14', 'n', 0, '2020-03-06'),
(40, 14, 15, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-14', 'n', 3, '2020-03-06'),
(41, 15, 16, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-15', 'n', 3, '2020-03-06'),
(42, 15, 16, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-15', 'n', 3, '2020-03-06'),
(43, 15, 16, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-15', 'n', 0, '2020-03-06'),
(44, 15, 16, 499, 'DIGITAL XRAY OF LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '499-15', 'n', 3, '2020-03-06'),
(45, 16, 17, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-16', 'n', 0, '2020-03-06'),
(46, 16, 17, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-16', 'n', 3, '2020-03-06'),
(47, 16, 17, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-16', 'n', 3, '2020-03-06'),
(48, 16, 17, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-16', 'n', 3, '2020-03-06'),
(49, 16, 17, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-16', 'n', 3, '2020-03-06'),
(50, 17, 18, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-17', 'n', 0, '2020-03-06'),
(51, 17, 18, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-17', 'n', 3, '2020-03-06'),
(52, 17, 18, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-17', 'n', 3, '2020-03-06'),
(53, 17, 18, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-17', 'n', 3, '2020-03-06'),
(54, 17, 18, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-17', 'n', 3, '2020-03-06'),
(55, 18, 19, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-18', 'n', 0, '2020-03-06'),
(56, 18, 19, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-18', 'n', 3, '2020-03-06'),
(57, 18, 19, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-18', 'n', 3, '2020-03-06'),
(58, 18, 19, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-18', 'n', 3, '2020-03-06'),
(59, 18, 19, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-18', 'n', 3, '2020-03-06'),
(60, 19, 20, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-19', 'n', 0, '2020-03-06'),
(61, 19, 20, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-19', 'n', 3, '2020-03-06'),
(62, 19, 20, 499, 'DIGITAL XRAY OF LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '499-19', 'n', 3, '2020-03-06'),
(63, 19, 20, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-19', 'n', 3, '2020-03-06'),
(64, 19, 20, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-19', 'n', 3, '2020-03-06'),
(65, 20, 21, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-20', 'n', 0, '2020-03-06'),
(66, 20, 21, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-20', 'n', 3, '2020-03-06'),
(67, 20, 21, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-20', 'n', 3, '2020-03-06'),
(68, 20, 21, 499, 'DIGITAL XRAY OF LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '499-20', 'n', 3, '2020-03-06'),
(69, 20, 21, 496, 'DIGITAL XRAY L.S SPINE --AP', 'n', 'n/a', '1', 200, '496-20', 'n', 3, '2020-03-06'),
(70, 21, 22, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-21', 'n', 3, '2020-03-06'),
(71, 21, 22, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-21', 'n', 3, '2020-03-06'),
(72, 21, 22, 499, 'DIGITAL XRAY OF LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '499-21', 'n', 3, '2020-03-06'),
(73, 21, 22, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-21', 'n', 3, '2020-03-06'),
(74, 23, 6, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-23', 'n', 0, '2020-03-06'),
(75, 23, 6, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-23', 'n', 3, '2020-03-06'),
(76, 23, 6, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-23', 'n', 3, '2020-03-06'),
(77, 24, 23, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-24', 'n', 3, '2020-03-07'),
(78, 24, 23, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-24', 'n', 3, '2020-03-07'),
(79, 25, 24, 293, 'BLOOD CULTURE', 'n', 'n/a', '1', 600, '293-25', 'n', 7, '2020-03-11'),
(80, 25, 24, 21, 'BLOOD UREA', 'n', 'n/a', '1', 100, '21-25', 'n', 1, '2020-03-11'),
(81, 25, 24, 103, 'BLOOD GROUPING & Rh FACTOR', 'n', 'n/a', '1', 80, '103-25', 'n', 4, '2020-03-11'),
(82, 25, 24, 3, 'BLOOD SUGAR- POST PRANDIAL', 'n', 'n/a', '1', 40, '3-25', 'n', 1, '2020-03-11'),
(83, 26, 25, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-26', 'n', 0, '2020-03-12'),
(84, 26, 25, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-26', 'n', 0, '2020-03-12'),
(85, 29, 28, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-29', 'n', 0, '2020-03-12'),
(86, 29, 28, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-29', 'n', 0, '2020-03-12'),
(87, 30, 3, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-30', 'n', 3, '2020-03-14'),
(88, 31, 24, 490, 'DIGITAL X RAY RIGHT CLAVICLE  AP', 'n', 'n/a', '1', 200, '490-31', 'n', 3, '2020-03-14'),
(89, 32, 23, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-32', 'n', 3, '2020-03-14'),
(90, 33, 30, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-33', 'n', 3, '2020-03-18'),
(91, 34, 31, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-34', 'n', 3, '2020-03-18'),
(92, 35, 30, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-35', 'n', 3, '2020-03-24'),
(93, 36, 31, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-36', 'n', 3, '2020-04-01'),
(94, 36, 31, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-36', 'n', 3, '2020-04-01'),
(95, 37, 31, 504, 'DIGITAL XRAY LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '504-37', 'n', 3, '2020-04-03'),
(96, 38, 30, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-38', 'n', 3, '2020-04-03'),
(97, 39, 23, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-39', 'n', 3, '2020-04-03'),
(98, 40, 31, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-40', 'n', 3, '2020-04-03'),
(99, 41, 24, 504, 'DIGITAL XRAY LEFT HUMERUS AP/LAT', 'n', 'n/a', '1', 200, '504-41', 'n', 3, '2020-04-03'),
(100, 42, 31, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-42', 'n', 3, '2020-04-03'),
(101, 43, 29, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-43', 'n', 3, '2020-04-03'),
(102, 44, 24, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-44', 'n', 3, '2020-04-03'),
(103, 45, 29, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-45', 'n', 3, '2020-04-03'),
(104, 46, 23, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-46', 'n', 3, '2020-04-03'),
(105, 47, 16, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-47', 'n', 0, '2020-04-03'),
(106, 47, 16, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-47', 'n', 0, '2020-04-03'),
(107, 47, 16, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-47', 'n', 3, '2020-04-03'),
(108, 47, 16, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-47', 'n', 3, '2020-04-03'),
(109, 47, 16, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-47', 'n', 3, '2020-04-03'),
(110, 47, 16, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-47', 'n', 3, '2020-04-03'),
(111, 47, 16, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-47', 'n', 3, '2020-04-03'),
(112, 47, 16, 495, 'XRAY OF TM JOINT AP/LAT', 'n', 'n/a', '1', 250, '495-47', 'n', 3, '2020-04-03'),
(113, 47, 16, 498, 'DIGITA XRAY RIGHT SCAPHOID OBL', 'n', 'n/a', '1', 200, '498-47', 'n', 3, '2020-04-03'),
(114, 47, 16, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-47', 'n', 3, '2020-04-03'),
(115, 47, 16, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-47', 'n', 3, '2020-04-03'),
(116, 47, 16, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-47', 'n', 3, '2020-04-03'),
(117, 47, 16, 493, 'DIGITAL XRAY RIGHT SCAPULA AP/LAT', 'n', 'n/a', '1', 250, '493-47', 'n', 3, '2020-04-03'),
(118, 48, 16, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-48', 'n', 0, '2020-04-03'),
(119, 48, 16, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-48', 'n', 0, '2020-04-03'),
(120, 48, 16, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-48', 'n', 3, '2020-04-03'),
(121, 48, 16, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-48', 'n', 3, '2020-04-03'),
(122, 48, 16, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-48', 'n', 3, '2020-04-03'),
(123, 48, 16, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-48', 'n', 3, '2020-04-03'),
(124, 48, 16, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-48', 'n', 3, '2020-04-03'),
(125, 48, 16, 495, 'XRAY OF TM JOINT AP/LAT', 'n', 'n/a', '1', 250, '495-48', 'n', 3, '2020-04-03'),
(126, 48, 16, 498, 'DIGITA XRAY RIGHT SCAPHOID OBL', 'n', 'n/a', '1', 200, '498-48', 'n', 3, '2020-04-03'),
(127, 48, 16, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-48', 'n', 3, '2020-04-03'),
(128, 48, 16, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-48', 'n', 3, '2020-04-03'),
(129, 48, 16, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-48', 'n', 3, '2020-04-03'),
(130, 48, 16, 493, 'DIGITAL XRAY RIGHT SCAPULA AP/LAT', 'n', 'n/a', '1', 250, '493-48', 'n', 3, '2020-04-03'),
(131, 49, 16, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-49', 'n', 0, '2020-04-03'),
(132, 49, 16, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-49', 'n', 0, '2020-04-03'),
(133, 49, 16, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-49', 'n', 3, '2020-04-03'),
(134, 49, 16, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-49', 'n', 3, '2020-04-03'),
(135, 49, 16, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-49', 'n', 3, '2020-04-03'),
(136, 49, 16, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-49', 'n', 3, '2020-04-03'),
(137, 49, 16, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-49', 'n', 3, '2020-04-03'),
(138, 49, 16, 495, 'XRAY OF TM JOINT AP/LAT', 'n', 'n/a', '1', 250, '495-49', 'n', 3, '2020-04-03'),
(139, 49, 16, 498, 'DIGITA XRAY RIGHT SCAPHOID OBL', 'n', 'n/a', '1', 200, '498-49', 'n', 3, '2020-04-03'),
(140, 49, 16, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-49', 'n', 3, '2020-04-03'),
(141, 49, 16, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-49', 'n', 3, '2020-04-03'),
(142, 49, 16, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-49', 'n', 3, '2020-04-03'),
(143, 49, 16, 493, 'DIGITAL XRAY RIGHT SCAPULA AP/LAT', 'n', 'n/a', '1', 250, '493-49', 'n', 3, '2020-04-03'),
(144, 50, 16, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-50', 'n', 0, '2020-04-03'),
(145, 50, 16, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-50', 'n', 0, '2020-04-03'),
(146, 50, 16, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-50', 'n', 3, '2020-04-03'),
(147, 50, 16, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-50', 'n', 3, '2020-04-03'),
(148, 50, 16, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-50', 'n', 3, '2020-04-03'),
(149, 50, 16, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-50', 'n', 3, '2020-04-03'),
(150, 50, 16, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-50', 'n', 3, '2020-04-03'),
(151, 50, 16, 495, 'XRAY OF TM JOINT AP/LAT', 'n', 'n/a', '1', 250, '495-50', 'n', 3, '2020-04-03'),
(152, 50, 16, 498, 'DIGITA XRAY RIGHT SCAPHOID OBL', 'n', 'n/a', '1', 200, '498-50', 'n', 3, '2020-04-03'),
(153, 50, 16, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-50', 'n', 3, '2020-04-03'),
(154, 50, 16, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-50', 'n', 3, '2020-04-03'),
(155, 50, 16, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-50', 'n', 3, '2020-04-03'),
(156, 50, 16, 493, 'DIGITAL XRAY RIGHT SCAPULA AP/LAT', 'n', 'n/a', '1', 250, '493-50', 'n', 3, '2020-04-03'),
(157, 51, 16, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-51', 'n', 0, '2020-04-03'),
(158, 51, 16, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-51', 'n', 0, '2020-04-03'),
(159, 51, 16, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'n/a', '1', 200, '507-51', 'n', 3, '2020-04-03'),
(160, 51, 16, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-51', 'n', 3, '2020-04-03'),
(161, 51, 16, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-51', 'n', 3, '2020-04-03'),
(162, 51, 16, 500, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 'n', 'n/a', '1', 400, '500-51', 'n', 3, '2020-04-03'),
(163, 51, 16, 497, 'DIGITAL XRAY BOTH HAND AP', 'n', 'n/a', '1', 200, '497-51', 'n', 3, '2020-04-03'),
(164, 51, 16, 495, 'XRAY OF TM JOINT AP/LAT', 'n', 'n/a', '1', 250, '495-51', 'n', 3, '2020-04-03'),
(165, 51, 16, 498, 'DIGITA XRAY RIGHT SCAPHOID OBL', 'n', 'n/a', '1', 200, '498-51', 'n', 3, '2020-04-03'),
(166, 51, 16, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-51', 'n', 3, '2020-04-03'),
(167, 51, 16, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-51', 'n', 3, '2020-04-03'),
(168, 51, 16, 501, 'DIGITAL XRAY LEFT THIGH AP', 'n', 'n/a', '1', 200, '501-51', 'n', 3, '2020-04-03'),
(169, 51, 16, 493, 'DIGITAL XRAY RIGHT SCAPULA AP/LAT', 'n', 'n/a', '1', 250, '493-51', 'n', 3, '2020-04-03'),
(170, 53, 29, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-53', 'n', 3, '2020-04-03'),
(171, 54, 24, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-54', 'y', 3, '2020-04-10'),
(172, 54, 24, 493, 'DIGITAL XRAY RIGHT SCAPULA AP/LAT', 'n', 'n/a', '1', 250, '493-54', 'y', 3, '2020-04-10'),
(173, 55, 23, 85, 'LFT', 'y', 'n/a', '1', 400, '85-55', 'y', 1, '2020-04-22'),
(174, 55, 23, 2, 'BLOOD SUGAR- FASTING', 'n', 'n/a', '1', 40, '2-55', 'n', 1, '2020-04-22'),
(175, 55, 23, 4, 'BLOOD SUGAR -RANDOM', 'n', 'n/a', '1', 40, '4-55', 'n', 1, '2020-04-22'),
(176, 55, 23, 3, 'BLOOD SUGAR- POST PRANDIAL', 'n', 'n/a', '1', 40, '3-55', 'n', 1, '2020-04-22'),
(177, 56, 30, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-56', 'n', 0, '2020-06-17'),
(178, 56, 30, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-56', 'n', 3, '2020-06-17'),
(179, 56, 30, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-56', 'n', 3, '2020-06-17'),
(180, 57, 30, 509, 'profiletest2', 'y', 'n/a', '2 day', 43, '509-57', 'n', 0, '2020-06-17'),
(181, 57, 30, 506, 'DIGITAL XRAY LEFT MANDIBLE LAT', 'n', 'n/a', '1', 200, '506-57', 'n', 3, '2020-06-17'),
(182, 57, 30, 502, 'DIGITAL XRAY OF RIGHT MANDIBLE', 'n', 'n/a', '1', 200, '502-57', 'n', 3, '2020-06-17'),
(183, 58, 24, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-58', 'n', 3, '2020-06-17'),
(184, 59, 23, 508, 'testprofile 1', 'y', 'n/a', '2 day', 33, '508-59', 'n', 0, '2020-06-17'),
(185, 60, 21, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'Stool', '1 day', 200, '507-60', 'n', 3, '2020-06-17'),
(186, 61, 20, 510, 'testpr3', 'y', 'n/a', '1 day', 33, '510-61', 'n', 0, '2020-06-17'),
(187, 62, 23, 85, 'LFT', 'y', 'n/a', '1', 400, '85-62', 'y', 1, '2020-06-18'),
(188, 62, 23, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'Stool', '1 day', 200, '507-62', 'y', 3, '2020-06-18'),
(189, 62, 23, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-62', 'y', 3, '2020-06-18'),
(190, 63, 18, 303, 'CORTISOL', 'n', 'n/a', '1', 600, '303-63', 'n', 7, '2020-07-16'),
(191, 63, 18, 57, 'CORTISOL[4.00PM]-SERUM', 'n', 'n/a', '1', 325, '57-63', 'n', 1, '2020-07-16'),
(192, 63, 18, 56, 'CORTISOL[8.00AM]-SERUM', 'n', 'n/a', '1', 325, '56-63', 'n', 1, '2020-07-16'),
(193, 64, 1, 293, 'BLOOD CULTURE', 'n', 'n/a', '1', 600, '293-64', 'n', 7, '2020-08-30'),
(194, 64, 1, 109, 'COMPLETE BLOOD PICTURE', 'n', 'n/a', '1', 200, '109-64', 'n', 4, '2020-08-30'),
(195, 64, 1, 21, 'BLOOD UREA', 'n', 'n/a', '1', 100, '21-64', 'n', 1, '2020-08-30'),
(196, 64, 1, 20, 'BLOOD UREA NITROGEN', 'n', 'n/a', '1', 100, '20-64', 'n', 1, '2020-08-30'),
(197, 64, 1, 4, 'BLOOD SUGAR -RANDOM', 'n', 'n/a', '1', 40, '4-64', 'n', 1, '2020-08-30'),
(198, 64, 1, 507, 'DIGITAL XRAY BOTH CALCANEUM LAT', 'n', 'Stool', '1 day', 200, '507-64', 'n', 3, '2020-08-30'),
(199, 64, 1, 505, 'DIGITAL XRAY SKULL PA', 'n', 'n/a', '1', 200, '505-64', 'n', 3, '2020-08-30'),
(200, 64, 1, 503, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 'n', 'n/a', '1', 2500, '503-64', 'n', 3, '2020-08-30'),
(201, 64, 1, 85, 'LFT', 'y', 'n/a', '1', 400, '85-64', 'n', 1, '2020-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `id` int(3) NOT NULL,
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
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `payment_style` enum('flat','percent') NOT NULL,
  `amount` int(11) NOT NULL
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
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `group_id` int(5) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `timeframe` varchar(50) NOT NULL,
  `sample_type` varchar(30) NOT NULL,
  `test_profile` enum('y','n') NOT NULL DEFAULT 'n',
  `commission_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `group_id`, `name`, `price`, `timeframe`, `sample_type`, `test_profile`, `commission_group_id`) VALUES
(2, 1, 'BLOOD SUGAR- FASTING', 40, '1', '', 'n', 0),
(3, 1, 'BLOOD SUGAR- POST PRANDIAL', 40, '1', '', 'n', 0),
(4, 1, 'BLOOD SUGAR -RANDOM', 40, '1', '', 'n', 0),
(5, 1, 'BLOOD SUGAR-FASTING & POSTPRANDIAL', 80, '1', '', 'n', 0),
(6, 1, 'GLUCOSE TOLERANCE TEST [GTT]', 175, '1', '', 'n', 0),
(7, 1, 'GLYCOSYLATED HAEMOGLOBIN', 300, '1', '', 'n', 0),
(8, 1, 'CHOLESTEROL[SERUM]', 100, '1', '', 'n', 0),
(9, 1, 'HDL CHOLESTEROL[SERUM]', 60, '1', '', 'n', 0),
(10, 1, 'TRIGLYCERIDES[SERUM]', 200, '1', '', 'n', 0),
(11, 1, 'VLDL CHOLESTEROL[SERUM]', 75, '1', '', 'n', 0),
(12, 1, 'TOTAL LIPIDS [PLASMA]', 0, '1', '', 'n', 0),
(13, 1, 'TOTAL CHOLESTEROL:HDL CHOLESTEROL RATIO', 45, '1', '', 'n', 0),
(14, 1, 'LDL: HDL RATIO', 0, '1', '', 'n', 0),
(15, 1, 'BILIRUBIN[SERUM]-TOTAL,DIRECT & INDIRECT', 60, '1', '', 'n', 0),
(16, 1, 'ALBUMIN [SERUM]', 100, '1', '', 'n', 0),
(17, 1, 'GLOBULIN[SERUM]', 0, '1', '', 'n', 0),
(18, 1, 'TOTAL PROTEIN WITH ALBUMIN AND GLOBULIN[SERUM]', 50, '1', '', 'n', 0),
(19, 1, 'A/G RATIO', 0, '1', '', 'n', 0),
(20, 1, 'BLOOD UREA NITROGEN', 100, '1', '', 'n', 0),
(21, 1, 'BLOOD UREA', 100, '1', '', 'n', 0),
(22, 1, 'CREATININE [SERUM]', 100, '1', '', 'n', 0),
(23, 1, 'URIC ACID[SERUM]', 100, '1', '', 'n', 0),
(24, 1, 'CHLORIDES[SERUM]', 50, '1', '', 'n', 0),
(25, 1, 'BLOOD ELECTROLYTES', 125, '1', '', 'n', 0),
(26, 1, 'SGOT[ SERUM]', 100, '1', '', 'n', 0),
(27, 1, 'SGPT [SERUM ]', 100, '1', '', 'n', 0),
(28, 1, 'GAMMA GT[SERUM]', 75, '1', '', 'n', 0),
(29, 1, 'ALKALINE PHOSPHATASE[SERUM]', 100, '1', '', 'n', 0),
(30, 1, 'CREATINE KINASE WITH C.K.M.B. FRACTION', 225, '1', '', 'n', 0),
(31, 1, 'CALCIUM[SERUM]', 100, '1', '', 'n', 0),
(32, 1, 'IRON[SERUM]', 100, '1', '', 'n', 0),
(33, 1, 'TIBC[TOTAL IRON BINDING CAPACITY]', 200, '1', '', 'n', 0),
(34, 1, 'FERRITIN[SERUM]', 400, '1', '', 'n', 0),
(35, 1, 'INORGANIC PHOSPHOROUS [ SERUM ]', 60, '1', '', 'n', 0),
(36, 1, 'TOTAL PROTEINS[SERUM]', 150, '1', '', 'n', 0),
(37, 1, 'FIBRINOGEN', 150, '1', '', 'n', 0),
(38, 1, 'MOLYBDENUM[SERUM]', 0, '1', '', 'n', 0),
(39, 1, '17-KETOSTEROIDS[ URINE]', 0, '1', '', 'n', 0),
(40, 1, '17-KETOGENIC STEROIDS[URINE]', 0, '1', '', 'n', 0),
(41, 1, 'VANILLYL MANDELLIC ACID [VMA] -URINE', 600, '1', '', 'n', 0),
(42, 1, 'SEROTONIN [ URINE]', 0, '1', '', 'n', 0),
(43, 1, 'T3', 175, '1', '', 'n', 0),
(44, 1, 'T4', 175, '1', '', 'n', 0),
(45, 1, 'THYROID STIMULATING HORMONE   [T.S.H]', 200, '1', '', 'n', 0),
(46, 1, 'T3,T4,TSH', 525, '1', '', 'n', 0),
(47, 1, 'FOLLICLE STIMULATING HORMONE [ FSH]- SERUM', 250, '1', '', 'n', 0),
(48, 1, 'FOLLICLE STIMULATING HORMONE[ FSH] - URINE', 0, '1', '', 'n', 0),
(49, 1, 'LEUTINIZING HORMONE[LH]-SERUM', 250, '1', '', 'n', 0),
(50, 1, 'ESTRADIOL-SERUM', 300, '1', '', 'n', 0),
(51, 1, 'TESTOSTERONE[TOTAL & FREE]-BLOOD', 750, '1', '', 'n', 0),
(52, 1, 'PROGESTERONE-SERUM', 300, '1', '', 'n', 0),
(53, 1, 'PROLACTIN[SERUM]', 250, '1', '', 'n', 0),
(54, 1, 'GROWTH HORMONE[GH]', 0, '1', '', 'n', 0),
(55, 1, 'PARATHYROID HORMONE[PTH]', 0, '1', '', 'n', 0),
(56, 1, 'CORTISOL[8.00AM]-SERUM', 325, '1', '', 'n', 0),
(57, 1, 'CORTISOL[4.00PM]-SERUM', 325, '1', '', 'n', 0),
(58, 1, 'ADRENOCORTICOTROPIC HORMONE[ACTH]', 0, '1', '', 'n', 0),
(59, 1, 'ANTIDIURETIC HORMONE[ADH]', 0, '1', '', 'n', 0),
(60, 1, 'OXYTOCIN[SERUM]', 0, '1', '', 'n', 0),
(61, 1, 'ALDOSTERONE [SERUM]', 0, '1', '', 'n', 0),
(62, 1, 'ALDOSTERONE[URINE]', 0, '1', '', 'n', 0),
(63, 1, '17-HYDROXY CORTICOSTEROIDS IN URINE', 0, '1', '', 'n', 0),
(64, 1, 'CATECHOLAMINES -PLASMA', 0, '1', '', 'n', 0),
(65, 1, 'CATECHOLAMINES -URINE', 0, '1', '', 'n', 0),
(66, 1, 'PROTEIN BOUND IODINE[PBI]', 0, '1', '', 'n', 0),
(67, 1, 'TSH STIMULATION TEST', 0, '1', '', 'n', 0),
(68, 1, 'FREE THYROXINE T4 INDEX[FTI]', 0, '1', '', 'n', 0),
(69, 1, 'TUBULAR REABSORPTION OF PHOSPHATE TEST[TRP]:', 0, '1', '', 'n', 0),
(70, 1, 'CORTISOL STIMULATION TEST', 0, '1', '', 'n', 0),
(71, 1, 'MELANOCYTE STIMULATING HORMONE[MSH]', 0, '1', '', 'n', 0),
(72, 1, 'TRH-THYROTOXIN RELEASING HORMONE', 0, '1', '', 'n', 0),
(73, 1, 'METHYL MALONIC ACID[URINE]', 0, '1', '', 'n', 0),
(74, 1, 'CALCIUM INFUSION TEST', 0, '1', '', 'n', 0),
(75, 1, 'ADRENOCORTICAL INHIBITION TEST', 0, '1', '', 'n', 0),
(76, 1, 'GONADOTROPIN STIMULATION TEST', 0, '1', '', 'n', 0),
(77, 1, 'ACTH RESPONSE TEST', 0, '1', '', 'n', 0),
(78, 1, 'LDL CHOLESTEROL', 200, '1', '', 'n', 0),
(79, 1, 'GLUCOSE F/PP', 100, '1', '', 'n', 0),
(80, 1, 'GLUCOSE F', 50, '1', '', 'n', 0),
(81, 1, 'GLUCOSE PP', 50, '1', '', 'n', 0),
(82, 1, 'GLUCOSE R', 50, '1', '', 'n', 0),
(83, 1, 'UREA', 100, '1', '', 'n', 0),
(84, 1, 'LIPID PROFILE', 500, '1', '', 'n', 0),
(85, 1, 'LFT', 400, '1', '', 'y', 0),
(86, 1, 'K+', 200, '1', '', 'n', 0),
(87, 1, 'BILLRUBIN', 100, '1', '', 'n', 0),
(88, 1, 'LDH', 300, '1', '', 'n', 0),
(89, 1, 'HDL', 200, '1', '', 'n', 0),
(90, 1, 'GTT', 300, '1', '', 'n', 0),
(91, 1, 'INORGANIC PHOSPHATE', 250, '1', '', 'n', 0),
(92, 8, 'URINE ANALYSIS', 0, '1', '', 'n', 0),
(93, 8, 'STOOL ANALYSIS', 50, '1 day', 'Blood', 'n', 0),
(94, 4, 'HAEMOGLOBIN[Hb]', 50, '1', '', 'n', 0),
(95, 4, 'RBC COUNT', 25, '1', '', 'n', 0),
(96, 4, 'DIFFERENTIAL COUNT[DC]', 0, '1', '', 'n', 0),
(97, 4, 'TOTAL COUNT-DIFFERENTIAL COUNT[TC - DC]', 40, '1', '', 'n', 0),
(98, 4, 'PLATELET COUNT', 30, '1', '', 'n', 0),
(99, 4, 'ABSOLUTE EIOSINOPHIL COUNT [AEC]', 30, '1', '', 'n', 0),
(100, 4, 'HEMOGLOBIN,TC-DC,ESR', 100, '1', '', 'n', 0),
(101, 4, 'RETICULOCYTE COUNT', 40, '1', '', 'n', 0),
(102, 4, 'MALARIAL PARASITE SMEAR EXAMINATION', 30, '1', '', 'n', 0),
(103, 4, 'BLOOD GROUPING & Rh FACTOR', 80, '1', '', 'n', 0),
(104, 4, 'LE CELLS', 100, '1', '', 'n', 0),
(105, 4, 'BLEEDING TIME & CLOTTING TIME', 40, '1', '', 'n', 0),
(106, 4, 'PROTHROMBIN TIME', 150, '1', '', 'n', 0),
(107, 4, 'PARTIAL THROMBOPLASTIN TIME', 150, '1', '', 'n', 0),
(108, 4, 'EUGLOBIN LYSIS TIME', 0, '1', '', 'n', 0),
(109, 4, 'COMPLETE BLOOD PICTURE', 200, '1', '', 'n', 0),
(110, 4, 'COMPLETE BLOOD COUNT', 200, '1', '', 'n', 0),
(111, 4, 'CAPILLARY FRAGILITY TEST', 40, '1', '', 'n', 0),
(112, 4, 'PROTAMINE SULPHATE TEST', 0, '1', '', 'n', 0),
(113, 4, 'FACTOR VII ASSAY', 0, '1', '', 'n', 0),
(114, 4, 'FACTOR IX ASSAY', 0, '1', '', 'n', 0),
(115, 4, 'FACTOR X ASSAY', 0, '1', '', 'n', 0),
(116, 4, 'THROMBIN TIME', 400, '1', '', 'n', 0),
(117, 4, 'HESS TEST', 200, '1', '', 'n', 0),
(118, 4, 'CLOT RETRACTION TEST', 25, '1', '', 'n', 0),
(119, 4, 'HB TC DC', 60, '1', '', 'n', 0),
(120, 4, 'HB TC DC ESR MP', 100, '1', '', 'n', 0),
(121, 4, 'ESR', 30, '1', '', 'n', 0),
(122, 4, 'DC', 30, '1', '', 'n', 0),
(123, 4, 'TC/DC/ESR', 50, '1', '', 'n', 0),
(124, 4, 'PERIPHERI SMEAR', 40, '1', '', 'n', 0),
(125, 4, 'TC/DC', 30, '1', '', 'n', 0),
(126, 4, 'PCV', 30, '1', '', 'n', 0),
(127, 4, 'MCV', 20, '1', '', 'n', 0),
(128, 4, 'ABNORMAL CELL', 40, '1', '', 'n', 0),
(129, 5, 'PUS C/S', 400, '1', '', 'n', 0),
(130, 5, 'STOOL C/S', 150, '1', '', 'n', 0),
(131, 5, 'URINE C/S', 150, '1', '', 'n', 0),
(132, 5, 'SPUTUM C/S', 400, '1', '', 'n', 0),
(133, 5, 'SWAB C/S', 150, '1', '', 'n', 0),
(134, 5, 'CONJUNCTIVAL SWAB C/S', 200, '1', '', 'n', 0),
(135, 5, 'THROAT SWAB C/S', 400, '1', '', 'n', 0),
(136, 5, 'SEMEN C/S', 200, '1', '', 'n', 0),
(137, 5, 'VAGINAL SWAB C/S', 125, '1', '', 'n', 0),
(138, 5, 'ASPIRATED FLUID C/S', 200, '1', '', 'n', 0),
(139, 5, 'PLEURAL FLUID C/S', 200, '1', '', 'n', 0),
(140, 5, 'PUS C/S [AEROBIC]', 200, '1', '', 'n', 0),
(141, 5, 'FUNGAL C/S', 200, '1', '', 'n', 0),
(142, 5, 'AFB CULTURE SPUTUM', 200, '1', '', 'n', 0),
(143, 5, 'AFB CULTURE URINE', 200, '1', '', 'n', 0),
(144, 5, 'AFB CULTURE PUS', 200, '1', '', 'n', 0),
(145, 5, 'CULTURE FOR DIPHTHERIA', 200, '1', '', 'n', 0),
(146, 5, 'SMEAR FOR AFB SPUTUM', 35, '1', '', 'n', 0),
(147, 5, 'SMEAR FOR AFB URINE', 100, '1', '', 'n', 0),
(148, 5, 'SMEAR FOR AFB PUS', 35, '1', '', 'n', 0),
(149, 5, 'SMEAR FOR AFB CSF', 35, '1', '', 'n', 0),
(150, 5, 'SPUTUM GRAM STAIN', 100, '1', '', 'n', 0),
(151, 5, 'PUS GRAM STAIN', 100, '1', '', 'n', 0),
(152, 5, 'URINE R/E', 50, '1', '', 'n', 0),
(153, 5, 'URINE PREGNANCY', 100, '1', '', 'n', 0),
(154, 5, 'STOOL R/E', 50, '1', '', 'n', 0),
(155, 5, 'STOOL R/E , OBT', 80, '1', '', 'n', 0),
(156, 5, 'STOOL R/S', 40, '1', '', 'n', 0),
(157, 5, 'SPUTUM AFB', 100, '1', '', 'n', 0),
(158, 5, 'SEMEN ANALYSIS', 200, '1', '', 'n', 0),
(159, 5, 'MT', 100, '1', '', 'n', 0),
(160, 5, 'STOOL R/E & OBT X 3', 240, '1', '', 'n', 0),
(161, 5, 'SPUTUM AFB X 2 DAYS', 200, '1', '', 'n', 0),
(162, 5, 'VAGINAL DISCHARGE C/S', 200, '1', '', 'n', 0),
(163, 5, 'URETHRAL DISCHARGE C/S', 400, '1', '', 'n', 0),
(164, 5, 'STOOL RE X 3 DAYS', 150, '1', '', 'n', 0),
(165, 5, 'THROAT SWAB GRAM STAIN', 100, '1', '', 'n', 0),
(166, 5, 'STOOL OBT X 3 DAYS', 90, '1', '', 'n', 0),
(167, 5, 'URINE PROTEIN', 100, '1', '', 'n', 0),
(168, 6, 'ECG', 150, '1', '', 'n', 0),
(169, 6, '24 HOURS HOLTER MONITOR', 1200, '1', '', 'n', 0),
(170, 6, 'PFT / SPIROMETRY', 700, '1', '', 'n', 0),
(171, 6, 'ECG DR. N. SARKAR', 200, '1', '', 'n', 0),
(172, 6, 'BP', 10, '1', '', 'n', 0),
(173, 6, 'TETVAC INJ.', 30, '1', '', 'n', 0),
(174, 6, 'EMG LEFT UPPER LIMB', 1200, '1', '', 'n', 0),
(175, 6, 'NCV LEFT UPPER LIMB', 0, '1', '', 'n', 0),
(176, 6, 'NCV STUDY BOTH UPPER LIMBS', 1400, '1', '', 'n', 0),
(177, 6, 'ECG OF DR. DHIMAN CHAKRABROTY', 200, '1', '', 'n', 0),
(178, 6, 'NCV BOTH LOWER LIMBS', 1400, '1', '', 'n', 0),
(179, 6, 'EMG & NCV BOTH UPPER LIMBS', 2800, '1', '', 'n', 0),
(180, 6, 'EEG', 1500, '1', '', 'n', 0),
(181, 6, '2D ECHOCARDIOGRAPHY', 1000, '1', '', 'n', 0),
(182, 6, 'ECHOCARDIOGRAPHY DOPPLER STUDY', 1200, '1', '', 'n', 0),
(183, 6, 'COLLECTION CHARGE', 50, '1', '', 'n', 0),
(184, 6, 'COLLECTION CHARGE', 100, '1', '', 'n', 0),
(185, 6, 'EMG BOTH LOWER LIMBS', 1400, '1', '', 'n', 0),
(186, 6, 'ECG TO HOME', 400, '1', '', 'n', 0),
(187, 6, 'FILARIA IGM', 800, '1', '', 'n', 0),
(188, 10, '2D - ECHOCARDIOGRAPHY  REPORT', 1000, '1', '', 'n', 0),
(189, 10, 'THYROID SCAN', 1000, '1', '', 'n', 0),
(190, 2, 'WIDAL TEST', 100, '1', '', 'n', 0),
(191, 2, 'VDRL TEST', 100, '1', '', 'n', 0),
(192, 2, 'MANTOUX TEST', 100, '1', '', 'n', 0),
(193, 2, 'RHEUMATOID FACTOR ASSAY', 150, '1', '', 'n', 0),
(194, 2, 'ANTI DNA ANTIBODY[ELISA]', 500, '1', '', 'n', 0),
(195, 2, 'C REACTIVE PROTEIN[CRP]', 300, '1', '', 'n', 0),
(196, 2, 'ANTI STREPTOLYSIN \"O\" TITRE', 250, '1', '', 'n', 0),
(197, 2, 'ANTI NUCLEAR ANTIBODY[ELISA]', 500, '1', '', 'n', 0),
(198, 2, 'ANTINUCLEAR ANTIBODY[IMF]', 300, '1', '', 'n', 0),
(199, 2, 'BRUCELLA AGGLUTINATION TEST', 200, '1', '', 'n', 0),
(200, 2, 'DENGUE VIRUS IgM ELISA TEST', 800, '1', '', 'n', 0),
(201, 2, 'TORCH Ig M - ELISA', 800, '1', '', 'n', 0),
(202, 2, 'TORCH Ig G-ELISA', 800, '1', '', 'n', 0),
(203, 2, 'ANTIAMOEBIC ANTIBODY', 0, '1', '', 'n', 0),
(204, 2, 'HBS AG', 300, '1', '', 'n', 0),
(205, 7, 'HIV 1+2', 500, '1', '', 'n', 0),
(206, 7, 'TSH', 250, '1', '', 'n', 0),
(207, 7, 'T3, T4, TSH', 500, '1', '', 'n', 0),
(208, 7, 'FT4, TSH', 600, '1', '', 'n', 0),
(209, 7, 'FT3, FT4, TSH', 700, '1', '', 'n', 0),
(210, 7, 'PROLACTIN', 400, '1', '', 'n', 0),
(211, 7, 'LH', 400, '1', '', 'n', 0),
(212, 7, 'FSH', 400, '1', '', 'n', 0),
(213, 7, 'TESTOTARAN', 600, '1', '', 'n', 0),
(214, 7, 'FREE TESTOTARAN', 800, '1', '', 'n', 0),
(215, 7, 'DHEAS', 600, '1', '', 'n', 0),
(216, 7, 'HCV', 500, '1', '', 'n', 0),
(217, 7, 'HBA1C', 500, '1', '', 'n', 0),
(218, 7, 'TORCH', 2000, '1', '', 'n', 0),
(219, 7, 'ANTI CCP', 1500, '1', '', 'n', 0),
(220, 7, 'B-HCG', 500, '1', '', 'n', 0),
(221, 7, 'PROGESTERON', 600, '1', '', 'n', 0),
(222, 7, 'BIOPSY 1 SLIDE', 400, '1', '', 'n', 0),
(223, 7, 'ANA', 500, '1', '', 'n', 0),
(224, 7, 'ANDROGENS', 1200, '1', '', 'n', 0),
(225, 7, 'ANTI PHOSPHOLIPID', 750, '1', '', 'n', 0),
(226, 7, 'CALCIUM', 200, '1', '', 'n', 0),
(227, 7, 'CA 125', 700, '1', '', 'n', 0),
(228, 7, 'CERULOPLASMIN', 850, '1', '', 'n', 0),
(229, 7, 'HLB B27', 2000, '1', '', 'n', 0),
(230, 7, 'LITHIUM', 300, '1', '', 'n', 0),
(231, 7, 'LUPUS ANTICOAGULANT', 1800, '1', '', 'n', 0),
(232, 7, 'PAP', 400, '1', '', 'n', 0),
(233, 7, 'Vitanin D3', 1500, '1', '', 'n', 0),
(234, 7, 'P-TIME & APTT INR', 400, '1', '', 'n', 0),
(235, 7, 'INDIRECT COOMB TEST', 500, '1', '', 'n', 0),
(236, 7, 'DIRECT COOMB TEST', 500, '1', '', 'n', 0),
(237, 7, 'AMYLASE', 400, '1', '', 'n', 0),
(238, 7, 'LIPASE', 300, '1', '', 'n', 0),
(239, 7, 'P-TIME', 150, '1', '', 'n', 0),
(240, 7, 'APTT INR', 250, '1', '', 'n', 0),
(241, 7, 'SERUM IGE', 500, '1', '', 'n', 0),
(242, 7, 'HB ELECTROPHOSIS', 600, '1', '', 'n', 0),
(243, 7, 'NA+', 200, '1', '', 'n', 0),
(244, 7, 'K+', 200, '1', '', 'n', 0),
(245, 7, 'AFP', 500, '1', '', 'n', 0),
(246, 7, 'PSA', 600, '1', '', 'n', 0),
(247, 7, 'CPK', 300, '1', '', 'n', 0),
(248, 7, 'CPK MB', 400, '1', '', 'n', 0),
(249, 7, 'FETAL HAMOGLOBIN', 500, '1', '', 'n', 0),
(250, 7, 'MALARIA ANTIGEN', 500, '1', '', 'n', 0),
(251, 7, 'BIOPSY X 3', 1200, '1', '', 'n', 0),
(252, 7, 'BIOPSY X 2', 800, '1', '', 'n', 0),
(253, 7, 'T4, TSH', 500, '1', '', 'n', 0),
(254, 7, 'URINE A/C/R', 500, '1', '', 'n', 0),
(255, 7, 'HLBB27', 2000, '1', '', 'n', 0),
(256, 7, 'TOTAL FLUID TEST', 1200, '1', '', 'n', 0),
(257, 7, 'FT3/FT4', 600, '1', '', 'n', 0),
(258, 7, 'GGT', 400, '1', '', 'n', 0),
(259, 7, 'TOTAL FLUID TEST WITH PAP', 1200, '1', '', 'n', 0),
(260, 7, 'G6PD', 500, '1', '', 'n', 0),
(261, 7, '24 HOURS URINE CALCIUM, OXALATE, CITRATE', 1000, '1', '', 'n', 0),
(262, 7, 'T4', 250, '1', '', 'n', 0),
(263, 7, 'ANTI PHOSPHOLIPID IGG/IGM', 1500, '1', '', 'n', 0),
(264, 7, 'FIBRINOGEN', 700, '1', '', 'n', 0),
(265, 7, 'IRON', 300, '1', '', 'n', 0),
(266, 7, 'D - Dimer', 800, '1', '', 'n', 0),
(267, 7, 'FNAC WITH DOCTOR', 1000, '1', '', 'n', 0),
(268, 7, 'AFB STAIN', 100, '1', '', 'n', 0),
(269, 7, 'FT4', 300, '1', '', 'n', 0),
(270, 7, 'DENGU IGG/IGM', 800, '1', '', 'n', 0),
(271, 7, 'TOTAL ALLERGY TEST', 2000, '1', '', 'n', 0),
(272, 7, 'VAGINAL SWAB C/S', 200, '1', '', 'n', 0),
(273, 7, 'VAGINAL SWAB RE & C/S', 400, '1', '', 'n', 0),
(274, 7, 'TPO ANTIBODY', 800, '1', '', 'n', 0),
(275, 7, 'HAV', 500, '1', '', 'n', 0),
(276, 7, 'PO4', 200, '1', '', 'n', 0),
(277, 7, 'ESTROGEN', 500, '1', '', 'n', 0),
(278, 7, 'SPUTUM C/S', 200, '1', '', 'n', 0),
(279, 7, 'ESTRADIOL', 500, '1', '', 'n', 0),
(280, 7, 'TRIPLE MARKAR', 2000, '1', '', 'n', 0),
(281, 7, 'T3/TSH', 500, '1', '', 'n', 0),
(282, 7, 'PTH', 800, '1', '', 'n', 0),
(283, 7, 'GTT', 300, '1', '', 'n', 0),
(284, 7, 'FERRTIN', 600, '1', '', 'n', 0),
(285, 7, 'VIT B12', 800, '1', '', 'n', 0),
(286, 7, 'CEA', 500, '1', '', 'n', 0),
(287, 7, 'PHOSPHATASE', 200, '1', '', 'n', 0),
(288, 7, 'ANTI TPO ANTIBODY', 800, '1', '', 'n', 0),
(289, 7, 'ANTI TPO', 800, '1', '', 'n', 0),
(290, 7, 'CL', 200, '1', '', 'n', 0),
(291, 7, 'AMH', 2500, '1', '', 'n', 0),
(292, 7, 'KARYOTYPING', 2800, '1', '', 'n', 0),
(293, 7, 'BLOOD CULTURE', 600, '1', '', 'n', 0),
(294, 7, 'TROPONIN --T', 1200, '1', '', 'n', 0),
(295, 7, 'CCT', 300, '1', '', 'n', 0),
(296, 7, 'URINE TBPCR', 1800, '1', '', 'n', 0),
(297, 7, 'NPN', 100, '1', '', 'n', 0),
(298, 7, '24 HOURS URIN PROTEIN', 500, '1', '', 'n', 0),
(299, 7, 'RUBELLA IGG', 500, '1', '', 'n', 0),
(300, 7, 'ELECTROLYTES', 500, '1', '', 'n', 0),
(301, 7, 'MAGNESIUM', 400, '1', '', 'n', 0),
(302, 7, 'Anti Cardiolipin Antibody ( IgA/IgG/IgM )', 1800, '1', '', 'n', 0),
(303, 7, 'CORTISOL', 600, '1', '', 'n', 0),
(304, 7, 'BUN', 100, '1', '', 'n', 0),
(305, 7, 'INSULIN PP', 500, '1', '', 'n', 0),
(306, 7, 'ANTI HBC IGM', 600, '1', '', 'n', 0),
(307, 7, 'HBeAG', 600, '1', '', 'n', 0),
(308, 7, 'HBV DNA', 4500, '1', '', 'n', 0),
(309, 7, 'LDH', 300, '1', '', 'n', 0),
(310, 7, 'CHIKENGUNIA IGG/IGM', 700, '1', '', 'n', 0),
(311, 7, 'RUBELLA IgG / IgM', 700, '1', '', 'n', 0),
(312, 7, 'TIBC', 300, '1', '', 'n', 0),
(313, 7, 'TOXOPLASMA IGG/IGM', 600, '1', '', 'n', 0),
(314, 7, 'ACE', 1450, '1', '', 'n', 0),
(315, 7, 'SERUM LACTATE', 800, '1', '', 'n', 0),
(316, 7, 'DENGUE NS1/IGG/IGM ( ELISA )', 1500, '1', '', 'n', 0),
(317, 7, 'DENGUE IGM ( ELISA )', 500, '1', '', 'n', 0),
(318, 7, 'PAPPA', 2000, '1', '', 'n', 0),
(319, 7, 'VDRL FOR R.P.A. TEST', 400, '1', '', 'n', 0),
(320, 7, 'APLA', 1500, '1', '', 'n', 0),
(321, 7, 'T3, T4', 400, '1', '', 'n', 0),
(322, 7, 'C3', 550, '1', '', 'n', 0),
(323, 7, 'ANA ( HEP 2 )', 1600, '1', '', 'n', 0),
(324, 7, 'DENGUE NS 1', 600, '1', '', 'n', 0),
(325, 7, 'QUATRIPLE MARKAR', 3500, '1', '', 'n', 0),
(326, 7, 'DUAL MARKAR', 3000, '1', '', 'n', 0),
(327, 7, 'HEV IGG/IGM', 1400, '1', '', 'n', 0),
(328, 7, 'HAV  IGG/IGM', 1200, '1', '', 'n', 0),
(329, 7, 'CA 19.9', 900, '1', '', 'n', 0),
(330, 7, 'FT3/TSH', 600, '1', '', 'n', 0),
(331, 7, 'FOLATE LEVEL', 800, '1', '', 'n', 0),
(332, 7, 'FREE PSA', 800, '1', '', 'n', 0),
(333, 7, 'FILARIA ANTIGEN', 700, '1', '', 'n', 0),
(334, 7, 'RENAL FUNCTION TEST', 2000, '1', '', 'n', 0),
(335, 7, 'e-GFR', 600, '1', '', 'n', 0),
(336, 7, 'ADA', 550, '1', '', 'n', 0),
(337, 7, 'URINE MALIGNANT CELLS', 400, '1', '', 'n', 0),
(338, 9, '9 PREGNANCY', 600, '1', '', 'n', 0),
(339, 9, 'UPPER ABDOMEN', 600, '1', '', 'n', 0),
(340, 9, 'LOWER ABDOMEN', 600, '1', '', 'n', 0),
(341, 9, 'WHOLE ABDOMEN', 900, '1', '', 'n', 0),
(342, 9, 'KUB', 600, '1', '', 'n', 0),
(343, 9, '9 TESTIS', 1200, '1', '', 'n', 0),
(344, 9, '9 THYROID', 1200, '1', '', 'n', 0),
(345, 9, '9 COLOUR DOPPLER', 1400, '1', '', 'n', 0),
(346, 9, 'PREGNANCY ANOMALIES', 1200, '1', '', 'n', 0),
(347, 9, '9 BOTH BREAST', 1200, '1', '', 'n', 0),
(348, 9, '9 NECK', 1500, '1', '', 'n', 0),
(349, 9, 'LOWER ABDOMEN SCREEING', 500, '1', '', 'n', 0),
(350, 9, 'FOLLICLULAR STUDY', 1000, '1', '', 'n', 0),
(351, 9, 'PREGNANCY SCREEING', 500, '1', '', 'n', 0),
(352, 9, 'WHOLE ABDOMEN SCREEING', 700, '1', '', 'n', 0),
(353, 9, 'DIGITAL 9 PAROTID GLAND', 1200, '1', '', 'n', 0),
(354, 9, 'LEFT SHOULDER', 1200, '1', '', 'n', 0),
(355, 9, '9 OF RT KNEE', 1200, '1', '', 'n', 0),
(356, 9, '9 LEFT LEG', 1000, '1', '', 'n', 0),
(357, 9, '9 RIGHT LEG', 1200, '1', '', 'n', 0),
(358, 9, '9 OF RT BREAST', 1000, '1', '', 'n', 0),
(359, 9, '9 OF LEFT SUBMANDIBULAR GLAND', 1200, '1', '', 'n', 0),
(360, 9, '9 OF LOWER ABD & BOTH TESTIS', 1500, '1', '', 'n', 0),
(361, 9, '9 OF LEFT FOOT', 1200, '1', '', 'n', 0),
(362, 9, 'FOLLICULAR STUDY 1 DAY', 400, '1', '', 'n', 0),
(363, 9, '9 BRAIN', 1200, '1', '', 'n', 0),
(364, 9, '9 LEFT BREAST', 1000, '1', '', 'n', 0),
(365, 9, '9 BOTH TESTIS WITH DOPPLER STUDY', 1500, '1', '', 'n', 0),
(366, 9, '9 OF EXCLUDE HERNIA', 1000, '1', '', 'n', 0),
(367, 9, '9 OF PYLORUS', 800, '1', '', 'n', 0),
(368, 9, '9 HEAD', 1200, '1', '', 'n', 0),
(369, 9, '9 LIVER,GB,PAN', 500, '1', '', 'n', 0),
(370, 9, '9 PAROTID GLAND', 1200, '1', '', 'n', 0),
(371, 9, '9 PREGNANCY, CLOUR DOPPLAR & ANOMALLY SCAN', 1800, '1', '', 'n', 0),
(372, 9, '9 RIGHT SHOULDER JOINT', 1200, '1', '', 'n', 0),
(373, 9, '9 WHOLE ABDOMEN WITH TESTIS', 1800, '1', '', 'n', 0),
(374, 9, '9 OF PENIS', 1200, '1', '', 'n', 0),
(375, 9, '9 OF RIGHT ARM', 1200, '1', '', 'n', 0),
(376, 9, '9 CHEAT WALL', 1000, '1', '', 'n', 0),
(377, 9, '9 PELVIS LOCAL SWELLING', 1000, '1', '', 'n', 0),
(378, 9, '9 LOWER ABDOMEN ( TVS )', 1200, '1', '', 'n', 0),
(379, 9, '9 RIGHT AXILLA', 800, '1', '', 'n', 0),
(380, 9, '9 OF BOTH INGUINAL REGION FEMALE', 1200, '1', '', 'n', 0),
(381, 9, '9 UPPER ABDOMEN SCREEING', 500, '1', '', 'n', 0),
(382, 9, '9 HEMITHORAX', 1000, '1', '', 'n', 0),
(383, 9, '9 OF LOCAL AREA', 1000, '1', '', 'n', 0),
(384, 9, '9 WHOLE ABDOMEN WITH ANOMALLY', 1800, '1', '', 'n', 0),
(385, 9, 'FOLLICULAR STUDY ( TVS )', 2000, '1', '', 'n', 0),
(386, 9, '9 OF LEFT KNEE', 1200, '1', '', 'n', 0),
(387, 9, '9 OF TA  LIGAMENT', 1000, '1', '', 'n', 0),
(388, 9, '9 ANOMALLY TWIN', 2000, '1', '', 'n', 0),
(389, 9, '9 COLOUR DOPPLER TWIN PREGNANCY', 2000, '1', '', 'n', 0),
(390, 3, 'DIGITAL 3 CHEST PA', 200, '1', '', 'n', 0),
(391, 3, 'DIGITAL 3 PNS OM', 200, '1', '', 'n', 0),
(392, 3, 'DIGITAL 3 RIGHT WRIST AP/LAT', 200, '1', '', 'n', 0),
(393, 3, 'DIGITAL 3 LEFT WRIST AP/LAT', 200, '1', '', 'n', 0),
(394, 3, 'DIGITAL 3 LEFT ELBOW AP/LAT', 200, '1', '', 'n', 0),
(395, 3, 'DIGITAL 3 RIGHT ELBOW AP/LAT', 200, '1', '', 'n', 0),
(396, 3, 'DIGITAL 3 RIGHT HAND AP/AT', 200, '1', '', 'n', 0),
(397, 3, 'DIGITAL 3 LEFT HAND AP/LAT', 200, '1', '', 'n', 0),
(398, 3, 'DIGITAL 3 RIGHT SHOULDER AP/LAT', 400, '1', '', 'n', 0),
(399, 3, 'DIGITAL 3 LEFT SHOULDER AP/LAT', 400, '1', '', 'n', 0),
(400, 3, 'DIGITAL 3 CERVICAL SPINE AP/LAT', 400, '1', '', 'n', 0),
(401, 3, 'DIGITAL 3 L.S SPINE AP/LAT', 400, '1', '', 'n', 0),
(402, 3, 'DIGITAL 3 BOTH KNEE AP/LAT', 400, '1', '', 'n', 0),
(403, 3, 'DIGITAL X- RAY RIGHT KNEE AP/LAT', 200, '1', '', 'n', 0),
(404, 3, 'DIGITAL 3 LEFT KNEE AP/LAT', 200, '1', '', 'n', 0),
(405, 3, 'DIGITAL 3 RIGHT FOOT AP/LAT', 200, '1', '', 'n', 0),
(406, 3, 'DIGITAL 3 RIGHT ANKLE AP/LAT', 200, '1', '', 'n', 0),
(407, 3, 'DIGITAL 3 LEFT FOOT AP/LAT', 200, '1', '', 'n', 0),
(408, 3, 'DIGITAL 3 LEFT ANKLE AP/LAT', 200, '1', '', 'n', 0),
(409, 3, 'DIGITAL 3 RIGHT LEG AP/LAT', 200, '1', '', 'n', 0),
(410, 3, 'DIGITAL 3 LEFT LEG AP/LAT', 200, '1', '', 'n', 0),
(411, 3, 'DIGITAL 3 BOTH MASTOIDS', 400, '1', '', 'n', 0),
(412, 3, 'DIGITAL 3 ABDOMEN AP', 200, '1', '', 'n', 0),
(413, 3, 'DIGITAL 3 KUB AP', 400, '1', '', 'n', 0),
(414, 3, 'DIGITAL 3 OESOPHAGUS WITH DIE', 1200, '1', '', 'n', 0),
(415, 3, '3 DENTAL', 100, '1', '', 'n', 0),
(416, 3, 'DIGITAL SOFT TISSUE NASOPHANYAX LAT', 200, '1', '', 'n', 0),
(417, 3, 'DIGITAL 3 D/L SPINE AP/LAT', 400, '1', '', 'n', 0),
(418, 3, 'DIGITAL 3 PELVIS SHOWING BOTH HIP - AP', 200, '1', '', 'n', 0),
(419, 3, 'DIGITAL 3 RIGHT HIP LAT', 200, '1', '', 'n', 0),
(420, 3, 'DIGITAL 3 LEFT HIP LAT', 200, '1', '', 'n', 0),
(421, 3, 'LEFT SHOULDER AP VIEW', 200, '1', '', 'n', 0),
(422, 3, 'DIGITAL 3 RIGHT FOREARM AP/LAT', 200, '1', '', 'n', 0),
(423, 3, 'DIGITAL 3 LEFT FOREARM AP/LAT', 200, '1', '', 'n', 0),
(424, 3, 'DIGITAL 3 CHEST AP', 200, '1', '', 'n', 0),
(425, 3, 'DIGITAL 3 CHEST RIGHT OBL', 200, '1', '', 'n', 0),
(426, 3, 'DIGITAL 3 CHEST LEFT LAT', 250, '1', '', 'n', 0),
(427, 3, 'DIGITAL 3 SKULL AP/LAT', 400, '1', '', 'n', 0),
(428, 3, 'DIGITAL 3 RIGHT HIP JOINT AP/LAT', 200, '1', '', 'n', 0),
(429, 3, 'DIGITAL 3 LEFT HIP JOINT AP/ALT', 250, '1', '', 'n', 0),
(430, 3, '3 HSG WITH DIE', 1600, '1', '', 'n', 0),
(431, 3, 'DENTAL IOPA +', 100, '1', '', 'n', 0),
(432, 3, 'DIGITAL 3 RIGHT FEMUR AP/ALT', 200, '1', '', 'n', 0),
(433, 3, 'DIGITAL 3 LEFT FEMUR AP/LAT', 200, '1', '', 'n', 0),
(434, 3, '3 L.S SPINE LAT ( FLEX/NEUTRAL/EXTARNAL)', 400, '1', '', 'n', 0),
(435, 3, '3 OF LEFT THUMB AP/LAT', 200, '1', '', 'n', 0),
(436, 3, 'DENTAL IOPA x 2', 200, '1', '', 'n', 0),
(437, 3, '3 OF ADENOIDS LAT', 200, '1', '', 'n', 0),
(438, 3, 'SINOGRAM, DIE WITH DOCTOR CHARGE', 1400, '1', '', 'n', 0),
(439, 3, 'XRAY BOTH HEALS LAT', 200, '1', '', 'n', 0),
(440, 3, 'DIGITAL XRAY WHOLE SPINE AP/LAT', 1200, '1', '', 'n', 0),
(441, 3, 'DIGITAL XRAY BOTH FOREARM WITH HAND AP/LAT', 200, '1', '', 'n', 0),
(442, 3, 'DIGITAL 3 NASAL BONE LAT', 200, '1', '', 'n', 0),
(443, 3, 'DIGITAL XRAY LEFT SHOULDER AP', 200, '1', '', 'n', 0),
(444, 3, 'DIGITAL XRAY CERVICAL SPINE LAT', 200, '1', '', 'n', 0),
(445, 3, 'DIGITAL BA-MEAL ILLEOCAL REGION WITH MEDICIN', 1200, '1', '', 'n', 0),
(446, 3, 'DIGITAL XRAY LEFT HEAL LAT', 200, '1', '', 'n', 0),
(447, 3, 'DIGITAL XRAY RIGHT ANKLE LAT', 200, '1', '', 'n', 0),
(448, 3, 'DIGITAL XRAY RIGHT SHOULDER JOINT AP', 200, '1', '', 'n', 0),
(449, 3, 'DIGITAL XRAY IVP WITH MEDICIN', 3500, '1', '', 'n', 0),
(450, 3, 'DIGITAL XRAY BA MEAL FOLLOW THROUGH WITH ILLECEAL ', 1700, '1', '', 'n', 0),
(451, 3, 'DIGITAL XRAY RIGHT MASTOID LAT', 200, '1', '', 'n', 0),
(452, 3, 'DIGITAL XRAY LEFT ANKLE LAT', 200, '1', '', 'n', 0),
(453, 3, 'DIGITAL XRAY LEFT CALCANEUM AXIAL VIEW', 200, '1', '', 'n', 0),
(454, 3, 'DIGITAL 3 LEFT HEEL LAT/AXIAL', 200, '1', '', 'n', 0),
(455, 3, 'DIGITAL XRAY RIGHT FOOT AP', 200, '1', '', 'n', 0),
(456, 3, 'RT CLAVICLE AP', 200, '1', '', 'n', 0),
(457, 3, 'SACRAM + COCCYX AP /LAT.', 400, '1', '', 'n', 0),
(458, 3, 'DIGITAL XRAY RIBS LAT', 200, '1', '', 'n', 0),
(459, 3, '3 RT MASTOID LAT/OBL', 200, '1', '', 'n', 0),
(460, 3, 'X- RAY OF THROCIC SPINE AP/LAT', 400, '1', '', 'n', 0),
(461, 3, 'DIGITAL XRAY LEFT CLAVICLE AP', 200, '1', '', 'n', 0),
(462, 3, 'X- RAY OF LEFT HUMERUS AP/LAT', 200, '1', '', 'n', 0),
(463, 3, '3 OF RT. KNEE JOINT ( SKY LINE / LAT )', 250, '1', '', 'n', 0),
(464, 3, 'DIGITAL XRAY CHEST AP & OBL', 400, '1', '', 'n', 0),
(465, 3, 'XRAY RIGHT ELBOW JOINT AP/LAT', 150, '1', '', 'n', 0),
(466, 3, 'DIGITAL XRAY RIGHT HEEL AP/AXIAL', 200, '1', '', 'n', 0),
(467, 3, 'DIGITAL XRAY RIGHT THIGH AP/LAT', 200, '1', '', 'n', 0),
(468, 3, '3 OF BOTH HIP AP', 200, '1', '', 'n', 0),
(469, 3, 'DIGITAL BOTH HIP JOINT AP/LAT', 400, '1', '', 'n', 0),
(470, 3, 'DIGITAL 3 OF RT. HIP JOINT LAT', 200, '1', '', 'n', 0),
(471, 3, 'DIGITAL 3 OF LEFT HIP JOINT LAT', 200, '1', '', 'n', 0),
(472, 3, 'DIGITAL XRAY BOTH KNEE AP', 200, '1', '', 'n', 0),
(473, 3, 'DIGITAL 3 OF BOTH KNEE AP', 200, '1', '', 'n', 0),
(474, 3, 'XRAY CHEST PA ( PLAIN )', 150, '1', '', 'n', 0),
(475, 3, 'DIGITAL XRAY MASTOID LEFT LAT OBL', 200, '1', '', 'n', 0),
(476, 3, 'DIGITAL XRAY BOTH HIP AP/LAT', 400, '1', '', 'n', 2),
(477, 3, 'DIGITAL XRAY SOFT TISSUE LAYRANX RIGHT LAT', 200, '1', '', 'n', 2),
(478, 3, 'DIGITAL XRAY CHEST PA & LAT', 400, '1', '', 'n', 2),
(479, 3, 'DIGITAL XRAY BOTH FOOT AP/OBL', 400, '1', '', 'n', 2),
(480, 3, 'DIGITAL XRAY BOTH HEELS LAT/ AXIAL', 400, '1', '', 'n', 2),
(481, 3, 'DIGITAL XRAY LEFT ARM AP/LAT', 200, '1', '', 'n', 2),
(482, 3, 'DIGITAL XRAY RIGHT CALCANEUM AP/LAT', 200, '1', '', 'n', 2),
(483, 3, 'DIGITAL XRAY RIGHT FORE FINGER AP', 200, '1', '', 'n', 2),
(484, 3, 'DIGITAL XRAY BOTH FOOT AP', 200, '1', '', 'n', 2),
(485, 3, 'DIGITAL XRSY LEFT MANDIBLE AP/LAT', 400, '1', '', 'n', 2),
(486, 3, 'DIGITAL XRAY BOTH SHOULDER JOINT AP', 400, '1', '', 'n', 2),
(487, 3, 'DIGITAL XRAY BOTH SHOULDER JOINT AP/LAT', 800, '1', '', 'n', 2),
(488, 3, 'DIGITAL XRAY LEFT WHOLE LEG AP/LAT', 400, '1', '', 'n', 2),
(489, 3, 'DIGITAL XRAY RIGHT HUMERUS AP/LAT', 400, '1', '', 'n', 2),
(490, 3, 'DIGITAL X RAY RIGHT CLAVICLE  AP', 200, '1', '', 'n', 2),
(491, 3, 'DIGITAL XRAY BOTH HEELS LAT', 200, '1', '', 'n', 2),
(492, 3, 'MAMOGRAPHY', 400, '1', '', 'n', 0),
(493, 3, 'DIGITAL XRAY RIGHT SCAPULA AP/LAT', 250, '1', '', 'n', 0),
(494, 3, 'DIGITAL XRAY LEFT HIP WITH THIGH AP/LAT', 400, '1', '', 'n', 6),
(495, 3, 'XRAY OF TM JOINT AP/LAT', 250, '1', '', 'n', 6),
(496, 3, 'DIGITAL XRAY L.S SPINE --AP', 200, '1', '', 'n', 6),
(497, 3, 'DIGITAL XRAY BOTH HAND AP', 200, '1', '', 'n', 6),
(498, 3, 'DIGITA XRAY RIGHT SCAPHOID OBL', 200, '1', '', 'n', 6),
(499, 3, 'DIGITAL XRAY OF LEFT HUMERUS AP/LAT', 200, '1', '', 'n', 6),
(500, 3, 'DIGITAL XRAY BOTH ANKLE AP/LAT', 400, '1', '', 'n', 5),
(501, 3, 'DIGITAL XRAY LEFT THIGH AP', 200, '1', '', 'n', 5),
(502, 3, 'DIGITAL XRAY OF RIGHT MANDIBLE', 200, '1', '', 'n', 5),
(503, 3, 'DIGITAL XRAY HSG WITH FEMALE DOCTOR', 2500, '1', '', 'n', 5),
(504, 3, 'DIGITAL XRAY LEFT HUMERUS AP/LAT', 200, '1', '', 'n', 5),
(505, 3, 'DIGITAL XRAY SKULL PA', 200, '1', '', 'n', 5),
(506, 3, 'DIGITAL XRAY LEFT MANDIBLE LAT', 200, '1', '', 'n', 5),
(507, 3, 'DIGITAL XRAY BOTH CALCANEUM LAT', 200, '1 day', 'Stool', 'n', 5),
(508, 0, 'testprofile 1', 33, '2 day', '', 'y', 5),
(509, 0, 'profiletest2', 43, '2 day', '', 'y', 5),
(510, 0, 'testpr3', 33, '1 day', '', 'y', 2),
(511, 0, 'asif', 22, '1 day', '', 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_descriptive_value_tpl`
--

CREATE TABLE `test_descriptive_value_tpl` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_descriptive_value_tpl`
--

INSERT INTO `test_descriptive_value_tpl` (`id`, `test_id`, `test_group_id`, `description`) VALUES
(1, 507, 0, '<p>DIGITAL XRAY BOTH CALCANEUM LAT</p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\n	<tbody>\n		<tr>\n			<td>qsdf</td>\n			<td>fsfdg</td>\n		</tr>\n		<tr>\n			<td>sdfg</td>\n			<td>sdfg</td>\n		</tr>\n		<tr>\n			<td>sdfg</td>\n			<td>sdfg</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>'),
(2, 506, 0, '<p><strong>asdfasdfsa</strong></p>'),
(3, 503, 0, ''),
(4, 498, 0, ''),
(5, 505, 0, '<p>DIGITAL XRAY SKULL PA</p>\n\n<p>testing with xray report</p>'),
(6, 502, 0, ''),
(7, 489, 3, ''),
(8, 174, 6, ''),
(9, 175, 6, ''),
(10, 2, 1, '<p>ggggggggggg</p>'),
(11, 4, 1, ''),
(12, 293, 7, ''),
(13, 3, 1, ''),
(14, 492, 3, ''),
(15, 110, 4, ''),
(16, 109, 4, ''),
(17, 21, 1, ''),
(18, 20, 1, ''),
(19, 385, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `test_group`
--

CREATE TABLE `test_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_group`
--

INSERT INTO `test_group` (`id`, `group_name`) VALUES
(1, 'BIOCHEMISTRY'),
(2, 'SEROLOGY'),
(3, 'X-RAY'),
(4, 'HAEMATOLOGY'),
(5, 'MICROBIOLOGY'),
(6, 'OTHERS'),
(7, 'SPECIAL CASE'),
(8, 'CLINICAL PATHOLOGY'),
(9, 'USG'),
(10, 'GR06');

-- --------------------------------------------------------

--
-- Table structure for table `test_numeric_value_tpl_interpretation`
--

CREATE TABLE `test_numeric_value_tpl_interpretation` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_numeric_value_tpl_interpretation`
--

INSERT INTO `test_numeric_value_tpl_interpretation` (`id`, `test_id`, `test_group_id`, `value`) VALUES
(15, 293, 7, 'numericccc'),
(16, 110, 4, NULL),
(17, 109, 4, NULL),
(18, 21, 1, NULL),
(19, 20, 1, NULL),
(20, 4, 1, NULL),
(21, 507, 3, NULL),
(22, 385, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_numeric_value_tpl_subtitle`
--

CREATE TABLE `test_numeric_value_tpl_subtitle` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `range` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_numeric_value_tpl_subtitle`
--

INSERT INTO `test_numeric_value_tpl_subtitle` (`id`, `test_id`, `test_group_id`, `title_id`, `subtitle`, `unit`, `range`) VALUES
(1, 507, 0, 1, NULL, 'min sec', NULL),
(2, 506, 0, 2, NULL, NULL, NULL),
(3, 505, 0, 3, NULL, NULL, NULL),
(4, 503, 0, 4, NULL, NULL, NULL),
(5, 502, 0, 5, NULL, NULL, NULL),
(7, 504, 3, 7, NULL, NULL, NULL),
(8, 501, 3, 8, NULL, NULL, NULL),
(9, 497, 3, 9, NULL, NULL, NULL),
(10, 489, 3, 10, NULL, NULL, NULL),
(11, 174, 6, 11, NULL, NULL, NULL),
(12, 175, 6, 12, NULL, NULL, NULL),
(13, 2, 1, 13, 'dfd', 'min sec', '4435'),
(14, 4, 1, 14, 'bsr1', 'min sec', '200'),
(15, 293, 7, 15, 'nbc1', 'min sec', '23432'),
(16, 3, 1, 16, NULL, NULL, NULL),
(17, 492, 3, 17, NULL, NULL, NULL),
(18, 110, 4, 18, NULL, NULL, NULL),
(19, 109, 4, 19, NULL, NULL, NULL),
(20, 21, 1, 20, NULL, NULL, NULL),
(21, 20, 1, 21, 'bun1', 'gm%', '20'),
(22, 20, 1, 21, 'bun2', 'min sec', '30'),
(23, 4, 1, 22, 'bsr2', 'gm%', '400'),
(24, 385, 9, 23, NULL, NULL, NULL),
(25, 507, 3, 1, NULL, NULL, NULL),
(26, 293, 7, 15, 'nbc 2', 'cell/cumm', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_numeric_value_tpl_title`
--

CREATE TABLE `test_numeric_value_tpl_title` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_numeric_value_tpl_title`
--

INSERT INTO `test_numeric_value_tpl_title` (`id`, `test_id`, `test_group_id`, `title`) VALUES
(1, 507, 0, NULL),
(2, 506, 0, NULL),
(3, 505, 0, NULL),
(4, 503, 0, NULL),
(5, 502, 0, NULL),
(7, 504, 3, NULL),
(8, 501, 3, NULL),
(9, 497, 3, NULL),
(10, 489, 3, NULL),
(11, 174, 6, NULL),
(12, 175, 6, NULL),
(13, 2, 1, 'dddddddd'),
(14, 4, 1, 'title 1'),
(15, 293, 7, 'Blood Culture'),
(16, 3, 1, NULL),
(17, 492, 3, NULL),
(18, 110, 4, NULL),
(19, 109, 4, NULL),
(20, 21, 1, NULL),
(21, 20, 1, 'title 1'),
(22, 4, 1, 'title 2'),
(23, 385, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_profile_relation`
--

CREATE TABLE `test_profile_relation` (
  `id` int(11) NOT NULL,
  `test_profile_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_profile_relation`
--

INSERT INTO `test_profile_relation` (`id`, `test_profile_id`, `test_id`) VALUES
(1, 85, 293),
(4, 510, 506),
(5, 510, 513),
(6, 85, 110);

-- --------------------------------------------------------

--
-- Table structure for table `test_report_collection_pivot`
--

CREATE TABLE `test_report_collection_pivot` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `billing_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `report_style` enum('single','numeric','descriptive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report_collection_pivot`
--

INSERT INTO `test_report_collection_pivot` (`id`, `patient_id`, `billing_id`, `test_id`, `report_style`) VALUES
(11, 1, 64, 293, 'numeric'),
(13, 1, 64, 109, 'single'),
(14, 1, 64, 21, 'single'),
(15, 1, 64, 507, 'descriptive'),
(16, 1, 64, 505, 'descriptive');

-- --------------------------------------------------------

--
-- Table structure for table `test_report_descriptive_value`
--

CREATE TABLE `test_report_descriptive_value` (
  `id` int(11) NOT NULL,
  `test_report_pivot_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `billing_id` int(11) NOT NULL,
  `is_profile_test` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report_descriptive_value`
--

INSERT INTO `test_report_descriptive_value` (`id`, `test_report_pivot_id`, `test_id`, `test_group_id`, `billing_id`, `is_profile_test`, `profile_id`, `profile_name`, `description`, `created_at`) VALUES
(1, 15, 507, 3, 64, 0, 0, NULL, '<p>DIGITAL XRAY BOTH CALCANEUM LAT</p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\n	<tbody>\n		<tr>\n			<td>qsdf</td>\n			<td>fsfdg</td>\n		</tr>\n		<tr>\n			<td>sdfg</td>\n			<td>sdfg</td>\n		</tr>\n		<tr>\n			<td>sdfg</td>\n			<td>sdfg</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>', '2020-09-14'),
(2, 16, 505, 3, 64, 0, 0, NULL, '<p>DIGITAL XRAY SKULL PA</p>\n\n<p>testing with xray report</p>', '2020-09-16');

-- --------------------------------------------------------

--
-- Table structure for table `test_report_numeric_value`
--

CREATE TABLE `test_report_numeric_value` (
  `id` int(11) NOT NULL,
  `test_report_pivot_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `billing_id` int(11) NOT NULL,
  `is_profile_test` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `subtitle_id` int(11) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  `range` text,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report_numeric_value`
--

INSERT INTO `test_report_numeric_value` (`id`, `test_report_pivot_id`, `test_id`, `test_group_id`, `billing_id`, `is_profile_test`, `profile_id`, `profile_name`, `title`, `subtitle_id`, `subtitle`, `unit`, `value`, `range`, `created_at`) VALUES
(10, 11, 293, 7, 64, 0, 0, NULL, 'Blood Culture', 15, 'nbc1', 'min sec', '45', '23432', '2020-09-14'),
(11, 11, 293, 7, 64, 0, 0, NULL, 'Blood Culture', 26, 'nbc 2', 'cell/cumm', 'fsdf', NULL, '2020-09-14');

-- --------------------------------------------------------

--
-- Table structure for table `test_report_numeric_value_interpretation`
--

CREATE TABLE `test_report_numeric_value_interpretation` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_report_pivot_id` int(11) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report_numeric_value_interpretation`
--

INSERT INTO `test_report_numeric_value_interpretation` (`id`, `test_id`, `test_report_pivot_id`, `value`) VALUES
(4, 293, 9, NULL),
(6, 293, 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_report_single_value`
--

CREATE TABLE `test_report_single_value` (
  `id` int(11) NOT NULL,
  `test_report_pivot_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `billing_id` int(11) NOT NULL,
  `is_profile_test` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `subtitle_id` int(11) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report_single_value`
--

INSERT INTO `test_report_single_value` (`id`, `test_report_pivot_id`, `test_id`, `test_group_id`, `billing_id`, `is_profile_test`, `profile_id`, `profile_name`, `title`, `subtitle_id`, `subtitle`, `options`, `value`, `created_at`) VALUES
(8, 13, 109, 4, 64, 0, 0, NULL, 'COMPLETE BLOOD PICTURE', 30, 'cbp', '', 'y', '2020-09-14'),
(9, 13, 109, 4, 64, 0, 0, NULL, 'COMPLETE BLOOD PICTURE', 37, 'cbp 2', '', 'n', '2020-09-14'),
(10, 14, 21, 1, 64, 0, 0, NULL, '', 32, 'bu', '', 'one', '2020-09-14');

-- --------------------------------------------------------

--
-- Table structure for table `test_report_single_value_interpretation`
--

CREATE TABLE `test_report_single_value_interpretation` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_report_pivot_id` int(11) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report_single_value_interpretation`
--

INSERT INTO `test_report_single_value_interpretation` (`id`, `test_id`, `test_report_pivot_id`, `value`) VALUES
(5, 109, 13, NULL),
(6, 21, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_single_value_tpl_interpretation`
--

CREATE TABLE `test_single_value_tpl_interpretation` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_single_value_tpl_interpretation`
--

INSERT INTO `test_single_value_tpl_interpretation` (`id`, `test_id`, `test_group_id`, `value`) VALUES
(23, 293, 7, 'single'),
(24, 502, 3, NULL),
(25, 507, 3, NULL),
(26, 110, 4, NULL),
(27, 109, 4, NULL),
(28, 109, 4, NULL),
(29, 21, 1, NULL),
(30, 20, 1, NULL),
(31, 505, 3, NULL),
(32, 385, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_single_value_tpl_subtitle`
--

CREATE TABLE `test_single_value_tpl_subtitle` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_single_value_tpl_subtitle`
--

INSERT INTO `test_single_value_tpl_subtitle` (`id`, `test_id`, `test_group_id`, `title_id`, `subtitle`, `options`) VALUES
(1, 507, 3, 1, 'dd', 'ff'),
(2, 507, 3, 2, 'rr', 'ee'),
(3, 506, 3, 3, NULL, NULL),
(4, 504, 3, 4, NULL, NULL),
(5, 501, 3, 5, NULL, NULL),
(6, 497, 3, 6, NULL, NULL),
(7, 489, 3, 7, NULL, NULL),
(10, 174, 6, 8, 'abc', 'yes, no'),
(11, 174, 6, 8, 'xyz', 'true, false'),
(12, 175, 6, 9, 'the scope', 'y,n'),
(13, 2, 1, 10, 'sub test1', 'y,n'),
(14, 2, 1, 11, 'sub test 3', 'y,n'),
(15, 2, 1, 10, 'sub test 2', 'true,false'),
(16, 4, 1, 12, 'sugar 1', 'y, n'),
(18, 293, 7, 14, 'bc1', 'positive,negative'),
(19, 293, 7, 14, 'bc2', 'y,n'),
(21, 3, 1, 16, NULL, NULL),
(22, 492, 3, 17, 'test', 'a, b,c'),
(23, 492, 3, 17, NULL, NULL),
(24, 492, 3, 18, 'df', 'd,em,f'),
(25, 502, 3, 19, 'asdf', 'am,df,asdf'),
(26, 507, 3, 1, NULL, NULL),
(29, 110, 4, 21, 'count', 'y,n'),
(30, 109, 4, 22, 'cbp', 'y,n'),
(32, 21, 1, 24, 'bu', 'one,two'),
(33, 20, 1, 25, NULL, NULL),
(34, 505, 3, 26, NULL, NULL),
(35, 293, 7, 14, NULL, NULL),
(36, 385, 9, 27, NULL, NULL),
(37, 109, 4, 22, 'cbp 2', 'y,n');

-- --------------------------------------------------------

--
-- Table structure for table `test_single_value_tpl_title`
--

CREATE TABLE `test_single_value_tpl_title` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_group_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_single_value_tpl_title`
--

INSERT INTO `test_single_value_tpl_title` (`id`, `test_id`, `test_group_id`, `title`) VALUES
(1, 507, 3, 'aa'),
(2, 507, 3, 'bb'),
(3, 506, 3, NULL),
(4, 504, 3, NULL),
(5, 501, 3, NULL),
(6, 497, 3, NULL),
(7, 489, 3, NULL),
(8, 174, 6, 'title'),
(9, 175, 6, 'biometic'),
(10, 2, 1, 'Sugar Sample 1'),
(11, 2, 1, 'sugar sample 2'),
(12, 4, 1, 'sugar testing'),
(14, 293, 7, 'Title 1'),
(16, 3, 1, NULL),
(17, 492, 3, 'title on'),
(18, 492, 3, 'asdf'),
(19, 502, 3, 'dfd'),
(21, 110, 4, 'blookd'),
(22, 109, 4, 'COMPLETE BLOOD PICTURE'),
(24, 21, 1, NULL),
(25, 20, 1, NULL),
(26, 505, 3, NULL),
(27, 385, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units_static`
--

CREATE TABLE `units_static` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units_static`
--

INSERT INTO `units_static` (`id`, `name`) VALUES
(1, 'million/cumm'),
(2, 'lakhs/cumm'),
(3, 'cell/cumm'),
(4, 'gm%'),
(5, 'min sec');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centre_admin`
--
ALTER TABLE `centre_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `commission_group`
--
ALTER TABLE `commission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_group_master`
--
ALTER TABLE `commission_group_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_group_master_relation`
--
ALTER TABLE `commission_group_master_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_cause`
--
ALTER TABLE `discount_cause`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_commission`
--
ALTER TABLE `doctor_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_billing`
--
ALTER TABLE `patient_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_billing_discount_cause`
--
ALTER TABLE `patient_billing_discount_cause`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_billing_service_charge`
--
ALTER TABLE `patient_billing_service_charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_test_collection`
--
ALTER TABLE `patient_test_collection`
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
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_descriptive_value_tpl`
--
ALTER TABLE `test_descriptive_value_tpl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_group`
--
ALTER TABLE `test_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_numeric_value_tpl_interpretation`
--
ALTER TABLE `test_numeric_value_tpl_interpretation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_numeric_value_tpl_subtitle`
--
ALTER TABLE `test_numeric_value_tpl_subtitle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_numeric_value_tpl_title`
--
ALTER TABLE `test_numeric_value_tpl_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_profile_relation`
--
ALTER TABLE `test_profile_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_report_collection_pivot`
--
ALTER TABLE `test_report_collection_pivot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_report_descriptive_value`
--
ALTER TABLE `test_report_descriptive_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_report_numeric_value`
--
ALTER TABLE `test_report_numeric_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_report_numeric_value_interpretation`
--
ALTER TABLE `test_report_numeric_value_interpretation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_report_single_value`
--
ALTER TABLE `test_report_single_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_report_single_value_interpretation`
--
ALTER TABLE `test_report_single_value_interpretation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_single_value_tpl_interpretation`
--
ALTER TABLE `test_single_value_tpl_interpretation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_single_value_tpl_subtitle`
--
ALTER TABLE `test_single_value_tpl_subtitle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_single_value_tpl_title`
--
ALTER TABLE `test_single_value_tpl_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units_static`
--
ALTER TABLE `units_static`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `centre_admin`
--
ALTER TABLE `centre_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commission_group`
--
ALTER TABLE `commission_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `commission_group_master`
--
ALTER TABLE `commission_group_master`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commission_group_master_relation`
--
ALTER TABLE `commission_group_master_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `discount_cause`
--
ALTER TABLE `discount_cause`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `doctor_commission`
--
ALTER TABLE `doctor_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `patient_billing`
--
ALTER TABLE `patient_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `patient_billing_discount_cause`
--
ALTER TABLE `patient_billing_discount_cause`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient_billing_service_charge`
--
ALTER TABLE `patient_billing_service_charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `patient_test_collection`
--
ALTER TABLE `patient_test_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_charge`
--
ALTER TABLE `service_charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT for table `test_descriptive_value_tpl`
--
ALTER TABLE `test_descriptive_value_tpl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `test_group`
--
ALTER TABLE `test_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `test_numeric_value_tpl_interpretation`
--
ALTER TABLE `test_numeric_value_tpl_interpretation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `test_numeric_value_tpl_subtitle`
--
ALTER TABLE `test_numeric_value_tpl_subtitle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `test_numeric_value_tpl_title`
--
ALTER TABLE `test_numeric_value_tpl_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `test_profile_relation`
--
ALTER TABLE `test_profile_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `test_report_collection_pivot`
--
ALTER TABLE `test_report_collection_pivot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `test_report_descriptive_value`
--
ALTER TABLE `test_report_descriptive_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_report_numeric_value`
--
ALTER TABLE `test_report_numeric_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `test_report_numeric_value_interpretation`
--
ALTER TABLE `test_report_numeric_value_interpretation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `test_report_single_value`
--
ALTER TABLE `test_report_single_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `test_report_single_value_interpretation`
--
ALTER TABLE `test_report_single_value_interpretation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `test_single_value_tpl_interpretation`
--
ALTER TABLE `test_single_value_tpl_interpretation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `test_single_value_tpl_subtitle`
--
ALTER TABLE `test_single_value_tpl_subtitle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `test_single_value_tpl_title`
--
ALTER TABLE `test_single_value_tpl_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `units_static`
--
ALTER TABLE `units_static`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
