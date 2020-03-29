-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2020 at 03:04 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `StayHome`
--

-- --------------------------------------------------------

--
-- Table structure for table `AdminLogin`
--

CREATE TABLE `AdminLogin` (
  `ID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(150) NOT NULL,
  `OnDate` datetime NOT NULL,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AdminLogin`
--

INSERT INTO `AdminLogin` (`ID`, `UserName`, `Password`, `OnDate`, `UpdatedDate`) VALUES
(1, 'admin', 'b7b1dc541ba98a721295e3d2a9079e7a', '2020-03-28 00:00:00', '2020-03-28 09:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `FundForToday`
--

CREATE TABLE `FundForToday` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Fund` float(11,2) NOT NULL,
  `OnDate` datetime NOT NULL,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FundForToday`
--

INSERT INTO `FundForToday` (`ID`, `Date`, `Fund`, `OnDate`, `UpdatedDate`) VALUES
(1, '2020-03-28', 1000.00, '2020-03-28 00:00:00', '2020-03-28 12:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE `Location` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Latitude` varchar(20) NOT NULL,
  `Longitude` varchar(20) NOT NULL,
  `OnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Location`
--

INSERT INTO `Location` (`ID`, `UserID`, `Latitude`, `Longitude`, `OnDate`) VALUES
(1, 1, '34', '45', '2020-03-28 13:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phoneno` varchar(12) NOT NULL,
  `AadharNo` varchar(20) NOT NULL,
  `ProfilePic` varchar(200) NOT NULL,
  `Latitude` varchar(20) NOT NULL,
  `Longitude` varchar(20) NOT NULL,
  `IsDelete` int(11) NOT NULL DEFAULT '0',
  `OnDate` datetime NOT NULL,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `Name`, `Phoneno`, `AadharNo`, `ProfilePic`, `Latitude`, `Longitude`, `IsDelete`, `OnDate`, `UpdatedDate`) VALUES
(1, 'Pooja kumari', '9937625302', '787878787878', 'c51ef477-c41b-4da5-a4a2-6b4619697b6a.jpg', '878', '123', 0, '2020-03-28 13:04:47', '2020-03-28 13:04:46');

-- --------------------------------------------------------

--
-- Table structure for table `Version`
--

CREATE TABLE `Version` (
  `ID` int(11) NOT NULL,
  `Version` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AdminLogin`
--
ALTER TABLE `AdminLogin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `FundForToday`
--
ALTER TABLE `FundForToday`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Latitude` (`Latitude`),
  ADD KEY `Longitude` (`Longitude`),
  ADD KEY `IsDelete` (`IsDelete`),
  ADD KEY `OnDate` (`OnDate`);

--
-- Indexes for table `Version`
--
ALTER TABLE `Version`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AdminLogin`
--
ALTER TABLE `AdminLogin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `FundForToday`
--
ALTER TABLE `FundForToday`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Location`
--
ALTER TABLE `Location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Version`
--
ALTER TABLE `Version`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
