-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 06:42 PM
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
(188, 13, '2024-08-18 00:15:11', 2500.00, '', 0),
(189, 12, '2024-08-18 00:29:00', 1250.00, '', 0),
(190, 13, '2024-08-18 00:39:28', 1250.00, '', 0),
(191, 13, '2024-08-18 01:16:14', 1250.00, '', 0),
(192, 13, '2024-08-18 01:20:09', 1250.00, 'pending', 0),
(193, 13, '2024-08-18 01:20:15', 2500.00, '', 0),
(194, 13, '2024-08-18 01:24:21', 2500.00, '', 0),
(195, 12, '2024-08-18 01:36:02', 2500.00, '', 0),
(196, 12, '2024-08-18 01:36:41', 2500.00, 'pending', 0),
(197, 12, '2024-08-18 01:36:50', 2500.00, 'pending', 0),
(198, 12, '2024-08-18 01:39:34', 2500.00, 'pending', 0),
(199, 12, '2024-08-18 01:39:44', 2500.00, 'pending', 0),
(200, 12, '2024-08-18 01:40:14', 2500.00, 'pending', 0),
(201, 13, '2024-08-18 01:40:30', 1250.00, 'pending', 0),
(202, 13, '2024-08-18 01:40:40', 1250.00, 'pending', 0),
(203, 13, '2024-08-18 01:41:29', 1250.00, 'pending', 0),
(204, 13, '2024-08-18 01:41:41', 1250.00, 'pending', 0),
(205, 13, '2024-08-18 01:41:43', 1250.00, 'pending', 0),
(206, 12, '2024-08-18 01:42:00', 1250.00, 'pending', 0),
(207, 12, '2024-08-18 01:42:09', 1250.00, 'pending', 0),
(208, 12, '2024-08-18 01:43:14', 1250.00, 'pending', 0),
(209, 12, '2024-08-18 01:43:33', 1250.00, 'pending', 0),
(210, 12, '2024-08-18 01:44:03', 1250.00, 'pending', 0),
(211, 12, '2024-08-18 01:44:04', 1250.00, 'pending', 0),
(212, 12, '2024-08-18 01:44:09', 1250.00, 'pending', 0),
(213, 13, '2024-08-19 04:52:25', 1250.00, 'pending', 0),
(214, 13, '2024-08-19 04:52:39', 1250.00, '', 0),
(215, 13, '2024-08-19 07:07:23', 1250.00, 'pending', 0),
(216, 13, '2024-08-19 07:07:31', 1250.00, 'pending', 0),
(217, 13, '2024-08-19 07:07:49', 1250.00, 'pending', 0),
(218, 12, '2024-08-19 07:07:56', 1250.00, 'pending', 0),
(219, 13, '2024-08-19 07:09:00', 1250.00, 'pending', 0),
(220, 13, '2024-08-19 07:09:02', 1250.00, 'pending', 0),
(221, 12, '2024-08-19 07:09:24', 1250.00, '', 0),
(222, 13, '2024-08-19 07:26:46', 1250.00, 'pending', 0),
(223, 13, '2024-08-19 08:02:16', 1250.00, 'pending', 0),
(224, 13, '2024-08-19 08:02:25', 1250.00, 'pending', 0),
(225, 13, '2024-08-19 08:02:52', 1250.00, 'pending', 0),
(226, 13, '2024-08-19 08:03:16', 1250.00, 'pending', 0),
(227, 12, '2024-08-19 08:03:24', 1250.00, 'pending', 0),
(228, 13, '2024-08-19 08:03:48', 1250.00, 'pending', 0),
(229, 12, '2024-08-19 08:04:16', 1250.00, 'pending', 0),
(230, 13, '2024-08-19 08:05:38', 1250.00, 'pending', 0),
(231, 13, '2024-08-19 08:06:04', 1250.00, 'pending', 0),
(232, 13, '2024-08-19 08:06:16', 1250.00, 'pending', 0),
(233, 13, '2024-08-19 08:06:25', 1250.00, 'pending', 0),
(234, 12, '2024-08-19 08:10:05', 1250.00, 'pending', 0),
(235, 12, '2024-08-19 08:10:19', 1250.00, 'pending', 0),
(236, 13, '2024-08-19 08:10:37', 1250.00, 'pending', 0),
(237, 13, '2024-08-19 08:10:58', 1250.00, 'pending', 0),
(238, 12, '2024-08-19 08:47:00', 1250.00, 'pending', 0),
(239, 12, '2024-08-19 08:47:39', 1250.00, 'pending', 0),
(240, 12, '2024-08-19 08:47:53', 1250.00, 'pending', 0),
(241, 12, '2024-08-19 08:48:04', 1250.00, 'pending', 0),
(242, 12, '2024-08-19 08:49:18', 1250.00, 'pending', 0),
(243, 12, '2024-08-19 08:50:01', 1250.00, 'pending', 0),
(244, 12, '2024-08-19 08:50:21', 1250.00, 'pending', 0),
(245, 12, '2024-08-19 08:50:51', 1250.00, '', 0),
(246, 12, '2024-08-19 09:01:11', 1250.00, '', 0);

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
(188, 188, 38, 2, 1250.00),
(189, 189, 38, 1, 1250.00),
(190, 190, 38, 1, 1250.00),
(191, 191, 38, 1, 1250.00),
(192, 192, 38, 1, 1250.00),
(193, 193, 38, 2, 1250.00),
(194, 194, 38, 2, 1250.00),
(195, 195, 38, 2, 1250.00),
(196, 196, 38, 2, 1250.00),
(197, 197, 38, 2, 1250.00),
(198, 198, 38, 2, 1250.00),
(199, 199, 38, 2, 1250.00),
(200, 200, 38, 2, 1250.00),
(201, 201, 38, 1, 1250.00),
(202, 202, 38, 1, 1250.00),
(203, 203, 38, 1, 1250.00),
(204, 204, 38, 1, 1250.00),
(205, 205, 38, 1, 1250.00),
(206, 206, 38, 1, 1250.00),
(207, 207, 38, 1, 1250.00),
(208, 208, 38, 1, 1250.00),
(209, 209, 38, 1, 1250.00),
(210, 210, 38, 1, 1250.00),
(211, 211, 38, 1, 1250.00),
(212, 212, 38, 1, 1250.00),
(213, 213, 38, 1, 1250.00),
(214, 214, 38, 1, 1250.00),
(215, 215, 38, 1, 1250.00),
(216, 216, 38, 1, 1250.00),
(217, 217, 38, 1, 1250.00),
(218, 218, 38, 1, 1250.00),
(219, 219, 38, 1, 1250.00),
(220, 220, 38, 1, 1250.00),
(221, 221, 38, 1, 1250.00),
(222, 222, 38, 1, 1250.00),
(223, 223, 38, 1, 1250.00),
(224, 224, 38, 1, 1250.00),
(225, 225, 38, 1, 1250.00),
(226, 226, 38, 1, 1250.00),
(227, 227, 38, 1, 1250.00),
(228, 228, 38, 1, 1250.00),
(229, 229, 38, 1, 1250.00),
(230, 230, 38, 1, 1250.00),
(231, 231, 38, 1, 1250.00),
(232, 232, 38, 1, 1250.00),
(233, 233, 38, 1, 1250.00),
(234, 234, 38, 1, 1250.00),
(235, 235, 38, 1, 1250.00),
(236, 236, 38, 1, 1250.00),
(237, 237, 38, 1, 1250.00),
(238, 238, 38, 1, 1250.00),
(239, 239, 38, 1, 1250.00),
(240, 240, 38, 1, 1250.00),
(241, 241, 38, 1, 1250.00),
(242, 242, 38, 1, 1250.00),
(243, 243, 38, 1, 1250.00),
(244, 244, 38, 1, 1250.00),
(245, 245, 38, 1, 1250.00),
(246, 246, 38, 1, 1250.00);

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
(38, 'Uma Musume Pretty Derby Figure Satono Diamond Ichiban Kuji', 1250.00, 'th-11134207-7r98p-lxvehtfn2mz39b.jpg', 'สินค้าบางกล่องอาจจะมีบุบเล็กน้อยเนื่องจากการขนส่ง', 2, NULL),
(39, 'KOTOBUKIYA Uma Musume Pretty Derby \"Kitasan Black\" 1/7', 8894.00, 'sg-11134201-7rdy3-lysrhd4jybfe4a.jpg', 'Brand: Kotobukiya\r\nProduct type: Hobby\r\nProduct name: Kotobukiya Uma Musume Pretty Derby [Pressured by the approaching heat] Kitasan Black 1/7 Scale PVC Painted Figure\r\nManufacturer: Kotobukiya\r\nProduct number: PV051\r\nRelease date: April 25, 2024\r\nContents: 1/7 scale figure', 0, NULL),
(40, 'Kotobukiya Uma Musume Pretty Derby \"Dreams Are Meant To Be Pursued!\" Tokai Teio 1/7 Scale', 10000.00, 'sg-11134201-7rdy4-lysri6dspjpi03.jpg', 'Brand: Kotobukiya\r\nProduct type: Hobby\r\nProduct name: Kotobukiya Umamusume Pretty Derby [Dreams are something to aspire to!] Tokai Teio 1/7 Scale PVC Pre-painted Completed Figure PV047\r\nManufacturer: Kotobukiya\r\nProduct number: PV047\r\nRelease date: December 24, 2022\r\nContents: 1/7', 5, NULL);

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

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `user_id`, `store_name`, `store_description`, `registration_date`, `is_active`) VALUES
(4, 13, 'ไก่', 'qssqsqsq', '2024-08-16 23:48:30', 1),
(5, 13, 'ไก่', 'กกกก', '2024-08-16 23:57:34', 1),
(6, 12, 'ไก่', 'wwww', '2024-08-19 07:09:51', 1);

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
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'สถานะการใช้งาน',
  `is_seller` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `registration_date`, `is_active`, `is_seller`) VALUES
(12, 'test', 'tester', 'test@gmail.com', 0, '$2y$10$tR8jJhTpZJQUDLY.YeMGjegPmsY7ju8zzEOJWGFzl4Fz85Dyzsx.G', '2024-08-10', 1, 1),
(13, 'test', 'tester', 'test1@gmail.com', 343252342, '$2y$10$5cyRQx2MlUYFRKCM/o7lVOL5wFrBrdldJeaKmSOFtwYw.CqFOpm3W', '2024-08-10', 1, 1),
(14, 'kai', 'kai', 'test2@gmail.com', 0, '$2y$10$X3S7iUsukF76v5s7f.NyH.qBSRTlWHrfgMyUuxaPZAkyPXtAHpOEq', '2024-08-16', 1, 0);

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
(1, 13, 'ฟหกฟหกฟห', 'กฟหกฟไก', 'หฟกฟหกฟ', 'หฟกฟหก', 'หฟกกฟห', 'ประเทศไทย'),
(2, 12, 'ฟหกฟหกฟห', 'กฟหกฟไก', 'หแฟแหผปแผ', 'หฟกฟหก', 'กหฟกฟห', 'ประเทศไทกฟหกฟหย');

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
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสคำสั่งซื้อ', AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสรายการสินค้าในคำสั่งซื้อ', AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสผู้ใช้', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
