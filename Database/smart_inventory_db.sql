-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2024 at 06:40 PM
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

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `user_id`, `action`, `performed_by`, `timestamp`) VALUES
(8, 2, 'Promoted to Manager', 1, '2024-10-02 14:43:37');

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
(30, 'Laptop ABC 15\"', 'Computers', 200, 'Section C, Rack 1', 45999.00, 29, '2024-10-02 16:33:02', '2024-10-02 13:03:02'),
(31, 'Air Conditioner 1.5 Ton', 'Home Appliances', 500, 'Section D, Rack 5', 31999.00, 30, '2024-10-02 16:33:54', '2024-10-02 13:03:54'),
(32, 'Bluetooth Speaker Z100', 'Audio', 80, 'Section E, Shelf 4', 1999.00, 31, '2024-10-02 16:34:34', '2024-10-02 13:04:34'),
(33, 'Microwave Oven 20L', 'Kitchen Appliances', 300, 'Section F, Shelf 2', 6999.00, 32, '2024-10-02 16:35:46', '2024-10-02 13:05:46'),
(34, 'Refrigerator 300L', 'Home Appliances', 30, 'Section G, Rack 1', 27999.00, 27, '2024-10-02 16:36:32', '2024-10-02 13:06:32'),
(35, 'Smartphone XYZ Pro', 'Mobile Phones', 200, 'Section B, Shelf 3', 19999.00, 28, '2024-10-02 16:37:50', '2024-10-02 13:07:50'),
(36, 'LED TV 42 inch', 'Television', 100, 'Section A, Rack 2', 29999.00, 27, '2024-10-02 16:38:44', '2024-10-02 13:08:44');

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
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `ContactPerson`, `ContactEmail`, `ContactPhone`, `Address`, `CreatedAt`, `UpdatedAt`, `is_deleted`) VALUES
(27, 'Bharat Electronics', 'Rajesh Kumar', 'rajesh.kumar@bharatelectronics.com', '9876543210', 'No. 12, MG Road, Bengaluru, Karnataka', '2024-10-02 16:22:34', '2024-10-02 16:22:34', 0),
(28, 'Tata Electricals', 'Amit Desai', 'amit.desai@tataelectricals.in', '9823123456', 'Plot 5, MIDC, Pune, Maharashtra', '2024-10-02 16:23:07', '2024-10-02 16:23:07', 0),
(29, 'Reliance Electronics', 'Anjali Mehta', 'anjali.mehta@relianceelectronics.com', '9967123456', 'Ghatkopar West, Mumbai, Maharashtra', '2024-10-02 16:23:52', '2024-10-02 16:23:52', 0),
(30, 'L&T Tech Supplies', 'Suresh Nair', 'suresh.nair@lttech.in', '9845123456', 'Sector 21, Gurgaon, Haryana', '2024-10-02 16:24:44', '2024-10-02 16:24:44', 0),
(31, 'Havells India', 'Vikram Singh', 'vikram.singh@havellsindia.in', '9911223344', 'DLF Cyber City, Hyderabad, Telangana', '2024-10-02 16:25:53', '2024-10-02 16:25:53', 0),
(32, 'Godrej Electricals', 'Pooja Sharma', 'pooja.sharma@godrejelectricals.in', '9988776655', 'Churchgate, Mumbai, Maharashtra', '2024-10-02 16:26:37', '2024-10-02 16:26:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_activity_log`
--

CREATE TABLE `supplier_activity_log` (
  `log_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `performed_by` int(11) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_activity_log`
--

INSERT INTO `supplier_activity_log` (`log_id`, `supplier_id`, `action`, `performed_by`, `role`, `timestamp`) VALUES
(31, 27, 'Added', 1, 'Admin', '2024-10-02 16:22:35'),
(32, 28, 'Added', 1, 'Admin', '2024-10-02 16:23:07'),
(33, 29, 'Added', 1, 'Admin', '2024-10-02 16:23:53'),
(34, 30, 'Added', 1, 'Admin', '2024-10-02 16:24:44'),
(35, 31, 'Added', 1, 'Manager', '2024-10-02 16:25:54'),
(36, 32, 'Added', 1, 'Manager', '2024-10-02 16:26:38');

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
(2, 'Vedanti', '$2y$10$qJCwTG3nMWZx2fAlPxTyFeaexj6evMdat//Iot1eLozncrnTNvwLq', 'vedanti@gmail.com', 'Manager', '2024-10-01 11:25:35', '2024-10-02 14:43:37', 1, '2024-10-02 14:43:37'),
(3, 'Jitesh', '$2y$10$MSfnKdiWdPYzrl2A2ZWiMO9baRq5kqqQvdqZBAIhgM0VOfV2XssHi', 'jitesh@gmail.com', 'Employee', '2024-10-01 11:25:52', '2024-10-02 11:14:58', 1, '2024-10-02 11:14:58'),
(4, 'Shalaka', '$2y$10$6DzydezrEJD0P.iRPbFYVuID1DMtagES1IgKOFCjxEnT/79oMs6NO', 'shalaka@gmail.com', 'Employee', '2024-10-01 11:26:12', '2024-10-02 13:46:17', 1, '2024-10-02 13:46:17');

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
  ADD KEY `inventoryitem_ibfk_1` (`SupplierID`);

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
-- Indexes for table `supplier_activity_log`
--
ALTER TABLE `supplier_activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `performed_by` (`performed_by`),
  ADD KEY `supplier_activity_log_ibfk_1` (`supplier_id`);

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
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventoryitem`
--
ALTER TABLE `inventoryitem`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `supplier_activity_log`
--
ALTER TABLE `supplier_activity_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  ADD CONSTRAINT `inventoryitem_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE;

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

--
-- Constraints for table `supplier_activity_log`
--
ALTER TABLE `supplier_activity_log`
  ADD CONSTRAINT `supplier_activity_log_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`SupplierID`) ON DELETE CASCADE,
  ADD CONSTRAINT `supplier_activity_log_ibfk_2` FOREIGN KEY (`performed_by`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
