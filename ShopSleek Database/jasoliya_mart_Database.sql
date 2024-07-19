-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 28, 2023 at 06:41 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jasoliya_mart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `email`, `mobile`, `status`) VALUES
(1, 'JasoliyaMartAdmin', 'Jasoliyamart9428', 0, '', '', 1),
(2, 'Kunik_jasoliya', 'Kunik#9510', 1, 'kunikp@gmail.com', '9510787878', 1),
(3, 'Henil_1009', 'henil_j@2003', 1, 'henil2003@gmail.com', '9870768523', 1),
(4, 'Utsav#3112', 'Utsav#1231', 1, 'utsav3112@gmail.com', '9955664522', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `heading1` varchar(50) NOT NULL,
  `heading2` varchar(50) NOT NULL,
  `btn_txt` varchar(20) DEFAULT NULL,
  `btn_link` varchar(100) DEFAULT NULL,
  `image` text NOT NULL,
  `order_no` int(4) NOT NULL,
  `status` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `heading1`, `heading2`, `btn_txt`, `btn_link`, `image`, `order_no`, `status`) VALUES
(1, 'Summer Sale 2023', 'Fashion Sale', '', '', '120493216_sum_offer_banner.png', 0, 1),
(2, 'happy holi 2023', 'Biggest Sale on Electronics', 'Shopping Now', 'http://localhost/jasoliya_mart/JasolyaMart/categories.php?id=1', '757534274_holi sale banner.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Electronics', 1),
(2, 'Appliances', 1),
(3, 'Men', 1),
(4, 'Women', 1),
(5, 'Baby&Kids', 1),
(6, 'Home&Furniture', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(20) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(20) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, 'New2023', 1000, 'Rupee', 50000, 1),
(2, 'Holi2023', 20, 'Percentage', 7000, 1),
(3, 'jasoliya', 200, 'Rupee', 20000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `length` float NOT NULL,
  `breadth` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `txnid` varchar(100) NOT NULL,
  `paymentid` varchar(100) NOT NULL,
  `ship_order_id` int(11) NOT NULL,
  `ship_shipment_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `length`, `breadth`, `height`, `weight`, `txnid`, `paymentid`, `ship_order_id`, `ship_shipment_id`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(1, 2, 'Jasoliya Road,Tarsimiya ,Bhavnagar', 'bhavnagar,gujarat', '364002', 'COD', 152397, 'Success', 5, 22, 22, 22, 22, 'd810b5139deca3f768eb', '', 0, 0, 1, 1000, 'New2023', '2023-02-24 07:08:15'),
(2, 2, 'Jasoliya Road,Tarsimiya ,Bhavnagar', 'bhavnagar,gujarat', '364002', 'card', 49500, 'Success', 5, 50, 50, 100, 5, 'a6a5ef243573d7bf0408', '', 314830911, 314212023, 0, 0, '', '2023-02-24 07:44:26'),
(3, 2, 'Jasoliya Road,Tarsimiya ,Bhavnagar', 'bhavnagar,gujarat', '364002', 'card', 799, 'complete', 3, 2, 2, 2, 2, '8810258b7afe43589513eed1f3f29ce8', 'MOJO3224L05A80424154', 314830615, 314211727, 0, 0, '', '2023-02-24 08:22:17'),
(4, 2, '606-A,sahjanand ,sudama chok', 'surat', '356210', 'COD', 399, 'pending', 1, 0, 0, 0, 0, '1aa34fb06d98d851c502', '', 0, 0, 0, 0, '', '2023-02-24 02:45:04'),
(5, 2, 'near water tank,tarsamiya', 'bhavnagar,gujarat', '364002', 'card', 355, 'pending', 1, 0, 0, 0, 0, 'ce3be3d242b945f5a8dea3c128ebe431', '', 0, 0, 0, 0, '', '2023-02-24 05:44:37'),
(6, 2, 'near water tank,tarsamiya', 'bhavnagar,gujarat', '364002', 'card', 7795, 'complete', 1, 0, 0, 0, 0, 'bbc40e7e4e9740aaa1a1f27320d41a3a', 'MOJO3224105A80424359', 0, 0, 0, 0, '', '2023-02-24 05:53:33'),
(7, 2, 'near water tank,tarsamiya', 'bhavnagar,gujarat', '364002', 'card', 55527, 'complete', 1, 0, 0, 0, 0, '0154402f4c234a6fa5a847946bd00a09', 'MOJO3224N05A80424391', 0, 0, 1, 1000, 'New2023', '2023-02-24 07:08:36'),
(8, 2, '101,near water tank,near talav', 'bhavnagar,gujarat', '364002', 'COD', 1200, 'pending', 1, 0, 0, 0, 0, '22dfbe05a965444e0962', '', 0, 0, 0, 0, '', '2023-02-24 07:38:14'),
(9, 2, 'near water tank,tarsamiya', 'bhavnagar,gujarat', '364002', 'card', 1200, 'complete', 1, 0, 0, 0, 0, '4195d12463d0423ea7ae55f772a5ccb5', 'MOJO3306F05A42165652', 0, 0, 0, 0, '', '2023-03-05 08:57:41'),
(10, 2, '101,j mart,near water tank,near talav', 'bhavnagar,gujarat', '364002', 'COD', 1200, 'pending', 1, 0, 0, 0, 0, '9ba09f6de3a96ea2587e', '', 0, 0, 0, 0, '', '2023-03-13 05:36:39'),
(11, 2, '101,j mart,near water tank,near talav', 'bhavnagar,gujarat', '364002', 'COD', 1200, 'pending', 1, 0, 0, 0, 0, 'c327f9d20ac57405fc2c', '', 0, 0, 0, 0, '', '2023-03-13 05:42:21'),
(12, 2, '101,j mart,near water tank,near talav', 'bhavnagar,gujarat', '364002', 'COD', 2400, 'pending', 1, 0, 0, 0, 0, 'abdd540678e379e248a3', '', 0, 0, 0, 0, '', '2023-03-13 05:46:55'),
(13, 2, '101,j mart,near water tank,near talav', 'bhavnagar', '364002', 'card', 17303, 'complete', 1, 0, 0, 0, 0, '684e1cbd2e4941e4a3f4040e4d164bda', 'MOJO3325W05A65889411', 0, 0, 2, 4326, 'holi2023', '2023-03-25 04:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 20, 2, 69500),
(2, 1, 14, 3, 799),
(3, 1, 7, 1, 12000),
(4, 2, 9, 1, 49500),
(5, 3, 14, 1, 799),
(6, 4, 12, 1, 399),
(7, 5, 25, 1, 355),
(8, 6, 22, 1, 7795),
(9, 7, 15, 3, 299),
(10, 7, 25, 3, 355),
(11, 7, 22, 7, 7795),
(12, 8, 26, 1, 1200),
(13, 9, 26, 1, 1200),
(14, 10, 26, 1, 1200),
(15, 11, 26, 1, 1200),
(16, 12, 26, 2, 1200),
(17, 13, 25, 6, 355),
(18, 13, 10, 1, 19499);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` text NOT NULL,
  `short_desc` text NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(4) NOT NULL,
  `meta_title` varchar(200) NOT NULL,
  `meta_desc` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `added_by` int(4) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `added_by`, `status`) VALUES
(1, 1, 1, 'HP 14s, 11th Gen Intel Core i3-1115G4, 8GB RAM/256GB SSD 14-inch(35.6 cm) Micro-Edge, Anti-Glare, FHD Laptop/Alexa Built-in/Win 11/Intel UHD Graphics/Dual Speakers/ MSO 2021/1.41 Kg, 14s-dy2507TU', 47206, 37990, 120, '793395834_41h8nAsiOQ.png', 'Processor:Intel Core i3-1115G4(up to 4.1 GHz with Intel Turbo Boost Technology(2g),6 MB L3 cache, 2 cores)|Memory: 8 GB DDR4-3200 SDRAM (1 x 8 GB)| Storage: 256 GB PCIe NVMe M.2 SSD\r\nDisplay & Graphics : 35.6 cm (14\") diagonal, FHD, micro-edge,anti-glare, 250 nits, 141 ppi, 45%NTSC |Graphics: Intel UHD Graphics\r\nOperating System & Preinstalled Software: Windows 11 Home 64 Plus Single', 'Do Check Partner offer section for Exciting offers from HP\r\nProcessor:Intel Core i3-1115G4(up to 4.1 GHz with Intel Turbo Boost Technology(2g),6 MB L3 cache, 2 cores)|Memory: 8 GB DDR4-3200 SDRAM (1 x 8 GB)| Storage: 256 GB PCIe NVMe M.2 SSD\r\nDisplay & Graphics : 35.6 cm (14\") diagonal, FHD, micro-edge,anti-glare, 250 nits, 141 ppi, 45%NTSC |Graphics: Intel UHD Graphics\r\nOperating System & Preinstalled Software: Windows 11 Home 64 Plus Single Language | Microsoft Office Home & Student 2021| McAfee LiveSafe (30 days free trial as default) |Pre-installed Alexa built-in- Your life simplified with Alexa. Just ask Alexa to check your calendar, create to-do lists, shopping lists, play music, set reminders, get latest news and control smart home.\r\nPorts: 1 SuperSpeed USB Type-C 5Gbps signaling rate, 2 SuperSpeed USB Type-A 5Gbps signaling rate, 1 headphone/microphone combo, 1 AC smart pin, 1 HDMI 1.4b', 0, 'HP 14s, 11th Gen Intel Core i3-1115G4, 8GB RAM/256GB SSD 14-inch(35.6 cm)', 'HP 14s, 11th Gen Intel Core i3-1115G4, 8GB RAM/256GB SSD 14-inch(35.6 cm)', 'HP 14s, 11th Gen Intel Core i3-1115G4, 8GB RAM/256GB SSD 14-inch(35.6 cm) laptops laptop', 1, 1),
(2, 1, 1, 'Lenovo IdeaPad Slim 5 Intel Core i5 11th Gen 15.6\" (39.62cm) FHD IPS Thin & Light Laptop (16GB/512GB SSD/Windows 11/Office 2021/Backlit/FPR/3months Game Pass/Graphite Grey/1.66Kg), 82FG01B5IN', 97890, 59418, 80, '840209337_61WNxdAeAoL._SX522_.jpg', 'Processor: 11th Gen Intel Tiger Lake Core i5-1135G7 | Speed: 2.4 GHz (Base) - 4.2 GHz (Max) | 4 Cores | 8MB Cache\r\nOS and Software: Pre-Loaded Windows 11 Home with Lifetime Validity', 'Processor: 11th Gen Intel Tiger Lake Core i5-1135G7 | Speed: 2.4 GHz (Base) - 4.2 GHz (Max) | 4 Cores | 8MB Cache\r\nOS and Software: Pre-Loaded Windows 11 Home with Lifetime Validity | MS Office Home and Student 2021 | Xbox GamePass Ultimate 3-month subscription*\r\nMemory, Storage & Graphics: 16GB RAM DDR4-3200 | 512 GB SSD | Integrated Intel Iris Xe Graphics\r\nDisplay: 15.6\" FHD (1920x1080) | Brightness: 300 nits | Anti-Glare | IPS Technology\r\nDesign: 1.79 cm Thin and 1.66 kg Light | Aluminium Material Top | Backlit Keyboard | Fingerprint Reader\r\nBattery Life: 8 Hours | 57Wh Battery | Rapid Charge (Up to 80% in 1 Hour)\r\nCamera (Built in) & Audio: HD 720p (1.0MP) Camera | Fixed Focus | Privacy Shutter | Integrated Dual Array Microphone | 2 x 2W Stereo Speakers | HD Audio | Dolby Audio', 0, 'Lenovo IdeaPad Slim 5 Intel Core i5 11th Gen 15.6\" (39.62cm)', 'Lenovo IdeaPad Slim 5 Intel Core i5 11th Gen 15.6\" (39.62cm) FHD IPS Thin & Light Laptop (16GB/512GB SSD/Windows 11', 'Lenovo IdeaPad Slim 5 Intel Core i5 11th Gen 15.6\" (39.62cm) FHD IPS Thin & Light Laptop (16GB/512GB SSD/Windows 11 laptop', 1, 1),
(3, 1, 1, 'ASUS VivoBook 15 (2021), 15.6-inch (39.62 cm) HD, Dual Core Intel Celeron N4020, Thin and Light Laptop (4GB RAM/256GB SSD/Integrated Graphics/Windows 11 Home/Transparent Silver/1.8 Kg), X515MA-BR011W', 33990, 25990, 16, '783408962_71S8U9VzLTL._SX679_.jpg', 'Processor: Intel Celeron N4020, 1.1 GHz base speed, Up to 2.8 GHz Turbo Speed, 2 cores, 2 Threads, 4MB Cache\r\nMemory & Storage: 4GB SO-DIMM DDR4 2400MHz RAM, Support up to 8GB using 1x SO-DIMM Slot', 'Processor: Intel Celeron N4020, 1.1 GHz base speed, Up to 2.8 GHz Turbo Speed, 2 cores, 2 Threads, 4MB Cache\r\nMemory & Storage: 4GB SO-DIMM DDR4 2400MHz RAM, Support up to 8GB using 1x SO-DIMM Slot with | Storage: 256GB M.2 NVMe PCIe SSD\r\nDisplay: 15.6-inch (39.62 cms), LED-Backlit LCD, HD (1366 x 768) 16:9, 220nits, NanoEdge bezel, Anti-Glare Plane with 45% NTSC, 82% Screen-To-Body Ratio\r\nOperating System: Pre-loaded Windows 11 Home with lifetime validity\r\nDesign & battery: Up to 19.9mm Thin | NanoEdge Bezels | Thin and Light Laptop | Laptop weight: 1.8 kg | 37WHrs, 2-cell Li-ion battery | Up to 6 hours battery life ;Note: Battery life depends on conditions of usage\r\nKeyboard: Chiclet Keyboard with 1.4mm Key Travel\r\nI/O Ports: 1x HDMI 1.4 | 1x 3.5mm Combo Audio Jack | 1x USB 3.2 Gen 1 Type-A | 1x USB 3.2 Gen 1 Type-C | 2x USB 2.0 Type-A\r\nOther: Wi-Fi 5 (802.11ac) (Dual band) 1*1 | VGA webcamera without privacy shutter | Built-in speaker | Built-in microphone', 0, 'ASUS VivoBook 15 (2021), 15.6-inch (39.62 cm) HD, Dual Core Intel Celeron N4020', 'ASUS VivoBook 15 (2021), 15.6-inch (39.62 cm) HD, Dual Core Intel Celeron N4020, Thin and Light Laptop (4GB RAM/256GB SSD/Integrated Graphics/Windows 11', 'ASUS VivoBook 15 (2021), 15.6-inch (39.62 cm) HD, Dual Core Intel Celeron N4020, Thin and Light Laptop (4GB RAM/256GB SSD/Integrated Graphics/Windows 11 laptop', 1, 1),
(4, 1, 1, 'Honor MagicBook 15, AMD Ryzen 5 5500U 15.6-inch (39.62 cm) FHD IPS Anti-Glare Thin and Light Laptop (8GB/256GB PCIe SSD/Windows 11/ Metal Body/Fingerprint Login/1.54Kg), Gray, BohrM-WDQ9CHNE', 55999, 39990, 40, '326756690_31bgVrI5qoL._SX300_SY300_QL70_FMwebp_.jpg', 'Honor Magicbook 15 has Premium Aluminium Metal Body with 16.9MM Thickness, 5.3 MM Narrow Bezels and the weight of the laptop is only 1.54kg, which allows you to carry it easily, making it very convenient for travel and work', '? Stylish Appearance?Honor Magicbook 15 has Premium Aluminium Metal Body with 16.9MM Thickness, 5.3 MM Narrow Bezels and the weight of the laptop is only 1.54kg, which allows you to carry it easily, making it very convenient for travel and work\r\n?Eye Comfort Mode?It has 15.6” FHD Full View IPS Anti-Glare Screen. And has the Support of TÜV Rheinland Low Blue Light Certification, and Flicker Free Certification. It Protects your eyes at all times, and your eyes will no longer be fatigued when working\r\n? 65W Type-C Fast Charging ?HONOR MagicBook 15 has a large battery capacity of 56 Wh, which can power local video watching for about 11.5 hours. The 65W portable charger can supplement about 65% battery capacity for HONOR MagicBook 15 in 1 hour.\r\n?Fast Speed Laptop?: HONOR Magicbook 15 Comes with AMD RyzenTM 5 5500U processor, 6-core 12 threads, speed 2.1GHz; Up to 4.0GHz, with AMD Radeon graphics card & 8GB DDR4 RAM, 256GB PCIe SSD, making it perfect for your office and study needs\r\n?Security and Privacy?2-in-1 Fingerprint Power Button save you the trouble of entering passwords. Webcam: The HD camera is hidden on the keyboard button. It is turned off when not in use\r\n?Operating System? Pre-Loaded Windows 11 Home 64-bit', 0, 'Honor MagicBook 15, AMD Ryzen 5 5500U 15.6-inch (39.62 cm) FHD', 'Honor MagicBook 15, AMD Ryzen 5 5500U 15.6-inch (39.62 cm) FHD IPS Anti-Glare Thin and Light Laptop', 'Honor MagicBook 15, AMD Ryzen 5 5500U 15.6-inch (39.62 cm) FHD IPS Anti-Glare Thin and Light Laptop', 1, 1),
(5, 1, 1, 'Dell Inspiron 3520 Laptop,12th Gen Intel Core i5-1235U, Windows 11 + MSO\'21, 8GB, 1TB HDD+ 56GB SSD, 15.6\" (39.62Cms) FHD WVA AG 120Hz 250 nits, Backlit KB, Silver (D560917WIN9S, 1.65Kgs)', 79928, 60500, 55, '998494410_51l8GSWUUvL._SX522_.jpg', 'Processor: Intel i5-1235U (3.30 GHz up to 4.40 GHz), 10 Cores & 12MB Cache\r\nRAM & Storage: 8GB, 8Gx1, DDR4, 2666MHz Ach & 1TB HDD + 256GB SSD', 'Processor: Intel i5-1235U (3.30 GHz up to 4.40 GHz), 10 Cores & 12MB Cache\r\nRAM & Storage: 8GB, 8Gx1, DDR4, 2666MHz Ach & 1TB HDD + 256GB SSD\r\nDisplay & Graphics: 15.6\" FHD WVA AG 120Hz 250 nits Narrow Border & Integrated Graphics\r\nKeyboard & Warranty: Backlit Keyboard & 1 Year Onsite Hardware Service\r\nPorts: 2 USB 3.2 Gen 1 ports, 1 USB 2.0 port, 1 Headset jack, 1 HDMI 1.4 port*, 1 M.2 2230/2280 slot for solid-state drive, 1 SD 3.0 card slot', 1, 'Dell Inspiron 3520 Laptop,12th Gen Intel Core i5-1235U, Windows 11 + MSO\'21, 8GB, 1TB HDD+ 56GB SSD', 'Dell Inspiron 3520 Laptop,12th Gen Intel Core i5-1235U, Windows 11 + MSO\'21, 8GB, 1TB HDD+ 56GB SSD', 'Dell Inspiron 3520 Laptop,12th Gen Intel Core i5-1235U, Windows 11 + MSO\'21, 8GB, 1TB HDD+ 56GB SSD', 1, 1),
(6, 1, 1, 'Apple 2020 MacBook Air Laptop M1 chip, 13.3-inch/33.74 cm Retina Display, 8GB RAM, 256GB SSD Storage, Backlit Keyboard, FaceTime HD Camera, Touch ID. Works with iPhone/iPad; Space Grey', 92600, 86900, 30, '990334503_71an9eiBxpL._SX679_.jpg', 'All-Day Battery Life – Go longer than ever with up to 18 hours of battery life.\r\nPowerful Performance – Take on everything from professional-quality editing to action-packed gaming with ease.', 'All-Day Battery Life – Go longer than ever with up to 18 hours of battery life.\r\nPowerful Performance – Take on everything from professional-quality editing to action-packed gaming with ease. The Apple M1 chip with an 8-core CPU delivers up to 3.5x faster performance than the previous generation while using way less power.\r\nSuperfast Memory – 8GB of unified memory makes your entire system speedy and responsive. That way it can support tasks like memory-hogging multitab browsing and opening a huge graphic file quickly and easily.\r\nStunning Display – With a 13.3-inch/33.74 cm Retina display, images come alive with new levels of realism. Text is sharp and clear, and colors are more vibrant.\r\nWhy Mac – Easy to learn. Easy to set up. Astoundingly powerful. Intuitive. Packed with apps to use right out of the box. Mac is designed to let you work, play, and create like never before.\r\nSimply Compatible – All your existing apps work, including Adobe Creative Cloud, Microsoft 365, and Google Drive. Plus you can use your favorite iPhone and iPad apps directly on macOS. Altogether you’ll have access to the biggest collection of apps ever for Mac. All available on the App Store.\r\nEasy to Learn – If you already have an iPhone, MacBook Air feels familiar from the moment you turn it on. And it works perfectly with all your Apple devices. Use your iPad to extend the workspace of your Mac, answer texts and phone calls directly on your Mac, and more.', 0, 'Apple 2020 MacBook Air Laptop M1 chip, 13.3-inch/33.74 cm Retina Display, 8GB RAM', 'Apple 2020 MacBook Air Laptop M1 chip, 13.3-inch/33.74 cm Retina Display, 8GB RAM', 'Apple 2020 MacBook Air Laptop M1 chip, 13.3-inch/33.74 cm Retina Display, 8GB RAM', 1, 1),
(7, 2, 2, 'Godrej 185 L 2 Star Direct Cool Single Door Refrigerator (RD EDGE 200B 23 WRF PP BL, Pep Blue, Large Vegetable Tray, 2022 Model)', 17330, 12000, 23, '738858811_618ikeOHFaL._SX679_.jpg', 'The star rating changes are as per BEE guidelines on or before 1st Jan 2023\r\nDirect- Cool Refrigerator with Capacity: 185 litres, suitable for a small family', 'The star rating changes are as per BEE guidelines on or before 1st Jan 2023\r\nDirect- Cool Refrigerator with Capacity: 185 litres, suitable for a small family\r\nEnergy rating: 2 star, Annual energy consumption: 210 Kilowatt Hours (Please refer energy label on product page or contact brand for more details)\r\n63 years of thoughtful appliances: Proudly Made in India\r\nWarranty: 1 year on product, 10 years on compressor\r\nShelf type: Strong wired shelves that ensures durability and withstands large vessels and bowls\r\n2.25L Aqua Space - Larger 2.25 L space in the door to store the extra large bottles of water or cola easily', 1, 'Godrej 185 L 2 Star Direct Cool Single Door Refrigerator', 'Godrej 185 L 2 Star Direct Cool Single Door Refrigerator (RD EDGE 200B 23 WRF PP BL, Pep Blue, Large Vegetable Tray, 2022 Model)', 'Godrej 185 L 2 Star Direct Cool Single Door Refrigerator (RD EDGE 200B 23 WRF PP BL, Pep Blue, Large Vegetable Tray, 2022 Model)', 1, 1),
(8, 2, 2, 'LG 688 L Frost Free Smart Inverter Side-by-Side Refrigerator (GC-B257KQDV, Dark Graphite Steel | Multi Digital Sensors and Express Freezing)', 120600, 77000, 20, '899618631_81EtiF0kHbL._SX679_.jpg', 'side by Side Frost Free Refrigerator: Premium Refrigerators with auto-defrost function to prevent ice build-up\r\n688 L Gross Capacity: Suitable for the daily requirements of a family with 5 or more members', 'Side by Side Frost Free Refrigerator: Premium Refrigerators with auto-defrost function to prevent ice build-up\r\n688 L Gross Capacity: Suitable for the daily requirements of a family with 5 or more members| Freezer capacity: 264 L, Fresh food capacity: 424 L | Please note that Left side of the refrigerator is Freezer & right side is regular Fridge\r\nManufacturer Warranty: 1 year on Product and 10 years on compressor (T&C)\r\nLG Frost Free Refrigerators with cutting edge Smart Inverter Compressor technology that takes energy efficiency to another level and helps you save more.\r\nA convenient and accessible place inside your refrigerator, where you can keep your dairy items. With optimal environment and temperature, the place is perfect for their storage.', 0, 'LG 688 L Frost Free Smart Inverter Side-by-Side Refrigerator', 'LG 688 L Frost Free Smart Inverter Side-by-Side Refrigerator (GC-B257KQDV, Dark Graphite Steel | Multi Digital Sensors and Express Freezing)', 'LG 688 L Frost Free Smart Inverter Side-by-Side Refrigerator (GC-B257KQDV, Dark Graphite Steel | Multi Digital Sensors and Express Freezing)', 1, 1),
(9, 2, 2, 'AmazonBasics 564 L Frost Free Side-by-Side Refrigerator with Water Dispenser (Silver Steel Finish)', 74999, 49500, 55, '830033866_71DuofqGR8L._SX679_.jpg', 'The star rating changes are as per BEE guidelines on or before 1st Jan 2023;Side-by-side refrigerator with Water Dispenser and Auto Defrost technology that prevents excess ice build up automatically', 'The star rating changes are as per BEE guidelines on or before 1st Jan 2023;Side-by-side refrigerator with Water Dispenser and Auto Defrost technology that prevents excess ice build up automatically\r\n564 L capacity: Suitable for the daily requirements of a family with 5 or more members; Please note that Left side of the refrigerator is Freezer & right side is regular Fridge;Warranty: 1 year on product & 5 years on compressor for malfunction arising from manufacturing defects. For claiming warranty, A) Go to \'Your orders\' section, B) select the product, C) Click on Get product support and D) schedule an appointment. No need to call anyone and wait in a queue. Hassle free process. Paperless Experience with complete visibility to every step of your warranty claim.\r\nMulti airflow system ensures smooth airflow into the storage compartments for uniform cooling; Comes with in-built LED Display Panel that allows instant control and access to the temperature settings, making it convenient and easy to use\r\nOne gas refill/top-up will be provided free of cost during the first year of warranty post which they will be chargeable\r\nModel Name: 564 L Ab2019rf005; Warranty Description: Free Warranty - 1 Year On Product & 5 Years On Compressor For Malfunction Arising From Manufacturing Defects. For Claiming Warranty, A) Go To \'Your Orders\' Section, B) Select The Product, C) Click On Get Product Support And D) Schedule An Appointment. No Need To Call Anyone And Wait In A Queue. Hassle Free Process. Paperless Experience With Complete Visibility To Every Step Of Your Warranty Claim; Shelf Type: Toughened Glass; Specification Met: Energy Star', 0, 'AmazonBasics 564 L Frost Free Side-by-Side Refrigerator', 'AmazonBasics 564 L Frost Free Side-by-Side Refrigerator with Water Dispenser (Silver Steel Finish)', 'AmazonBasics 564 L Frost Free Side-by-Side Refrigerator with Water Dispenser (Silver Steel Finish)', 1, 1),
(10, 2, 3, 'IFB 6.5 kg 5 Star Fully Automatic Top Load Silver  (TL-RDS/RDSS 6.5 kg Aqua)', 20999, 19499, 5, '234123664_41UO6bZnK1L._SY445_SX342_QL70_FMwebp_.png', 'This IFB washing machine ensures that your clothes look fresh and new after every single wash.', 'This IFB washing machine ensures that your clothes look fresh and new after every single wash. Packed with features, this washing machine ensures that your garments are always well taken care of. The Aqua Fresh feature keeps your clothes as new as ever, while the Triadic Pulsator helps wash away even the most stubborn dirt on your garments in 3 simple steps. The Crescent Moon drum protects your clothes from being damaged. The machine also comes with a voltage protection feature that ensures the longevity of the appliance.', 0, 'IFB 6.5 kg 5 Star Fully Automatic Top Load Silver', 'IFB 6.5 kg 5 Star Fully Automatic Top Load Silver  (TL-RDS/RDSS 6.5 kg Aqua)', 'IFB 6.5 kg 5 Star Fully Automatic Top Load Silver  (TL-RDS/RDSS 6.5 kg Aqua)', 1, 1),
(11, 5, 4, 'Mirana USB Rechargeable ATV Car with Nitrous Boost | RC Toy and Gift for Kids and Boys  (Fiery Red)', 1999, 1199, 125, '268102726_usb-rechargeable-atv-car-with-nitrous-boost-rc-toy-and-gift-for-original-imagfhuk3pygzwge.png', 'The 2WD RC ATV is a great value for money smart toy that is loaded with unique features', 'The 2WD RC ATV is a great value for money smart toy that is loaded with unique features. It has a real car feel and is equipped with 2 headlights and taillights on the front and rear respectively. Want to know more? You can operate the RC car with proper hand-eye coordination. It has two wheels at the front for turning the vehicle and two rear wheels for acceleration purposes. This Made in India product comes with USB Rechargeable batteries that roll up to 30 minutes with a full charge of about 60 minutes.', 1, 'Mirana USB Rechargeable ATV Car with Nitrous Boost', 'Mirana USB Rechargeable ATV Car with Nitrous Boost | RC Toy and Gift for Kids and Boys  (Fiery Red)', 'Mirana USB Rechargeable ATV Car with Nitrous Boost | RC Toy and Gift for Kids and Boys  (Fiery Red)', 1, 1),
(12, 6, 5, 'CG Homes 160 TC Microfiber Double Printed Flat Bedsheet  (Pack of 1, Blue Beige Multi)', 1500, 399, 50, '649165988_printed-vo-626-flat-cg-homes-original-imagjwvf9zbha3de.jpg', 'CG Homes 160 TC Microfiber Double Printed Flat Bedsheet', 'CG Homes 160 TC Microfiber Double Printed Flat Bedsheet  (Pack of 1, Blue Beige Multi)', 1, 'CG Homes 160 TC Microfiber Double Printed Flat Bedsheet', 'CG Homes 160 TC Microfiber Double Printed Flat Bedsheet  (Pack of 1, Blue Beige Multi)', 'CG Homes 160 TC Microfiber Double Printed Flat Bedsheet  (Pack of 1, Blue Beige Multi)', 1, 1),
(13, 3, 6, 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 1899, 610, 58, '482534279_618Wek95laS._UY879_.jpg', 'Care Instructions: Machine Wash\r\nFit Type: Slim Fit\r\nFabric - 100% Premium Cotton, Pre-Washed for extremely soft finish and Guaranteed 0% Shrinkage Post Washing', 'Care Instructions: Machine Wash\r\nFit Type: Slim Fit\r\nFabric - 100% Premium Cotton, Pre-Washed for extremely soft finish and Guaranteed 0% Shrinkage Post Washing\r\nStyle - Enhance your look by wearing this Casual Stylish Men\'s shirt, Team it with a pair of tapered denims Or Solid Chinos and Loafers for a fun Smart Casual look\r\nFit Type - Modern Slim Fit. Size chart - S-38, M-40, L-42, XL-44, XXL-46. Please Check the Size chart before Ordering for the Perfect Fit\r\nAbout the Brand DENNIS LINGO - Finding Basic Menswear for daily use can be hard among todays Over priced Fast fashion world, where trends change daily. That’s why we started Dennis Lingo, to create a one stop shop for premium essential clothing for everyday use at lowest prices and bring Basics back in trend.', 0, 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves', 'Dennis Lingo Men\'s Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves shirts man men', 1, 1),
(14, 3, 6, 'Dennis Lingo Men\'s Shirt | Cotton Casual Shirt with Spread Collar & Full Sleeves', 1899, 799, 20, '954595643_61qcnAHZP3L._UX679_.jpg', 'Care Instructions: Machine Wash\r\nFit Type: Slim Fit\r\nFabric - 100% Premium Cotton, Pre-Washed for extremely soft finish and Guaranteed 0% Shrinkage Post Washing', 'Care Instructions: Machine Wash\r\nFit Type: Slim Fit\r\nFabric - 100% Premium Cotton, Pre-Washed for extremely soft finish and Guaranteed 0% Shrinkage Post Washing\r\nStyle - This Casual Checkered shirt has Slim collar,1 Patch Pocket on chest and can be worn to college, Party or casual events\r\nFit Type - Modern Slim Fit: A Good balance between Wearing Comfort and Slim Fit look. Size chart - S-38, M-40, L-42, XL-44, XXL-46. Please Check the Size chart before Ordering for the Perfect Fit\r\nAbout the Brand DENNIS LINGO - Finding Basic Menswear for daily use can be hard among todays Over priced Fast fashion world, where trends change daily. That’s why we started Dennis Lingo, to create a one stop shop for premium essential clothing for everyday use at lowest prices and bring Basics back in trend.\r\nStyle Tip - Enhance your look by wearing this Casual Stylish shirt by Teaming it with a pair of Black Denims , plain tshirt inside and sneakers for a fun Casual look', 1, 'Dennis Lingo Men\'s Shirt', 'Dennis Lingo Men\'s Shirt', 'Dennis Lingo Men\'s Shirt men t-shirt', 1, 1),
(15, 4, 7, 'Women Fit and Flare White, Black Dress', 899, 299, 20, '495994861_onqxl-patta-dress-fashion2wear-original-imaggn5znzakrffv.png', 'Women Fit and Flare White, Black Dress', 'Women Fit and Flare White, Black Dress', 1, 'Women Fit and Flare White, Black Dress', 'Women Fit and Flare White, Black Dress', 'Women Fit and Flare White, Black Dress', 1, 1),
(16, 1, 1, 'HP 15s, 12th Gen Intel Core i5 16GB RAM/512GB SSD 15.6-inch(39.6 cm) Micro-Edge Anti-Glare FHD Laptop/Win 11/Intel Iris Xe Graphics/Dual Speakers/Alexa/Backlit KB/MSO/Fast Charge, 15s- fq5112TU', 75990, 62900, 66, '257610935_81aRc2uLLWL._SX522_.jpg', 'Processor: Intel Core i5-1235U (up to 4.4 GHz with Intel Turbo Boost Technology(2g),12 MB L3 cache, 10 cores, 12 threads|Memory:16 GB DDR4-3200 MHz RAM (2 x 8 GB) Upto 16 GB DDR4-3200 MHz RAM (2 x 8 GB)| Storage:512 GB PCIe NVMe M.2 SSD', 'Do Check Partner offer section for Exciting offers from HP; Processor: Intel Core i5-1235U (up to 4.4 GHz with Intel Turbo Boost Technology(2g),12 MB L3 cache, 10 cores, 12 threads|Memory:16 GB DDR4-3200 MHz RAM (2 x 8 GB) Upto 16 GB DDR4-3200 MHz RAM (2 x 8 GB)| Storage:512 GB PCIe NVMe M.2 SSD\r\nDisplay & Graphics : 39.6 cm (15.6\") diagonal, FHD, micro-edge, anti-glare, UWVA, 250 nits, 141 ppi|Graphics: Intel Iris Xe Graphics\r\nOperating System & Preinstalled Software: Windows 11 Home 64 Plus Single Language | Microsoft Office Home & Student 2021| McAfee LiveSafe (30 days free trial as default) |Pre-installed Alexa built-in- Your life simplified with Alexa. Just ask Alexa to check your calendar, create to-do lists, shopping lists, play music, set reminders, get latest news and control smart home.\r\nPorts & Networking: 1 SuperSpeed USB Type-C 5Gbps signaling rate, 2 SuperSpeed USB Type-A 5Gbps signaling rate, 1 headphone/microphone combo, 1 AC smart pin, 1 HDMI 1.4b| Networking: Realtek RTL8821CE-M 802.11a/b/g/n/ac (1x1) Wi-Fi and Bluetooth 4.2 combo, MU-MIMO supported, Miracast compatible\r\nResolution: 1280 X 720; Form Factor: Netbook; Human Interface Input: Numeric Keypadmicrophonekeyboard; Software Included: Microsoft Office 365; Display Resolution Maximum: 1920 X 1080', 1, 'HP 15s, 12th Gen Intel Core i5 16GB RAM/512GB SSD 15.6-inch(39.6 cm) Micro-Edge Anti-Glare FHD Laptop', 'HP 15s, 12th Gen Intel Core i5 16GB RAM/512GB SSD 15.6-inch(39.6 cm) Micro-Edge Anti-Glare FHD Laptop', 'HP 15s, 12th Gen Intel Core i5 16GB RAM/512GB SSD 15.6-inch(39.6 cm) Micro-Edge Anti-Glare FHD Laptop', 1, 1),
(17, 1, 1, 'HP Pavilion 14 AMD Ryzen 5 14 inches FHD IPS Micro-Edge Anti-Glare Display Laptop (8GB/512GB SSD/Backlit KB/Alexa/B&O Audio/Fast Charge/720p Camera/Windows 11 ready/3D Metal Design/1.41kg/14-ec0035AU)', 65900, 52500, 20, '695251287_712G0mwN3ZL._SX679_.jpg', 'Processor: AMD Ryzen 5 5500U (up to 4.0 GHz max boost clock, 8 MB L3 cache, 6 cores, 12 threads) | Memory: 8 GB DDR4-3200 MHz RAM (2 x 4 GB) | Storage: 512 GB PCIe NVMe M.2 SSD', 'Processor: AMD Ryzen 5 5500U (up to 4.0 GHz max boost clock, 8 MB L3 cache, 6 cores, 12 threads) | Memory: 8 GB DDR4-3200 MHz RAM (2 x 4 GB) | Storage: 512 GB PCIe NVMe M.2 SSD\r\nOperating System & Pre-installed Software: Pre-loaded Windows 10 Home with lifetime validity, FREE Upgrade to Windows 11* (when available, refer product description for more details) | Microsoft Office Home & Student 2019\r\nDisplay & Graphics: 35.6 cm (14\") diagonal, FHD (1920 x 1080), IPS, micro-edge, anti-glare, 250 nits, 45% NTSC | AMD Radeon Graphics\r\nPorts: 1 SuperSpeed USB Type-C 10Gbps (USB Power Delivery, DisplayPort 1.4, HP Sleep and Charge), 2 SuperSpeed USB Type-A 5Gbps, 1 headphone/microphone combo, 1 AC smart pin, 1 HDMI 2.0 | 3-cell, 43 Wh Li-ion Battery, Supports battery fast charge: approximately 50% in 30 minutes\r\nFeatures: Camera: HP Wide Vision 720p HD camera | Microphone: Integrated Dual array digital microphones| Audio: Dual Speakers, Audio by B&O | Keyboard: Full-size backlit keyboard | Alexa Built In | Networking: Realtek Wi-Fi 6 (2x2) and Bluetooth 5.2 combo (Supporting Gigabit data rate)\r\nIn an unlikely case of product quality related issue, we may ask you to reach out to brand’s customer service support and seek resolution. We will require brand proof of issue to process replacement request.', 1, 'HP Pavilion 14 AMD Ryzen 5 14 inches FHD IPS Micro-Edge Anti-Glare Display Laptop (8GB/512GB SSD', 'HP Pavilion 14 AMD Ryzen 5 14 inches FHD IPS Micro-Edge Anti-Glare Display Laptop (8GB/512GB SSD', 'HP Pavilion 14 AMD Ryzen 5 14 inches FHD IPS Micro-Edge Anti-Glare Display Laptop (8GB/512GB SSD', 1, 1),
(18, 1, 1, 'Acer Nitro 5 Gaming Laptop/ 12th Gen Intel Core i5-12500H Processor 12 core/ 15.6\"(39.6cms) FHD 144Hz Display (8GB/512GB SSD/RTX 3050 Graphics/Windows 11 Home/RGB), AN515-58 + Xbox Game Pass Ultimate', 85999, 79000, 10, '666958478_91U5Ler19jL._SX679_.jpg', 'Processor: Intel Core i5-12500H processor - 12 cores, max turbo up to 4.50 Ghz | RAM : 8 GB of DDR4 system memory, upgradable to 32 GB using two soDIMM module\r\nDisplay : 15.6\" display with IPS (In-Plane Switching) technology, Full HD 1920 x 1080, Acer ComfyView LED-backlit TFT LCD, 16:9 aspect ratio, supporting 144 Hz refresh rate', 'Processor: Intel Core i5-12500H processor - 12 cores, max turbo up to 4.50 Ghz | RAM : 8 GB of DDR4 system memory, upgradable to 32 GB using two soDIMM module\r\nDisplay : 15.6\" display with IPS (In-Plane Switching) technology, Full HD 1920 x 1080, Acer ComfyView LED-backlit TFT LCD, 16:9 aspect ratio, supporting 144 Hz refresh rate\r\nGraphics : NVIDIA GeForce RTX 3050 with 4 GB of GDDR6 memory | Fully optimized for Max Graphics Performance; Storage : SSD : 512 GB, PCIe Gen4, 16 Gb/s, NVMe | OS : Windows 11 Home 64-bit\r\nPorts: 1 x USB 3.2 Gen 2 port with power-off charging, 1 x USB 3.2 Gen 2 port, 1 x USB Type-C port (USB 3.2 Gen 2) (Thunderbolt 4), 1 x USB 3.2 Gen 1 port | Features: 4 zone RGB keyboard with dedicated NitroSense key | Chilled performance with Quad exhaust design\r\nNative Resolution: 1920 X 1080 Pixels; Resolution: 1080p', 0, 'Acer Nitro 5 Gaming Laptop/ 12th Gen Intel Core i5-12500H Processor 12 core', 'Acer Nitro 5 Gaming Laptop/ 12th Gen Intel Core i5-12500H Processor 12 core', 'Acer Nitro 5 Gaming Laptop/ 12th Gen Intel Core i5-12500H', 1, 1),
(19, 1, 1, 'Dell Vostro 3520 Laptop, Intel Core i5-1235U, 8GB, 512 GB SSD, 15.6\" (39.62Cms) FHD WVA AG 120Hz 250 nits, Win 11 + MSO\'21, Titan Grey (ICC-D586008WIN8, 1.65KGs)', 80000, 68000, 25, '661920449_61+TuJc8K-L._SX679_.jpg', 'Processor: i5-1235U (3.30 GHz up to 4.40 GHz) 10 Cores, 12MB Cache\r\nRAM & Storage: 8GB, 8Gx1, DDR4, 2666MHz & 512GB SSD\r\nDisplay & Keyboard: 15.6\" FHD WVA AG 120Hz 250 nits Narrow Border & Standard Keyboard', 'Processor: i5-1235U (3.30 GHz up to 4.40 GHz) 10 Cores, 12MB Cache\r\nRAM & Storage: 8GB, 8Gx1, DDR4, 2666MHz & 512GB SSD\r\nDisplay & Keyboard: 15.6\" FHD WVA AG 120Hz 250 nits Narrow Border & Standard Keyboard\r\nPorts: 2 USB 3.2 Gen 1 ports, 1 USB 2.0 port, 1 Headset jack, 1 HDMI 1.4 port, 1 SD 3.0 card slot\r\nWi-fi & Bluetooth: 802.11ac 1x1 WiFi and Bluetooth', 0, 'Dell Vostro 3520 Laptop, Intel Core i5-1235U, 8GB, 512 GB SSD, 15.6\" (39.62Cms)', 'Dell Vostro 3520 Laptop, Intel Core i5-1235U, 8GB, 512 GB SSD, 15.6\" (39.62Cms)', 'Dell Vostro 3520 Laptop, Intel Core i5-1235U, 8GB, 512 GB SSD, 15.6\" (39.62Cms)', 1, 1),
(20, 1, 1, 'Dell Gaming G15 5525, AMD R5-6600H, 8GB, 512GB SSD, NVIDIA RTX 3050 (4GB GDDR6), 15.6\" (39.62Cms) FHD WVA AG 120Hz 250 nits, Win 11 + MSO\'21, Phantom Grey with speckles, 2.51Kgs (D560817WIN9B)', 99000, 69500, 34, '544803838_61K9AyvhgmL._SY450_.jpg', 'Processor: AMD Ryzen5 6600H 6-Cores Processor (19M Cache, up to 4.5 GHz)\r\nRAM & Storage: 8GB, 1xRAM & Storage: 8GB, DDR5, 4800MHz & 512GB M.2 PCIe Solid State Drive\r\nGraphics: NVIDIA GeForce RTX 3050 4GB GDDR6 (90 W)', 'Processor: AMD Ryzen5 6600H 6-Cores Processor (19M Cache, up to 4.5 GHz)\r\nRAM & Storage: 8GB, 1xRAM & Storage: 8GB, DDR5, 4800MHz & 512GB M.2 PCIe Solid State Drive\r\nGraphics: NVIDIA GeForce RTX 3050 4GB GDDR6 (90 W)\r\nDisplay & Keyboard: 15.6 inch FHD (1920 x 1080) 120Hz 250 nits WVA Anti- Glare LED Backlit Narrow Border Display & Orange backlit Keyboard\r\nSoftware: Windows 11 & Microsoft Office Home and Student 2021 & 3-Cell Battery, 56WHr (Integrated)\r\nPorts: (1) HDMI 2.1, (3) SuperSpeed USB 3.2 Gen 1 Type-A, (1) USB Type C Gen 3.2 Display Port Alt-Mode, Headphone/Mic, (1) RJ45', 0, 'Dell Gaming G15 5525, AMD R5-6600H, 8GB, 512GB SSD, NVIDIA RTX 3050 (4GB GDDR6)', 'Dell Gaming G15 5525, AMD R5-6600H, 8GB, 512GB SSD, NVIDIA RTX 3050 (4GB GDDR6)', 'Dell Gaming G15 5525, AMD R5-6600H, 8GB, 512GB SSD, NVIDIA RTX 3050 (4GB GDDR6)', 1, 1),
(21, 1, 1, 'ASUS Vivobook 14, 14.0-inch (35.56 cms) FHD, Intel Core i5-1035G1 10th Gen, Thin and Light Laptop (8GB/512GB SSD/Integrated Graphics/Windows 11/Office 2021/Grey/1.60 kg), X415JA-EK522WS', 65900, 51000, 20, '856954754_716bvqzz7PL._SY450_.jpg', 'Processor: 10th Gen Intel Core i5-1035G1, 1.0 GHz Base speed (6MB Cache, up to 3.6 GHz Max Turbo Speed, 4 cores)\r\nMemory: 8GB (4GB onboard + 4GB SO-DIMM) DDR4 with | Storage: 512GB M.2 NVMe PCIe 3.0 SSD', 'Processor: 10th Gen Intel Core i5-1035G1, 1.0 GHz Base speed (6MB Cache, up to 3.6 GHz Max Turbo Speed, 4 cores)\r\nMemory: 8GB (4GB onboard + 4GB SO-DIMM) DDR4 with | Storage: 512GB M.2 NVMe PCIe 3.0 SSD with empty 1x 2.5-inch Slot for HDD Storage\r\nDisplay: 14.0-inch (35.56 cm) FHD (1920 x 1080) 16:9 aspect ratio LED Backlit 250nits, IPS-level Panel, Anti-glare display, 82 % Screen-to-body ratio\r\nGraphics: Integrated Intel UHD Graphics\r\nOperating System: Windows 11 Home | Software: Office Home and Student 2021 included\r\nDesign: 1.99 cm Thin | Thin & Light | 1.60 kg weight | 37WHrs Battery Capacity | Up to 6 hours Battery life, Note: Battery life depends on conditions of usage\r\nKeyboard: Chiclet Keyboard | 1.4mm key travel', 0, 'ASUS Vivobook 14, 14.0-inch (35.56 cms) FHD, Intel Core i5-1035G1 10th Gen, Thin and Light Laptop', 'ASUS Vivobook 14, 14.0-inch (35.56 cms) FHD, Intel Core i5-1035G1 10th Gen, Thin and Light Laptop', 'ASUS Vivobook 14, 14.0-inch (35.56 cms) FHD, Intel Core i5-1035G1 10th Gen, Thin and Light Laptop', 1, 1),
(22, 4, 8, 'Fossil Gwen Analogue Women\'s Watch(Rose Gold Dial Womens Standard Colored Strap)-ES4879', 11900, 7795, 28, '450861964_81-uDhNwXZL._UX522_.jpg', 'Case size: 34mm; Band size: 14mm Quartz movement with 3-hand Analog display; mineral crystal face; imported\r\nRose gold plated stainless steel case; rose gold dial with date window\r\nRose gold plated stainless steel', 'Case size: 34mm; Band size: 14mm Quartz movement with 3-hand Analog display; mineral crystal face; imported\r\nRose gold plated stainless steel case; rose gold dial with date window\r\nRose gold plated stainless steel bracelet with 2 pusher foldover clasp closure\r\nWater resistant to 165 feet (50 M): suitable for short periods of exposure to water i.e washing hands or showering/bathing. Not suitable for recreational swimming, diving or snorkeling. Circumference - 175+/- 5MM\r\nWarranty type:Manufacturer; 2 Years International Warranty', 0, 'Fossil Gwen Analogue Women\'s Watch(Rose Gold Dial Womens Standard Colored Strap)-ES4879', 'Fossil Gwen Analogue Women\'s Watch(Rose Gold Dial Womens Standard Colored Strap)-ES4879', 'Fossil Gwen Analogue Women\'s Watch(Rose Gold Dial Womens Standard Colored Strap)-ES4879', 1, 1),
(23, 1, 9, 'OnePlus 11 5G (Eternal Green, 16GB RAM, 256GB Storage) Upto 18M No Cost EMI with ICICI Amazon Pay Credit Card', 62000, 61500, 20, '702867176_61amb0CfMGL._SX679_.jpg', 'Camera: 50MP Main Camera with Sony IMX890 (OIS supported), 48MP Ultrawide Camera with Sony IMX581 (FOV: 115 degree) and 32MP Telephoto lens with Sony IMX709 (2X Optical Zoom); 16MP Front (Selfie) Camera with EIS support', 'Camera: 50MP Main Camera with Sony IMX890 (OIS supported), 48MP Ultrawide Camera with Sony IMX581 (FOV: 115 degree) and 32MP Telephoto lens with Sony IMX709 (2X Optical Zoom); 16MP Front (Selfie) Camera with EIS support\r\nCamera Modes: Photo, Video, Night, PRO, PANO, Portrait, TIME-LAPSE, SLO-MO, Text scanner, Movie, Long Exposure, Dual-view video, TILT-SHIFT, XPAN, Scan, STICKER, and AI ID photo\r\nDisplay: 6.7 Inches; 120 Hz AMOLED QHD Display with Corning Gorilla Glass Victus; Resolution: 3216 X 1440 pixels; HDR 10+, sRGB, 10-bit Color Depth, PWM + DC dimming\r\nOperating System: OxygenOS based on Android 13\r\nProcessor: Snapdragon 8 Gen 2 Mobile Platform\r\n16GB LPDDR5X RAM, 256GB UFS4.0 Storage\r\nBattery & Charging: 5000 mAh with 100W SUPERVOOC\r\nIn-Display Fingerprint Sensor', 1, 'OnePlus 11 5G (Eternal Green, 16GB RAM, 256GB Storage) Upto 18M No Cost EMI with ICICI Amazon Pay Credit Card', 'OnePlus 11 5G (Eternal Green, 16GB RAM, 256GB Storage) Upto 18M No Cost EMI with ICICI Amazon Pay Credit Card', 'OnePlus 11 5G (Eternal Green, 16GB RAM, 256GB Storage) Upto 18M No Cost EMI with ICICI Amazon Pay Credit Card', 1, 1),
(24, 4, 7, 'Raptus Lifestyle Women\'s Cotton Maxi Fit And Flare Dress (MR-207, White, 2XL)', 1200, 799, 28, '478841794_41hGQecJP0L.jpg', 'GOWN LENGTH : 55 INC || GOWN FLAIR : 3 mtr\r\nBOTTOM FABRIC : MICRO COTTON\r\nDUPATTA FABRIC : FOX GEORGETTE WITH DIGITAL PRINT WITH FOUR SIDE REDEEMED LESS BORDER', 'GOWN LENGTH : 55 INC || GOWN FLAIR : 3 mtr\r\nBOTTOM FABRIC : MICRO COTTON\r\nDUPATTA FABRIC : FOX GEORGETTE WITH DIGITAL PRINT WITH FOUR SIDE REDEEMED LESS BORDER\r\nAge Range Description: Adult; Sleeve Type: Long Sleeve', 1, 'Raptus Lifestyle Women\'s Cotton Maxi Fit And Flare Dress (MR-207, White, 2XL)', 'Raptus Lifestyle Women\'s Cotton Maxi Fit And Flare Dress (MR-207, White, 2XL)', 'Raptus Lifestyle Women\'s Cotton Maxi Fit And Flare Dress (MR-207, White, 2XL)', 1, 1),
(25, 3, 6, 'Lymio Casual Shirt for Men| Shirt for Men|| Men Stylish Shirt | Men Printed Shirt (Patta)', 599, 355, 55, '596509625_71rvRI2VHqL._UY879_.jpg', 'Care Instructions: Dry Clean Only\r\nFit Type: Slim Fit\r\nshirt for men || casual shirt for men || men stylish shirt || men Printed Shirt', 'Care Instructions: Dry Clean Only\r\nFit Type: Slim Fit\r\nshirt for men || casual shirt for men || men stylish shirt || men Printed Shirt\r\nhalf Sleeve\r\nStyle - Enhance your look by wearing this Casual Stylish Men\'s shirt, Team it with a pair of tapered denims Or Solid Chinos and Loafers for a fun Smart Casual look\r\nPrinted Shirt\r\nClosure Type: Button; Collar Style: Printed', 1, 'Lymio Casual Shirt for Men| Shirt for Men|| Men Stylish Shirt | Men Printed Shirt (Patta)', 'Lymio Casual Shirt for Men| Shirt for Men|| Men Stylish Shirt | Men Printed Shirt (Patta)', 'Lymio Casual Shirt for Men| Shirt for Men|| Men Stylish Shirt | Men Printed Shirt (Patta)', 1, 1),
(26, 3, 6, 'Men Slim Fit Solid Spread Collar Formal Shirt', 1900, 1200, 50, '419505558_38-men-regular-slim-fit-s.jpg', 'Men Slim Fit Solid Spread Collar Formal Shirt', 'Men Slim Fit Solid Spread Collar Formal Shirt', 0, 'Men Slim Fit Solid Spread Collar Formal Shirt', 'Men Slim Fit Solid Spread Collar Formal Shirt', 'Men Slim Fit Solid Spread Collar Formal Shirt', 2, 1),
(27, 3, 6, 'Diverse Men\'s Regular Fit Formal Shirt', 699, 599, 50, '839571889_81MOApk-H8L._UY741_.jpg', 'Care Instructions: Machine Wash\r\nMaterial - Cotton\r\nFull sleeve, Collar style - Classic collar; Cuff style - Single cuff', 'Care Instructions: Machine Wash\r\nMaterial - Cotton\r\nFull sleeve, Collar style - Classic collar; Cuff style - Single cuff\r\nPattern - Printed Men’s Formal Shirt\r\nDouble yoke for extra durability & stiffness; Patch pocket at chest\r\nMade in India', 1, 'Diverse Men\'s Regular Fit Formal Shirt', 'Diverse Men\'s Regular Fit Formal Shirt', 'Diverse Men\'s Regular Fit Formal Shirt', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_images` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `product_images`) VALUES
(1, 4, '536140931_71u9-lTwP5L._SY355_.jpg'),
(2, 4, '913405707_71P2mv0o0cL._SY355_.jpg'),
(3, 7, '403726819_61Mvur7XRzL._SX679_.jpg'),
(4, 13, '583309492_71ZKcnsNHRS._UY741_.jpg'),
(5, 13, '674345069_51V2gEYvc8S._UY741_.jpg'),
(6, 13, '546309912_51PRAkh5OtS._UY741_.jpg'),
(7, 14, '296577754_51qvQnjCbRL._UY741_.jpg'),
(8, 14, '360920101_61fnrPd4k7L._UY741_.jpg'),
(9, 15, '501464266_xxl-patta-dress-fashion2wear-original-imaggn5zchkbqwmh.png'),
(10, 16, '824652663_81nPQkC49JL._SX522_.jpg'),
(11, 16, '665209858_81pvQ2IKg5L._SX522_.jpg'),
(12, 18, '601519393_91k0JJbkPuL._SX679_.jpg'),
(13, 18, '432475728_81jvbBUyC6L._SX679_.jpg'),
(14, 19, '257676359_61nawdTwbuL._SX679_.jpg'),
(15, 20, '986827521_61e2z7xABOL._SY450_.jpg'),
(16, 21, '761689455_71QVt4OK-DL._SY450_.jpg'),
(17, 22, '995911660_71DFCKNJ70L._UX522_.jpg'),
(18, 22, '939041378_71IAkb9tKaL._UX522_.jpg'),
(19, 23, '856079457_51QVJveu+-L._SX679_.jpg'),
(20, 23, '825315855_51pJKV6eUhL._SX679_.jpg'),
(21, 25, '256466286_41j-JoAzHDL._SR38,50_.jpg'),
(22, 25, '458017610_81RmSyTlkAL._UY741_.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shiprocket_token`
--

INSERT INTO `shiprocket_token` (`id`, `token`, `added_on`) VALUES
(1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjMxNTk3MDQsImlzcyI6Imh0dHBzOi8vYXBpdjIuc2hpcHJvY2tldC5pbi92MS9leHRlcm5hbC9hdXRoL2xvZ2luIiwiaWF0IjoxNjc3MjIzNjc4LCJleHAiOjE2NzgwODc2NzgsIm5iZiI6MTY3NzIyMzY3OCwianRpIjoiSFluVGdSZFZLcTNaejhrWiJ9.IDi2gTgHRTaOEQEpsPxsU7TA4YMX5st9QFWBxTcWiW4', '2023-02-24 07:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 1, 'Laptop', 1),
(2, 2, 'Refrigerator', 1),
(3, 2, 'Washing Machines', 1),
(4, 5, 'Toys', 1),
(5, 6, 'Bedsheet', 1),
(6, 3, 'Shirts', 1),
(7, 4, 'Dresses', 1),
(8, 4, 'Watch', 1),
(9, 1, 'Mobile', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(2, 'jasoliya darpan', 'c054f5e5b268da7100f8fc3d2334a8e0', 'jdbpatel9265@gmail.com', '9428785086', '2023-02-23 04:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(1, 2, 7, '2023-02-24 05:01:15'),
(2, 2, 12, '2023-02-24 05:02:37'),
(3, 2, 23, '2023-02-24 06:39:44'),
(4, 2, 25, '2023-02-25 05:54:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
