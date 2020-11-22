-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 18, 2020 at 05:13 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_WSET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_caffekita`
--

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
(7, 'TRANSAKSI-003', 'MENU-002', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `kode_menupesanan` varchar(60) NOT NULL,
  `nama_menu` text,
  `harga_menu` int(11) DEFAULT NULL,
  `kategori` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`kode_menupesanan`, `nama_menu`, `harga_menu`, `kategori`) VALUES
('MENU-001', 'Ice Cincau', 5000, 'Minuman'),
('MENU-002', 'Ayam Geprek Spesial', 25000, 'Makanan'),
('MENU-003', 'Bakso Kikil Spesial', 30000, 'Makanan'),
('MENU-004', 'Bajigur Ice Cream', 10000, 'Minuman');

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
('TRANSAKSI-001', 'CUSTOMER-025', '2020-07-28 04:42:40', 'Cash', 50000, 'WAIT-056'),
('TRANSAKSI-002', 'CUSTOMER-045', '2020-07-28 04:42:45', 'Cash', 200000, 'WAIT-076'),
('TRANSAKSI-003', 'CUSTOMER-033', '2020-09-17 02:05:44', 'Cash', 100000, 'WAIT-056');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `kode_user` int(11) NOT NULL,
  `id_user` text,
  `nama_user` text,
  `kontak` text,
  `password` text,
  `username` text,
  `roles` text,
  `tanggal_terdaftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`kode_user`, `id_user`, `nama_user`, `kontak`, `password`, `username`, `roles`, `tanggal_terdaftar`) VALUES
(1, 'USR-912039', 'Rani Febriani', '081xxxxxxxxx', 'rani', 'rani', 'Waitress', '2020-08-12 02:08:29'),
(2, 'USR-234223', 'Firman Utina', '081xxxxxxxxx', 'firman', 'firman', 'Member', '2020-08-12 02:08:38'),
(3, 'USR-342233', 'Hermansyah Saputra', '081xxxxxxxxx', 'saputra', 'saputra', 'Member', '2020-08-12 02:08:46'),
(4, 'USR-212211', 'Julianto', '081xxxxxxxxx', 'juli', 'juli', 'Waitress', '2020-08-12 02:08:52'),
(5, 'USR-113223', 'Utami', '081xxxxxxxxx', 'utami', 'utami', 'Member', '2020-08-12 02:09:00'),
(6, 'USR-128931', 'Hendra Witjaksono', '0813xxxxxx', '123', 'hendra', 'Administrator', '2020-08-13 01:22:51'),
(7, 'USR-1823791', 'Mika Keyla', '081492034101', '123', 'mikha', 'Waitress', '2020-08-13 01:32:04'),
(8, 'USR-1823792', 'Randi Fadhila', '0812931231312', '123', 'randi', 'Administrator', '2020-08-13 01:50:43');

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
-- Indexes for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD PRIMARY KEY (`kode_relasi`,`kode_transaksi`),
  ADD KEY `FK_menu2detailtransaksi` (`kode_menupesanan`),
  ADD KEY `fk_tran2detailtrans` (`kode_transaksi`);

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
  ADD KEY `fk_trans2wait` (`kode_waitress`),
  ADD KEY `fk_trans2customer` (`kode_pelanggan`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`kode_user`);

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
  MODIFY `kode_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `kode_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD CONSTRAINT `FK_menu2detailtransaksi` FOREIGN KEY (`kode_menupesanan`) REFERENCES `tbl_menu` (`kode_menupesanan`),
  ADD CONSTRAINT `fk_tran2detailtrans` FOREIGN KEY (`kode_transaksi`) REFERENCES `tbl_transaksi` (`kode_transaksi`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `fk_trans2customer` FOREIGN KEY (`kode_pelanggan`) REFERENCES `tbl_pelanggan` (`kode_pelanggan`),
  ADD CONSTRAINT `fk_trans2wait` FOREIGN KEY (`kode_waitress`) REFERENCES `tbl_waitress` (`kode_waitress`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


use db_caffekita;

ALTER TABLE tbl_menu
ADD COLUMN img_menu TEXT AFTER kategori;

USE db_caffekita;

SHOW TABLES;

SELECT * FROM 
tbl_transaksi;

INSERT INTO tbl_transaksi
(kode_transaksi, kode_pelanggan, metode_pembayaran, total_cash, kode_waitress)
VALUES
('TRANSAKSI-005', 'CUSTOMER-033', 'Cash', 250000, 'WAIT-076');

SELECT * FROM tbl_transaksi WHERE kode_transaksi ='TRANSAKSI-0087';

SHOW TABLES;

CREATE TABLE tbl_chart
(
  kode_chart INT(11) PRIMARY KEY,
  kode_detailchart VARCHAR(60),
  tanggal_tambah DATETIME
);

ALTER TABLE tbl_chart
CHANGE kode_detailchart kode_transaksi VARCHAR(60)

ALTER TABLE tbl_detailtransaksi
DROP FOREIGN KEY fk_tran2detailtrans;

ALTER TABLE tbl_transaksi
DROP FOREIGN KEY fk_trans2wait;

ALTER TABLE tbl_transaksi
DROP FOREIGN KEY fk_trans2customer;

ALTER TABLE tbl_transaksi
DROP PRIMARY KEY;

ALTER TABLE tbl_transaksi
ADD COLUMN kode_detailchart VARCHAR(60) NOT NULL 
AFTER kode_transaksi

ALTER TABLE tbl_transaksi
ADD CONSTRAINT pk_transaksi PRIMARY KEY (kode_transaksi, kode_detailchart);

ALTER TABLE tbl_transaksi
ADD CONSTRAINT fk_transaksi_pelanggan
FOREIGN KEY (kode_pelanggan) REFERENCES tbl_pelanggan(kode_pelanggan);

ALTER TABLE tbl_transaksi
ADD CONSTRAINT fk_transaksi_waitress
FOREIGN KEY (kode_waitress) REFERENCES tbl_waitress(kode_waitress);

ALTER TABLE tbl_detailtransaksi
ADD CONSTRAINT fk_detail_transaksi
FOREIGN KEY (kode_transaksi) REFERENCES tbl_transaksi(kode_transaksi);

ALTER TABLE tbl_chart
ADD CONSTRAINT fk_chart_transaksi
FOREIGN KEY (kode_transaksi) REFERENCES tbl_transaksi(kode_transaksi);

-- ============================================================== BATCH 2

ALTER TABLE tbl_transaksi
DROP FOREIGN KEY fk_transaksi_pelanggan;

ALTER TABLE tbl_transaksi
DROP FOREIGN KEY fk_transaksi_waitress;

ALTER TABLE tbl_chart
DROP FOREIGN KEY fk_chart_transaksi;

ALTER TABLE tbl_detailtransaksi
DROP FOREIGN KEY fk_detail_transaksi;

ALTER TABLE tbl_transaksi
DROP PRIMARY KEY;

ALTER TABLE tbl_transaksi
DROP COLUMN kode_detailchart;

ALTER TABLE tbl_transaksi
ADD CONSTRAINT pk_transaksi PRIMARY KEY (kode_transaksi);