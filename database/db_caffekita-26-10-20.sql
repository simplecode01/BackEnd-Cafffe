-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2020 at 11:18 AM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_caffekita`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chart`
--

CREATE TABLE `tbl_chart` (
  `kode_chart` int(11) NOT NULL,
  `kode_transaksi` varchar(60) DEFAULT NULL,
  `tanggal_tambah` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_chart`
--

INSERT INTO `tbl_chart` (`kode_chart`, `kode_transaksi`, `tanggal_tambah`) VALUES
(9081023, 'TRANSAKSI-001', '2020-10-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailtransaksi`
--

CREATE TABLE `tbl_detailtransaksi` (
  `kode_relasi` int(11) NOT NULL,
  `kode_transaksi` varchar(60) NOT NULL,
  `kode_menupesanan` varchar(60) DEFAULT NULL,
  `jumlah_pesanan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_detailtransaksi`
--

INSERT INTO `tbl_detailtransaksi` (`kode_relasi`, `kode_transaksi`, `kode_menupesanan`, `jumlah_pesanan`) VALUES
(1, 'TRANSAKSI-001', 'MENU-001', 2),
(2, 'TRANSAKSI-001', 'MENU-002', 1),
(3, 'TRANSAKSI-002', 'MENU-004', 3),
(4, 'TRANSAKSI-002', 'MENU-002', 2),
(5, 'TRANSAKSI-002', 'MENU-003', 2),
(6, 'TRANSAKSI-003', 'MENU-004', 2),
(7, 'TRANSAKSI-003', 'MENU-002', 2),
(8, 'TRANSAKSI-004', 'MENU-003', 5),
(9, 'TRANSAKSI-004', 'MENU-001', 5),
(10, 'TRANSAKSI-004', 'MENU-004', 5),
(18, 'TRX-25102020084519-5', 'MENU-002', 1),
(19, 'TRX-25102020084519-5', 'MENU-002', 4),
(20, 'TRX-25102020084519-5', 'MENU-001', 2),
(21, 'TRX-25102020084519-5', 'MENU-003', 4),
(22, 'TRX-25102020084519-5', 'MENU-004', 4),
(23, 'TRX-25102020084519-5', 'MENU-007', 4),
(24, 'TRX-25102020084519-5', 'MENU-008', 2),
(25, 'TRX-25102020084519-5', 'MENU-002', 2),
(26, 'TRX-25102020084519-5', 'MENU-001', 5),
(27, 'TRX-25102020084519-5', 'MENU-007', 5),
(28, 'TRX-25102020084519-5', 'MENU-005', 1),
(29, 'TRX-25102020084519-5', 'MENU-005', 10),
(30, 'TRX-25102020084519-5', 'MENU-005', 10),
(31, 'TRX-25102020084519-5', 'MENU-002', 2),
(34, 'TRX-25102020084519-5', 'MENU-004', 2),
(35, 'TRX-26102020105433-6', 'MENU-004', 2),
(36, 'TRX-26102020105433-6', 'MENU-001', 5),
(38, 'TRX-26102020110658-7', 'MENU-006', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `kode_menupesanan` varchar(60) NOT NULL,
  `nama_menu` text,
  `harga_menu` int(11) DEFAULT NULL,
  `kategori` text,
  `img_menu` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`kode_menupesanan`, `nama_menu`, `harga_menu`, `kategori`, `img_menu`) VALUES
('MENU-001', 'Ice Cincau', 5000, 'Minuman', 'default_image.png'),
('MENU-002', 'Ayam Geprek Spesial', 25000, 'Makanan', 'default_image.png'),
('MENU-003', 'Bakso Kikil Spesial', 30000, 'Makanan', 'default_image.png'),
('MENU-004', 'Bajigur Ice Cream', 10000, 'Minuman', 'default_image.png'),
('MENU-005', 'Sate Maranggi Spesial', 35000, 'Manakan', 'maranggi.jpg'),
('MENU-006', 'Rujak Tumbuk Spesial', 10500, 'Makanan', 'default_image.png'),
('MENU-007', 'Gulai Sapi Spesial ala Samarinda', 25000, 'Makanan', 'default_image.png'),
('MENU-008', 'Sate Ayam Spesial Subang (15 Tusuk)', 15000, 'Makanan', 'default_image.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `kode_pelanggan` varchar(60) NOT NULL,
  `tanggal_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nama_pelanggan` text,
  `wa_no` text,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`kode_pelanggan`, `tanggal_daftar`, `nama_pelanggan`, `wa_no`, `alamat`) VALUES
('CUSTOMER-025', '2020-07-28 04:40:39', 'Irfan Maulana', '+62841923011', 'Bekasi Barat'),
('CUSTOMER-033', '2020-09-17 02:04:21', 'Asep Septiadi, S.Kom.', '+0834534c234289', 'Cikarang Timur, Bekasi.'),
('CUSTOMER-045', '2020-07-28 04:40:39', 'Ari Hidayat Fahrul', '+628141921023', 'Bekasi Timur');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `kode_transaksi` varchar(60) NOT NULL,
  `kode_pelanggan` varchar(60) DEFAULT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `metode_pembayaran` text,
  `total_cash` int(11) DEFAULT NULL,
  `kode_waitress` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`kode_transaksi`, `kode_pelanggan`, `tanggal_transaksi`, `metode_pembayaran`, `total_cash`, `kode_waitress`) VALUES
('TRANSAKSI-001', 'CUSTOMER-025', '2020-10-23 02:42:11', 'Cash', 50000, 'WAIT-056'),
('TRANSAKSI-002', 'CUSTOMER-045', '2020-10-23 02:42:25', 'Cash', 200000, 'WAIT-076'),
('TRANSAKSI-003', 'CUSTOMER-033', '2020-10-23 02:42:29', 'Cash', 100000, 'WAIT-056'),
('TRANSAKSI-004', 'CUSTOMER-025', '2020-10-23 02:42:31', 'Cash', 250000, 'WAIT-056'),
('TRX-25102020084519-5', NULL, '2020-10-25 01:45:22', NULL, NULL, 'WAIT-056'),
('TRX-26102020105433-6', NULL, '2020-10-26 03:54:35', NULL, NULL, 'WAIT-056'),
('TRX-26102020110658-7', NULL, '2020-10-26 04:07:05', NULL, NULL, 'WAIT-056');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waitress`
--

CREATE TABLE `tbl_waitress` (
  `kode_waitress` varchar(60) NOT NULL,
  `nama_waitress` text,
  `join_tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `wa_no` text,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_waitress`
--

INSERT INTO `tbl_waitress` (`kode_waitress`, `nama_waitress`, `join_tanggal`, `wa_no`, `alamat`) VALUES
('WAIT-056', 'Firdasari Putri', '2020-07-28 04:27:41', '+628132233112', 'Cikarang, Bekasi'),
('WAIT-076', 'Ahmad Fauzi', '2020-07-28 04:27:41', '+628123810232', 'Cibarusah, Cikarang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_chart`
--
ALTER TABLE `tbl_chart`
  ADD PRIMARY KEY (`kode_chart`),
  ADD KEY `fk_chart_transaksi` (`kode_transaksi`);

--
-- Indexes for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD PRIMARY KEY (`kode_relasi`,`kode_transaksi`),
  ADD KEY `FK_menu2detailtransaksi` (`kode_menupesanan`),
  ADD KEY `fk_detail_transaksi` (`kode_transaksi`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`kode_menupesanan`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `fk_transaksi_pelanggan` (`kode_pelanggan`),
  ADD KEY `fk_transaksi_waitress` (`kode_waitress`);

--
-- Indexes for table `tbl_waitress`
--
ALTER TABLE `tbl_waitress`
  ADD PRIMARY KEY (`kode_waitress`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  MODIFY `kode_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_chart`
--
ALTER TABLE `tbl_chart`
  ADD CONSTRAINT `fk_chart_transaksi` FOREIGN KEY (`kode_transaksi`) REFERENCES `tbl_transaksi` (`kode_transaksi`);

--
-- Constraints for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD CONSTRAINT `FK_menu2detailtransaksi` FOREIGN KEY (`kode_menupesanan`) REFERENCES `tbl_menu` (`kode_menupesanan`),
  ADD CONSTRAINT `fk_detail_transaksi` FOREIGN KEY (`kode_transaksi`) REFERENCES `tbl_transaksi` (`kode_transaksi`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `fk_transaksi_pelanggan` FOREIGN KEY (`kode_pelanggan`) REFERENCES `tbl_pelanggan` (`kode_pelanggan`),
  ADD CONSTRAINT `fk_transaksi_waitress` FOREIGN KEY (`kode_waitress`) REFERENCES `tbl_waitress` (`kode_waitress`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
