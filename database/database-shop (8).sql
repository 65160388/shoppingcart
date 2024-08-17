-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2024 at 06:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL COMMENT 'รหัสคำสั่งซื้อ',
  `user_id` int(11) NOT NULL COMMENT 'รหัสผู้ใช้ที่ทำคำสั่งซื้อ',
  `order_date` datetime NOT NULL COMMENT 'วันที่สั่งซื้อ',
  `total_amount` decimal(10,2) NOT NULL COMMENT 'จำนวนเงินรวมของคำสั่งซื้อ',
  `status` enum('pending','processing','completed','cancelled') NOT NULL DEFAULT 'pending' COMMENT 'สถานะของคำสั่งซื้อ',
  `shipping_address_id` int(11) NOT NULL COMMENT 'รหัสที่อยู่ในการจัดส่ง'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ตารางเก็บข้อมูลคำสั่งซื้อแต่ละคำสั่ง';

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_amount`, `status`, `shipping_address_id`) VALUES
(6, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(7, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(8, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(9, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(10, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(11, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(12, 13, '0000-00-00 00:00:00', 2500.00, 'pending', 0),
(13, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(14, 13, '0000-00-00 00:00:00', 2500.00, 'pending', 0),
(15, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(16, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(17, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(18, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(19, 13, '0000-00-00 00:00:00', 2500.00, 'pending', 0),
(20, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(21, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(22, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(23, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(24, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(25, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(26, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(27, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(28, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(29, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(30, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(31, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(32, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(33, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(34, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(35, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(36, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(37, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(38, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(39, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(40, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(41, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(42, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(43, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(44, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(45, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(46, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(47, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(48, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(49, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(50, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(51, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(52, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(53, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(54, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(55, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(56, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(57, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(58, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(59, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(60, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(61, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(62, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(63, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(64, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(65, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(66, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(67, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(68, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(69, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(70, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(71, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(72, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(73, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(74, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(75, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(76, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(77, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(78, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(79, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(80, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(81, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(82, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(83, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(84, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(85, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(86, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(87, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(88, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(89, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(90, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(91, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(92, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(93, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(94, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(95, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(96, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(97, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(98, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(99, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(100, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(101, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(102, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(103, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(104, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(105, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(106, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(107, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(108, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(109, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(110, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(111, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(112, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(113, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(114, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(115, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(116, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(117, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(118, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(119, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(120, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(121, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(122, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(123, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(124, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(125, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(126, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(127, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(128, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(129, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(130, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(131, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(132, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(133, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(134, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0),
(135, 13, '0000-00-00 00:00:00', 1250.00, 'pending', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL COMMENT 'รหัสรายการสินค้าในคำสั่งซื้อ',
  `order_id` int(11) NOT NULL COMMENT 'รหัสคำสั่งซื้อ',
  `product_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `quantity` int(11) NOT NULL COMMENT 'จำนวนสินค้าที่สั่งซื้อ',
  `price` decimal(10,2) NOT NULL COMMENT 'ราคาสินค้าในแต่ละรายการ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ตารางเก็บรายการสินค้าที่อยู่ในคำสั่งซื้อแต่ละรายการ';

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(6, 6, 38, 1, 1250.00),
(7, 7, 38, 1, 1250.00),
(8, 8, 38, 1, 1250.00),
(9, 9, 38, 1, 1250.00),
(10, 10, 38, 1, 1250.00),
(11, 11, 38, 1, 1250.00),
(12, 12, 38, 2, 1250.00),
(13, 13, 38, 1, 1250.00),
(14, 14, 38, 2, 1250.00),
(15, 15, 38, 1, 1250.00),
(16, 16, 38, 1, 1250.00),
(17, 17, 38, 1, 1250.00),
(18, 18, 38, 1, 1250.00),
(19, 19, 38, 2, 1250.00),
(20, 20, 38, 1, 1250.00),
(21, 21, 38, 1, 1250.00),
(22, 22, 38, 1, 1250.00),
(23, 23, 38, 1, 1250.00),
(24, 24, 38, 1, 1250.00),
(25, 25, 38, 1, 1250.00),
(26, 26, 38, 1, 1250.00),
(27, 27, 38, 1, 1250.00),
(28, 28, 38, 1, 1250.00),
(29, 29, 38, 1, 1250.00),
(30, 30, 38, 1, 1250.00),
(31, 31, 38, 1, 1250.00),
(32, 32, 38, 1, 1250.00),
(33, 33, 38, 1, 1250.00),
(34, 34, 38, 1, 1250.00),
(35, 35, 38, 1, 1250.00),
(36, 36, 38, 1, 1250.00),
(37, 37, 38, 1, 1250.00),
(38, 38, 38, 1, 1250.00),
(39, 39, 38, 1, 1250.00),
(40, 40, 38, 1, 1250.00),
(41, 41, 38, 1, 1250.00),
(42, 42, 38, 1, 1250.00),
(43, 43, 38, 1, 1250.00),
(44, 44, 38, 1, 1250.00),
(45, 45, 38, 1, 1250.00),
(46, 46, 38, 1, 1250.00),
(47, 47, 38, 1, 1250.00),
(48, 48, 38, 1, 1250.00),
(49, 49, 38, 1, 1250.00),
(50, 50, 38, 1, 1250.00),
(51, 51, 38, 1, 1250.00),
(52, 52, 38, 1, 1250.00),
(53, 53, 38, 1, 1250.00),
(54, 54, 38, 1, 1250.00),
(55, 55, 38, 1, 1250.00),
(56, 56, 38, 1, 1250.00),
(57, 57, 38, 1, 1250.00),
(58, 58, 38, 1, 1250.00),
(59, 59, 38, 1, 1250.00),
(60, 60, 38, 1, 1250.00),
(61, 61, 38, 1, 1250.00),
(62, 62, 38, 1, 1250.00),
(63, 63, 38, 1, 1250.00),
(64, 64, 38, 1, 1250.00),
(65, 65, 38, 1, 1250.00),
(66, 66, 38, 1, 1250.00),
(67, 67, 38, 1, 1250.00),
(68, 68, 38, 1, 1250.00),
(69, 69, 38, 1, 1250.00),
(70, 70, 38, 1, 1250.00),
(71, 71, 38, 1, 1250.00),
(72, 72, 38, 1, 1250.00),
(73, 73, 38, 1, 1250.00),
(74, 74, 38, 1, 1250.00),
(75, 75, 38, 1, 1250.00),
(76, 76, 38, 1, 1250.00),
(77, 77, 38, 1, 1250.00),
(78, 78, 38, 1, 1250.00),
(79, 79, 38, 1, 1250.00),
(80, 80, 38, 1, 1250.00),
(81, 81, 38, 1, 1250.00),
(82, 82, 38, 1, 1250.00),
(83, 83, 38, 1, 1250.00),
(84, 84, 38, 1, 1250.00),
(85, 85, 38, 1, 1250.00),
(86, 86, 38, 1, 1250.00),
(87, 87, 38, 1, 1250.00),
(88, 88, 38, 1, 1250.00),
(89, 89, 38, 1, 1250.00),
(90, 90, 38, 1, 1250.00),
(91, 91, 38, 1, 1250.00),
(92, 92, 38, 1, 1250.00),
(93, 93, 38, 1, 1250.00),
(94, 94, 38, 1, 1250.00),
(95, 95, 38, 1, 1250.00),
(96, 96, 38, 1, 1250.00),
(97, 97, 38, 1, 1250.00),
(98, 98, 38, 1, 1250.00),
(99, 99, 38, 1, 1250.00),
(100, 100, 38, 1, 1250.00),
(101, 101, 38, 1, 1250.00),
(102, 102, 38, 1, 1250.00),
(103, 103, 38, 1, 1250.00),
(104, 104, 38, 1, 1250.00),
(105, 105, 38, 1, 1250.00),
(106, 106, 38, 1, 1250.00),
(107, 107, 38, 1, 1250.00),
(108, 108, 38, 1, 1250.00),
(109, 109, 38, 1, 1250.00),
(110, 110, 38, 1, 1250.00),
(111, 111, 38, 1, 1250.00),
(112, 112, 38, 1, 1250.00),
(113, 113, 38, 1, 1250.00),
(114, 114, 38, 1, 1250.00),
(115, 115, 38, 1, 1250.00),
(116, 116, 38, 1, 1250.00),
(117, 117, 38, 1, 1250.00),
(118, 118, 38, 1, 1250.00),
(119, 119, 38, 1, 1250.00),
(120, 120, 38, 1, 1250.00),
(121, 121, 38, 1, 1250.00),
(122, 122, 38, 1, 1250.00),
(123, 123, 38, 1, 1250.00),
(124, 124, 38, 1, 1250.00),
(125, 125, 38, 1, 1250.00),
(126, 126, 38, 1, 1250.00),
(127, 127, 38, 1, 1250.00),
(128, 128, 38, 1, 1250.00),
(129, 129, 38, 1, 1250.00),
(130, 130, 38, 1, 1250.00),
(131, 131, 38, 1, 1250.00),
(132, 132, 38, 1, 1250.00),
(133, 133, 38, 1, 1250.00),
(134, 134, 38, 1, 1250.00),
(135, 135, 38, 1, 1250.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `profile_image` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0 COMMENT 'จำนวนสินค้าคงเหลือ',
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `price`, `profile_image`, `detail`, `stock_quantity`, `store_id`) VALUES
(22, 'กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด -monologue- เล่ม 22 จบ', 125.00, 'th-11134207-7r98t-lwpek45dd6mn10.jpg', 'ขณะที่ฮาจิมังเดินหน้าทำงานเพื่อจัดงานพรอมร่วมโดยอาศัยความช่วยเหลือจากโทสีกะและไซโมคุสะระหว่างนั้นความสัมพันธ์ของฮาจิมัง ยูกิโนะ และยุยก็มาถึงจุดเปลี่ยน...?และแล้วเวลาก็ผ่านไป โคมาจิซึ่งเข้าโรงเรียนมัธยมปลายโซบุได้แล้วก็พาอิโรฮมาที่ห้องชมรมอุทิศตน...ไลท์โนเวลยอดฮิตฉบับคอมมิกมาถึงเล่มสุดท้ายและตอนจบที่ยิ่งใหญ่แล้ว!', 0, NULL),
(23, 'หนังสือ กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 13 (นิยาย)', 240.00, 'sg-11134201-7qvfq-lgta7dsyct9r60.jpg', 'กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 13 (นิยาย)แม้จะถึงฤดูกาลที่หิมะหลอมละลาย แต่เดือนมีนาคมเช่นนี้ก็ยังให้ความรู้สึกไกลห่างจากความหวังครั้งใหม่เหลือเกินยูกิโนะ ยุย และฮะจิมันตั้งใจพูดในสิ่งที่ตัวเองคิด ตั้งใจจะทำให้สิ่งที่อยากทำ เพื่อให้ความสัมพันธ์ที่เป็นอยู่นี้สิ้นสุดลงยูกิโนะชิตะ ยูกิโนะหวังว่าทุกคนจะคอยเฝ้าดูเธออยู่ห่างๆ จนถึงที่สุด ยุยกาฮามะ ยุยหวังว่าพวกเธอสามคนจะได้อยู่ด้วยกันแบบนี้ตลอดไป ถึงแม้จะหวังให้แสงอาทิตย์ยามเย็นที่งดงามคงอยู่ไปตลอดกาล แต่ถ้าดวงอาทิตย์ไม่ลาลับขอบฟ้าวันใหม่ก็ไม่มีวันมาเยือน เพื่อเดินหน้าต่อจึงต้องถอดใจ ต้องหาจุดสิ้นสุดไม่มีแม้แต่เวลาจะกลัดกลุ่มไป ไม่อาจย้อนเวลาหวนคืน ฉากสุดท้ายได้เริ่มต้นขึ้นแล้ว... \r\n\r\nหมวดสินค้า : นิยาย ไลท์โนเวล (Light Novel)\r\nสำนักพิมพ์ : เซนชู/ZENSHU\r\nผู้แต่ง : Wataru Watari', 0, NULL),
(24, 'หนังสือ กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 6.5', 240.00, 'sg-11134201-7qvcu-lha03cz5s0ek0e.jpg', 'หลังงานวัฒนธรรมจบลง พวกฮะจิมันและยูกิโนะก็ต้องไปช่วยงานตามคำขอร้องที่ว่าอยากจะทำให้งานกีฬาสีดูครึกครื้นของประธานนักเรียนชิโรเมงุริ เมงุริในฐานะชมรมบริการ แต่ก็ยังไม่ได้กำหนดด้วยซํ้าว่าใครจะเป็นประธานคณะกรรมการจัดงานกีฬาสี คนที่ถูกดันขึ้นมารับตำแหน่งนั้น คือซางามิ มินามิที่เป็นประธานคณะกรรมการจัดงานวัฒนธรรม..\r\n\r\nหมวดสินค้า : นิยาย ไลท์โนเวล (Light Novel)\r\nสำนักพิมพ์ : เซนชู/ZENSHU\r\nผู้แต่ง : Wataru Watari', 0, NULL),
(25, 'หนังสือ การ์ตูน กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 20', 95.00, 'sg-11134201-7qvcp-ljz1bsksjslz7c.jpg', 'ช่วยเต้นรำกับฉันได้มั้ยคะและแล้วก็ถึงวันพิธีจบการศึกษาที่จัดขึ้นพร้อมกับงานพรอม งานนี้อิโรฮะกับยูกิโนะทำงานเป็นหลัก ส่วนฮาจิมังก็เข้าไปช่วยเรื่องฝ่ายควบคุมเสียง!? ระหว่างนั้นเองยูกิโนะและยุยต่างก็เอ่ยคำขอซึ่งเป็นสิทธิพิเศษของผู้ชนะในชมรมอุทิศตนกับฮาจิมัง...มิหนำซ้ำหลังงานพรอมจบลง คุณแม่ของยูกิโนะยังมาหายูกิโนะอีกด้วย! นี่คือไลท์โนเวลยอดฮิตฉบับคอมมิกเล่ม 20! ที่อัดแน่นไปด้สนเนื้อหาจากอนิเมะในซีซั่น 3!\r\n\r\nผู้แต่ง : Wataru Watari', 0, NULL),
(26, 'Narita Brian 1/7', 8000.00, 'th-11134207-7r98y-lwhe700rr367ca.jpg', 'สินค้า : Narita Brian\r\nชื่อเรื่อง : Umamusume: Pretty Derby\r\nค่าย : Max Factory\r\nScale : 1/7\r\nสูงประมาณ 26 เซนติเมตร\r\n-----------------------------------------\r\nสินค้าวางจำหน่าย พฤษภาคม 2025 - มิถุนายน 2025\r\nผู้แต่ง : Wataru Watari', 0, NULL),
(28, 'Umamusume Pretty Derby [Beyond the Horizon] Tokai Teio 1/7', 10000.00, 'th-11134207-7r992-ly7ucu8xsg4p22.jpg', 'Brand Alter\r\nSeries Title Umamusume Pretty Derby\r\nSpecifications Pre-painted Complete Figure\r\nScale: 1/7\r\nSize: Approx. H250mm (including base)\r\nMaterial: PVC ABS', 0, NULL),
(29, 'NOTEBOOK (โน้ตบุ๊ค) MSI RAIDER GE78 HX 14VHG-605TH (CORE BLACK)', 110000.00, 'th-11134207-7r98r-luj0jgwz3uj9b8.jpg', 'โน๊ตบุ๊ค MSI Raider GE78 HX 14VHG-605TH Black\r\nCPU: Intel Core i9-14900HX (up to 5.60 GHz, 24C(8P+16E)/32T, 36MB Intel Smart Cache)\r\nGraphics: NVIDIA GeForce RTX 4080 12GB GDDR6.\r\nRAM: 32GB (2x16GB) DDR5-5600.\r\nSSD: 2TB NVMe PCIe 4.0 x4.', 0, NULL),
(30, 'BANDAI S.H.Figuarts Kamen Rider Fire Gotchard PREMIUM BANDAI Action Figure', 2000.00, 'th-11134207-7r98t-ly4kl3ekl41u34.jpg', 'Kamen Rider Fire Gotchard, the form Ichinose Hōtarō from Kamen Rider Gotchard transforms into using the Gotcha Igniter which he obtained through his own power, is now available in S.H.Figuarts!', 0, NULL),
(31, 'BANDAI Super Minipla Renketsu Gattai Grand Liner w/o gum PREMIUM BANDAI Candy Toy', 2000.00, 'th-11134207-7r98s-lv2odqhp3jlf25.jpg', 'Renketsu Gattai Grand Liner is presented in Super Minipla.\r\nAssembling GO-LINER 1-5, Grand Liner can be transformed.', 0, NULL),
(32, 'Bandai 1/60 METAL STRUCTURE MSN-04 SAZABI', 139900.00, 'sg-11134201-23010-a2jv9aef51lvfb.jpg', 'Condition: New พร้อมส่ง \r\nBrand: Bandai\r\nModel: MSN-04 SAZABI\r\nType: METAL STRUCTURE MSN-04 SAZABI 1/60', 0, NULL),
(33, '[P-Bandai] GFF Metal Composite 1/100 Wing Gundam Zero EW', 26400.00, '389be5fa6cc9457ec57e7cb90f3bbbd1.jpg', 'Condition : New\r\nBrand : Bandai\r\nModel : Wing Gundam Zero EW\r\nType : GFF Metal Composite 1/100', 0, NULL),
(34, 'MNQ-XH07', 21804.00, 'sg-11134201-7rbkq-lqrjk1f3bvdh09.jpg', 'สินค้าในร้านเป็นของใหม่ 100%', 0, NULL),
(36, 'Re:ZERO -Starting Life in Another World- Rem Aqua Orb Ver. 1/7 Scale Figure - FURYU Corporation', 10000.00, '46b3a4ba850f11533dfba7ea7ded1211.jpg', 'Re:ZERO -Starting Life in Another World-\r\nRem Aqua Orb Ver. 1/7 Scale Figure\r\nBrand :   F NEX  Furyu', 0, NULL),
(37, 'Figure: THE IDOLM@STER Cinderella Girls: Ranko Kanzaki Anniversary Princess -Mad Banquet- 1/8', 9900.00, 'e767518b954aac876fce8f8f051b00ec.jpg', 'Figure: THE IDOLM@STER Cinderella Girls: Ranko Kanzaki Anniversary Princess -Mad Banquet- 1/8\r\nยี่ห้อ: Phat Company\r\nสินค้าประเภท: ฟิกเกอร์ 1/8 ขนาด 24 ซม', 0, NULL),
(38, 'Uma Musume Pretty Derby Figure Satono Diamond Ichiban Kuji', 1250.00, 'th-11134207-7r98p-lxvehtfn2mz39b.jpg', 'สินค้าบางกล่องอาจจะมีบุบเล็กน้อยเนื่องจากการขนส่ง', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_description` text DEFAULT NULL,
  `registration_date` datetime DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'รหัสผู้ใช้',
  `first_name` varchar(50) NOT NULL COMMENT 'ชื่อจริง',
  `last_name` varchar(50) NOT NULL COMMENT 'นามสกุล',
  `email` varchar(100) NOT NULL COMMENT 'อีเมล',
  `phone` int(30) DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `password` varchar(255) NOT NULL COMMENT 'รหัสผ่าน',
  `registration_date` date NOT NULL COMMENT 'วันที่ลงทะเบียน',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะการใช้งาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `registration_date`, `is_active`) VALUES
(12, 'test', 'tester', 'test@gmail.com', 0, '$2y$10$tR8jJhTpZJQUDLY.YeMGjegPmsY7ju8zzEOJWGFzl4Fz85Dyzsx.G', '2024-08-10', 1),
(13, 'test', 'tester', 'test1@gmail.com', 343252342, '$2y$10$5cyRQx2MlUYFRKCM/o7lVOL5wFrBrdldJeaKmSOFtwYw.CqFOpm3W', '2024-08-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_line1` varchar(255) NOT NULL COMMENT 'บ้านเลขที่, หมู่บ้าน, ถนน',
  `address_line2` varchar(255) DEFAULT NULL COMMENT 'ตำบล, แขวง',
  `district` varchar(100) NOT NULL COMMENT 'อำเภอ, เขต',
  `province` varchar(100) NOT NULL COMMENT 'จังหวัด',
  `postal_code` varchar(10) NOT NULL COMMENT 'รหัสไปรษณีย์',
  `country` varchar(50) NOT NULL DEFAULT 'ประเทศไทย' COMMENT 'ประเทศ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`address_id`, `user_id`, `address_line1`, `address_line2`, `district`, `province`, `postal_code`, `country`) VALUES
(1, 13, 'ฟหกฟหกฟห', 'กฟหกฟไก', 'หฟกฟหกฟ', 'หฟกฟหก', 'หฟกกฟห', 'ประเทศไทย');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสคำสั่งซื้อ', AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสรายการสินค้าในคำสั่งซื้อ', AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสผู้ใช้', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
