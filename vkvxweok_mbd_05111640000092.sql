-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2018 at 06:15 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vkvxweok_mbd_05111640000092`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `idbahan` int(11) NOT NULL,
  `namabahan` varchar(45) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_volatilitas` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`idbahan`, `namabahan`, `harga_jual`, `harga_beli`, `harga_volatilitas`) VALUES
(1, 'beras', 8983, 5066, 0.2),
(2, 'santan', 4000, 4763, 0.2),
(3, 'Ayam', 1200, 1000, 0.3),
(4, 'Bawang Putih', 70, 60, 0.1),
(5, 'Bawang Merah', 110, 100, 0.2),
(6, 'Lengkuas', 100, 90, 0.4),
(7, 'Sosis', 150, 139, 0.5),
(8, 'Telur', 280, 270, 0.1),
(9, 'Kecap', 510, 500, 0.1),
(10, 'Wortel', 50, 40, 0.3),
(11, 'Kentang', 190, 180, 0.4),
(12, 'Seledri', 30, 25, 0.5),
(13, 'Daun Bawang', 25, 20, 0.1),
(14, 'Merica', 15, 10, 0.5),
(15, 'Kemiri', 15, 10, 0.1),
(16, 'Pala', 20, 15, 0.2),
(17, 'Kambing', 1250, 1200, 0.3),
(18, 'Santan', 35, 30, 0.4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`idbahan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahan`
--
ALTER TABLE `bahan`
  MODIFY `idbahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
