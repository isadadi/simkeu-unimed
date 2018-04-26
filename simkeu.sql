-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2018 at 07:47 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simkeu`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'user admin', NULL, NULL, NULL, NULL),
('buka-verifikasi', 1, 'Admin buka verifikasi', NULL, NULL, NULL, NULL),
('user', 1, 'Halaman User', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'buka-verifikasi'),
('admin', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_akun`
--

CREATE TABLE `simkeu_akun` (
  `akun_id` int(11) NOT NULL,
  `pagu_id` int(11) NOT NULL,
  `mak_id` int(11) NOT NULL,
  `output_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `akun_uraian` int(11) NOT NULL,
  `akun_jumlah` int(11) NOT NULL,
  `tahun_anggaran` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_master_mak`
--

CREATE TABLE `simkeu_master_mak` (
  `mak_id` int(11) NOT NULL,
  `mak_kd` varchar(50) NOT NULL,
  `mak_uraian` text NOT NULL,
  `tahun_anggaran` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_master_output`
--

CREATE TABLE `simkeu_master_output` (
  `output_id` int(11) NOT NULL,
  `output_kd` int(11) NOT NULL,
  `output_uraian` int(11) NOT NULL,
  `tahun_anggaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_master_pagu`
--

CREATE TABLE `simkeu_master_pagu` (
  `pagu_id` int(11) NOT NULL,
  `pagu_kd` varchar(50) NOT NULL,
  `pagu_uraian` text NOT NULL,
  `tahun_anggaran` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_master_pejabat`
--

CREATE TABLE `simkeu_master_pejabat` (
  `pajabat_id` int(11) NOT NULL,
  `pejabat_nip` varchar(50) NOT NULL,
  `pejabat_nama` varchar(50) NOT NULL,
  `pejabat_jabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_master_unit`
--

CREATE TABLE `simkeu_master_unit` (
  `unit_id` int(11) NOT NULL,
  `unit_nama` varchar(255) NOT NULL,
  `unit_status` enum('aktif','nonaktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simkeu_master_unit`
--

INSERT INTO `simkeu_master_unit` (`unit_id`, `unit_nama`, `unit_status`) VALUES
(1, 'master', 'aktif'),
(2, 'FMIPA', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_pembayaran_up`
--

CREATE TABLE `simkeu_pembayaran_up` (
  `pembayaran_id` int(11) NOT NULL,
  `pembayaran_no_bukti` char(10) NOT NULL,
  `pembayaran_tanggal` date NOT NULL,
  `pembayaran_uraian` text NOT NULL,
  `unit_id` int(11) NOT NULL,
  `pembayaran_jumlah` int(11) NOT NULL,
  `tahun_anggaran` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_penerimaan_up`
--

CREATE TABLE `simkeu_penerimaan_up` (
  `penerimaan_id` int(11) NOT NULL,
  `penerimaan_no_bukti` char(10) NOT NULL,
  `penerimaan_tanggal` date NOT NULL,
  `penerimaan_jumlah` int(11) NOT NULL,
  `penerimaan_uraian` text NOT NULL,
  `tahun_anggaran` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_pungut_pajak`
--

CREATE TABLE `simkeu_pungut_pajak` (
  `pungut_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `pungut_wajib_pajak` varchar(50) NOT NULL,
  `pungut_npwp` varchar(50) NOT NULL,
  `pungut_pph` int(11) NOT NULL,
  `pungut_pph21` int(11) NOT NULL,
  `pungut_pph22` int(11) NOT NULL,
  `pungut_pph23` int(11) NOT NULL,
  `lainnya` int(11) NOT NULL,
  `pungut_jumlah` int(20) NOT NULL,
  `pungut_tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_riwayat`
--

CREATE TABLE `simkeu_riwayat` (
  `riwayat_id` int(11) NOT NULL,
  `riwayat_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `id_terkait` int(11) NOT NULL,
  `riwayat_uraian` text NOT NULL,
  `tahun_anggaran` varchar(5) NOT NULL,
  `tabel` varchar(30) NOT NULL,
  `aksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_setor_pajak`
--

CREATE TABLE `simkeu_setor_pajak` (
  `setor_id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `setor_tanggal` date NOT NULL,
  `setor_wajib_pajak` int(11) NOT NULL,
  `setor_npwp` int(11) NOT NULL,
  `setor_pph` int(11) NOT NULL,
  `setor_pph21` int(11) NOT NULL,
  `setor_pph22` int(11) NOT NULL,
  `setor_pph23` int(11) NOT NULL,
  `setor_lainnya` int(11) NOT NULL,
  `setor_jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_tahun_anggaran`
--

CREATE TABLE `simkeu_tahun_anggaran` (
  `tahun_anggaran` varchar(5) NOT NULL,
  `anggaran_status` enum('aktif','nonaktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_transaksi`
--

CREATE TABLE `simkeu_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `transaksi_tanggal` date NOT NULL,
  `akun_id` int(11) NOT NULL,
  `transaksi_uraian` text NOT NULL,
  `transaksi_jumlah` int(20) NOT NULL,
  `transaksi_pengguna` varchar(50) NOT NULL,
  `transaksi_pungut_pajak` enum('ya','tidak') NOT NULL,
  `transaksi_verifikasi` enum('perbaikan','verifikator','nihil','selesai') NOT NULL,
  `transaksi_komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simkeu_user`
--

CREATE TABLE `simkeu_user` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(25) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_nama` varchar(50) NOT NULL,
  `user_level` enum('admin','bendum','bnbp','bppc','verifikator','nihil') NOT NULL,
  `user_status` enum('aktif','nonaktif') NOT NULL,
  `user_authKey` varchar(250) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simkeu_user`
--

INSERT INTO `simkeu_user` (`user_id`, `user_username`, `user_password`, `user_nama`, `user_level`, `user_status`, `user_authKey`, `unit_id`) VALUES
(3, 'admin', '$2y$13$q3IYbissuwsXvle/P7A2RO/t7VhbFGtwSSPNSKmWGWoW.DsE.vw4i', 'Admin', 'admin', 'aktif', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `simkeu_akun`
--
ALTER TABLE `simkeu_akun`
  ADD PRIMARY KEY (`akun_id`),
  ADD KEY `pagu_id` (`pagu_id`),
  ADD KEY `mak_id` (`mak_id`),
  ADD KEY `output_id` (`output_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `simkeu_master_mak`
--
ALTER TABLE `simkeu_master_mak`
  ADD PRIMARY KEY (`mak_id`);

--
-- Indexes for table `simkeu_master_output`
--
ALTER TABLE `simkeu_master_output`
  ADD PRIMARY KEY (`output_id`);

--
-- Indexes for table `simkeu_master_pagu`
--
ALTER TABLE `simkeu_master_pagu`
  ADD PRIMARY KEY (`pagu_id`);

--
-- Indexes for table `simkeu_master_pejabat`
--
ALTER TABLE `simkeu_master_pejabat`
  ADD PRIMARY KEY (`pajabat_id`);

--
-- Indexes for table `simkeu_master_unit`
--
ALTER TABLE `simkeu_master_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `simkeu_pembayaran_up`
--
ALTER TABLE `simkeu_pembayaran_up`
  ADD PRIMARY KEY (`pembayaran_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `simkeu_penerimaan_up`
--
ALTER TABLE `simkeu_penerimaan_up`
  ADD PRIMARY KEY (`penerimaan_id`);

--
-- Indexes for table `simkeu_pungut_pajak`
--
ALTER TABLE `simkeu_pungut_pajak`
  ADD PRIMARY KEY (`pungut_id`),
  ADD KEY `transaksi_id` (`transaksi_id`);

--
-- Indexes for table `simkeu_riwayat`
--
ALTER TABLE `simkeu_riwayat`
  ADD PRIMARY KEY (`riwayat_id`);

--
-- Indexes for table `simkeu_setor_pajak`
--
ALTER TABLE `simkeu_setor_pajak`
  ADD PRIMARY KEY (`setor_id`),
  ADD KEY `transaksi_id` (`transaksi_id`);

--
-- Indexes for table `simkeu_transaksi`
--
ALTER TABLE `simkeu_transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `akun_id` (`akun_id`);

--
-- Indexes for table `simkeu_user`
--
ALTER TABLE `simkeu_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `simkeu_akun`
--
ALTER TABLE `simkeu_akun`
  MODIFY `akun_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_master_mak`
--
ALTER TABLE `simkeu_master_mak`
  MODIFY `mak_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_master_output`
--
ALTER TABLE `simkeu_master_output`
  MODIFY `output_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_master_pagu`
--
ALTER TABLE `simkeu_master_pagu`
  MODIFY `pagu_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_master_pejabat`
--
ALTER TABLE `simkeu_master_pejabat`
  MODIFY `pajabat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_master_unit`
--
ALTER TABLE `simkeu_master_unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `simkeu_pembayaran_up`
--
ALTER TABLE `simkeu_pembayaran_up`
  MODIFY `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_penerimaan_up`
--
ALTER TABLE `simkeu_penerimaan_up`
  MODIFY `penerimaan_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_pungut_pajak`
--
ALTER TABLE `simkeu_pungut_pajak`
  MODIFY `pungut_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_riwayat`
--
ALTER TABLE `simkeu_riwayat`
  MODIFY `riwayat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_setor_pajak`
--
ALTER TABLE `simkeu_setor_pajak`
  MODIFY `setor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_transaksi`
--
ALTER TABLE `simkeu_transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simkeu_user`
--
ALTER TABLE `simkeu_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simkeu_akun`
--
ALTER TABLE `simkeu_akun`
  ADD CONSTRAINT `simkeu_akun_ibfk_1` FOREIGN KEY (`pagu_id`) REFERENCES `simkeu_master_pagu` (`pagu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `simkeu_akun_ibfk_2` FOREIGN KEY (`mak_id`) REFERENCES `simkeu_master_mak` (`mak_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `simkeu_akun_ibfk_3` FOREIGN KEY (`output_id`) REFERENCES `simkeu_master_output` (`output_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `simkeu_akun_ibfk_4` FOREIGN KEY (`unit_id`) REFERENCES `simkeu_master_unit` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simkeu_pembayaran_up`
--
ALTER TABLE `simkeu_pembayaran_up`
  ADD CONSTRAINT `simkeu_pembayaran_up_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `simkeu_master_unit` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simkeu_pungut_pajak`
--
ALTER TABLE `simkeu_pungut_pajak`
  ADD CONSTRAINT `simkeu_pungut_pajak_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `simkeu_transaksi` (`transaksi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simkeu_setor_pajak`
--
ALTER TABLE `simkeu_setor_pajak`
  ADD CONSTRAINT `simkeu_setor_pajak_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `simkeu_transaksi` (`transaksi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simkeu_transaksi`
--
ALTER TABLE `simkeu_transaksi`
  ADD CONSTRAINT `simkeu_transaksi_ibfk_1` FOREIGN KEY (`akun_id`) REFERENCES `simkeu_akun` (`akun_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simkeu_user`
--
ALTER TABLE `simkeu_user`
  ADD CONSTRAINT `simkeu_user_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `simkeu_master_unit` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
