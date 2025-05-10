-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 07:20 AM
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
-- Database: `restaurant_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BILL_NO` varchar(20) NOT NULL,
  `ORDER_DETAIL` text DEFAULT NULL,
  `ID_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BILL_NO`, `ORDER_DETAIL`, `ID_NO`) VALUES
('B001', 'Burger and Fries', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `ID_NO` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`ID_NO`, `NAME`) VALUES
(1, 'Jayrick'),
(2, 'Jayrick'),
(3, 'Alex'),
(4, 'Ian');

-- --------------------------------------------------------

--
-- Table structure for table `chef`
--

CREATE TABLE `chef` (
  `ID_NO` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chef`
--

INSERT INTO `chef` (`ID_NO`, `NAME`) VALUES
(3, 'Chef Gordon Ramsey');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `CONTACT_NO` varchar(20) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`, `CONTACT_NO`, `NAME`, `ADDRESS`) VALUES
(0, '09073320244', 'Mark Angelo Yakit', 'Prosperidad'),
(101, '09051022031', 'Mark Angelo Yakit', 'Agusan Del Sur'),
(102, '09215184134', 'Alex Janross', 'Butuan City');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ITEMS_NO` int(100) NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL,
  `PRICE` decimal(50,0) NOT NULL,
  `QUANTITY` int(100) NOT NULL,
  `NO_OF_ITEMS` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ITEMS_NO`, `DESCRIPTION`, `PRICE`, `QUANTITY`, `NO_OF_ITEMS`) VALUES
(6, 'Dessert', 4, 5, 3),
(7, 'Salad', 5, 2, 4),
(9, 'Soup', 4, 5, 5),
(10, 'Dessert', 4, 1, 3),
(11, 'Soup', 20, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `ID_NO` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `CONTACT_NO` varchar(20) DEFAULT NULL,
  `CONTACT_NO_FK` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`ID_NO`, `NAME`, `CONTACT_NO`, `CONTACT_NO_FK`) VALUES
(3, 'Cesar Ian', '09123456789', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ORDER_NO` varchar(20) NOT NULL,
  `NO_OF_ITEMS` int(11) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `ID_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`ORDER_NO`, `NO_OF_ITEMS`, `CUSTOMER_ID`, `ID_NO`) VALUES
('O0011', 5, 101, 3),
('O004', 3, 101, 3),
('O005', 4, 101, 3),
('O006', 5, 101, 3),
('O007', 5, 101, 3),
('O009', 5, 101, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `DETAIL_ID` int(11) NOT NULL,
  `ORDER_NO` varchar(20) NOT NULL,
  `ORDER_STATUS` enum('Pending','Preparing','Served','Cancelled') DEFAULT 'Pending',
  `ORDER_TIMESTAMP` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`DETAIL_ID`, `ORDER_NO`, `ORDER_STATUS`, `ORDER_TIMESTAMP`) VALUES
(1, 'O004', 'Served', '2025-04-26 12:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `CONTACT_NO` varchar(20) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`CONTACT_NO`, `NAME`, `ADDRESS`) VALUES
('09215151314', 'Tikay Resto', 'Butuan City'),
('0921515134', 'Tikay Resto', 'Butuan City'),
('09541216544', 'Tikay Resto', 'Butuan City'),
('12', 'Tikay Resto', 'Butuan City');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BILL_NO`),
  ADD KEY `ID_NO` (`ID_NO`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`ID_NO`);

--
-- Indexes for table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`ID_NO`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSTOMER_ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ITEMS_NO`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`ID_NO`),
  ADD KEY `CONTACT_NO_FK` (`CONTACT_NO_FK`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ORDER_NO`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `ID_NO` (`ID_NO`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`DETAIL_ID`),
  ADD KEY `ORDER_NO` (`ORDER_NO`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`CONTACT_NO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`ID_NO`) REFERENCES `cashier` (`ID_NO`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`CONTACT_NO_FK`) REFERENCES `restaurant` (`CONTACT_NO`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`ID_NO`) REFERENCES `chef` (`ID_NO`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`ORDER_NO`) REFERENCES `order` (`ORDER_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
