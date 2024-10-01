-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 01:41 PM
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
-- Database: `smart_inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `performed_by` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventoryitem`
--

CREATE TABLE `inventoryitem` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventoryitem`
--

INSERT INTO `inventoryitem` (`ItemID`, `ItemName`, `Category`, `Quantity`, `Location`, `Price`, `SupplierID`, `CreatedAt`, `UpdatedAt`) VALUES
(15, 'Wireless Mouse', 'Electronics', 50, 'Warehouse A', 799.00, 1, '2024-10-01 11:37:28', '2024-10-01 08:08:14'),
(16, 'Mechanical Keyboard', 'Electronics', 30, 'Warehouse B', 1499.00, 2, '2024-10-01 11:37:28', '2024-10-01 08:08:28'),
(17, 'Office Chair', 'Furniture', 20, 'Showroom', 499.00, 3, '2024-10-01 11:37:28', '2024-10-01 08:08:36'),
(18, 'USB-C Cable', 'Accessories', 100, 'Warehouse A', 299.00, 1, '2024-10-01 11:37:28', '2024-10-01 08:08:44'),
(19, 'Notebook', 'Stationery', 150, 'Stationery Section', 49.00, 3, '2024-10-01 11:37:28', '2024-10-01 08:08:51'),
(20, 'Pen', 'Stationery', 300, 'Stationery Section', 35.00, 1, '2024-10-01 11:37:28', '2024-10-01 08:09:03'),
(21, 'HDMI Cable', 'Accessories', 80, 'Warehouse C', 99.00, 2, '2024-10-01 11:37:28', '2024-10-01 08:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `prediction`
--

CREATE TABLE `prediction` (
  `PredictionID` int(11) NOT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `PredictedRestockDate` date NOT NULL,
  `PredictedQuantity` int(11) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `ReportID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ReportType` enum('Sales Report','Inventory Report') NOT NULL,
  `DateRangeStart` date NOT NULL,
  `DateRangeEnd` date NOT NULL,
  `GeneratedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restockalert`
--

CREATE TABLE `restockalert` (
  `AlertID` int(11) NOT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `QuantityThreshold` int(11) NOT NULL,
  `AlertDate` date NOT NULL,
  `Status` enum('Pending','Resolved') DEFAULT 'Pending',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salestransaction`
--

CREATE TABLE `salestransaction` (
  `TransactionID` int(11) NOT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `QuantitySold` int(11) NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  `SaleDate` date NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `CustomerEmail` varchar(255) DEFAULT NULL,
  `CustomerPhone` varchar(20) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `ContactPerson` varchar(255) DEFAULT NULL,
  `ContactEmail` varchar(255) DEFAULT NULL,
  `ContactPhone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `ContactPerson`, `ContactEmail`, `ContactPhone`, `Address`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Nitin Govardhane', 'Nitin Govardhane', 'nitin.govardhane@gmail.com', '1234567890', 'Nashik', '2024-10-01 11:28:41', '2024-10-01 11:28:41'),
(2, 'Jitesh Borse', 'Jitesh Borse', 'jitesh.borse@gmail.com', '0987654321', 'Pune', '2024-10-01 11:28:41', '2024-10-01 11:28:41'),
(3, 'Vedanti Lakade', 'Vedanti Lakade', 'vedanti.lakade@gmail.com', '1122334455', 'Mumbai', '2024-10-01 11:28:41', '2024-10-01 11:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Role` enum('Admin','Manager','Employee') NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role_assigned_by` int(11) DEFAULT NULL,
  `role_assigned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `Role`, `CreatedAt`, `UpdatedAt`, `role_assigned_by`, `role_assigned_at`) VALUES
(1, 'Admin', '$2y$10$9I/Dj22uuAYYh9FL4/s.COnzrqIYE7MCsHLhlF9sjWKJorOBYU2w6', 'admin@gmail.com', 'Admin', '2024-10-01 11:24:52', '2024-10-01 11:24:52', NULL, NULL),
(2, 'Vedanti', '$2y$10$qJCwTG3nMWZx2fAlPxTyFeaexj6evMdat//Iot1eLozncrnTNvwLq', 'vedanti@gmail.com', 'Employee', '2024-10-01 11:25:35', '2024-10-01 11:25:35', NULL, NULL),
(3, 'Jitesh', '$2y$10$MSfnKdiWdPYzrl2A2ZWiMO9baRq5kqqQvdqZBAIhgM0VOfV2XssHi', 'jitesh@gmail.com', 'Employee', '2024-10-01 11:25:52', '2024-10-01 11:25:52', NULL, NULL),
(4, 'Shalaka', '$2y$10$6DzydezrEJD0P.iRPbFYVuID1DMtagES1IgKOFCjxEnT/79oMs6NO', 'shalaka@gmail.com', 'Employee', '2024-10-01 11:26:12', '2024-10-01 11:26:12', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `inventoryitem`
--
ALTER TABLE `inventoryitem`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `prediction`
--
ALTER TABLE `prediction`
  ADD PRIMARY KEY (`PredictionID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `restockalert`
--
ALTER TABLE `restockalert`
  ADD PRIMARY KEY (`AlertID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Indexes for table `salestransaction`
--
ALTER TABLE `salestransaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `ItemID` (`ItemID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventoryitem`
--
ALTER TABLE `inventoryitem`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `prediction`
--
ALTER TABLE `prediction`
  MODIFY `PredictionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restockalert`
--
ALTER TABLE `restockalert`
  MODIFY `AlertID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salestransaction`
--
ALTER TABLE `salestransaction`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventoryitem`
--
ALTER TABLE `inventoryitem`
  ADD CONSTRAINT `inventoryitem_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);

--
-- Constraints for table `prediction`
--
ALTER TABLE `prediction`
  ADD CONSTRAINT `prediction_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `inventoryitem` (`ItemID`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `restockalert`
--
ALTER TABLE `restockalert`
  ADD CONSTRAINT `restockalert_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `inventoryitem` (`ItemID`);

--
-- Constraints for table `salestransaction`
--
ALTER TABLE `salestransaction`
  ADD CONSTRAINT `salestransaction_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `inventoryitem` (`ItemID`),
  ADD CONSTRAINT `salestransaction_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
