-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 02:39 AM
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
(1, 0, 231000001, NULL, 'dddd', '2023-10-19 21:13:35', NULL),
(1, 0, 231000001, NULL, 'Hi', '2023-10-20 03:14:50', NULL),
(1, 0, 231000001, NULL, 'csadad', '2023-10-20 07:33:27', NULL),
(1, 0, 232000001, NULL, 'UWU', '2023-10-20 07:36:27', NULL);

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
(1, '1.2kg', 139),
(2, '500 g', 89),
(3, '500 g', 692),
(4, '1.5 kg', 339),
(5, '1.5 kg', 399),
(6, '1.5 kg', 339),
(7, '500 g', 89),
(8, '2.27 kg', 556),
(9, '2.27 kg', 795),
(10, '1.5 kg', 333),
(11, '1.5 kg', 199),
(12, '2.5 kg', 420),
(13, '3.4 kg', 260),
(14, '3 kg', 720),
(15, '1.5 kg', 760),
(16, '1.5 kg', 235),
(17, '1.5 kg', 235),
(18, '1.2 kg', 249),
(19, '85 g', 35),
(20, '500 g', 89),
(21, '500 g', 35),
(22, '85 g', 14),
(23, '85 g', 18),
(24, '85 g', 35),
(25, '85 g', 99),
(26, '85 g', 22),
(27, '40 g', 88),
(28, '40 g', 88),
(29, '40 g', 89),
(30, '40 g', 85),
(31, '40 g', 168),
(32, '15x4 g', 39),
(33, '15x4 g', 49),
(34, '15 g', 289),
(35, '15x4 g', 55),
(36, 'ปกติ', 79),
(37, 'ปกติ', 69),
(38, 'ปกติ', 65),
(39, 'ปกติ', 75),
(40, 'ปกติ', 65),
(41, 'ปกติ', 199),
(42, 'ปกติ', 999),
(43, 'ปกติ', 159),
(44, 'ปกติ', 580),
(45, 'ปกติ', 310),
(46, 'ปกติ', 210),
(47, 'ปกติ', 450),
(48, 'ปกติ', 199),
(49, '2 kg', 315),
(50, '2 kg', 286),
(51, '2 kg', 209),
(52, '2 kg', 785),
(53, '500 g', 147),
(54, '500 g', 147),
(55, '5 kg', 1150),
(56, '1 kg', 515),
(57, '2 kg', 1290),
(58, '400 g', 49),
(59, '400 g', 49),
(60, '400 g', 49),
(61, '600 g', 293),
(62, '200 g', 59),
(63, '120 g', 22),
(64, '130 g', 24),
(65, '56 g', 56),
(66, '112 g', 56),
(67, 'Medium', 175),
(68, '180 g', 299),
(69, '50 g', 79),
(70, '50 g', 65),
(71, 'ปกติ', 70),
(72, 'ปกติ', 65),
(73, 'ปกติ', 512),
(74, 'ปกติ', 710),
(75, 'ปกติ', 875),
(76, 'ปกติ', 1639),
(77, 'ปกติ', 18900),
(78, 'ปกติ', 3290),
(79, 'ปกติ', 1950),
(80, 'ปกติ', 1950),
(81, '500 g', 85),
(82, '500 g', 550),
(83, '500 g', 250),
(84, '1.75 kg', 630),
(85, '400 g', 228),
(86, '50 g', 130),
(87, '50 g', 130),
(88, '650 g', 178),
(89, '10 g', 158),
(90, '1 kg', 405),
(91, '1 kg', 290),
(92, '1.5 kg', 250),
(93, '100 g', 60),
(94, '1.5 kg', 490),
(95, '10 ชิ่น', 300),
(96, 'ปกติ', 1800),
(97, 'เล็ก', 2500),
(98, 'ปกติ', 190),
(99, '300 g', 85),
(100, 'ปกติ', 220);

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
(1, 'แคท เอ็นจอย', 'Food_grain', 'Cat', 'Img\\A001.jpg', 'อาหารเม็ด สำหรับลูกแมวทุกสายพันธุ์ รสปลาทะเลไก่และนม 1.2 kg', 'Cat N Joy'),
(2, 'คานิว่า', 'Food_grain', 'Cat', 'Img\\A002.jpg', 'อาหารเม็ด สำหรับแมวทุกช่วงวัย สูตรเนื้อไก่ ปลาทูน่าและข้าว ', 'Kaniva'),
(3, 'เนเจอร์ส', 'Food_grain', 'Cat', 'Img\\A003.jpg', 'โพรเทคชั่น อาหารเม็ด สำหรับแมวโตหลังทำหมัน ขนาดเล็ก', 'Nature\'s Protection'),
(4, 'วอร์เซเล ลากา', 'Food_grain', 'Cat', 'Img\\A004.jpg', 'อาหารเม็ด สำหรับลูกแมว สูตรโปรตีนและแคลเซียมสูง', 'Versele Laga'),
(5, 'วอร์เซเล ลากา', 'Food_grain', 'Cat', 'Img\\A005.jpg', 'อาหารเม็ด สำหรับแมว สูตรบำรุงขนและผิวหนัง รสปลาแซลมอน', 'Versele Laga'),
(6, 'วอร์เซเล ลากา', 'Food_grain', 'Cat', 'Img\\A006.jpg', 'อาหารเม็ด สำหรับแมวทำหมัน ', 'Versele Laga'),
(7, 'คานิว่า', 'Food_grain', 'Cat', 'Img\\A007.jpg', 'อาหารเม็ด สำหรับแมวทุกช่วงวัย สูตรปลาแซลมอน ทูน่าและข้าว', 'Kaniva'),
(8, 'นูเทรียนซ์ อินฟิวชั่น', 'Food_grain', 'Cat', 'Img\\A008.jpg', 'อาหารเม็ด สำหรับแมวโต สูตรไก่ ', 'Nutrience Infusion'),
(9, 'นูเทรียนซ์ อินฟิวชั่น ', 'Food_grain', 'Cat', 'Img\\A009.jpg', 'อาหารเม็ด สำหรับแมวโตเลี้ยงในบ้าน สูตรไก่', 'Nutrience Infusion'),
(10, 'มีโอ', 'Food_grain', 'Cat', 'Img\\A010.jpg', 'อาหารเม็ด สำหรับแมวโต รสซีฟู้ด', 'Me-O'),
(11, 'โรยัล คานิน', 'Food_grain', 'Cat', 'Img\\A011.jpg', 'อาหารเม็ด สำหรับแมวโตรูปร่างดี อายุ 1 ปีขึ้นไป', 'Royal Canin'),
(12, 'อีสคาน', 'Food_grain', 'Cat', 'Img\\A012.jpg', 'อาหารเม็ด สำหรับแมวโตทุกสายพันธุ์ สูตรเกรนฟรี 2.5 kg', 'Iskhan'),
(13, 'โอริเจน', 'Food_grain', 'Cat', 'Img\\A013.jpg', 'อาหารเม็ด สำหรับแมวเด็กและแมวโต', 'Orijen'),
(14, 'เพียวริน่า', 'Food_grain', 'Cat', 'Img/A014.jpg', 'อาหารเม็ด สำหรับแมวโต สูตรสำหรับเลี้ยงในบ้าน 3 kg', 'Purina One'),
(15, 'แบล็คฮอว์ค', 'Food_grain', 'Cat', 'Img/A015.jpg', 'อาหารเม็ด สำหรับแมวโตอายุ 12 เดือนขึ้นไป รสเนื้อปลา 1.5 kg', 'Blackhawk'),
(16, 'โรยัล คานิน', 'Food_grain', 'Cat', 'Img/A016.jpg', 'อาหารเม็ด สำหรับแมวโต สูตรดูแลระบบทางเดินปัสสาวะ อายุ 1 ปีขึ้นไป', 'Royal Canin'),
(17, 'โรยัล คานิน', 'Food_grain', 'Cat', 'Img/A017.jpg', 'อาหารเม็ด สำหรับแมวโต สูตรดูแลปัญหาก้อนขน อายุ 1 ปีขึ้นไป', 'Royal Canin'),
(18, 'Nekko Love Mix', 'Food_grain', 'Cat', 'Img/A018.jpg', 'อาหารเม็ด สำหรับแมวโต รสปลาทูน่าและมากุโระ 1.2 kg', 'Nekko Love Mix'),
(19, 'โรยัล คานิน', 'Food_Wet', 'Cat', 'Img/B001.jpg', 'อาหารเปียก ในเยลลี่ สำหรับลูกแมว อายุ 4-12 เดือน', 'Royal Canin'),
(20, 'โรยัล คานิน', 'Food_Wet', 'Cat', 'Img/B002.jpg', 'อาหารเปียก สำหรับแม่แมวตั้งท้อง ให้นม และลูกแมวหย่านม อายุต่ำกว่า 4 เดือน', 'Royal Canin'),
(21, 'Purina ONE', 'Food_Wet', 'Cat', 'Img/B003.jpg', 'อาหารเปียก แบบซอง สำหรับลูกแมว รสไก่ 85 g', 'Purina ONE'),
(22, 'Meow Meow', 'Food_Wet', 'Cat', 'Img/B004.jpg', 'อาหารแมวแบบเปียก ปลาทูและปลาทูน่าและไก่สำหรับลูกแมว 85 g', 'Meow Meow'),
(23, 'Nekko', 'Food_Wet', 'Cat', 'Img/B005.jpg', 'อาหารเปียก สำหรับลูกแมวทุกสายพันธุ์ สูตรทูน่าครีมมี่สูตรผสมปลาแซลมอน 70 g', 'Nekko'),
(24, 'Purina ONE', 'Food_Wet', 'Cat', 'Img/B006.jpg', 'อาหารเปียก แบบซอง สำหรับแมวโต รสปลาทะเล 85 g', 'Purina ONE'),
(25, 'ไลฟ์เมต', 'Food_Wet', 'Cat', 'Img/B007.jpg', 'อาหารเปียก สำหรับแมวว สูตรแคท บูสเตอร์ 150 g', 'Lifemate'),
(26, 'คานิว่า', 'Food_Wet', 'Cat', 'Img/B008.jpg', 'อาหารเปียก สำหรับแมว สูตรเนื้อปลาทูน่ำกับเนื้อแกะในเยลลี่ 70 g', 'Kaniva'),
(27, 'Jinny', 'Food_Supply', 'Cat', 'Img/C001.jpg', 'ฟรีซดรายเนื้อไก่', 'Jinny'),
(28, 'Jinny', 'Food_Supply', 'Cat', 'Img/C002.jpg', 'ฟรีซดรายตับวัว', 'Jinny'),
(29, 'Petsmile', 'Food_Supply', 'Cat', 'Img/C003.jpg', 'ผงโรยอาหารบำรุงขนและผิวหนังสำหรับแมว จากปลาน้ำจืดโซเดี่ยมต่ำ', 'Petsmile'),
(30, 'Kelly & Co', 'Food_Supply', 'Cat', 'Img/C004.jpg', 'Dinner Booster ผงโรยอาหาร สำหรับแมว สูตรแซลมอนแอนด์ชิกเก้น 50 g', 'Kelly & Co'),
(31, 'แคทสเตอร์ เพลย์', 'Food_Supply', 'Cat', 'Img/C005.jpg', 'ขนมและท็อปปิ้งฟรีซดาย รสปลาทูน่า สำหรับแมว 40 g', 'Catster'),
(32, 'Kitty Licks', 'Food_Supply', 'Cat', 'Img/C006.jpg', 'ขนมแมวเลีย รสไก่ 15 g 4 ชิ้น', 'Rena\'s Recipe'),
(33, 'ไลฟ์เมต', 'Food_Supply', 'Cat', 'Img/C007.jpg', 'ขนมแมวเลีย สูตรปลาทูน่าเนื้อขาวกับแซลมอน 12 g, 4 ชิ้น', 'Lifemate'),
(34, 'Toro', 'Food_Supply', 'Cat', 'Img/C008.jpg', 'ขนมแมวเลีย รสปลาทูน่าและปลาแซลมอน 15 g, 36 ชิ้น', 'Toro'),
(35, 'Bellotta', 'Food_Supply', 'Cat', 'Img/C009.jpg', 'มูส ขนมครีมแมวเลีย รสทูน่ากับกุ้งล็อบสเตอร์ 60 g', 'Bellotta'),
(36, 'Kanimal', 'Toys', 'Cat', 'Img/D001.jpg', 'ไม้ล่อแมว รุ่นลูกบอลพันเชือก ช่วยขัดฟัน', 'Kanimal'),
(37, 'Kanimal', 'Toys', 'Cat', 'Img/D002.jpg', 'ของเล่น สำหรับแมว กระบองเพชรพันขน', 'Kanimal'),
(38, 'Kanimal', 'Toys', 'Cat', 'Img/D003.jpg', 'ไม้ล่อแมว รุ่นเชือกยาวพันขน สีดำ ', 'Kanimal'),
(39, 'Kanimal', 'Toys', 'Cat', 'Img/D004.jpg', 'ก้านเชือกพันขน สำหรับแมว สีีน้ำตาล', 'Kanimal'),
(40, 'Kanimal', 'Toys', 'Cat', 'Img/D005.jpg', 'ไม้ล่อแมว รุ่นลูกบอลพันเชือก สีดำ ', 'Kanimal'),
(41, 'Kafbo', 'Toys', 'Cat', 'Img/D006.jpg', 'คาฟโบ ของเล่นแมว สปริงและอุปกรณ์เสริม', 'Kafbo'),
(42, 'Kafbo', 'Toys', 'Cat', 'Img/D007.jpg', 'ของเล่นอัจฉริยะ สำหรับแมว', 'Kafbo'),
(43, 'ซีซีเพ็ท ของเล่น สำหรับสุนัข รูปปลานิลดิ้นได้ สีเทา', 'Toys', 'Cat', 'Img/D008.jpg', 'ซีซีเพ็ท ของเล่น สำหรับสุนัข รูปปลานิลดิ้นได้ สีเทา ', 'Cc Pet'),
(44, 'Vetreska', 'Toys', 'Cat', 'Img/D009.jpg', 'วีเทรสก้า ลูกบอลแคทนิป แบบไม้มามาทาบิ', 'Vetreska'),
(45, 'Petkit', 'Gadget', 'Cat', 'Img/E001.jpg', 'พ็ทคิด ไส้กรองน้ำพุแมว สำหรับแมว 5 ชิ้น ', 'Petkit'),
(46, 'Catit', 'Gadget', 'Cat', 'Img/E002.jpg', 'แคทอิท ชามอาหาร สำหรับแมว แบบสแตนเลสคู่', 'Catit'),
(47, 'CC Pets', 'Gadget', 'Cat', 'Img/E003.jpg', 'ซีซี เพ็ท ชามอาหารแบบเอียง สำหรับสัตว์เลี้ยง ', 'CC Pets'),
(48, 'Petkit', 'Gadget', 'Cat', 'Img/E004.jpg', 'เพ็ทคิด ปลอกคออัจฉริยะ​​เชื่อมต่อแอพได้ สำหรับแมว', 'Petkit'),
(49, 'Okiko', 'Gadget', 'Cat', 'Img/E005.jpg', 'โอกิโกะ ทรายแมวเต้าหู้ กลิ่นชาโคล 6 L', 'Okiko'),
(50, 'Smart Heart', 'Food_grain', 'Dog', 'Img/F001.jpg', 'Gold อาหารเม็ด สำหรับสุนัขโต สูตร Fit & Firm ', 'Smart Heart'),
(51, 'Smart Heart', 'Food_grain', 'Dog', 'Img/F002.jpg', 'สมาร์ทฮาร์ท อาหารเม็ด สำหรับลูกสุนัข รสไก่ ไข่ และนม ', 'Smart Heart'),
(52, 'Smart Heart', 'Food_grain', 'Dog', 'Img/F003.jpg', 'อาหารเม็ด สำหรับสุนัขโตอายุ 7 ปีขึ้นไป สูตร Fit & Firm ', 'Smart Heart'),
(53, 'Buzz', 'Food_grain', 'Dog', 'Img/F004.jpg', 'บัซซ์ อาหารเม็ด สำหรับสุนัขโต สูตรบำรุงข้อเม็ดเล็ก รสเนื้อแกะ ', 'Buzz'),
(54, 'Buzz', 'Food_grain', 'Dog', 'Img/F005.jpg', 'บัซซ์ อาหารเม็ด สำหรับสุนัขโต สูตรบำรุงข้อกระดูก รสแกะ เม็ดเล็ก 500 g', 'Buzz'),
(55, 'Buzz', 'Food_grain', 'Dog', 'Img/F005.jpg', 'บัซซ์ อาหารเม็ด สำหรับสุนัขโต สูตรบำรุงข้อกระดูก รสแกะ เม็ดเล็ก 500 g', 'Buzz'),
(56, 'Buzz', 'Food_grain', 'Dog', 'Img/F006.jpg', 'บัซซ์ อาหารเม็ด สำหรับสุนัขโต สูตรบำรุงข้อกระดูก รสแกะ เม็ดใหญ่ 500 g ', 'Buzz'),
(57, 'Royal Canin', 'Food_grain', 'Dog', 'Img/F007.jpg', 'โรยัล คานิน อาหารเม็ด สำหรับสุนัขโต สายพันธุ์ปอมเมอเรเนียน อายุ 8 เดือนขึ้นไป', 'Royal Canin'),
(58, 'Royal Canin', 'Food_grain', 'Dog', 'Img/F008.jpg', 'โรยัล คานิน อาหารเม็ด สำหรับสุนัขโต สายพันธุ์เล็ก อ้วนง่าย อายุ 10 เดือนขึ้นไป 1 kg', 'Royal Canin'),
(59, 'Royal Canin', 'Food_grain', 'Dog', 'Img/F009.jpg', 'รยัล คานิน อาหารเม็ด สำหรับแม่สุนัขตั้งท้อง ให้นม และลูกสุนัขหย่านม อายุ 1 - 2 เดือน สายพันธุ์ใหญ่ ', 'Royal Canin'),
(60, 'Hercules', 'Food_Wet', 'Dog', 'Img/G001.jpg', 'เฮอร์คิวลิส อาหารเปียก แบบกระป๋อง สำหรับลูกสุนัข รสเนื้อไก่และนมแพะ 400 g ', 'Hercules'),
(61, 'Hercules', 'Food_Wet', 'Dog', 'Img/G002.jpg', 'เฮอร์คิวลิส อาหารเปียก แบบกระป๋อง สำหรับสุนัขโตสายพันธุ์ใหญ่ รสสเต็กเนื้อแกะในน้ำเกรวี่ 400 g', 'Hercules'),
(62, 'Hercules', 'Food_Wet', 'Dog', 'Img/G003.jpg', 'เฮอร์คิวลิส อาหารเปียก แบบกระป๋อง สำหรับสุนัขโต รสเนื้อไก่และปลาแซลมอนพร้อมผัก 400 g', 'Hercules'),
(63, 'Cesar', 'Food_Wet', 'Dog', 'Img/G004.jpg', 'ซีซาร์ อาหารเปียก แบบถาด สำหรับสุนัขโตทุกสายพันธุ์ รสเนื้อวัวและตับ 600 g', 'Cesar'),
(64, 'Jerhigh', 'Food_Wet', 'Dog', 'Img/G006.jpg', 'เจอร์ไฮเนื้อไก่ย่างน้ำเกรวี่120g ', 'Jerhigh'),
(65, 'Pedigree ', 'Food_Wet', 'Dog', 'Img/G007.jpg', 'เพดดีกรี อาหารเปียก แบบเพาช์ สำหรับลูกสุนัข รสไก่ ตับและไข่บดพร้อมผัก  130 g', 'Pedigree '),
(66, 'Dentastix ', 'Food_Supply', 'Dog', 'Img/H001.jpg', 'Dentastix ขนมขัดฟัน สำหรับลูกสำหรับสุนัข 56 g ', 'Pedigree '),
(67, 'Dentastix ', 'Food_Supply', 'Dog', 'Img/H002.jpg', 'ขนมขัดฟัน สำหรับสุนัขพันธุ์ใหญ่ รสเนื้อรมควัน 112 g ', 'Pedigree '),
(68, 'Hoya ', 'Food_Supply', 'Dog', 'Img/H003.jpg', 'โฮย่า หูวัวเต็มใบ สำหรับสัตว์เลี้ยง ขนาดกลาง ', 'Hoya'),
(69, 'Pet8 ', 'Food_Supply', 'Dog', 'Img/H004.jpg', 'เพ็ทเอท ขนมฟรีซดราย สำหรับสุนัข รสสันในไก่เจอกี้สไลด์ 180 g', 'Pet8'),
(70, 'Pet Smile ', 'Food_Supply', 'Dog', 'Img/H005.jpg', 'เพ็ท สมายล์ ขนมฟรีซดราย สำหรับสุนัข รสไก่ห่อตับอบนิ่ม 50 g ', 'Pet Smile'),
(71, 'Kanimal ', 'Toys', 'Dog', 'Img/I001.jpg', 'แคนนิมอล ของเล่นบีบมีเสียง สำหรับสุนัข รูปแซนวิช 14 x 6 cm ', 'Kanimal'),
(72, 'Kanimal ', 'Toys', 'Dog', 'Img/I002.jpg', 'แคนนิมอล ของเล่น สำหรับสุนัข รูปแซลมอน', 'Kanimal'),
(73, 'Kanimal ', 'Toys', 'Dog', 'Img/I003.jpg', 'แคนนิมอล ของเล่น สำหรับสุนัข รูปสเต็กเนื้อย่าง 10.5 x 11 cm ', 'Kanimal'),
(74, 'Kong', 'Toys', 'Dog', 'Img/I004.jpg', 'คอง ลูกบอลยางกัด สำหรับสัตว์เลี้ยง ', 'Kong'),
(75, 'Kong', 'Toys', 'Dog', 'Img/I005.jpg', 'คอง ของเล่น สำหรับสุนัข รุ่น Wrapz Ball ไซส์ L ', 'Kong'),
(76, 'Dogit', 'Gadget', 'Dog', 'Img/J001.jpg', 'ด็อกอิท กล่องเดินทาง สำหรับสุนัข รุ่น Voyageur Brown', 'Dogit'),
(77, 'Mps', 'Gadget', 'Dog', 'Img/J002.jpg', 'เอ็มพีเอส กล่องเดินทาง สำหรับสัตว์เลี้ยง', 'Mps'),
(78, 'Royal Tails', 'Gadget', 'Dog', 'Img/J003.jpg', 'โรยัล เทลส์ รถเข็น สำหรับสัตว์เลี้ยง รุ่น Florence ', 'Royal Tails'),
(79, 'Sugarpawrent', 'Gadget', 'Dog', 'Img/J004.jpg', 'ชูการ์พอวเรนท์ กระเป๋าล้อลาก สำหรับสัตว์เลี้ยง แบบใส ', 'Sugarpawrent'),
(80, 'Barketek', 'Gadget', 'Dog', 'Img/J005.jpg', 'บาร์คคีเท็ค ชามอาหารแบบคู่ สำหรับสุนัข รุ่น Ice', 'Barketek'),
(81, 'Smart Heart ', 'Food_grain', 'Rabbit', 'Img/K001.jpg', 'สมาร์ทฮาร์ท อาหารเม็ด สำหรับกระต่ายโต สูตรซีเลกต์ มูสลี่ 500 g', 'Smart Heart'),
(82, 'Nature ', 'Food_grain', 'Rabbit', 'Img/K002.jpg', 'Nature อาหาร สำหรับกระต่ายโต สูตร Original ', 'Versele Laga'),
(83, 'Versele Laga', 'Food_grain', 'Rabbit', 'Img/K003.jpg', 'เวอร์เซเล ลากา อาหารผสมไฟเบอร์สูง สำหรับกระต่ายแพ้ง่าย 500 g', 'Versele Laga'),
(84, 'Versele Laga', 'Food_grain', 'Rabbit', 'Img/K004.jpg', 'เวอร์เซเล ลากา อาหารเม็ด แบบแท่ง สำหรับกระต่าย สูตร Sensitive Complete 1.75 kg ', 'Versele Laga'),
(85, 'Marukan Laga', 'Food_grain', 'Rabbit', 'Img/K005.jpg', 'มารุคัง หญ้าทิโมธี สำหรับกระต่าย สูตรพรีเมี่ยมคัดพิเศษ ', 'Marukan'),
(86, 'Versele Laga', 'Food_Supply', 'Rabbit', 'Img/L001.jpg', 'เวอร์เซเล ลากา ขนมคุกกี้ สำหรับกระต่าย ชนิดไฟเบอร์สูงสอดไส้แครอท 50 g', 'Versele Laga'),
(87, 'Versele Laga', 'Food_Supply', 'Rabbit', 'Img/L002.jpg', 'เวอร์เซเล ลากา ขนมคุกกี้ สำหรับกระต่าย ชนิดไฟเบอร์สูงสอดไส้เบอร์รี่ 50 g', 'Versele Laga'),
(88, 'Marukan', 'Food_Supply', 'Rabbit', 'Img/L003.jpg', 'มารุคัง ขนมหญ้าอัดแท่ง สำหรับกระต่าย 650 g', 'Marukan'),
(89, 'Marukan', 'Food_Supply', 'Rabbit', 'Img/L004.jpg', 'มารุคัง ขนมแท่ง สำหรับกระต่าย สูตรบันนี่ดูโอ้ รสหญ้าทีโมธี่และแอปเปิ้ล 10 g ', 'Marukan'),
(90, 'Aquamaster', 'Food_grain', 'Fish', 'Img/M001.jpg', 'อความาสเตอร์ อาหารปลา สูตรเร่งสี เม็ดเล็ก 1 kg ', 'Aquamaster'),
(91, 'Aquamaster', 'Food_grain', 'Fish', 'Img/M002.jpg', 'อความาสเตอร์ อาหารปลา สูตรเร่งโต เม็ดใหญ่ 1 kg ', 'Aquamaster'),
(92, 'Optimum', 'Food_grain', 'Fish', 'Img/M003.jpg', 'ออพติมั่ม Hi Pro อาหารปลาแบบเม็ด สูตรเร่งโต เร่งสี 1.5 kg เม็ดกลาง', 'Optimum'),
(93, 'Okiko', 'Food_grain', 'Fish', 'Img/M004.jpg', 'โอกิโกะ อาหารปลา สูตรเพิ่มขนาดหัว เม็ดกลาง 100 g', 'Okiko'),
(94, 'Saiteki', 'Food_grain', 'Fish', 'Img/M005.jpg', 'อาหารปลาคาร์พไซเตกิ สูตรเร่งสี เม็ดกลาง 1.5g', 'Saiteki'),
(95, 'Tip', 'Gadget', 'Fish', 'Img/N001.jpg', 'ทีไอพี ใยแก้วกรองน้ำ 10 ชิ้น', 'Tip'),
(96, 'Cunzo', 'Gadget', 'Fish', 'Img/N002.jpg', 'คันโซ่ ตู้ปลา แบบนาโน ', 'Cunzo'),
(97, 'Cunzo', 'Gadget', 'Fish', 'Img/N003.jpg', ' คันโซ่ ตู้ครึ่งบกขนาดเล็ก', 'Cunzo'),
(98, 'Aquapro', 'Gadget', 'Fish', 'Img/N004.jpg', 'อควาโปร กระชอนตักปลา 3D ทรงกลม ยืดได้สูงสุด 55 cm ', 'Aquapro'),
(99, 'Twin', 'Gadget', 'Fish', 'Img/N005.jpg', 'ทวิน ปั๊มลม รุ่น Magic-6600 300 g ', 'Twin'),
(100, 'Crazy Stone', 'Gadget', 'Fish', 'Img/N006.jpg', 'เครซี่ สโตน กล่องอะคริลิคให้อาหารปลา ', 'Crazy Stone');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `User_id` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Amount` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statment`
--

CREATE TABLE `statment` (
  `Order_ID` int(20) NOT NULL,
  `Order_Date` varchar(225) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
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
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`Store_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
