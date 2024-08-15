-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2024 at 05:46 PM
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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `profile_image` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0 COMMENT 'จำนวนสินค้าคงเหลือ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `price`, `profile_image`, `detail`, `stock_quantity`) VALUES
(22, 'กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด -monologue- เล่ม 22 จบ', 125.00, 'th-11134207-7r98t-lwpek45dd6mn10.jpg', 'ขณะที่ฮาจิมังเดินหน้าทำงานเพื่อจัดงานพรอมร่วมโดยอาศัยความช่วยเหลือจากโทสีกะและไซโมคุสะระหว่างนั้นความสัมพันธ์ของฮาจิมัง ยูกิโนะ และยุยก็มาถึงจุดเปลี่ยน...?และแล้วเวลาก็ผ่านไป โคมาจิซึ่งเข้าโรงเรียนมัธยมปลายโซบุได้แล้วก็พาอิโรฮมาที่ห้องชมรมอุทิศตน...ไลท์โนเวลยอดฮิตฉบับคอมมิกมาถึงเล่มสุดท้ายและตอนจบที่ยิ่งใหญ่แล้ว!', 0),
(23, 'หนังสือ กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 13 (นิยาย)', 240.00, 'sg-11134201-7qvfq-lgta7dsyct9r60.jpg', 'กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 13 (นิยาย)แม้จะถึงฤดูกาลที่หิมะหลอมละลาย แต่เดือนมีนาคมเช่นนี้ก็ยังให้ความรู้สึกไกลห่างจากความหวังครั้งใหม่เหลือเกินยูกิโนะ ยุย และฮะจิมันตั้งใจพูดในสิ่งที่ตัวเองคิด ตั้งใจจะทำให้สิ่งที่อยากทำ เพื่อให้ความสัมพันธ์ที่เป็นอยู่นี้สิ้นสุดลงยูกิโนะชิตะ ยูกิโนะหวังว่าทุกคนจะคอยเฝ้าดูเธออยู่ห่างๆ จนถึงที่สุด ยุยกาฮามะ ยุยหวังว่าพวกเธอสามคนจะได้อยู่ด้วยกันแบบนี้ตลอดไป ถึงแม้จะหวังให้แสงอาทิตย์ยามเย็นที่งดงามคงอยู่ไปตลอดกาล แต่ถ้าดวงอาทิตย์ไม่ลาลับขอบฟ้าวันใหม่ก็ไม่มีวันมาเยือน เพื่อเดินหน้าต่อจึงต้องถอดใจ ต้องหาจุดสิ้นสุดไม่มีแม้แต่เวลาจะกลัดกลุ่มไป ไม่อาจย้อนเวลาหวนคืน ฉากสุดท้ายได้เริ่มต้นขึ้นแล้ว... \r\n\r\nหมวดสินค้า : นิยาย ไลท์โนเวล (Light Novel)\r\nสำนักพิมพ์ : เซนชู/ZENSHU\r\nผู้แต่ง : Wataru Watari', 0),
(24, 'หนังสือ กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 6.5', 240.00, 'sg-11134201-7qvcu-lha03cz5s0ek0e.jpg', 'หลังงานวัฒนธรรมจบลง พวกฮะจิมันและยูกิโนะก็ต้องไปช่วยงานตามคำขอร้องที่ว่าอยากจะทำให้งานกีฬาสีดูครึกครื้นของประธานนักเรียนชิโรเมงุริ เมงุริในฐานะชมรมบริการ แต่ก็ยังไม่ได้กำหนดด้วยซํ้าว่าใครจะเป็นประธานคณะกรรมการจัดงานกีฬาสี คนที่ถูกดันขึ้นมารับตำแหน่งนั้น คือซางามิ มินามิที่เป็นประธานคณะกรรมการจัดงานวัฒนธรรม..\r\n\r\nหมวดสินค้า : นิยาย ไลท์โนเวล (Light Novel)\r\nสำนักพิมพ์ : เซนชู/ZENSHU\r\nผู้แต่ง : Wataru Watari', 0),
(25, 'หนังสือ การ์ตูน กะแล้วชีวิตรักวัยรุ่นของผมมันต้องไม่สดใสเลยสักนิด เล่ม 20', 95.00, 'sg-11134201-7qvcp-ljz1bsksjslz7c.jpg', 'ช่วยเต้นรำกับฉันได้มั้ยคะและแล้วก็ถึงวันพิธีจบการศึกษาที่จัดขึ้นพร้อมกับงานพรอม งานนี้อิโรฮะกับยูกิโนะทำงานเป็นหลัก ส่วนฮาจิมังก็เข้าไปช่วยเรื่องฝ่ายควบคุมเสียง!? ระหว่างนั้นเองยูกิโนะและยุยต่างก็เอ่ยคำขอซึ่งเป็นสิทธิพิเศษของผู้ชนะในชมรมอุทิศตนกับฮาจิมัง...มิหนำซ้ำหลังงานพรอมจบลง คุณแม่ของยูกิโนะยังมาหายูกิโนะอีกด้วย! นี่คือไลท์โนเวลยอดฮิตฉบับคอมมิกเล่ม 20! ที่อัดแน่นไปด้สนเนื้อหาจากอนิเมะในซีซั่น 3!\r\n\r\nผู้แต่ง : Wataru Watari', 0),
(26, 'Narita Brian 1/7', 8000.00, 'th-11134207-7r98y-lwhe700rr367ca.jpg', 'สินค้า : Narita Brian\r\nชื่อเรื่อง : Umamusume: Pretty Derby\r\nค่าย : Max Factory\r\nScale : 1/7\r\nสูงประมาณ 26 เซนติเมตร\r\n-----------------------------------------\r\nสินค้าวางจำหน่าย พฤษภาคม 2025 - มิถุนายน 2025\r\nผู้แต่ง : Wataru Watari', 0),
(28, 'Umamusume Pretty Derby [Beyond the Horizon] Tokai Teio 1/7', 10000.00, 'th-11134207-7r992-ly7ucu8xsg4p22.jpg', 'Brand Alter\r\nSeries Title Umamusume Pretty Derby\r\nSpecifications Pre-painted Complete Figure\r\nScale: 1/7\r\nSize: Approx. H250mm (including base)\r\nMaterial: PVC ABS', 0),
(29, 'NOTEBOOK (โน้ตบุ๊ค) MSI RAIDER GE78 HX 14VHG-605TH (CORE BLACK)', 110000.00, 'th-11134207-7r98r-luj0jgwz3uj9b8.jpg', 'โน๊ตบุ๊ค MSI Raider GE78 HX 14VHG-605TH Black\r\nCPU: Intel Core i9-14900HX (up to 5.60 GHz, 24C(8P+16E)/32T, 36MB Intel Smart Cache)\r\nGraphics: NVIDIA GeForce RTX 4080 12GB GDDR6.\r\nRAM: 32GB (2x16GB) DDR5-5600.\r\nSSD: 2TB NVMe PCIe 4.0 x4.', 0),
(30, 'BANDAI S.H.Figuarts Kamen Rider Fire Gotchard PREMIUM BANDAI Action Figure', 2000.00, 'th-11134207-7r98t-ly4kl3ekl41u34.jpg', 'Kamen Rider Fire Gotchard, the form Ichinose Hōtarō from Kamen Rider Gotchard transforms into using the Gotcha Igniter which he obtained through his own power, is now available in S.H.Figuarts!', 0),
(31, 'BANDAI Super Minipla Renketsu Gattai Grand Liner w/o gum PREMIUM BANDAI Candy Toy', 2000.00, 'th-11134207-7r98s-lv2odqhp3jlf25.jpg', 'Renketsu Gattai Grand Liner is presented in Super Minipla.\r\nAssembling GO-LINER 1-5, Grand Liner can be transformed.', 0),
(32, 'Bandai 1/60 METAL STRUCTURE MSN-04 SAZABI', 139900.00, 'sg-11134201-23010-a2jv9aef51lvfb.jpg', 'Condition: New พร้อมส่ง \r\nBrand: Bandai\r\nModel: MSN-04 SAZABI\r\nType: METAL STRUCTURE MSN-04 SAZABI 1/60', 0),
(33, '[P-Bandai] GFF Metal Composite 1/100 Wing Gundam Zero EW', 26400.00, '389be5fa6cc9457ec57e7cb90f3bbbd1.jpg', 'Condition : New\r\nBrand : Bandai\r\nModel : Wing Gundam Zero EW\r\nType : GFF Metal Composite 1/100', 0),
(34, 'MNQ-XH07', 21804.00, 'sg-11134201-7rbkq-lqrjk1f3bvdh09.jpg', 'สินค้าในร้านเป็นของใหม่ 100%', 0),
(36, 'Re:ZERO -Starting Life in Another World- Rem Aqua Orb Ver. 1/7 Scale Figure - FURYU Corporation', 10000.00, '46b3a4ba850f11533dfba7ea7ded1211.jpg', 'Re:ZERO -Starting Life in Another World-\r\nRem Aqua Orb Ver. 1/7 Scale Figure\r\nBrand :   F NEX  Furyu', 0),
(37, 'Figure: THE IDOLM@STER Cinderella Girls: Ranko Kanzaki Anniversary Princess -Mad Banquet- 1/8', 9900.00, 'e767518b954aac876fce8f8f051b00ec.jpg', 'Figure: THE IDOLM@STER Cinderella Girls: Ranko Kanzaki Anniversary Princess -Mad Banquet- 1/8\r\nยี่ห้อ: Phat Company\r\nสินค้าประเภท: ฟิกเกอร์ 1/8 ขนาด 24 ซม', 0),
(38, 'Uma Musume Pretty Derby Figure Satono Diamond Ichiban Kuji', 1250.00, 'th-11134207-7r98p-lxvehtfn2mz39b.jpg', 'สินค้าบางกล่องอาจจะมีบุบเล็กน้อยเนื่องจากการขนส่ง', 2);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสผู้ใช้', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
