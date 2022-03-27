-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2021 at 12:05 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'NGUYEN Huy', 'nguyenhuyhoang020499@gmail.com', 'admin', 'f925916e2754e5e03f75dd58a5733251', '2021-04-27 09:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(2, 'Chinua Achebe', '2021-04-17 14:30:23', '2021-04-18 15:15:09'),
(3, 'Gaël Faye', '2021-04-24 14:35:08', '2021-04-21 09:41:17'),
(4, 'J. K. Rowling ', '2021-04-27 15:58:42', '2021-04-19 09:41:34'),
(11, 'Stephen King', '2021-04-27 16:01:16', '2021-04-20 09:41:39'),
(12, 'Anna Oliverio Ferraris', '2021-04-27 16:04:04', '2021-04-21 09:41:47'),
(13, 'Juan Branco', '2021-04-27 16:10:12', '2021-04-22 09:41:52'),
(14, 'Caroline Estremo', '2021-04-27 16:11:37', '2021-04-23 09:41:56'),
(15, 'Julien Luxcey', '2021-04-27 16:14:18', '2021-04-24 09:41:59'),
(17, 'Mark Kanazawa', '2021-04-27 16:16:10', '2021-04-25 09:42:03'),
(18, 'Peter Pukownik', '2021-04-27 16:21:51', '2021-04-26 09:42:08'),
(19, 'Samuel Kahen', '2021-05-03 10:40:34', '2021-04-29 09:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `RegDate`, `UpdationDate`) VALUES
(4, 'Harry Potter, tome 1 : Harry Potter à l\'Ecole des Sorciers par Rowling Harry Potter, tome 1 : Harry Potter à l\'Ecole des Sorciers', 4, 4, 17, 35, '2021-04-27 15:59:51', '2021-04-29 09:58:17'),
(7, 'Devenir père... pour la vie', 6, 12, 15, 18, '2021-04-27 16:04:50', '2021-04-29 09:58:00'),
(8, 'Abattre l\'ennemi', 7, 13, 21, 17, '2021-04-27 16:10:42', '2021-04-29 09:58:05'),
(9, 'Infirmière', 9, 14, 20, 7, '2021-04-27 16:12:00', '2021-04-29 09:57:45'),
(12, 'Simetierre', 2, 11, 23, 25, '2021-04-27 16:20:14', '2021-04-29 09:58:03'),
(13, 'Le livre de santé de sainte Hildegarde de Bingen (Français) Relié', 9, 18, 14, 23, '2021-04-27 16:22:11', '2021-04-29 09:57:50'),
(15, 'Le livre du job', 1, 19, 20, 15, '2021-05-03 10:44:40', NULL),
(17, 'Santé et Enviroment', 16, 15, 25, 30, '2021-05-04 10:02:10', NULL),
(18, 'Guérir de son enfance (Français)', 3, 17, 22, 21, '2021-05-04 10:03:43', NULL),
(19, 'Manuel d\'économie ', 8, 2, 15, 16, '2021-05-04 10:05:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Roman', 1, '2021-04-14 18:35:25', '2021-04-13 16:00:42'),
(2, 'Horror', 1, '2021-04-14 18:35:39', '2021-04-29 09:56:59'),
(3, 'Enfance', 1, '2021-04-24 18:35:55', '2021-04-29 09:57:05'),
(4, 'Mystèry', 1, '2021-04-22 18:36:16', '2021-04-29 09:57:12'),
(5, 'Famille', 1, '2021-04-27 15:50:53', '2021-04-29 09:57:14'),
(6, 'éducation', 1, '2021-04-27 15:51:48', '2021-04-29 09:57:15'),
(7, 'société', 1, '2021-04-27 15:52:23', '2021-04-29 09:57:17'),
(8, 'Économie', 1, '2021-04-27 15:52:46', '2021-04-29 09:57:18'),
(9, 'Santé', 1, '2021-04-27 15:53:05', '2021-04-29 09:57:19'),
(16, 'Enviroment', 1, '2021-05-03 10:35:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`) VALUES
(1, 9, 'SID013', '2021-04-19 06:09:47', '2021-05-03 10:26:13', 1, 7),
(2, 7, 'SID014', '2021-04-19 06:09:47', '2021-05-03 10:26:30', 0, 18),
(3, 12, 'SID015', '2021-04-19 06:09:47', '2021-05-03 10:26:52', 0, 25);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(12, 'SID013', 'NGUYEN Huy', 'Aries.THs@gmail.com', '0766192277', '94717c569f4794475c34d36bb3f09f20', 1, '2021-04-29 09:38:52', '2021-05-04 09:40:05'),
(13, 'SID014', 'THAO Vy', 'vyvy050199@gmail.com', '0501202196', 'cd58808f78cda6062ada8a4b0ce89a0a', 1, '2021-04-29 09:42:03', '2021-05-03 09:35:58'),
(14, 'SID015', 'User', 'User2904@gmail.com', '2904202100', 'ee11cbb19052e40b07aac0ca060c23ee', 1, '2021-04-29 09:51:26', '2021-05-03 09:35:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
