-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2023 at 04:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sicmature-sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `User_id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `telephone` varchar(12) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `gender` varchar(255) NOT NULL,
  `Dateofbirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`User_id`, `Username`, `telephone`, `Email`, `Address`, `gender`, `Dateofbirth`) VALUES
(231000001, 'Mr. Anutin', '777-777-7777', 'Anutin@gmail.com', 'ม.พะเยา', 'male', '2023-10-13');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `Chat_id` int(11) NOT NULL,
  `Message_id` int(11) NOT NULL,
  `Person_id_send` int(20) NOT NULL,
  `Video` longblob DEFAULT NULL,
  `Text` text DEFAULT NULL,
  `Datetime` datetime NOT NULL,
  `Photo` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`Chat_id`, `Message_id`, `Person_id_send`, `Video`, `Text`, `Datetime`, `Photo`) VALUES
(1, 0, 231000001, NULL, 'dddd', '2023-10-19 21:13:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_room`
--

CREATE TABLE `chat_room` (
  `Chat_id` int(20) NOT NULL,
  `Chat_name` varchar(255) NOT NULL,
  `User_id` int(20) NOT NULL,
  `Store_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_room`
--

INSERT INTO `chat_room` (`Chat_id`, `Chat_name`, `User_id`, `Store_ID`) VALUES
(1, 'ร้าน888', 231000001, 232000001),
(2, '7777777', 231000001, 232000002);

-- --------------------------------------------------------

--
-- Table structure for table `price_size`
--

CREATE TABLE `price_size` (
  `Product_ID` int(11) NOT NULL,
  `Size` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_size`
--

INSERT INTO `price_size` (`Product_ID`, `Size`, `Price`) VALUES
(1, '3 kg', 520),
(1, '9 kg', 1490),
(4, '450 g', 64),
(4, '7 kg', 609),
(6, '400 g', 179),
(6, '2 kg', 679),
(3, '1.2 kg', 490),
(8, '7.03 kg', 2300),
(9, '500 g', 45),
(10, '8 Kg', 4390),
(11, '150 g', 450),
(12, '50 ml', 32),
(13, '0.245 kg', 390),
(14, '100 tablets', 320),
(15, 'cat', 850),
(16, 'LITE', 14990);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_name` varchar(255) NOT NULL,
  `Category` varchar(225) NOT NULL,
  `Product_for` varchar(225) NOT NULL,
  `Img` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_name`, `Category`, `Product_for`, `Img`, `Description`, `Brand`) VALUES
(1, 'Kaniva', 'Food', '', 'Img\\Kaniva.jpg', 'Food Cat Kaniva แซลมอน ทูน่าและข้าว', 'KANIVA'),
(3, 'Purina One', 'Food', '', 'Img\\Purina One.jpg', 'เพียวริน่า วัน อาหารแมวแบบเม็ด', 'PURINA'),
(4, 'ME-O', 'Food', '', 'Img\\ME-O.jpg', 'มีโอ อาหารเม็ด สำหรับแมวโต รสปลาทู', 'ME-O'),
(6, 'Royal Canin', 'Food', '', 'Img\\Royal Canin.jpg', 'โรยัล คานิน อาหารเม็ด สำหรับลูกแมว', 'ROYAL CANIN'),
(8, 'Hill is Science Die', 'Food', '', 'Img\\Hill is Science Die.jpg', 'มีสารอาหารที่ช่วยลดการก่อตัวของก้อนขนในแมว', 'Hill is'),
(9, 'Whiskas', 'Food', '', 'Img\\Whiskas.jpg', 'อาหารแมววิสกัส แมวโต รสปลาทู แบ่งขายแพ็คถุงใส', 'Whiskas'),
(10, 'Canagan Scottish Salmon', 'Food', '', 'Img\\Canagan Scottish Salmon.jpg', 'คานาแกน สคอททิช แซลมอน อาหารลูกแมว และแมวโต', 'Canagan'),
(11, 'Pinkpawpal', 'Food_supplement', '', 'Img\\Pinkpawpal.jpg', 'สูตรเพิ่มน้ำหนัก บำรุงขนและกล้ามเนื้อ', 'Pinkpawpal'),
(12, 'O3Vit', 'Food_supplement', '', 'Img\\O3Vit.jpg', 'น้ำมันตับปลา สำหรับแมว บำรุงสุขภาพแมว', 'O3Vit'),
(13, 'Shed-x Dermaplex', 'Food_supplement', '', 'Img\\Shed-x Dermaplex.jpg', 'อาหารเสริมลดขนร่วงและบำรุงขน สำหรับแมว', 'Shed-X'),
(14, 'Maxicoat Cat', 'Food_supplement', '', 'Img\\Maxicoat Cat.jpg', 'อาหารเสริมวิตามินบำรุงขนและผิวหนัง สำหรับแมวทุกสายพันธุ์', 'Green Pet'),
(15, 'Smart Nail Clippers', 'Tool', '', 'Img\\Smart Nail Clippers.jpg', 'กรรไกรตัดเล็บสัตว์เลี้ยง', 'PETHROOM'),
(16, 'Pura Max', 'Tool', '', 'Img\\Pura Max.jpg', 'ห้องน้ำแมวอัตโนมัติ - Global Version', 'PETKIT');

-- --------------------------------------------------------

--
-- Table structure for table `statment`
--

CREATE TABLE `statment` (
  `Order_ID` int(20) NOT NULL,
  `Order_Date` varchar(225) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Amount` int(100) NOT NULL,
  `Payment` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `Store_ID` int(11) NOT NULL,
  `Store_name` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `Telephone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`Store_ID`, `Store_name`, `Address`, `Telephone`) VALUES
(231000002, 'ร้าน7777777', 'เหนือ ม.พะเยา', '777-777-7777'),
(232000001, 'ร้าน888', 'หน้า ม.พะเยา', '888-888-8888');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexes for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`Chat_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `statment`
--
ALTER TABLE `statment`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`Store_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
