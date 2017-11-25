-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2017 at 10:11 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pemiloe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `NIP` int(11) NOT NULL,
  `NAMA` varchar(25) DEFAULT NULL,
  `JABATAN` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`NIP`, `NAMA`, `JABATAN`) VALUES
(20170801, 'Wahwan', 'Manajer'),
(20170802, 'Ridho', 'Anggota');

-- --------------------------------------------------------

--
-- Table structure for table `akun_admin`
--

CREATE TABLE IF NOT EXISTS `akun_admin` (
  `NIP` int(11) DEFAULT NULL,
  `USERNAME` varchar(25) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun_admin`
--

INSERT INTO `akun_admin` (`NIP`, `USERNAME`, `PASSWORD`) VALUES
(20170801, 'wahwan', 'wakwaw22'),
(20170802, 'ridho', 'ridho22');

-- --------------------------------------------------------

--
-- Table structure for table `akun_pemilih`
--

CREATE TABLE IF NOT EXISTS `akun_pemilih` (
  `NIK` int(11) DEFAULT NULL,
  `USERNAME` varchar(25) NOT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun_pemilih`
--

INSERT INTO `akun_pemilih` (`NIK`, `USERNAME`, `PASSWORD`) VALUES
(20171, 'amir', 'hanjakal21'),
(20172, 'imam', 'hanjakal22');

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE IF NOT EXISTS `kandidat` (
  `NO_KDT` int(11) NOT NULL,
  `NAMA` varchar(25) DEFAULT NULL,
  `JENIS_KELAMIN` char(1) DEFAULT NULL,
  `NO_HP` varchar(14) DEFAULT NULL,
  `ALAMAT` text,
  `VISI` text,
  `MISI` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kandidat`
--

INSERT INTO `kandidat` (`NO_KDT`, `NAMA`, `JENIS_KELAMIN`, `NO_HP`, `ALAMAT`, `VISI`, `MISI`) VALUES
(1, 'Ucup Surucup', 'L', '+6289777666555', 'komp. Saung Hejo no 17', 'membuat indonesia menjadi kaya', 'membuat wifi indonesia kencang'),
(2, 'Indah', 'P', '+628765499912', 'komp. Tanjung sari no3', 'mengalahkan amerika', 'membbuat rakyat indonesia menjadi lebih peka');

-- --------------------------------------------------------

--
-- Table structure for table `man_pemilu`
--

CREATE TABLE IF NOT EXISTS `man_pemilu` (
  `ID_PEMILU` int(11) NOT NULL,
  `DESKRIPSI` text,
  `WAKTU_MULAI` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `WAKTU_SELESAI` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `man_pemilu`
--

INSERT INTO `man_pemilu` (`ID_PEMILU`, `DESKRIPSI`, `WAKTU_MULAI`, `WAKTU_SELESAI`) VALUES
(1, 'pemilihan ketua ketuaan', '2017-11-25 18:00:00', '2017-11-25 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pemenang`
--

CREATE TABLE IF NOT EXISTS `pemenang` (
  `ID_PEMILU` int(11) DEFAULT NULL,
  `JML_SUARA` int(11) DEFAULT NULL,
  `NO_KDT` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemilih`
--

CREATE TABLE IF NOT EXISTS `pemilih` (
  `NIK` int(11) NOT NULL,
  `NAMA` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `JENIS_KELAMIN` char(1) DEFAULT NULL,
  `NO_HP` varchar(14) DEFAULT NULL,
  `ALAMAT` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemilih`
--

INSERT INTO `pemilih` (`NIK`, `NAMA`, `EMAIL`, `JENIS_KELAMIN`, `NO_HP`, `ALAMAT`) VALUES
(20171, 'Amir', 'amirabdillah@gmail.com', 'L', '+6289615921374', 'jl. Mekarsari no 15'),
(20172, 'Imam', 'imamgejolak@gmail,com', 'L', '+6289615921373', 'jl. ManusiaApi no. 5'),
(20173, 'Umam', 'MislahulUman@gmail.com', 'L', '+6281777555987', NULL),
(20174, 'Jilal', 'jilalakbar@gmail.com', 'L', '+6281777555988', 'komp. Kolongbambu no 15');

-- --------------------------------------------------------

--
-- Table structure for table `suara`
--

CREATE TABLE IF NOT EXISTS `suara` (
  `NO_KDT` int(11) NOT NULL,
  `NIK` int(11) NOT NULL,
  `NO_SUARA` int(11) NOT NULL,
  `ID_PEMILU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suara`
--

INSERT INTO `suara` (`NO_KDT`, `NIK`, `NO_SUARA`, `ID_PEMILU`) VALUES
(1, 20171, 1, 1),
(1, 20172, 2, 1),
(2, 20173, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `akun_admin`
--
ALTER TABLE `akun_admin`
 ADD KEY `FK_MEMILIKI2` (`NIP`);

--
-- Indexes for table `akun_pemilih`
--
ALTER TABLE `akun_pemilih`
 ADD KEY `FK_MEMILIKI` (`NIK`);

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
 ADD PRIMARY KEY (`NO_KDT`);

--
-- Indexes for table `man_pemilu`
--
ALTER TABLE `man_pemilu`
 ADD PRIMARY KEY (`ID_PEMILU`);

--
-- Indexes for table `pemenang`
--
ALTER TABLE `pemenang`
 ADD KEY `FK_TERDATA` (`ID_PEMILU`), ADD KEY `FK_MENGHASILKAN` (`NO_KDT`);

--
-- Indexes for table `pemilih`
--
ALTER TABLE `pemilih`
 ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `suara`
--
ALTER TABLE `suara`
 ADD PRIMARY KEY (`NO_SUARA`), ADD KEY `FK_MEMBUAT` (`ID_PEMILU`), ADD KEY `FK_MEMILIH` (`NO_KDT`), ADD KEY `FK_MEMILIH2` (`NIK`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun_admin`
--
ALTER TABLE `akun_admin`
ADD CONSTRAINT `FK_MEMILIKI2` FOREIGN KEY (`NIP`) REFERENCES `admin` (`NIP`) ON UPDATE CASCADE;

--
-- Constraints for table `akun_pemilih`
--
ALTER TABLE `akun_pemilih`
ADD CONSTRAINT `FK_MEMILIKI` FOREIGN KEY (`NIK`) REFERENCES `pemilih` (`NIK`) ON UPDATE CASCADE;

--
-- Constraints for table `pemenang`
--
ALTER TABLE `pemenang`
ADD CONSTRAINT `FK_MENGHASILKAN` FOREIGN KEY (`NO_KDT`) REFERENCES `kandidat` (`NO_KDT`),
ADD CONSTRAINT `FK_TERDATA` FOREIGN KEY (`ID_PEMILU`) REFERENCES `man_pemilu` (`ID_PEMILU`);

--
-- Constraints for table `suara`
--
ALTER TABLE `suara`
ADD CONSTRAINT `FK_MEMBUAT` FOREIGN KEY (`ID_PEMILU`) REFERENCES `man_pemilu` (`ID_PEMILU`),
ADD CONSTRAINT `FK_MEMILIH` FOREIGN KEY (`NO_KDT`) REFERENCES `kandidat` (`NO_KDT`),
ADD CONSTRAINT `FK_MEMILIH2` FOREIGN KEY (`NIK`) REFERENCES `pemilih` (`NIK`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
