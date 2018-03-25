-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2018 at 01:55 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineattendancesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Account_Id` varchar(20) NOT NULL,
  `Student_Id` varchar(20) NOT NULL,
  `Token` varchar(20) NOT NULL,
  `TokenValid` enum('Yes','No','','') NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Type` enum('Parent','Student','','') NOT NULL,
  `Current_Sem` varchar(20) NOT NULL,
  `Current_Year` varchar(20) NOT NULL,
  `College_Id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_Id` varchar(20) NOT NULL,
  `College_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `message` (
  `Message_Id` varchar(20) NOT NULL,
  `Student_Id` varchar(20) NOT NULL,
  `Message` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `Student_Id` varchar(20) NOT NULL,
  `College_Id` varchar(20) NOT NULL,
  `Lec_Conducted` int(255) NOT NULL,
  `Lec_Attended` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `College_Id` varchar(20) NOT NULL,
  `College_Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `Subject_Id` varchar(20) NOT NULL,
  `Subject_Semester` varchar(20) NOT NULL,
  `Teacher_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject_record`
--

CREATE TABLE `subject_record` (
  `Subject_Id` varchar(20) NOT NULL,
  `Lecture_Attended` int(255) NOT NULL,
  `Lecture_Conducted` int(255) NOT NULL,
  `Student_Id` varchar(255) NOT NULL,
  `Pt1` int(255) NOT NULL,
  `Pt2` int(255) NOT NULL,
  `Sem_Marks` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `Teacher_Id` varchar(20) NOT NULL,
  `College_Id` varchar(20) NOT NULL,
  `College_Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_Id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_Id`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`College_Id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`Subject_Id`);

--
-- Indexes for table `subject_record`
--
ALTER TABLE `subject_record`
  ADD PRIMARY KEY (`Subject_Id`,`Student_Id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`Teacher_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
