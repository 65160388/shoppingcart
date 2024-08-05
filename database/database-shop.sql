-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2024 at 04:17 AM
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
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(4) NOT NULL COMMENT 'รหัสลูกค้า',
  `first_name` varchar(50) NOT NULL COMMENT 'ชื่อจริง',
  `last_name` varchar(50) NOT NULL COMMENT 'นามสกุล',
  `email` varchar(100) NOT NULL COMMENT 'อีเมล',
  `phone` varchar(30) DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `registration_date` date NOT NULL COMMENT 'วันที่ลงทะเบียน',
  `is_active` tinyint(1) NOT NULL COMMENT 'สถานะการใช้งาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tell` varchar(20) NOT NULL,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `total` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `profile_image` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `price`, `profile_image`, `detail`) VALUES
(22, 'กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด -monologue- เล่ม 22 จบ', 125.00, 'th-11134207-7r98t-lwpek45dd6mn10.jpg', 'ขณะที่ฮาจิมังเดินหน้าทำงานเพื่อจัดงานพรอมร่วมโดยอาศัยความช่วยเหลือจากโทสีกะและไซโมคุสะระหว่างนั้นความสัมพันธ์ของฮาจิมัง ยูกิโนะ และยุยก็มาถึงจุดเปลี่ยน...?และแล้วเวลาก็ผ่านไป โคมาจิซึ่งเข้าโรงเรียนมัธยมปลายโซบุได้แล้วก็พาอิโรฮมาที่ห้องชมรมอุทิศตน...ไลท์โนเวลยอดฮิตฉบับคอมมิกมาถึงเล่มสุดท้ายและตอนจบที่ยิ่งใหญ่แล้ว!'),
(23, 'หนังสือ กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 13 (นิยาย)', 240.00, 'sg-11134201-7qvfq-lgta7dsyct9r60.jpg', 'กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 13 (นิยาย)แม้จะถึงฤดูกาลที่หิมะหลอมละลาย แต่เดือนมีนาคมเช่นนี้ก็ยังให้ความรู้สึกไกลห่างจากความหวังครั้งใหม่เหลือเกินยูกิโนะ ยุย และฮะจิมันตั้งใจพูดในสิ่งที่ตัวเองคิด ตั้งใจจะทำให้สิ่งที่อยากทำ เพื่อให้ความสัมพันธ์ที่เป็นอยู่นี้สิ้นสุดลงยูกิโนะชิตะ ยูกิโนะหวังว่าทุกคนจะคอยเฝ้าดูเธออยู่ห่างๆ จนถึงที่สุด ยุยกาฮามะ ยุยหวังว่าพวกเธอสามคนจะได้อยู่ด้วยกันแบบนี้ตลอดไป ถึงแม้จะหวังให้แสงอาทิตย์ยามเย็นที่งดงามคงอยู่ไปตลอดกาล แต่ถ้าดวงอาทิตย์ไม่ลาลับขอบฟ้าวันใหม่ก็ไม่มีวันมาเยือน เพื่อเดินหน้าต่อจึงต้องถอดใจ ต้องหาจุดสิ้นสุดไม่มีแม้แต่เวลาจะกลัดกลุ่มไป ไม่อาจย้อนเวลาหวนคืน ฉากสุดท้ายได้เริ่มต้นขึ้นแล้ว... \r\n\r\nหมวดสินค้า : นิยาย ไลท์โนเวล (Light Novel)\r\nสำนักพิมพ์ : เซนชู/ZENSHU\r\nผู้แต่ง : Wataru Watari'),
(24, 'หนังสือ กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 6.5', 240.00, 'sg-11134201-7qvcu-lha03cz5s0ek0e.jpg', 'หลังงานวัฒนธรรมจบลง พวกฮะจิมันและยูกิโนะก็ต้องไปช่วยงานตามคำขอร้องที่ว่าอยากจะทำให้งานกีฬาสีดูครึกครื้นของประธานนักเรียนชิโรเมงุริ เมงุริในฐานะชมรมบริการ แต่ก็ยังไม่ได้กำหนดด้วยซํ้าว่าใครจะเป็นประธานคณะกรรมการจัดงานกีฬาสี คนที่ถูกดันขึ้นมารับตำแหน่งนั้น คือซางามิ มินามิที่เป็นประธานคณะกรรมการจัดงานวัฒนธรรม..\r\n\r\nหมวดสินค้า : นิยาย ไลท์โนเวล (Light Novel)\r\nสำนักพิมพ์ : เซนชู/ZENSHU\r\nผู้แต่ง : Wataru Watari'),
(25, 'หนังสือ การ์ตูน กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 20', 95.00, 'sg-11134201-7qvcp-ljz1bsksjslz7c.jpg', 'ช่วยเต้นรำกับฉันได้มั้ยคะและแล้วก็ถึงวันพิธีจบการศึกษาที่จัดขึ้นพร้อมกับงานพรอม งานนี้อิโรฮะกับยูกิโนะทำงานเป็นหลัก ส่วนฮาจิมังก็เข้าไปช่วยเรื่องฝ่ายควบคุมเสียง!? ระหว่างนั้นเองยูกิโนะและยุยต่างก็เอ่ยคำขอซึ่งเป็นสิทธิพิเศษของผู้ชนะในชมรมอุทิศตนกับฮาจิมัง...มิหนำซ้ำหลังงานพรอมจบลง คุณแม่ของยูกิโนะยังมาหายูกิโนะอีกด้วย! นี่คือไลท์โนเวลยอดฮิตฉบับคอมมิกเล่ม 20! ที่อัดแน่นไปด้สนเนื้อหาจากอนิเมะในซีซั่น 3!\r\n\r\nผู้แต่ง : Wataru Watari'),
(26, 'Narita Brian 1/7', 8000.00, 'th-11134207-7r98y-lwhe700rr367ca.jpg', 'สินค้า : Narita Brian\r\nชื่อเรื่อง : Umamusume: Pretty Derby\r\nค่าย : Max Factory\r\nScale : 1/7\r\nสูงประมาณ 26 เซนติเมตร\r\n-----------------------------------------\r\nสินค้าวางจำหน่าย พฤษภาคม 2025 - มิถุนายน 2025\r\nผู้แต่ง : Wataru Watari'),
(28, 'Umamusume Pretty Derby [Beyond the Horizon] Tokai Teio 1/7', 10000.00, 'th-11134207-7r992-ly7ucu8xsg4p22.jpg', 'Brand Alter\r\nSeries Title Umamusume Pretty Derby\r\nSpecifications Pre-painted Complete Figure\r\nScale: 1/7\r\nSize: Approx. H250mm (including base)\r\nMaterial: PVC ABS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'รหัสลูกค้า';

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
