-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2022 at 03:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atdev`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nom_admin` varchar(255) COLLATE utf8_bin NOT NULL,
  `prenom_admin` varchar(255) COLLATE utf8_bin NOT NULL,
  `tel_admin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_admin` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `psseudo_admin` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nom_admin`, `prenom_admin`, `tel_admin`, `email_admin`, `psseudo_admin`) VALUES
(1, 'bsd', 'ayoub', '0652086766', 'bsd-ayoub@gmail.com', 'aaaa'),
(22, 'jkhiom', 'uohoi', 'iohoi', 'uhuho', 'hhhh');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8_bin NOT NULL,
  `lname` varchar(255) COLLATE utf8_bin NOT NULL,
  `tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_bin NOT NULL,
  `psseudo_client` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `fname`, `lname`, `tel`, `profession`, `psseudo_client`) VALUES
(142, 'hello', 'ZHADUA', '0638249248', 'other', '62501f1fd0ed0'),
(141, 'ayoub', 'basidi', '0681530508', 'other', '62501ebf72648');

-- --------------------------------------------------------

--
-- Table structure for table `rdv`
--

CREATE TABLE `rdv` (
  `id_r` int(11) NOT NULL,
  `date_r` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sujet` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_creneau` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `rdv`
--

INSERT INTO `rdv` (`id_r`, `date_r`, `sujet`, `id_creneau`, `id_client`) VALUES
(37, '29-02-2022', 'bghit nbni ', '10h a 10:30h', 27),
(30, '29-02-2022', 'bghit nbni ', '10h a 10:30h', 40),
(42, '29-02-2022', 'bghit nbni ', '10h a 10:30h', 31),
(41, '29-02-2022', 'bghit nbni ', '10h a 10:30h', 30),
(39, '29-02-2022', 'bghit nbni ', '10h a 10:30h', 33),
(33, '29-02-2022', 'bghit nbni ', '10h a 10:30h', 39),
(38, '29-02-2022', 'bghit nbni ', '10h a 10:30h', 35),
(40, '29-02-2022', 'bghit nbni ', '11h a 11:30h', 28),
(43, '2020_09_08', 'aaaa', '11h a 11:30h', 90),
(44, '2022-04-22', 'umyswdoihfo', '14h a 14:30h', 92),
(45, '2022-04-15', 'uireugfoi', '11h a 11:30h', 92),
(46, '2020_09_08', 'aaaa', '', 90),
(47, '2020_09_08', 'aaaa', '', 90),
(48, '2022-04-14', 'gdsiugfi', '', 92),
(49, '2022-04-14', 'gdsiugfi', '', 92),
(50, '2022-04-14', 'gdsiugfi', '', 92),
(51, '2022-04-14', 'ugdsiugfui', '', 92),
(52, '2022-04-22', '', '', 95),
(53, '2022-04-15', 'jjjjj', '1', 142),
(54, '2022-04-15', 'jjjjj', '1', 142),
(55, '2022-04-15', 'jjjjj', '1', 142),
(56, '2022-04-15', 'jjjjj', '1', 142),
(57, '2022-04-15', 'jjjjj', '1', 142),
(58, '2022-04-15', 'jjjjj', '1', 142),
(59, '2022-04-15', 'jjjjj', '1', 142),
(60, '2022-04-15', 'jjjjj', '1', 142);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`id_r`),
  ADD KEY `id_client` (`id_client`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `id_r` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
