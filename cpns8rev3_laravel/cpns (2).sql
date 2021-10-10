-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2021 at 06:14 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpns`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `no_telp` char(13) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_admin`, `no_telp`, `jenis_kelamin`, `username`, `password`) VALUES
(1, 'Administrator', '08000000000', 'Laki-laki', 'admin', 'qwerty'),
(11, 'Hanif Mukkorrobin', '085640988663', 'Laki-laki', 'hanif', 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `tb_informasi`
--

CREATE TABLE `tb_informasi` (
  `id_informasi` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(225) NOT NULL,
  `tgl_upload` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_informasi`
--

INSERT INTO `tb_informasi` (`id_informasi`, `judul`, `isi`, `gambar`, `tgl_upload`) VALUES
(8, 'Ayo Ikuti CPNS 2021', 'Penerimaan Calon Pegawan Negeri Sipil (CPNS) 2018 dibuka. Berdasarkan Permen PANRB No.36/2018 tentang Kriteria Penetapan Kebutuhan PNS dan Pelaksanaan CPNS Tahun 2018, pemerintah Indonesia akan membuka lowongan 238.015 formasi untuk pengadaan kali ini dan akan memulai pendaftaran pada 19 September 2018 melalui portal http://sscn.bkn.go.id.\r\n\r\nSebanyak Sebanyak 51.271 formasi di antaranya untuk instansi Pemerintah Pusat (76 K/L) dan 186.744 formasi untuk instansi Pemerintah Daerah (Pemda). Rinciannya, ada jabatan Inti yang diisi dari pelamar umum sebanyak 24.817 formasi, Guru Madrasah Kementerian Agama yang bertugas di Kabupaten/Kota sebanyak 12.000 formasi, serta dosen Kemenristekdikti dan Kementerian Agama sebanyak 14.454 formasi.\r\n\r\nAdapun peruntukan instansi Pemerintah Daerah terdiri dari Guru Kelas dan Mata Pelajaran sebanyak 88.000 formasi, Guru Agama sebanyak 8.000 formasi, Tenaga Kesehatan sebanyak 60.315 formasi (Dokter Umum, Dokter Spesialis, Dokter Gigi, dan Tenaga Medis/Paramedis), serta Tenaga Teknis yang diisi dari pelamar umum sebanyak 30.429 formasi.\r\n\r\nDitambahkan pada penerimaan CPNS tahun ini dibuka formasi khusus yang terdiri dari lulusan terbaik (cumlaude), penyandang disabilitas, putra-putri Papua dan Papua Barat, Diaspora, olahragawan berprestasi internasional, serta tenaga pendidik dan tenaga kesehatan eks tenaga honorer kategori II yang memenuhi persyaratan.\r\n\r\nSejumlah instansi pemerintah baik pusat maupun daerah juga sudah menyetorkan dan mengumumkan formasi seleksi penerimaann CPNS 2021.', '1626940475.jpg', '2021-07-22'),
(11, 'CPNS 2021 Segera Dibuka', 'CPNS 2021 Akan Segera Dibuka, Cek Syaratnya!', 'image_1920x_6048f244310d1.jpg', '2021-07-23'),
(12, 'Seleksi CPNS dan PPPK', 'Plt Kepala Biro Humas, Hukum, dan Kerja Sama BKN Paryono mengatakan, pengumuman hasil seleksi administrasi CPNS 2021 masih sesuai pada jadwal terbaru yang dirilis BKN pada 19 Juli 2021. Jadwal tersebut tertuang dalam Surat Kepala BKN Nomor 6201/B-KS.04.01/SD/K/2021 tentang Penyesuaian Jadwal Tahapan Pelaksanaan Seleksi Calon ASN Tahun 2021.\r\n\r\nTertulis, pengumuman hasil seleksi administrasi akan dilakukan pada 2-3 Agustus 2021\r\n\r\nKemudian dilanjutkan dengan masa sanggah hingga pengumuman pasca-sanggah yang akan dilakukan pada pertengahan Agustus 2021. \r\nBerikut jadwalnya: \r\n- Pengumuman seleksi ASN: 30 Juni-14 Juli 2021 \r\n- Pendaftaran seleksi ASN: 30 Juni-26 Juli 2021\r\n- Pengumuman hasil seleksi administrasi: 2-3 Agustus 2021 \r\n- Masa sanggah: 4 Agustus-6 Agustus 2021\r\n-Jawab sanggah: 4-13 Agustus 2021\r\n- Pengumuman pasca-sanggah: 15 Agustus 2021.', '1632194284.png', '2021-09-21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Tes Wawasan Kebangsaan'),
(2, 'Tes Intelegensi Umum'),
(3, 'Tes Karakteristik Pribadi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lembar_soal`
--

CREATE TABLE `tb_lembar_soal` (
  `id_lembar_soal` int(11) NOT NULL,
  `no_soal` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `jawaban` text NOT NULL DEFAULT 'null',
  `nilai` int(32) NOT NULL,
  `kesempatan` int(11) NOT NULL,
  `tipe_tryout` varchar(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `ragu` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_lembar_soal`
--

INSERT INTO `tb_lembar_soal` (`id_lembar_soal`, `no_soal`, `id_soal`, `id_peserta`, `jawaban`, `nilai`, `kesempatan`, `tipe_tryout`, `status`, `ragu`) VALUES
(1, 1, 280, 5, 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 5, 1, 'premium', 1, 0),
(2, 2, 306, 5, 'Otonomi Daerah', 0, 1, 'premium', 1, 0),
(3, 3, 301, 5, 'A dan B benar', 0, 1, 'premium', 1, 0),
(4, 4, 284, 5, 'kosong', 0, 1, 'premium', 1, 0),
(5, 5, 290, 5, 'null', 0, 1, 'premium', 1, 0),
(6, 6, 289, 5, 'null', 0, 1, 'premium', 1, 0),
(7, 7, 308, 5, 'null', 0, 1, 'premium', 1, 0),
(8, 8, 305, 5, 'null', 0, 1, 'premium', 1, 0),
(9, 9, 303, 5, 'null', 0, 1, 'premium', 1, 0),
(10, 10, 298, 5, 'null', 0, 1, 'premium', 1, 0),
(11, 11, 291, 5, 'null', 0, 1, 'premium', 1, 0),
(12, 12, 309, 5, 'null', 0, 1, 'premium', 1, 0),
(13, 13, 281, 5, 'null', 0, 1, 'premium', 1, 0),
(14, 14, 286, 5, 'null', 0, 1, 'premium', 1, 0),
(15, 15, 288, 5, 'null', 0, 1, 'premium', 1, 0),
(16, 16, 299, 5, 'null', 0, 1, 'premium', 1, 0),
(17, 17, 285, 5, 'null', 0, 1, 'premium', 1, 0),
(18, 18, 295, 5, 'null', 0, 1, 'premium', 1, 0),
(19, 19, 282, 5, 'null', 0, 1, 'premium', 1, 0),
(20, 20, 293, 5, 'null', 0, 1, 'premium', 1, 0),
(21, 21, 302, 5, 'null', 0, 1, 'premium', 1, 0),
(22, 22, 294, 5, 'null', 0, 1, 'premium', 1, 0),
(23, 23, 296, 5, 'null', 0, 1, 'premium', 1, 0),
(24, 24, 287, 5, 'null', 0, 1, 'premium', 1, 0),
(25, 25, 297, 5, 'null', 0, 1, 'premium', 1, 0),
(26, 26, 292, 5, 'null', 0, 1, 'premium', 1, 0),
(27, 27, 307, 5, 'null', 0, 1, 'premium', 1, 0),
(28, 28, 300, 5, 'null', 0, 1, 'premium', 1, 0),
(29, 29, 304, 5, 'null', 0, 1, 'premium', 1, 0),
(30, 30, 283, 5, 'null', 0, 1, 'premium', 1, 0),
(31, 31, 332, 5, 'null', 0, 1, 'premium', 1, 0),
(32, 32, 327, 5, 'null', 0, 1, 'premium', 1, 0),
(33, 33, 312, 5, 'null', 0, 1, 'premium', 1, 0),
(34, 34, 344, 5, 'null', 0, 1, 'premium', 1, 0),
(35, 35, 333, 5, 'null', 0, 1, 'premium', 1, 0),
(36, 36, 320, 5, 'null', 0, 1, 'premium', 1, 0),
(37, 37, 323, 5, 'null', 0, 1, 'premium', 1, 0),
(38, 38, 322, 5, 'null', 0, 1, 'premium', 1, 0),
(39, 39, 330, 5, 'null', 0, 1, 'premium', 1, 0),
(40, 40, 325, 5, 'null', 0, 1, 'premium', 1, 0),
(41, 41, 335, 5, 'null', 0, 1, 'premium', 1, 0),
(42, 42, 318, 5, 'null', 0, 1, 'premium', 1, 0),
(43, 43, 337, 5, 'null', 0, 1, 'premium', 1, 0),
(44, 44, 321, 5, 'null', 0, 1, 'premium', 1, 0),
(45, 45, 334, 5, 'null', 0, 1, 'premium', 1, 0),
(46, 46, 336, 5, 'null', 0, 1, 'premium', 1, 0),
(47, 47, 343, 5, 'null', 0, 1, 'premium', 1, 0),
(48, 48, 313, 5, 'null', 0, 1, 'premium', 1, 0),
(49, 49, 316, 5, 'null', 0, 1, 'premium', 1, 0),
(50, 50, 311, 5, 'null', 0, 1, 'premium', 1, 0),
(51, 51, 315, 5, 'null', 0, 1, 'premium', 1, 0),
(52, 52, 331, 5, 'null', 0, 1, 'premium', 1, 0),
(53, 53, 338, 5, 'null', 0, 1, 'premium', 1, 0),
(54, 54, 324, 5, 'null', 0, 1, 'premium', 1, 0),
(55, 55, 319, 5, 'null', 0, 1, 'premium', 1, 0),
(56, 56, 340, 5, 'null', 0, 1, 'premium', 1, 0),
(57, 57, 329, 5, 'null', 0, 1, 'premium', 1, 0),
(58, 58, 342, 5, 'null', 0, 1, 'premium', 1, 0),
(59, 59, 328, 5, 'null', 0, 1, 'premium', 1, 0),
(60, 60, 341, 5, 'null', 0, 1, 'premium', 1, 0),
(61, 61, 317, 5, 'null', 0, 1, 'premium', 1, 0),
(62, 62, 314, 5, 'null', 0, 1, 'premium', 1, 0),
(63, 63, 326, 5, 'null', 0, 1, 'premium', 1, 0),
(64, 64, 310, 5, 'null', 0, 1, 'premium', 1, 0),
(65, 65, 339, 5, 'null', 0, 1, 'premium', 1, 0),
(66, 66, 353, 5, 'null', 0, 1, 'premium', 1, 0),
(67, 67, 385, 5, 'null', 0, 1, 'premium', 1, 0),
(68, 68, 375, 5, 'null', 0, 1, 'premium', 1, 0),
(69, 69, 358, 5, 'null', 0, 1, 'premium', 1, 0),
(70, 70, 361, 5, 'null', 0, 1, 'premium', 1, 0),
(71, 71, 347, 5, 'null', 0, 1, 'premium', 1, 0),
(72, 72, 360, 5, 'null', 0, 1, 'premium', 1, 0),
(73, 73, 357, 5, 'null', 0, 1, 'premium', 1, 0),
(74, 74, 380, 5, 'null', 0, 1, 'premium', 1, 0),
(75, 75, 373, 5, 'null', 0, 1, 'premium', 1, 0),
(76, 76, 355, 5, 'null', 0, 1, 'premium', 1, 0),
(77, 77, 352, 5, 'null', 0, 1, 'premium', 1, 0),
(78, 78, 369, 5, 'null', 0, 1, 'premium', 1, 0),
(79, 79, 366, 5, 'null', 0, 1, 'premium', 1, 0),
(80, 80, 346, 5, 'null', 0, 1, 'premium', 1, 0),
(81, 81, 363, 5, 'null', 0, 1, 'premium', 1, 0),
(82, 82, 372, 5, 'null', 0, 1, 'premium', 1, 0),
(83, 83, 384, 5, 'null', 0, 1, 'premium', 1, 0),
(84, 84, 370, 5, 'null', 0, 1, 'premium', 1, 0),
(85, 85, 354, 5, 'null', 0, 1, 'premium', 1, 0),
(86, 86, 348, 5, 'null', 0, 1, 'premium', 1, 0),
(87, 87, 382, 5, 'null', 0, 1, 'premium', 1, 0),
(88, 88, 356, 5, 'null', 0, 1, 'premium', 1, 0),
(89, 89, 371, 5, 'null', 0, 1, 'premium', 1, 0),
(90, 90, 388, 5, 'null', 0, 1, 'premium', 1, 0),
(91, 91, 350, 5, 'null', 0, 1, 'premium', 1, 0),
(92, 92, 379, 5, 'null', 0, 1, 'premium', 1, 0),
(93, 93, 387, 5, 'null', 0, 1, 'premium', 1, 0),
(94, 94, 378, 5, 'null', 0, 1, 'premium', 1, 0),
(95, 95, 374, 5, 'null', 0, 1, 'premium', 1, 0),
(96, 96, 389, 5, 'null', 0, 1, 'premium', 1, 0),
(97, 97, 367, 5, 'null', 0, 1, 'premium', 1, 0),
(98, 98, 381, 5, 'null', 0, 1, 'premium', 1, 0),
(99, 99, 365, 5, 'null', 0, 1, 'premium', 1, 0),
(100, 100, 345, 5, 'null', 0, 1, 'premium', 1, 0),
(101, 101, 359, 5, 'null', 0, 1, 'premium', 1, 0),
(102, 102, 368, 5, 'null', 0, 1, 'premium', 1, 0),
(103, 103, 362, 5, 'null', 0, 1, 'premium', 1, 0),
(104, 104, 377, 5, 'null', 0, 1, 'premium', 1, 0),
(105, 105, 386, 5, 'null', 0, 1, 'premium', 1, 0),
(106, 106, 383, 5, 'null', 0, 1, 'premium', 1, 0),
(107, 107, 364, 5, 'null', 0, 1, 'premium', 1, 0),
(108, 108, 349, 5, 'null', 0, 1, 'premium', 1, 0),
(109, 109, 351, 5, 'null', 0, 1, 'premium', 1, 0),
(110, 110, 376, 5, 'null', 0, 1, 'premium', 1, 0),
(111, 1, 298, 5, 'Kekuasaan yang terbatas', 0, 2, 'premium', 1, 0),
(112, 2, 281, 5, 'Ketuhanan, kemanusiaan, persatuan', 0, 2, 'premium', 1, 0),
(113, 3, 297, 5, 'Kekuasaan belaka', 5, 2, 'premium', 1, 0),
(114, 4, 291, 5, 'Semua Benar', 0, 2, 'premium', 1, 0),
(115, 5, 289, 5, 'null', 0, 2, 'premium', 1, 0),
(116, 6, 280, 5, 'null', 0, 2, 'premium', 1, 0),
(117, 7, 303, 5, 'null', 0, 2, 'premium', 1, 0),
(118, 8, 305, 5, 'null', 0, 2, 'premium', 1, 0),
(119, 9, 307, 5, 'null', 0, 2, 'premium', 1, 0),
(120, 10, 283, 5, 'null', 0, 2, 'premium', 1, 0),
(121, 11, 302, 5, 'null', 0, 2, 'premium', 1, 0),
(122, 12, 304, 5, 'null', 0, 2, 'premium', 1, 0),
(123, 13, 295, 5, 'null', 0, 2, 'premium', 1, 0),
(124, 14, 306, 5, 'null', 0, 2, 'premium', 1, 0),
(125, 15, 290, 5, 'null', 0, 2, 'premium', 1, 0),
(126, 16, 292, 5, 'null', 0, 2, 'premium', 1, 0),
(127, 17, 294, 5, 'null', 0, 2, 'premium', 1, 0),
(128, 18, 288, 5, 'null', 0, 2, 'premium', 1, 0),
(129, 19, 285, 5, 'null', 0, 2, 'premium', 1, 0),
(130, 20, 300, 5, 'null', 0, 2, 'premium', 1, 0),
(131, 21, 287, 5, 'null', 0, 2, 'premium', 1, 0),
(132, 22, 296, 5, 'null', 0, 2, 'premium', 1, 0),
(133, 23, 301, 5, 'null', 0, 2, 'premium', 1, 0),
(134, 24, 309, 5, 'null', 0, 2, 'premium', 1, 0),
(135, 25, 308, 5, 'null', 0, 2, 'premium', 1, 0),
(136, 26, 284, 5, 'null', 0, 2, 'premium', 1, 0),
(137, 27, 282, 5, 'null', 0, 2, 'premium', 1, 0),
(138, 28, 293, 5, 'null', 0, 2, 'premium', 1, 0),
(139, 29, 299, 5, 'null', 0, 2, 'premium', 1, 0),
(140, 30, 286, 5, 'null', 0, 2, 'premium', 1, 0),
(141, 31, 323, 5, 'null', 0, 2, 'premium', 1, 0),
(142, 32, 330, 5, 'null', 0, 2, 'premium', 1, 0),
(143, 33, 336, 5, 'null', 0, 2, 'premium', 1, 0),
(144, 34, 326, 5, 'null', 0, 2, 'premium', 1, 0),
(145, 35, 337, 5, 'null', 0, 2, 'premium', 1, 0),
(146, 36, 310, 5, 'null', 0, 2, 'premium', 1, 0),
(147, 37, 332, 5, 'null', 0, 2, 'premium', 1, 0),
(148, 38, 328, 5, 'null', 0, 2, 'premium', 1, 0),
(149, 39, 315, 5, 'null', 0, 2, 'premium', 1, 0),
(150, 40, 314, 5, 'null', 0, 2, 'premium', 1, 0),
(151, 41, 333, 5, 'null', 0, 2, 'premium', 1, 0),
(152, 42, 317, 5, 'null', 0, 2, 'premium', 1, 0),
(153, 43, 329, 5, 'null', 0, 2, 'premium', 1, 0),
(154, 44, 320, 5, 'null', 0, 2, 'premium', 1, 0),
(155, 45, 318, 5, 'null', 0, 2, 'premium', 1, 0),
(156, 46, 342, 5, 'null', 0, 2, 'premium', 1, 0),
(157, 47, 316, 5, 'null', 0, 2, 'premium', 1, 0),
(158, 48, 338, 5, 'null', 0, 2, 'premium', 1, 0),
(159, 49, 341, 5, 'null', 0, 2, 'premium', 1, 0),
(160, 50, 311, 5, 'null', 0, 2, 'premium', 1, 0),
(161, 51, 331, 5, 'null', 0, 2, 'premium', 1, 0),
(162, 52, 327, 5, 'null', 0, 2, 'premium', 1, 0),
(163, 53, 339, 5, 'null', 0, 2, 'premium', 1, 0),
(164, 54, 343, 5, 'null', 0, 2, 'premium', 1, 0),
(165, 55, 340, 5, 'null', 0, 2, 'premium', 1, 0),
(166, 56, 325, 5, 'null', 0, 2, 'premium', 1, 0),
(167, 57, 344, 5, 'null', 0, 2, 'premium', 1, 0),
(168, 58, 324, 5, 'null', 0, 2, 'premium', 1, 0),
(169, 59, 335, 5, 'null', 0, 2, 'premium', 1, 0),
(170, 60, 322, 5, 'null', 0, 2, 'premium', 1, 0),
(171, 61, 312, 5, 'null', 0, 2, 'premium', 1, 0),
(172, 62, 319, 5, 'null', 0, 2, 'premium', 1, 0),
(173, 63, 334, 5, 'null', 0, 2, 'premium', 1, 0),
(174, 64, 321, 5, 'null', 0, 2, 'premium', 1, 0),
(175, 65, 313, 5, 'null', 0, 2, 'premium', 1, 0),
(176, 66, 353, 5, 'null', 0, 2, 'premium', 1, 0),
(177, 67, 363, 5, 'null', 0, 2, 'premium', 1, 0),
(178, 68, 346, 5, 'null', 0, 2, 'premium', 1, 0),
(179, 69, 359, 5, 'null', 0, 2, 'premium', 1, 0),
(180, 70, 376, 5, 'null', 0, 2, 'premium', 1, 0),
(181, 71, 385, 5, 'null', 0, 2, 'premium', 1, 0),
(182, 72, 380, 5, 'null', 0, 2, 'premium', 1, 0),
(183, 73, 360, 5, 'null', 0, 2, 'premium', 1, 0),
(184, 74, 382, 5, 'null', 0, 2, 'premium', 1, 0),
(185, 75, 352, 5, 'null', 0, 2, 'premium', 1, 0),
(186, 76, 378, 5, 'null', 0, 2, 'premium', 1, 0),
(187, 77, 387, 5, 'null', 0, 2, 'premium', 1, 0),
(188, 78, 362, 5, 'null', 0, 2, 'premium', 1, 0),
(189, 79, 355, 5, 'null', 0, 2, 'premium', 1, 0),
(190, 80, 348, 5, 'null', 0, 2, 'premium', 1, 0),
(191, 81, 379, 5, 'null', 0, 2, 'premium', 1, 0),
(192, 82, 364, 5, 'null', 0, 2, 'premium', 1, 0),
(193, 83, 368, 5, 'null', 0, 2, 'premium', 1, 0),
(194, 84, 358, 5, 'null', 0, 2, 'premium', 1, 0),
(195, 85, 366, 5, 'null', 0, 2, 'premium', 1, 0),
(196, 86, 383, 5, 'null', 0, 2, 'premium', 1, 0),
(197, 87, 381, 5, 'null', 0, 2, 'premium', 1, 0),
(198, 88, 361, 5, 'null', 0, 2, 'premium', 1, 0),
(199, 89, 371, 5, 'null', 0, 2, 'premium', 1, 0),
(200, 90, 367, 5, 'null', 0, 2, 'premium', 1, 0),
(201, 91, 389, 5, 'null', 0, 2, 'premium', 1, 0),
(202, 92, 345, 5, 'null', 0, 2, 'premium', 1, 0),
(203, 93, 369, 5, 'null', 0, 2, 'premium', 1, 0),
(204, 94, 375, 5, 'null', 0, 2, 'premium', 1, 0),
(205, 95, 373, 5, 'null', 0, 2, 'premium', 1, 0),
(206, 96, 370, 5, 'null', 0, 2, 'premium', 1, 0),
(207, 97, 374, 5, 'null', 0, 2, 'premium', 1, 0),
(208, 98, 354, 5, 'null', 0, 2, 'premium', 1, 0),
(209, 99, 347, 5, 'null', 0, 2, 'premium', 1, 0),
(210, 100, 351, 5, 'null', 0, 2, 'premium', 1, 0),
(211, 101, 377, 5, 'null', 0, 2, 'premium', 1, 0),
(212, 102, 357, 5, 'null', 0, 2, 'premium', 1, 0),
(213, 103, 356, 5, 'null', 0, 2, 'premium', 1, 0),
(214, 104, 349, 5, 'null', 0, 2, 'premium', 1, 0),
(215, 105, 350, 5, 'null', 0, 2, 'premium', 1, 0),
(216, 106, 372, 5, 'null', 0, 2, 'premium', 1, 0),
(217, 107, 388, 5, 'null', 0, 2, 'premium', 1, 0),
(218, 108, 384, 5, 'null', 0, 2, 'premium', 1, 0),
(219, 109, 386, 5, 'null', 0, 2, 'premium', 1, 0),
(220, 110, 365, 5, 'null', 0, 2, 'premium', 1, 0),
(441, 1, 304, 5, 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri', 0, 3, 'premium', 0, 1),
(442, 2, 301, 5, 'null', 0, 3, 'premium', 0, 0),
(443, 3, 299, 5, 'null', 0, 3, 'premium', 0, 0),
(444, 4, 292, 5, 'null', 0, 3, 'premium', 0, 0),
(445, 5, 293, 5, 'null', 0, 3, 'premium', 0, 0),
(446, 6, 285, 5, 'null', 0, 3, 'premium', 0, 0),
(447, 7, 306, 5, 'null', 0, 3, 'premium', 0, 0),
(448, 8, 300, 5, 'null', 0, 3, 'premium', 0, 0),
(449, 9, 307, 5, 'null', 0, 3, 'premium', 0, 0),
(450, 10, 305, 5, 'null', 0, 3, 'premium', 0, 0),
(451, 11, 283, 5, 'null', 0, 3, 'premium', 0, 0),
(452, 12, 303, 5, 'null', 0, 3, 'premium', 0, 0),
(453, 13, 295, 5, 'null', 0, 3, 'premium', 0, 0),
(454, 14, 280, 5, 'null', 0, 3, 'premium', 0, 0),
(455, 15, 282, 5, 'null', 0, 3, 'premium', 0, 0),
(456, 16, 294, 5, 'null', 0, 3, 'premium', 0, 0),
(457, 17, 298, 5, 'null', 0, 3, 'premium', 0, 0),
(458, 18, 288, 5, 'null', 0, 3, 'premium', 0, 0),
(459, 19, 309, 5, 'null', 0, 3, 'premium', 0, 0),
(460, 20, 284, 5, 'null', 0, 3, 'premium', 0, 0),
(461, 21, 290, 5, 'null', 0, 3, 'premium', 0, 0),
(462, 22, 281, 5, 'null', 0, 3, 'premium', 0, 0),
(463, 23, 302, 5, 'null', 0, 3, 'premium', 0, 0),
(464, 24, 291, 5, 'null', 0, 3, 'premium', 0, 0),
(465, 25, 296, 5, 'null', 0, 3, 'premium', 0, 0),
(466, 26, 297, 5, 'null', 0, 3, 'premium', 0, 0),
(467, 27, 308, 5, 'null', 0, 3, 'premium', 0, 0),
(468, 28, 286, 5, 'null', 0, 3, 'premium', 0, 0),
(469, 29, 287, 5, 'null', 0, 3, 'premium', 0, 0),
(470, 30, 289, 5, 'null', 0, 3, 'premium', 0, 0),
(471, 31, 339, 5, 'null', 0, 3, 'premium', 0, 0),
(472, 32, 310, 5, 'null', 0, 3, 'premium', 0, 0),
(473, 33, 323, 5, 'null', 0, 3, 'premium', 0, 0),
(474, 34, 332, 5, 'null', 0, 3, 'premium', 0, 0),
(475, 35, 324, 5, 'null', 0, 3, 'premium', 0, 0),
(476, 36, 344, 5, 'null', 0, 3, 'premium', 0, 0),
(477, 37, 311, 5, 'null', 0, 3, 'premium', 0, 0),
(478, 38, 327, 5, 'null', 0, 3, 'premium', 0, 0),
(479, 39, 314, 5, 'null', 0, 3, 'premium', 0, 0),
(480, 40, 338, 5, 'null', 0, 3, 'premium', 0, 0),
(481, 41, 335, 5, 'null', 0, 3, 'premium', 0, 0),
(482, 42, 340, 5, 'null', 0, 3, 'premium', 0, 0),
(483, 43, 325, 5, 'null', 0, 3, 'premium', 0, 0),
(484, 44, 316, 5, 'null', 0, 3, 'premium', 0, 0),
(485, 45, 326, 5, 'null', 0, 3, 'premium', 0, 0),
(486, 46, 343, 5, 'null', 0, 3, 'premium', 0, 0),
(487, 47, 322, 5, 'null', 0, 3, 'premium', 0, 0),
(488, 48, 334, 5, 'null', 0, 3, 'premium', 0, 0),
(489, 49, 313, 5, 'null', 0, 3, 'premium', 0, 0),
(490, 50, 320, 5, 'null', 0, 3, 'premium', 0, 0),
(491, 51, 317, 5, 'null', 0, 3, 'premium', 0, 0),
(492, 52, 319, 5, 'null', 0, 3, 'premium', 0, 0),
(493, 53, 331, 5, 'null', 0, 3, 'premium', 0, 0),
(494, 54, 329, 5, 'null', 0, 3, 'premium', 0, 0),
(495, 55, 330, 5, 'null', 0, 3, 'premium', 0, 0),
(496, 56, 342, 5, 'null', 0, 3, 'premium', 0, 0),
(497, 57, 341, 5, 'null', 0, 3, 'premium', 0, 0),
(498, 58, 333, 5, 'null', 0, 3, 'premium', 0, 0),
(499, 59, 337, 5, 'null', 0, 3, 'premium', 0, 0),
(500, 60, 312, 5, 'null', 0, 3, 'premium', 0, 0),
(501, 61, 321, 5, 'null', 0, 3, 'premium', 0, 0),
(502, 62, 315, 5, 'null', 0, 3, 'premium', 0, 0),
(503, 63, 328, 5, 'null', 0, 3, 'premium', 0, 0),
(504, 64, 318, 5, 'null', 0, 3, 'premium', 0, 0),
(505, 65, 336, 5, 'null', 0, 3, 'premium', 0, 0),
(506, 66, 378, 5, 'null', 0, 3, 'premium', 0, 0),
(507, 67, 350, 5, 'null', 0, 3, 'premium', 0, 0),
(508, 68, 349, 5, 'null', 0, 3, 'premium', 0, 0),
(509, 69, 379, 5, 'null', 0, 3, 'premium', 0, 0),
(510, 70, 363, 5, 'null', 0, 3, 'premium', 0, 0),
(511, 71, 351, 5, 'null', 0, 3, 'premium', 0, 0),
(512, 72, 362, 5, 'null', 0, 3, 'premium', 0, 0),
(513, 73, 388, 5, 'null', 0, 3, 'premium', 0, 0),
(514, 74, 389, 5, 'null', 0, 3, 'premium', 0, 0),
(515, 75, 364, 5, 'null', 0, 3, 'premium', 0, 0),
(516, 76, 371, 5, 'null', 0, 3, 'premium', 0, 0),
(517, 77, 359, 5, 'null', 0, 3, 'premium', 0, 0),
(518, 78, 354, 5, 'null', 0, 3, 'premium', 0, 0),
(519, 79, 384, 5, 'null', 0, 3, 'premium', 0, 0),
(520, 80, 381, 5, 'null', 0, 3, 'premium', 0, 0),
(521, 81, 387, 5, 'null', 0, 3, 'premium', 0, 0),
(522, 82, 368, 5, 'null', 0, 3, 'premium', 0, 0),
(523, 83, 386, 5, 'null', 0, 3, 'premium', 0, 0),
(524, 84, 345, 5, 'null', 0, 3, 'premium', 0, 0),
(525, 85, 372, 5, 'null', 0, 3, 'premium', 0, 0),
(526, 86, 360, 5, 'null', 0, 3, 'premium', 0, 0),
(527, 87, 380, 5, 'null', 0, 3, 'premium', 0, 0),
(528, 88, 357, 5, 'null', 0, 3, 'premium', 0, 0),
(529, 89, 376, 5, 'null', 0, 3, 'premium', 0, 0),
(530, 90, 358, 5, 'null', 0, 3, 'premium', 0, 0),
(531, 91, 374, 5, 'null', 0, 3, 'premium', 0, 0),
(532, 92, 385, 5, 'null', 0, 3, 'premium', 0, 0),
(533, 93, 347, 5, 'null', 0, 3, 'premium', 0, 0),
(534, 94, 352, 5, 'null', 0, 3, 'premium', 0, 0),
(535, 95, 375, 5, 'null', 0, 3, 'premium', 0, 0),
(536, 96, 355, 5, 'null', 0, 3, 'premium', 0, 0),
(537, 97, 365, 5, 'null', 0, 3, 'premium', 0, 0),
(538, 98, 356, 5, 'null', 0, 3, 'premium', 0, 0),
(539, 99, 382, 5, 'null', 0, 3, 'premium', 0, 0),
(540, 100, 377, 5, 'null', 0, 3, 'premium', 0, 0),
(541, 101, 369, 5, 'null', 0, 3, 'premium', 0, 0),
(542, 102, 348, 5, 'null', 0, 3, 'premium', 0, 0),
(543, 103, 366, 5, 'null', 0, 3, 'premium', 0, 0),
(544, 104, 346, 5, 'null', 0, 3, 'premium', 0, 0),
(545, 105, 373, 5, 'null', 0, 3, 'premium', 0, 0),
(546, 106, 353, 5, 'null', 0, 3, 'premium', 0, 0),
(547, 107, 383, 5, 'null', 0, 3, 'premium', 0, 0),
(548, 108, 370, 5, 'null', 0, 3, 'premium', 0, 0),
(549, 109, 367, 5, 'null', 0, 3, 'premium', 0, 0),
(550, 110, 361, 5, 'null', 0, 3, 'premium', 0, 0),
(661, 1, 309, 14, 'Perubahan Iklim Dunia', 5, 1, 'free', 1, 0),
(662, 2, 291, 14, 'Pembukaan UUD 1945', 5, 1, 'free', 1, 0),
(663, 3, 301, 14, 'Kekuasaan untuk menetapkan undang-undang', 0, 1, 'free', 1, 0),
(664, 4, 286, 14, 'Pandangan hidup bangsa Indonesia', 0, 1, 'free', 1, 0),
(665, 5, 284, 14, 'Rigid', 0, 1, 'free', 1, 0),
(666, 6, 282, 14, 'Alenia ke-4', 5, 1, 'free', 1, 0),
(667, 7, 281, 14, 'null', 0, 1, 'free', 1, 0),
(668, 8, 300, 14, 'null', 0, 1, 'free', 1, 0),
(669, 9, 296, 14, 'null', 0, 1, 'free', 1, 0),
(670, 10, 283, 14, 'null', 0, 1, 'free', 1, 0),
(671, 11, 303, 14, 'null', 0, 1, 'free', 1, 0),
(672, 12, 307, 14, 'null', 0, 1, 'free', 1, 0),
(673, 13, 298, 14, 'null', 0, 1, 'free', 1, 0),
(674, 14, 293, 14, 'null', 0, 1, 'free', 1, 0),
(675, 15, 308, 14, 'null', 0, 1, 'free', 1, 0),
(676, 16, 297, 14, 'null', 0, 1, 'free', 1, 0),
(677, 17, 287, 14, 'null', 0, 1, 'free', 1, 0),
(678, 18, 289, 14, 'null', 0, 1, 'free', 1, 0),
(679, 19, 290, 14, 'null', 0, 1, 'free', 1, 0),
(680, 20, 305, 14, 'null', 0, 1, 'free', 1, 0),
(681, 21, 295, 14, 'null', 0, 1, 'free', 1, 0),
(682, 22, 299, 14, 'null', 0, 1, 'free', 1, 0),
(683, 23, 292, 14, 'null', 0, 1, 'free', 1, 0),
(684, 24, 285, 14, 'null', 0, 1, 'free', 1, 0),
(685, 25, 302, 14, 'null', 0, 1, 'free', 1, 0),
(686, 26, 304, 14, 'null', 0, 1, 'free', 1, 0),
(687, 27, 306, 14, 'null', 0, 1, 'free', 1, 0),
(688, 28, 280, 14, 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 5, 1, 'free', 1, 0),
(689, 29, 288, 14, 'DPR dan MPR', 5, 1, 'free', 1, 0),
(690, 30, 294, 14, 'TAP MPR RI No.II/MPR/1978', 0, 1, 'free', 1, 0),
(691, 31, 322, 14, 'Rangkaian', 0, 1, 'free', 1, 0),
(692, 32, 336, 14, 'null', 0, 1, 'free', 1, 0),
(693, 33, 324, 14, 'null', 0, 1, 'free', 1, 0),
(694, 34, 317, 14, 'null', 0, 1, 'free', 1, 0),
(695, 35, 330, 14, 'null', 0, 1, 'free', 1, 0),
(696, 36, 321, 14, 'null', 0, 1, 'free', 1, 0),
(697, 37, 327, 14, 'null', 0, 1, 'free', 1, 0),
(698, 38, 319, 14, 'null', 0, 1, 'free', 1, 0),
(699, 39, 341, 14, 'null', 0, 1, 'free', 1, 0),
(700, 40, 335, 14, 'null', 0, 1, 'free', 1, 0),
(701, 41, 312, 14, 'null', 0, 1, 'free', 1, 0),
(702, 42, 343, 14, 'null', 0, 1, 'free', 1, 0),
(703, 43, 340, 14, 'null', 0, 1, 'free', 1, 0),
(704, 44, 338, 14, 'null', 0, 1, 'free', 1, 0),
(705, 45, 314, 14, 'null', 0, 1, 'free', 1, 0),
(706, 46, 311, 14, 'null', 0, 1, 'free', 1, 0),
(707, 47, 316, 14, 'null', 0, 1, 'free', 1, 0),
(708, 48, 344, 14, 'null', 0, 1, 'free', 1, 0),
(709, 49, 337, 14, 'null', 0, 1, 'free', 1, 0),
(710, 50, 339, 14, 'null', 0, 1, 'free', 1, 0),
(711, 51, 331, 14, 'null', 0, 1, 'free', 1, 0),
(712, 52, 500, 14, 'null', 0, 1, 'free', 1, 0),
(713, 53, 310, 14, 'null', 0, 1, 'free', 1, 0),
(714, 54, 334, 14, 'null', 0, 1, 'free', 1, 0),
(715, 55, 332, 14, 'Semua siswa yang pandai adalah siswa SMP Harapanjaya.', 0, 1, 'free', 1, 0),
(716, 56, 333, 14, 'Tidak setiap Kenari yang terbang ke Barat adalah burung.', 0, 1, 'free', 1, 0),
(717, 57, 315, 14, 'null', 0, 1, 'free', 1, 0),
(718, 58, 325, 14, 'null', 0, 1, 'free', 1, 0),
(719, 59, 323, 14, 'null', 0, 1, 'free', 1, 0),
(720, 60, 313, 14, 'null', 0, 1, 'free', 1, 0),
(721, 61, 328, 14, 'null', 0, 1, 'free', 1, 0),
(722, 62, 318, 14, 'null', 0, 1, 'free', 1, 0),
(723, 63, 326, 14, 'null', 0, 1, 'free', 1, 0),
(724, 64, 329, 14, 'null', 0, 1, 'free', 1, 0),
(725, 65, 342, 14, 'null', 0, 1, 'free', 1, 0),
(726, 66, 389, 14, 'null', 0, 1, 'free', 1, 0),
(727, 67, 385, 14, 'null', 0, 1, 'free', 1, 0),
(728, 68, 352, 14, 'null', 0, 1, 'free', 1, 0),
(729, 69, 362, 14, 'null', 0, 1, 'free', 1, 0),
(730, 70, 383, 14, 'null', 0, 1, 'free', 1, 0),
(731, 71, 348, 14, 'null', 0, 1, 'free', 1, 0),
(732, 72, 381, 14, 'null', 0, 1, 'free', 1, 0),
(733, 73, 386, 14, 'null', 0, 1, 'free', 1, 0),
(734, 74, 351, 14, 'null', 0, 1, 'free', 1, 0),
(735, 75, 367, 14, 'null', 0, 1, 'free', 1, 0),
(736, 76, 349, 14, 'null', 0, 1, 'free', 1, 0),
(737, 77, 360, 14, 'null', 0, 1, 'free', 1, 0),
(738, 78, 368, 14, 'null', 0, 1, 'free', 1, 0),
(739, 79, 363, 14, 'null', 0, 1, 'free', 1, 0),
(740, 80, 374, 14, 'Menerima aturan panitia', 0, 1, 'free', 1, 0),
(741, 81, 370, 14, 'Banyak Pekerjaan', 5, 1, 'free', 1, 0),
(742, 82, 371, 14, 'Berusaha mempelajari dan memahami mekanisme kerja unit melalui rekan sejawat', 5, 1, 'free', 1, 0),
(743, 83, 365, 14, 'null', 0, 1, 'free', 1, 0),
(744, 84, 364, 14, 'null', 0, 1, 'free', 1, 0),
(745, 85, 378, 14, 'null', 0, 1, 'free', 1, 0),
(746, 86, 345, 14, 'null', 0, 1, 'free', 1, 0),
(747, 87, 353, 14, 'null', 0, 1, 'free', 1, 0),
(748, 88, 380, 14, 'null', 0, 1, 'free', 1, 0),
(749, 89, 379, 14, 'null', 0, 1, 'free', 1, 0),
(750, 90, 358, 14, 'null', 0, 1, 'free', 1, 0),
(751, 91, 384, 14, 'null', 0, 1, 'free', 1, 0),
(752, 92, 388, 14, 'null', 0, 1, 'free', 1, 0),
(753, 93, 347, 14, 'null', 0, 1, 'free', 1, 0),
(754, 94, 354, 14, 'null', 0, 1, 'free', 1, 0),
(755, 95, 356, 14, 'null', 0, 1, 'free', 1, 0),
(756, 96, 357, 14, 'null', 0, 1, 'free', 1, 0),
(757, 97, 376, 14, 'null', 0, 1, 'free', 1, 0),
(758, 98, 372, 14, 'null', 0, 1, 'free', 1, 0),
(759, 99, 359, 14, 'null', 0, 1, 'free', 1, 0),
(760, 100, 387, 14, 'null', 0, 1, 'free', 1, 0),
(761, 101, 369, 14, 'null', 0, 1, 'free', 1, 0),
(762, 102, 346, 14, 'null', 0, 1, 'free', 1, 0),
(763, 103, 382, 14, 'null', 0, 1, 'free', 1, 0),
(764, 104, 366, 14, 'null', 0, 1, 'free', 1, 0),
(765, 105, 377, 14, 'null', 0, 1, 'free', 1, 0),
(766, 106, 373, 14, 'Berusaha mengenal dan memahami visi dan misi pimpinan baru', 0, 1, 'free', 1, 0),
(767, 107, 375, 14, 'Saya marah dengan diam mengacuhkannya', 0, 1, 'free', 1, 0),
(768, 108, 350, 14, 'Menegurnya karena hal yang dia lakukan itu tidak\r\nbaik.', 0, 1, 'free', 1, 0),
(769, 109, 355, 14, 'Saya berkonsultasi kepada rekan sejawat dulu', 0, 1, 'free', 1, 0),
(770, 110, 361, 14, 'Mempersiapkan diri guna memenangkan persaingan', 5, 1, 'free', 1, 0),
(771, 1, 296, 14, 'PW! dan suku-bangsa', 0, 2, 'free', 1, 0),
(772, 2, 287, 14, 'Organisasi kekuasaan', 5, 2, 'free', 1, 0),
(773, 3, 289, 14, 'Nilai instrumental', 5, 2, 'free', 1, 0),
(774, 4, 309, 14, 'Perjanjian Ekspor Impor', 0, 2, 'free', 1, 0),
(775, 5, 301, 14, 'Kekuasaan untuk menetapkan undang-undang', 0, 2, 'free', 1, 0),
(776, 6, 285, 14, 'null', 0, 2, 'free', 1, 0),
(777, 7, 308, 14, 'null', 0, 2, 'free', 1, 0),
(778, 8, 305, 14, 'null', 0, 2, 'free', 1, 0),
(779, 9, 307, 14, 'null', 0, 2, 'free', 1, 0),
(780, 10, 303, 14, 'Daerah otonomi', 0, 2, 'free', 1, 0),
(781, 11, 284, 14, 'Rigid', 0, 2, 'free', 1, 0),
(782, 12, 280, 14, 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 5, 2, 'free', 1, 0),
(783, 13, 299, 14, 'MPR', 5, 2, 'free', 1, 0),
(784, 14, 281, 14, 'Ketuhanan, kemanusiaan, persatuan', 0, 2, 'free', 1, 0),
(785, 15, 304, 14, 'null', 0, 2, 'free', 1, 0),
(786, 16, 294, 14, 'null', 0, 2, 'free', 1, 0),
(787, 17, 290, 14, 'null', 0, 2, 'free', 1, 0),
(788, 18, 298, 14, 'null', 0, 2, 'free', 1, 0),
(789, 19, 295, 14, 'Sila ketiga', 0, 2, 'free', 1, 0),
(790, 20, 292, 14, 'null', 0, 2, 'free', 1, 0),
(791, 21, 306, 14, 'Otonomi Daerah', 0, 2, 'free', 1, 0),
(792, 22, 302, 14, 'null', 0, 2, 'free', 1, 0),
(793, 23, 291, 14, 'null', 0, 2, 'free', 1, 0),
(794, 24, 283, 14, 'null', 0, 2, 'free', 1, 0),
(795, 25, 288, 14, 'null', 0, 2, 'free', 1, 0),
(796, 26, 293, 14, 'null', 0, 2, 'free', 1, 0),
(797, 27, 286, 14, 'Pandangan hidup bangsa Indonesia', 0, 2, 'free', 1, 0),
(798, 28, 297, 14, 'Majelis Permusyawaratan Rakyat', 0, 2, 'free', 1, 0),
(799, 29, 282, 14, 'Alenia ke-4', 5, 2, 'free', 1, 0),
(800, 30, 300, 14, 'Presiden memiliki kekuasaan dan tanggung jawab yang lebih tinggi dari lembaga  tinggi Negara lainnya', 0, 2, 'free', 1, 0),
(801, 31, 341, 14, 'null', 0, 2, 'free', 1, 0),
(802, 32, 330, 14, 'null', 0, 2, 'free', 1, 0),
(803, 33, 310, 14, 'null', 0, 2, 'free', 1, 0),
(804, 34, 329, 14, 'null', 0, 2, 'free', 1, 0),
(805, 35, 342, 14, 'null', 0, 2, 'free', 1, 0),
(806, 36, 316, 14, 'null', 0, 2, 'free', 1, 0),
(807, 37, 328, 14, 'null', 0, 2, 'free', 1, 0),
(808, 38, 331, 14, 'Sugiono memiliki 4 orang adik.', 0, 2, 'free', 1, 0),
(809, 39, 311, 14, 'null', 0, 2, 'free', 1, 0),
(810, 40, 323, 14, 'null', 0, 2, 'free', 1, 0),
(811, 41, 338, 14, 'null', 0, 2, 'free', 1, 0),
(812, 42, 324, 14, 'Canggih', 0, 2, 'free', 1, 0),
(813, 43, 343, 14, 'null', 0, 2, 'free', 1, 0),
(814, 44, 314, 14, 'null', 0, 2, 'free', 1, 0),
(815, 45, 332, 14, 'null', 0, 2, 'free', 1, 0),
(816, 46, 319, 14, 'null', 0, 2, 'free', 1, 0),
(817, 47, 340, 14, 'null', 0, 2, 'free', 1, 0),
(818, 48, 321, 14, 'null', 0, 2, 'free', 1, 0),
(819, 49, 325, 14, 'Harapan', 5, 2, 'free', 1, 0),
(820, 50, 500, 14, 'Bank : Deposit', 5, 2, 'free', 1, 0),
(821, 51, 335, 14, 'kosong', 0, 2, 'free', 1, 0),
(822, 52, 315, 14, 'null', 0, 2, 'free', 1, 0),
(823, 53, 333, 14, 'null', 0, 2, 'free', 1, 0),
(824, 54, 317, 14, 'null', 0, 2, 'free', 1, 0),
(825, 55, 326, 14, 'Khayalan', 5, 2, 'free', 1, 0),
(826, 56, 312, 14, 'null', 0, 2, 'free', 1, 0),
(827, 57, 313, 14, 'null', 0, 2, 'free', 1, 0),
(828, 58, 327, 14, 'Potongan harga', 0, 2, 'free', 1, 0),
(829, 59, 344, 14, 'null', 0, 2, 'free', 1, 0),
(830, 60, 318, 14, 'null', 0, 2, 'free', 1, 0),
(831, 61, 334, 14, 'null', 0, 2, 'free', 1, 0),
(832, 62, 322, 14, 'Rangkaian', 0, 2, 'free', 1, 0),
(833, 63, 336, 14, 'null', 0, 2, 'free', 1, 0),
(834, 64, 337, 14, 'null', 0, 2, 'free', 1, 0),
(835, 65, 339, 14, 'null', 0, 2, 'free', 1, 0),
(836, 66, 367, 14, 'null', 0, 2, 'free', 1, 0),
(837, 67, 380, 14, 'Saya akan berusaha sekuat mungkin memecahkannya', 5, 2, 'free', 1, 0),
(838, 68, 387, 14, 'null', 0, 2, 'free', 1, 0),
(839, 69, 360, 14, 'null', 0, 2, 'free', 1, 0),
(840, 70, 384, 14, 'null', 0, 2, 'free', 1, 0),
(841, 71, 370, 14, 'Banyak Pekerjaan', 5, 2, 'free', 1, 0),
(842, 72, 377, 14, 'Marah itu tidak baik', 0, 2, 'free', 1, 0),
(843, 73, 349, 14, 'null', 0, 2, 'free', 1, 0),
(844, 74, 389, 14, 'null', 0, 2, 'free', 1, 0),
(845, 75, 366, 14, 'Menghubungi anak saya dengan menjelaskan agar naik taksi saja', 0, 2, 'free', 1, 0),
(846, 76, 351, 14, 'null', 0, 2, 'free', 1, 0),
(847, 77, 374, 14, 'null', 0, 2, 'free', 1, 0),
(848, 78, 375, 14, 'null', 0, 2, 'free', 1, 0),
(849, 79, 369, 14, 'null', 0, 2, 'free', 1, 0),
(850, 80, 364, 14, 'null', 0, 2, 'free', 1, 0),
(851, 81, 348, 14, 'null', 0, 2, 'free', 1, 0),
(852, 82, 379, 14, 'null', 0, 2, 'free', 1, 0),
(853, 83, 363, 14, 'Saya mengusulkan kepada atasan untuk mengoptimalkan perdagangan produk-produk tersebut, karena memiliki keunggulan harga murah dan ketersediaan barang', 5, 2, 'free', 1, 0),
(854, 84, 368, 14, 'null', 0, 2, 'free', 1, 0),
(855, 85, 354, 14, 'null', 0, 2, 'free', 1, 0),
(856, 86, 359, 14, 'null', 0, 2, 'free', 1, 0),
(857, 87, 362, 14, 'null', 0, 2, 'free', 1, 0),
(858, 88, 382, 14, 'null', 0, 2, 'free', 1, 0),
(859, 89, 356, 14, 'null', 0, 2, 'free', 1, 0),
(860, 90, 347, 14, 'Merasa kasihan terhadap nenek tersebut tapi apalah daya anda tidak dapat membantu nenek tersebut', 0, 2, 'free', 1, 0),
(861, 91, 376, 14, 'null', 0, 2, 'free', 1, 0),
(862, 92, 371, 14, 'null', 0, 2, 'free', 1, 0),
(863, 93, 355, 14, 'null', 0, 2, 'free', 1, 0),
(864, 94, 385, 14, 'null', 0, 2, 'free', 1, 0),
(865, 95, 353, 14, 'null', 0, 2, 'free', 1, 0),
(866, 96, 365, 14, 'null', 0, 2, 'free', 1, 0),
(867, 97, 373, 14, 'null', 0, 2, 'free', 1, 0),
(868, 98, 372, 14, 'null', 0, 2, 'free', 1, 0),
(869, 99, 361, 14, 'Mempersiapkan diri guna memenangkan persaingan', 5, 2, 'free', 1, 0),
(870, 100, 350, 14, 'null', 0, 2, 'free', 1, 0),
(871, 101, 386, 14, 'null', 0, 2, 'free', 1, 0),
(872, 102, 346, 14, 'Menolaknya dengan tegas karena saya tidak ingin\r\nterlambat', 0, 2, 'free', 1, 0),
(873, 103, 358, 14, 'null', 0, 2, 'free', 1, 0),
(874, 104, 345, 14, 'null', 0, 2, 'free', 1, 0),
(875, 105, 352, 14, 'null', 0, 2, 'free', 1, 0),
(876, 106, 388, 14, 'Meminta bantuan dan secara bersama-sama menyelesaikannya meski kadang diselesaikannya secara personal', 0, 2, 'free', 1, 0),
(877, 107, 357, 14, 'null', 0, 2, 'free', 1, 0),
(878, 108, 381, 14, 'null', 0, 2, 'free', 1, 0),
(879, 109, 383, 14, 'null', 0, 2, 'free', 1, 0),
(880, 110, 378, 14, 'null', 0, 2, 'free', 1, 0),
(881, 1, 284, 14, 'Normatif', 5, 1, 'premium', 1, 0),
(882, 2, 290, 14, 'Dasar negara', 5, 1, 'premium', 1, 0),
(883, 3, 304, 14, 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri berdasarkan aspirasi masyarakat dalam sistem NKRI.', 5, 1, 'premium', 1, 0),
(884, 4, 307, 14, 'Kabupaten', 5, 1, 'premium', 1, 0),
(885, 5, 302, 14, 'Wewenang, hak dan kewajiban daerah otonom untuk mengatur dan mengurus sendiri urusan pemerintah sesuai dengan peraturan perundang-undangan.', 0, 1, 'premium', 1, 0),
(886, 6, 301, 14, 'Kekuasaan untuk menetapkan peraturan pemerintah', 5, 1, 'premium', 1, 0),
(887, 7, 292, 14, 'Sumber dari segala sumber hukum', 5, 1, 'premium', 1, 0),
(888, 8, 298, 14, 'Kekuasaan yang tidak tak terbatas', 0, 1, 'premium', 1, 0),
(889, 9, 288, 14, 'DPR dan MPR', 5, 1, 'premium', 1, 0),
(890, 10, 282, 14, 'Alenia ke-4', 5, 1, 'premium', 1, 0),
(891, 11, 303, 14, 'Prinsip otonomi daerah', 5, 1, 'premium', 1, 0),
(892, 12, 285, 14, 'Dasar negara berisi prinsip-prinsip hidup bernegara yang dijabarkan melalui konstitusi ke dalam berbagai aturan hukum.', 5, 1, 'premium', 1, 0),
(893, 13, 305, 14, 'UU No. 32 Tahun 2004', 5, 1, 'premium', 1, 0),
(894, 14, 295, 14, 'Sila kedua', 5, 1, 'premium', 1, 0),
(895, 15, 294, 14, 'TAP MPR No.I/MPR/1983', 5, 1, 'premium', 1, 0),
(896, 16, 291, 14, 'Pembukaan UUD 1945', 5, 1, 'premium', 1, 0),
(897, 17, 297, 14, 'Kekuasaan belaka', 5, 1, 'premium', 1, 0),
(898, 18, 300, 14, 'Dalam menjalankan pemerintahan negara kekuasaan dan tanggung jawab adalah di tangan Presiden', 5, 1, 'premium', 1, 0),
(899, 19, 283, 14, 'Kekuasaan tidak terbatas', 5, 1, 'premium', 1, 0),
(900, 20, 289, 14, 'Nilai instrumental', 5, 1, 'premium', 1, 0),
(901, 21, 280, 14, 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 5, 1, 'premium', 1, 0),
(902, 22, 293, 14, 'Pandangan hidup', 5, 1, 'premium', 1, 0),
(903, 23, 281, 14, 'Kebudayaan, religius, kenegaraan', 5, 1, 'premium', 1, 0),
(904, 24, 296, 14, 'Pendidikan dan pekerjaan', 5, 1, 'premium', 1, 0),
(905, 25, 286, 14, 'Paradigma pembangunan', 5, 1, 'premium', 1, 0),
(906, 26, 308, 14, 'Pasal 5, 7,9, 13, 14, 15, 17, 20, dan 21', 5, 1, 'premium', 1, 0),
(907, 27, 309, 14, 'Perubahan Iklim Dunia', 5, 1, 'premium', 1, 0),
(908, 28, 306, 14, 'Pemerintahan Daerah', 5, 1, 'premium', 1, 0),
(909, 29, 299, 14, 'MPR', 5, 1, 'premium', 1, 0),
(910, 30, 287, 14, 'Organisasi kekuasaan', 5, 1, 'premium', 1, 0),
(911, 31, 339, 14, 'Sebagian sepeda motor berwarna hitam dan tidak dilengkapi spedometer.', 0, 1, 'premium', 1, 0),
(912, 32, 335, 14, 'Sebagian mahasiswa yang tidak mempersiapkan diri dan tidak mendapat nilai baik, tidak lulus ujian.', 5, 1, 'premium', 1, 0),
(913, 33, 336, 14, 'Komar Buana paling tua.', 5, 1, 'premium', 1, 0),
(914, 34, 323, 14, 'Rekanan', 5, 1, 'premium', 1, 0),
(915, 35, 337, 14, 'Sebagian wisatawan yang membawa kamera mempunyai paspor.', 5, 1, 'premium', 1, 0),
(916, 36, 342, 14, '255003', 5, 1, 'premium', 1, 0),
(917, 37, 331, 14, 'Sugiono memiliki 2 orang adik kandung.', 5, 1, 'premium', 1, 0),
(918, 38, 314, 14, '55', 5, 1, 'premium', 1, 0),
(919, 39, 500, 14, 'Bank : Deposit', 5, 1, 'premium', 1, 0),
(920, 40, 317, 14, '72 Kali', 5, 1, 'premium', 1, 0),
(921, 41, 338, 14, 'Semua cleaning service hadir dalam rapat rutin.', 5, 1, 'premium', 1, 0),
(922, 42, 312, 14, '14', 5, 1, 'premium', 1, 0),
(923, 43, 324, 14, 'Menuju masa depan', 5, 1, 'premium', 1, 0),
(924, 44, 311, 14, '13', 5, 1, 'premium', 1, 0),
(925, 45, 340, 14, 'Kursi Tamu', 5, 1, 'premium', 1, 0),
(926, 46, 318, 14, '31 Orang', 5, 1, 'premium', 1, 0),
(927, 47, 316, 14, '15', 5, 1, 'premium', 1, 0),
(928, 48, 325, 14, 'Harapan', 5, 1, 'premium', 1, 0),
(929, 49, 330, 14, 'Mungkin Banu dan Dimas akan lolos ujian CPNS.', 5, 1, 'premium', 1, 0),
(930, 50, 329, 14, 'Perlindungan', 5, 1, 'premium', 1, 0),
(931, 51, 319, 14, '6.1875', 5, 1, 'premium', 1, 0),
(932, 52, 322, 14, 'Daur', 5, 1, 'premium', 1, 0),
(933, 53, 343, 14, '49.5', 5, 1, 'premium', 1, 0),
(934, 54, 313, 14, '32', 5, 1, 'premium', 1, 0),
(935, 55, 341, 14, 'Resna tidak minum obat dan tidak sembuh', 5, 1, 'premium', 1, 0),
(936, 56, 326, 14, 'Khayalan', 5, 1, 'premium', 1, 0),
(937, 57, 321, 14, 'Secara acak', 0, 1, 'premium', 1, 0),
(938, 58, 334, 14, 'Jika jus buah disajikan, maka nasi goreng juga disajikan.', 5, 1, 'premium', 1, 0),
(939, 59, 327, 14, 'Nilai jual', 5, 1, 'premium', 1, 0),
(940, 60, 328, 14, 'Bulat telur', 5, 1, 'premium', 1, 0),
(941, 61, 310, 14, '18', 5, 1, 'premium', 1, 0),
(942, 62, 315, 14, '7225', 5, 1, 'premium', 1, 0),
(943, 63, 344, 14, '100.9', 5, 1, 'premium', 1, 0),
(944, 64, 332, 14, 'Sebagian besar siswa SMP Harapanjaya kaya dan pandai.', 5, 1, 'premium', 1, 0),
(945, 65, 333, 14, 'Beberapa burung terbang ke barat.', 5, 1, 'premium', 1, 0),
(946, 66, 372, 14, 'Keberhasilan pekerjaan tergantung jenis perubahan, ide, dan cara-cara baru tersebut.', 5, 1, 'premium', 1, 0),
(947, 67, 349, 14, 'Memilih orang-orang dari berbagai latar belakang yang\r\nberbeda agar dapat memperoleh bermacam saran\r\ndan masukan.', 0, 1, 'premium', 1, 0),
(948, 68, 379, 14, 'Segera mempelajari SOP-nya', 5, 1, 'premium', 1, 0),
(949, 69, 352, 14, 'Mengumpulkan anggota tim dan membahas\r\npermasalahan anggota tim yang bermasalah tersebut.', 0, 1, 'premium', 1, 0),
(950, 70, 383, 14, 'Saya berani mencoba setelah mempertimbangkan risikonya', 5, 1, 'premium', 1, 0),
(951, 71, 367, 14, 'Saya membimbingnya dan memintanya untuk meningkatkan kemampuannya', 5, 1, 'premium', 1, 0),
(952, 72, 369, 14, 'Cukup tekun', 5, 1, 'premium', 1, 0),
(953, 73, 365, 14, 'Masuk ke ruangan dan membuat rencana kerja', 5, 1, 'premium', 1, 0),
(954, 74, 362, 14, 'Melakukan introspeksi dan memperbaiki kekurangan penyebab kegagalan.', 5, 1, 'premium', 1, 0),
(955, 75, 350, 14, 'Menegurnya karena hal yang dia lakukan itu tidak\r\nbaik.', 0, 1, 'premium', 1, 0),
(956, 76, 357, 14, 'Menegur dan melaporkan apa adanya kepada atasan', 5, 1, 'premium', 1, 0),
(957, 77, 376, 14, 'Saya marah jika memang diperlukan untuk perbaikan kondisi agar lebih baik', 5, 1, 'premium', 1, 0),
(958, 78, 377, 14, 'Marah itu bisa baik bisa buruk', 5, 1, 'premium', 1, 0),
(959, 79, 366, 14, 'Meminta izin pimpinan mengantar anak saya kemudian kembali ke kantor untuk bekerja lembur', 5, 1, 'premium', 1, 0),
(960, 80, 373, 14, 'Berusaha mengenal pribadi pimpinan baru', 5, 1, 'premium', 1, 0),
(961, 81, 382, 14, 'Berani mengambil keputusan karena tugas tersebut telah dipercayakan kepada saya', 5, 1, 'premium', 1, 0),
(962, 82, 354, 14, 'Meminta maaf atas nama rekan kerja anda', 5, 1, 'premium', 1, 0),
(963, 83, 345, 14, 'Menutup pecahan piring dengan kain karena\r\nburu-buru agar tidak terlambat rapat dengan\r\natasan Anda', 0, 1, 'premium', 1, 0),
(964, 84, 355, 14, 'Saya menolaknya dengan mantap', 5, 1, 'premium', 1, 0),
(965, 85, 361, 14, 'Mempersiapkan diri guna memenangkan persaingan', 5, 1, 'premium', 1, 0),
(966, 86, 384, 14, 'Manusia berusaha sebaik-baiknya dan Tuhan yang menentukan', 5, 1, 'premium', 1, 0),
(967, 87, 388, 14, 'Saya berusaha menyelesaikannya sendiri sembari meminta bantuan rekan kerja lain', 5, 1, 'premium', 1, 0),
(968, 88, 347, 14, 'Pergi meninggalkan nenek tersebut karena anda harus segera naik pesawat', 5, 1, 'premium', 1, 0),
(969, 89, 358, 14, 'Tidak akan membocorkan hasil keputusan rapat karena bukan wewenang saya', 5, 1, 'premium', 1, 0),
(970, 90, 353, 14, 'Melaporkan kepada atasan apakah harus berhenti\r\nmenggunakan sistem itu.', 0, 1, 'premium', 1, 0),
(971, 91, 346, 14, 'Mengantarkan hanya setengah jalan karena saya\r\nharus melintasi jalur yang berbeda untuk cepat\r\nsampai dikantor.', 0, 1, 'premium', 1, 0),
(972, 92, 380, 14, 'Saya akan berusaha sekuat mungkin memecahkannya', 5, 1, 'premium', 1, 0),
(973, 93, 371, 14, 'Berusaha mempelajari dan memahami mekanisme kerja unit melalui rekan sejawat', 5, 1, 'premium', 1, 0),
(974, 94, 378, 14, 'Bersabar adalah hal paling sulit dalam hidup saya', 5, 1, 'premium', 1, 0),
(975, 95, 370, 14, 'Banyak Pekerjaan', 5, 1, 'premium', 1, 0),
(976, 96, 359, 14, 'Pastikan bahwa kepala keuangan bertanggung jawab penuh terhadap masalah ini', 0, 1, 'premium', 1, 0),
(977, 97, 381, 14, 'Mengambil keputusan tanpa petunjuk atasan karena keadaan sangat mendesak', 0, 1, 'premium', 1, 0),
(978, 98, 360, 14, 'Saya mencoba menyelesaikan tanggal 26 jika memungkinkan', 5, 1, 'premium', 1, 0),
(979, 99, 363, 14, 'Saya mengusulkan kepada atasan untuk mengoptimalkan perdagangan produk-produk tersebut, karena memiliki keunggulan harga murah dan ketersediaan barang', 5, 1, 'premium', 1, 0),
(980, 100, 348, 14, 'Menyarankannya agar segera mendaftar di lembaga\r\nrehabilitasi tersebut.', 0, 1, 'premium', 1, 0),
(981, 101, 375, 14, 'Saya memberitahukan kesalahannya', 5, 1, 'premium', 1, 0),
(982, 102, 368, 14, 'Saya pergunakan untuk membaca buku-buku pengembangan diri', 5, 1, 'premium', 1, 0),
(983, 103, 374, 14, 'Menerima aturan panitia dan berusaha mengenal dan memahami teman sekamar', 5, 1, 'premium', 1, 0),
(984, 104, 387, 14, 'Tetap melanjutkan perjalanan untuk tepat waktu mengikuti tes pekerjaan', 5, 1, 'premium', 1, 0),
(985, 105, 389, 14, 'Tidak ingin melakukannya sama sekali', 5, 1, 'premium', 1, 0),
(986, 106, 385, 14, 'Berusaha secepatnya mengenal rekan kerja yang lain agar tercipta suasana kerja yang nyaman', 5, 1, 'premium', 1, 0),
(987, 107, 364, 14, 'Melakukan pekerjaan yang terbaik dengan standar kinerja yang tinggi', 5, 1, 'premium', 1, 0),
(988, 108, 386, 14, 'Bersifat terbuka terhadap kritik atau masukan', 5, 1, 'premium', 1, 0),
(989, 109, 356, 14, 'Mengingatkan dan melaporkan kepada yang berwenang', 5, 1, 'premium', 1, 0),
(990, 110, 351, 14, 'Mempelajari permasalahannya lalu membuat sistem\r\nmandiri', 0, 1, 'premium', 1, 0),
(991, 1, 293, 17, 'Pandangan hidup', 5, 1, 'free', 1, 0),
(992, 2, 285, 17, 'Dasar negara berisi prinsip-prinsip hidup bernegara yang dijabarkan melalui konstitusi ke dalam berbagai aturan hukum.', 5, 1, 'free', 1, 0),
(993, 3, 296, 17, 'Pendidikan dan pekerjaan', 5, 1, 'free', 1, 0),
(994, 4, 303, 17, 'Prinsip otonomi daerah', 5, 1, 'free', 1, 0),
(995, 5, 299, 17, 'MPR', 5, 1, 'free', 1, 0),
(996, 6, 305, 17, 'UU No. 32 Tahun 2004', 5, 1, 'free', 1, 0),
(997, 7, 281, 17, 'Kebudayaan, religius, kenegaraan', 5, 1, 'free', 1, 0),
(998, 8, 286, 17, 'Paradigma pembangunan', 5, 1, 'free', 1, 0),
(999, 9, 301, 17, 'Kekuasaan untuk menetapkan peraturan pemerintah', 5, 1, 'free', 1, 0),
(1000, 10, 282, 17, 'Alenia ke-4', 5, 1, 'free', 1, 0),
(1001, 11, 280, 17, 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 5, 1, 'free', 1, 0),
(1002, 12, 308, 17, 'Pasal 5, 7,9, 13, 14, 15, 17, 20, dan 21', 5, 1, 'free', 1, 0),
(1003, 13, 284, 17, 'Normatif', 5, 1, 'free', 1, 0),
(1004, 14, 289, 17, 'Nilai instrumental', 5, 1, 'free', 1, 0),
(1005, 15, 307, 17, 'Kabupaten', 5, 1, 'free', 1, 0),
(1006, 16, 295, 17, 'Sila kedua', 5, 1, 'free', 1, 0),
(1007, 17, 283, 17, 'Kekuasaan tidak terbatas', 5, 1, 'free', 1, 0),
(1008, 18, 290, 17, 'Dasar negara', 5, 1, 'free', 1, 0),
(1009, 19, 304, 17, 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri berdasarkan aspirasi masyarakat dalam sistem NKRI.', 5, 1, 'free', 1, 0),
(1010, 20, 298, 17, 'Kekuasaan yang tidak tak terbatas', 0, 1, 'free', 1, 0),
(1011, 21, 300, 17, 'Dalam menjalankan pemerintahan negara kekuasaan dan tanggung jawab adalah di tangan Presiden', 5, 1, 'free', 1, 0),
(1012, 22, 292, 17, 'Sumber dari segala sumber hukum', 5, 1, 'free', 1, 0),
(1013, 23, 309, 17, 'Perubahan Iklim Dunia', 5, 1, 'free', 1, 0),
(1014, 24, 297, 17, 'Kekuasaan belaka', 5, 1, 'free', 1, 0),
(1015, 25, 288, 17, 'DPR dan MPR', 5, 1, 'free', 1, 0),
(1016, 26, 306, 17, 'Pemerintahan Daerah', 5, 1, 'free', 1, 0),
(1017, 27, 287, 17, 'Organisasi kekuasaan', 5, 1, 'free', 1, 0),
(1018, 28, 291, 17, 'Pembukaan UUD 1945', 5, 1, 'free', 1, 0),
(1019, 29, 294, 17, 'TAP MPR No.I/MPR/1983', 5, 1, 'free', 1, 0),
(1020, 30, 302, 17, 'Penugasan dari pemerintah kepada daerah dan atau desa dari pemerintah provinsi kepada kabupaten/kota dan atau desa untuk melakukan tugas tertentu.', 5, 1, 'free', 1, 0),
(1021, 31, 318, 17, '31 Orang', 5, 1, 'free', 1, 0),
(1022, 32, 328, 17, 'Bulat telur', 5, 1, 'free', 1, 0),
(1023, 33, 314, 17, '55', 5, 1, 'free', 1, 0),
(1024, 34, 326, 17, 'Khayalan', 5, 1, 'free', 1, 0),
(1025, 35, 310, 17, '18', 5, 1, 'free', 1, 0),
(1026, 36, 311, 17, '13', 5, 1, 'free', 1, 0),
(1027, 37, 342, 17, '255003', 5, 1, 'free', 1, 0),
(1028, 38, 500, 17, 'Bank : Deposit', 5, 1, 'free', 1, 0),
(1029, 39, 325, 17, 'Harapan', 5, 1, 'free', 1, 0),
(1030, 40, 322, 17, 'Daur', 5, 1, 'free', 1, 0),
(1031, 41, 340, 17, 'Kursi Tamu', 5, 1, 'free', 1, 0),
(1032, 42, 337, 17, 'Sebagian wisatawan yang membawa kamera mempunyai paspor.', 5, 1, 'free', 1, 0),
(1033, 43, 324, 17, 'Menuju masa depan', 5, 1, 'free', 1, 0),
(1034, 44, 336, 17, 'Komar Buana paling tua.', 5, 1, 'free', 1, 0),
(1035, 45, 321, 17, 'Secara acak', 0, 1, 'free', 1, 0),
(1036, 46, 312, 17, '14', 5, 1, 'free', 1, 0),
(1037, 47, 343, 17, '49.5', 5, 1, 'free', 1, 0),
(1038, 48, 338, 17, 'Semua cleaning service hadir dalam rapat rutin.', 5, 1, 'free', 1, 0),
(1039, 49, 329, 17, 'Perlindungan', 5, 1, 'free', 1, 0),
(1040, 50, 339, 17, 'Sebagian sepeda motor tidak berwarna hitam dan tidak dilengkapi spedometer', 5, 1, 'free', 1, 0),
(1041, 51, 316, 17, '15', 5, 1, 'free', 1, 0),
(1042, 52, 332, 17, 'Sebagian besar siswa SMP Harapanjaya kaya dan pandai.', 5, 1, 'free', 1, 0),
(1043, 53, 330, 17, 'Mungkin Banu dan Dimas akan lolos ujian CPNS.', 5, 1, 'free', 1, 0),
(1044, 54, 319, 17, '6.1875', 5, 1, 'free', 1, 0),
(1045, 55, 331, 17, 'Sugiono memiliki 2 orang adik kandung.', 5, 1, 'free', 1, 0),
(1046, 56, 317, 17, '72 Kali', 5, 1, 'free', 1, 0),
(1047, 57, 315, 17, '7225', 5, 1, 'free', 1, 0),
(1048, 58, 323, 17, 'Rekanan', 5, 1, 'free', 1, 0),
(1049, 59, 341, 17, 'Resna tidak minum obat dan tidak sembuh', 5, 1, 'free', 1, 0),
(1050, 60, 335, 17, 'Sebagian mahasiswa yang tidak mempersiapkan diri dan tidak mendapat nilai baik, tidak lulus ujian.', 5, 1, 'free', 1, 0),
(1051, 61, 327, 17, 'Nilai jual', 5, 1, 'free', 1, 0),
(1052, 62, 313, 17, '32', 5, 1, 'free', 1, 0),
(1053, 63, 344, 17, '100.9', 5, 1, 'free', 1, 0),
(1054, 64, 334, 17, 'Jika jus buah disajikan, maka bebek goreng juga disajikan.', 0, 1, 'free', 1, 0),
(1055, 65, 333, 17, 'Beberapa burung terbang ke barat.', 5, 1, 'free', 1, 0),
(1056, 66, 379, 17, 'Segera mempelajari SOP-nya', 5, 1, 'free', 1, 0),
(1057, 67, 366, 17, 'Meminta izin pimpinan mengantar anak saya kemudian kembali ke kantor untuk bekerja lembur', 5, 1, 'free', 1, 0),
(1058, 68, 355, 17, 'Saya menolaknya dengan mantap', 5, 1, 'free', 1, 0),
(1059, 69, 381, 17, 'Mengambil keputusan tanpa petunjuk atasan karena keadaan sangat mendesak', 0, 1, 'free', 1, 0),
(1060, 70, 378, 17, 'Bersabar adalah hal paling sulit dalam hidup saya', 5, 1, 'free', 1, 0),
(1061, 71, 360, 17, 'Saya mencoba menyelesaikan tanggal 26 jika memungkinkan', 5, 1, 'free', 1, 0),
(1062, 72, 369, 17, 'Cukup tekun', 5, 1, 'free', 1, 0),
(1063, 73, 377, 17, 'Marah itu bisa baik bisa buruk', 5, 1, 'free', 1, 0),
(1064, 74, 365, 17, 'Masuk ke ruangan dan membuat rencana kerja', 5, 1, 'free', 1, 0),
(1065, 75, 372, 17, 'Keberhasilan pekerjaan tergantung jenis perubahan, ide, dan cara-cara baru tersebut.', 5, 1, 'free', 1, 0),
(1066, 76, 368, 17, 'Saya pergunakan untuk membaca buku-buku pengembangan diri', 5, 1, 'free', 1, 0),
(1067, 77, 345, 17, 'Menelepon teman bahwa Anda sedikit terlambat\r\ndatang dan membersihkan pecahan piring', 0, 1, 'free', 1, 0),
(1068, 78, 358, 17, 'Tidak akan membocorkan hasil keputusan rapat karena bukan wewenang saya', 5, 1, 'free', 1, 0),
(1069, 79, 388, 17, 'Saya berusaha menyelesaikannya sendiri sembari meminta bantuan rekan kerja lain', 5, 1, 'free', 1, 0),
(1070, 80, 385, 17, 'Berusaha secepatnya mengenal rekan kerja yang lain agar tercipta suasana kerja yang nyaman', 5, 1, 'free', 1, 0),
(1071, 81, 350, 17, 'Menegurnya karena hal yang dia lakukan itu tidak\r\nbaik.', 0, 1, 'free', 1, 0),
(1072, 82, 383, 17, 'Yang penting saya coba dulu', 0, 1, 'free', 1, 0),
(1073, 83, 354, 17, 'Mengucapkan terimakasih banyak kepada klient\r\ntersebut dan menjadikan sebagai tolak ukur kinerja anda', 0, 1, 'free', 1, 0),
(1074, 84, 371, 17, 'Berusaha mempelajari dan memahami mekanisme kerja unit melalui rekan sejawat', 5, 1, 'free', 1, 0),
(1075, 85, 346, 17, 'Menolaknya dengan tegas karena saya tidak ingin\r\nterlambat', 0, 1, 'free', 1, 0),
(1076, 86, 351, 17, 'Mempelajari permasalahannya lalu membuat sistem mandiri', 5, 1, 'free', 1, 0),
(1077, 87, 352, 17, 'Mengumpulkan anggota tim dan membahas\r\npermasalahan anggota tim yang bermasalah tersebut.', 0, 1, 'free', 1, 0),
(1078, 88, 386, 17, 'Bersifat terbuka terhadap kritik atau masukan', 5, 1, 'free', 1, 0),
(1079, 89, 376, 17, 'Saya marah jika memang diperlukan untuk perbaikan kondisi agar lebih baik', 5, 1, 'free', 1, 0),
(1080, 90, 374, 17, 'Menerima aturan panitia dan berusaha mengenal dan memahami teman sekamar', 5, 1, 'free', 1, 0),
(1081, 91, 387, 17, 'Tetap melanjutkan perjalanan untuk tepat waktu mengikuti tes pekerjaan', 5, 1, 'free', 1, 0),
(1082, 92, 364, 17, 'Melakukan pekerjaan yang terbaik dengan standar kinerja yang tinggi', 5, 1, 'free', 1, 0),
(1083, 93, 359, 17, 'Saya akan menjaga kerahasiaan permasalahan yang terjadi dan mencoba advertisement memberikan alternatif solusi kepada pimpinan', 5, 1, 'free', 1, 0),
(1084, 94, 373, 17, 'Berusaha mengenal pribadi pimpinan baru', 5, 1, 'free', 1, 0),
(1085, 95, 347, 17, 'Pergi meninggalkan nenek tersebut karena anda harus segera naik pesawat', 5, 1, 'free', 1, 0),
(1086, 96, 357, 17, 'Menegur dan melaporkan apa adanya kepada atasan', 5, 1, 'free', 1, 0),
(1087, 97, 361, 17, 'Mempersiapkan diri guna memenangkan persaingan', 5, 1, 'free', 1, 0),
(1088, 98, 367, 17, 'Saya membimbingnya dan memintanya untuk meningkatkan kemampuannya', 5, 1, 'free', 1, 0),
(1089, 99, 384, 17, 'Mengambil keputusan dengan menunggu petunjuk atasan', 5, 1, 'free', 1, 0),
(1090, 100, 382, 17, 'Berani mengambil keputusan karena tugas tersebut telah dipercayakan kepada saya', 5, 1, 'free', 1, 0),
(1091, 101, 349, 17, 'Memilih orang-orang dari berbagai latar belakang yang\r\nberbeda agar dapat memperoleh bermacam saran\r\ndan masukan.', 0, 1, 'free', 1, 0),
(1092, 102, 348, 17, 'Menyarankannya agar segera mendaftar di lembaga\r\nrehabilitasi tersebut.', 0, 1, 'free', 1, 0),
(1093, 103, 380, 17, 'Akan berusaha sekuat mungkin memecahkannya', 5, 1, 'free', 1, 0),
(1094, 104, 375, 17, 'Saya memberitahukan kesalahannya', 5, 1, 'free', 1, 0),
(1095, 105, 389, 17, 'Tidak ingin melakukannya sama sekali', 5, 1, 'free', 1, 0),
(1096, 106, 363, 17, 'Saya mengusulkan kepada atasan untuk mengoptimalkan perdagangan produk-produk tersebut, karena memiliki keunggulan harga murah dan ketersediaan barang', 5, 1, 'free', 1, 0),
(1097, 107, 356, 17, 'Tidak ingin terlibat dalam proses rekayasa tersebut', 0, 1, 'free', 1, 0),
(1098, 108, 370, 17, 'Banyak Pekerjaan', 5, 1, 'free', 1, 0),
(1099, 109, 362, 17, 'Melakukan introspeksi dan memperbaiki kekurangan penyebab kegagalan.', 5, 1, 'free', 1, 0),
(1100, 110, 353, 17, 'Melaporkan kepada atasan apakah harus berhenti\r\nmenggunakan sistem itu.', 0, 1, 'free', 1, 0),
(1101, 1, 282, 14, 'Alenia ke-4', 5, 2, 'premium', 1, 0),
(1102, 2, 300, 14, 'Dalam menjalankan pemerintahan negara kekuasaan dan tanggung jawab adalah di tangan Presiden', 5, 2, 'premium', 1, 0),
(1103, 3, 308, 14, 'Pasal 5, 7,9, 13, 14, 15, 17, 20, dan 21', 5, 2, 'premium', 1, 0),
(1104, 4, 289, 14, 'Nilai Instrumental', 5, 2, 'premium', 1, 0),
(1105, 5, 281, 14, 'Kebudayaan, Religius, Kenegaraan', 5, 2, 'premium', 1, 0),
(1106, 6, 298, 14, 'Kekuasaan yang tidak terbatas', 5, 2, 'premium', 1, 0),
(1107, 7, 280, 14, 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 5, 2, 'premium', 1, 0),
(1108, 8, 291, 14, 'Pembukaan UUD 1945', 5, 2, 'premium', 1, 0),
(1109, 9, 306, 14, 'Pemerintahan Daerah', 5, 2, 'premium', 1, 0),
(1110, 10, 288, 14, 'DPR dan MPR', 5, 2, 'premium', 1, 0),
(1111, 11, 285, 14, 'Dasar negara adalah pedoman penyelenggaraan pemerintahan yang dijabarkan lebih lanjut dalam konstitusi.', 0, 2, 'premium', 1, 0),
(1112, 12, 303, 14, 'Prinsip otonomi daerah', 5, 2, 'premium', 1, 0),
(1113, 13, 297, 14, 'Kekuasaan belaka', 5, 2, 'premium', 1, 0),
(1114, 14, 284, 14, 'Normatif', 5, 2, 'premium', 1, 0),
(1115, 15, 292, 14, 'Sumber dari segala sumber hukum', 5, 2, 'premium', 1, 0),
(1116, 16, 305, 14, 'UU No. 32 Tahun 2004', 5, 2, 'premium', 1, 0),
(1117, 17, 290, 14, 'Dasar negara', 5, 2, 'premium', 1, 0),
(1118, 18, 299, 14, 'MPR', 5, 2, 'premium', 1, 0),
(1119, 19, 307, 14, 'Kabupaten', 5, 2, 'premium', 1, 0),
(1120, 20, 286, 14, 'Sumber dari segala sumber hukum', 0, 2, 'premium', 1, 0),
(1121, 21, 296, 14, 'Pendidikan dan Pekerjaan', 5, 2, 'premium', 1, 0),
(1122, 22, 293, 14, 'Pandangan hidup', 5, 2, 'premium', 1, 0),
(1123, 23, 309, 14, 'Perubahan Iklim Dunia', 5, 2, 'premium', 1, 0),
(1124, 24, 304, 14, 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri berdasarkan aspirasi masyarakat dalam sistem NKRI.', 5, 2, 'premium', 1, 0),
(1125, 25, 302, 14, 'Penugasan dari pemerintah kepada daerah dan atau desa dari pemerintah provinsi kepada kabupaten/kota dan atau desa untuk melakukan tugas tertentu.', 5, 2, 'premium', 1, 0),
(1126, 26, 301, 14, 'Kekuasaan untuk menetapkan peraturan pemerintah', 5, 2, 'premium', 1, 0),
(1127, 27, 287, 14, 'Organisasi kekuasaan', 5, 2, 'premium', 1, 0),
(1128, 28, 295, 14, 'Sila kedua', 5, 2, 'premium', 1, 0),
(1129, 29, 283, 14, 'Kekuasaan terbatas', 0, 2, 'premium', 1, 0),
(1130, 30, 294, 14, 'TAP MPR No.I/MPR/1983', 5, 2, 'premium', 1, 0),
(1131, 31, 323, 14, 'Rekanan', 5, 2, 'premium', 1, 0),
(1132, 32, 319, 14, '6.1875', 5, 2, 'premium', 1, 0),
(1133, 33, 333, 14, 'Beberapa burung terbang ke barat.', 5, 2, 'premium', 1, 0),
(1134, 34, 317, 14, '72 Kali', 5, 2, 'premium', 1, 0),
(1135, 35, 325, 14, 'Harapan', 5, 2, 'premium', 1, 0),
(1136, 36, 337, 14, 'Sebagian wisatawan yang membawa kamera mempunyai paspor.', 5, 2, 'premium', 1, 0),
(1137, 37, 315, 14, '7225', 5, 2, 'premium', 1, 0);
INSERT INTO `tb_lembar_soal` (`id_lembar_soal`, `no_soal`, `id_soal`, `id_peserta`, `jawaban`, `nilai`, `kesempatan`, `tipe_tryout`, `status`, `ragu`) VALUES
(1138, 38, 500, 14, 'Bank : Deposit', 5, 2, 'premium', 1, 0),
(1139, 39, 318, 14, '31 Orang', 5, 2, 'premium', 1, 0),
(1140, 40, 344, 14, '100.9', 5, 2, 'premium', 1, 0),
(1141, 41, 336, 14, 'Komar Buana paling tua.', 5, 2, 'premium', 1, 0),
(1142, 42, 330, 14, 'Mungkin Banu dan Dimas akan lolos ujian CPNS.', 5, 2, 'premium', 1, 0),
(1143, 43, 332, 14, 'Sebagian besar siswa SMP Harapanjaya kaya dan pandai.', 5, 2, 'premium', 1, 0),
(1144, 44, 334, 14, 'Jika jus buah disajikan, maka bebek goreng juga disajikan.', 0, 2, 'premium', 1, 0),
(1145, 45, 310, 14, '18', 5, 2, 'premium', 1, 0),
(1146, 46, 321, 14, 'Secara acak', 0, 2, 'premium', 1, 0),
(1147, 47, 314, 14, '55', 5, 2, 'premium', 1, 0),
(1148, 48, 312, 14, '14', 5, 2, 'premium', 1, 0),
(1149, 49, 335, 14, 'Sebagian mahasiswa yang tidak mempersiapkan diri dan tidak mendapat nilai baik, tidak lulus ujian.', 5, 2, 'premium', 1, 0),
(1150, 50, 342, 14, '255003', 5, 2, 'premium', 1, 0),
(1151, 51, 324, 14, 'Canggih', 0, 2, 'premium', 1, 0),
(1152, 52, 326, 14, 'Khayalan', 5, 2, 'premium', 1, 0),
(1153, 53, 311, 14, '13', 5, 2, 'premium', 1, 0),
(1154, 54, 340, 14, 'Kursi Tamu', 5, 2, 'premium', 1, 0),
(1155, 55, 316, 14, '15', 5, 2, 'premium', 1, 0),
(1156, 56, 328, 14, 'Bulat telur', 5, 2, 'premium', 1, 0),
(1157, 57, 343, 14, '49.5', 5, 2, 'premium', 1, 0),
(1158, 58, 322, 14, 'Daur', 5, 2, 'premium', 1, 0),
(1159, 59, 331, 14, 'Sugiono memiliki 2 orang adik kandung.', 5, 2, 'premium', 1, 0),
(1160, 60, 339, 14, 'Sebagian sepeda motor tidak berwarna hitam dan tidak dilengkapi spedometer', 5, 2, 'premium', 1, 0),
(1161, 61, 338, 14, 'Semua cleaning service hadir dalam rapat rutin.', 5, 2, 'premium', 1, 0),
(1162, 62, 329, 14, 'Perlindungan', 5, 2, 'premium', 1, 0),
(1163, 63, 313, 14, '32', 5, 2, 'premium', 1, 0),
(1164, 64, 341, 14, 'Resna minum obat dan tidak sembuh', 0, 2, 'premium', 1, 0),
(1165, 65, 327, 14, 'Nilai jual', 5, 2, 'premium', 1, 0),
(1166, 66, 362, 14, 'Mengambil waktu untuk menenangkan diri', 0, 2, 'premium', 1, 0),
(1167, 67, 351, 14, 'Mempelajari permasalahannya lalu membuat sistem mandiri', 5, 2, 'premium', 1, 0),
(1168, 68, 355, 14, 'Saya menolaknya dengan mantap', 5, 2, 'premium', 1, 0),
(1169, 69, 346, 14, 'Mengantarkan hanya setengah jalan karena saya\r\nharus melintasi jalur yang berbeda untuk cepat\r\nsampai dikantor.', 0, 2, 'premium', 1, 0),
(1170, 70, 348, 14, 'Menyarankannya agar segera mendaftar di lembaga\r\nrehabilitasi tersebut.', 0, 2, 'premium', 1, 0),
(1171, 71, 364, 14, 'Melakukan pekerjaan yang terbaik dengan standar kinerja yang tinggi', 5, 2, 'premium', 1, 0),
(1172, 72, 367, 14, 'Saya membimbingnya dan memintanya untuk meningkatkan kemampuannya', 5, 2, 'premium', 1, 0),
(1173, 73, 350, 14, 'Menegurnya karena hal yang dia lakukan itu tidak\r\nbaik.', 0, 2, 'premium', 1, 0),
(1174, 74, 345, 14, 'Menutup pecahan piring dengan kain karena\r\nburu-buru agar tidak terlambat rapat dengan\r\natasan Anda', 0, 2, 'premium', 1, 0),
(1175, 75, 376, 14, 'Saya marah jika memang diperlukan untuk perbaikan kondisi agar lebih baik', 5, 2, 'premium', 1, 0),
(1176, 76, 382, 14, 'Berani mengambil keputusan karena tugas tersebut telah dipercayakan kepada saya', 5, 2, 'premium', 1, 0),
(1177, 77, 387, 14, 'Tetap melanjutkan perjalanan untuk tepat waktu mengikuti tes pekerjaan', 5, 2, 'premium', 1, 0),
(1178, 78, 384, 14, 'Mengambil keputusan dengan menunggu petunjuk atasan', 5, 2, 'premium', 1, 0),
(1179, 79, 389, 14, 'Tidak ingin melakukannya sama sekali', 5, 2, 'premium', 1, 0),
(1180, 80, 377, 14, 'Marah itu bisa baik bisa buruk', 5, 2, 'premium', 1, 0),
(1181, 81, 354, 14, 'Meminta maaf atas nama rekan kerja anda', 5, 2, 'premium', 1, 0),
(1182, 82, 363, 14, 'Saya mengusulkan kepada atasan untuk mengoptimalkan perdagangan produk-produk tersebut, karena memiliki keunggulan harga murah dan ketersediaan barang', 5, 2, 'premium', 1, 0),
(1183, 83, 385, 14, 'Berusaha secepatnya mengenal rekan kerja yang lain agar tercipta suasana kerja yang nyaman', 5, 2, 'premium', 1, 0),
(1184, 84, 374, 14, 'Menerima aturan panitia dan berusaha mengenal dan memahami teman sekamar', 5, 2, 'premium', 1, 0),
(1185, 85, 357, 14, 'Menegur dan melaporkan apa adanya kepada atasan', 5, 2, 'premium', 1, 0),
(1186, 86, 372, 14, 'Keberhasilan pekerjaan tergantung jenis perubahan, ide, dan cara-cara baru tersebut.', 5, 2, 'premium', 1, 0),
(1187, 87, 375, 14, 'Saya memberitahukan kesalahannya', 5, 2, 'premium', 1, 0),
(1188, 88, 356, 14, 'Mengingatkan dan melaporkan kepada yang berwenang', 5, 2, 'premium', 1, 0),
(1189, 89, 388, 14, 'Saya berusaha menyelesaikannya sendiri sembari meminta bantuan rekan kerja lain', 5, 2, 'premium', 1, 0),
(1190, 90, 373, 14, 'Berusaha mengenal dan memahami visi dan misi pimpinan baru', 0, 2, 'premium', 1, 0),
(1191, 91, 361, 14, 'Ikut jika ada kemungkinan saya menang.', 0, 2, 'premium', 1, 0),
(1192, 92, 359, 14, 'Pastikan bahwa kepala keuangan bertanggung jawab penuh terhadap masalah ini', 0, 2, 'premium', 1, 0),
(1193, 93, 369, 14, 'Cukup tekun', 5, 2, 'premium', 1, 0),
(1194, 94, 378, 14, 'Bersabar adalah hal paling sulit dalam hidup saya', 5, 2, 'premium', 1, 0),
(1195, 95, 360, 14, 'Saya mencoba menyelesaikan tanggal 26 jika memungkinkan', 5, 2, 'premium', 1, 0),
(1196, 96, 353, 14, 'Menyelesaikan pekerjaan penting tersebut lebih dulu\r\nkemudian melaporkan ke atasan tentang masalah\r\npada sistem itu', 0, 2, 'premium', 1, 0),
(1197, 97, 352, 14, 'Mengumpulkan anggota tim dan membahas\r\npermasalahan anggota tim yang bermasalah tersebut.', 0, 2, 'premium', 1, 0),
(1198, 98, 370, 14, 'Banyak Pekerjaan', 5, 2, 'premium', 1, 0),
(1199, 99, 379, 14, 'Segera mempelajari SOP-nya', 5, 2, 'premium', 1, 0),
(1200, 100, 368, 14, 'Saya pergunakan untuk membaca buku-buku pengembangan diri', 5, 2, 'premium', 1, 0),
(1201, 101, 358, 14, 'Tidak akan membocorkan hasil keputusan rapat karena bukan wewenang saya', 5, 2, 'premium', 1, 0),
(1202, 102, 386, 14, 'Bersifat terbuka terhadap kritik atau masukan', 5, 2, 'premium', 1, 0),
(1203, 103, 347, 14, 'Pergi meninggalkan nenek tersebut karena anda harus segera naik pesawat', 5, 2, 'premium', 1, 0),
(1204, 104, 365, 14, 'Masuk ke ruangan dan membuat rencana kerja', 5, 2, 'premium', 1, 0),
(1205, 105, 380, 14, 'Akan berusaha sekuat mungkin memecahkannya', 5, 2, 'premium', 1, 0),
(1206, 106, 349, 14, 'Membuka kesempatan bagi siapapun yang memiliki\r\nkemauan dan kemampuan bekerja tim tanpa\r\nmembedakan latar belakang.', 0, 2, 'premium', 1, 0),
(1207, 107, 366, 14, 'Meminta izin pimpinan mengantar anak saya kemudian kembali ke kantor untuk bekerja lembur', 5, 2, 'premium', 1, 0),
(1208, 108, 383, 14, 'Saya berani mencoba setelah mempertimbangkan risikonya', 5, 2, 'premium', 1, 0),
(1209, 109, 381, 14, 'Mengambil keputusan tanpa petunjuk atasan karena keadaan sangat mendesak', 0, 2, 'premium', 1, 0),
(1210, 110, 371, 14, 'Berusaha mempelajari dan memahami mekanisme kerja unit melalui rekan sejawat', 5, 2, 'premium', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_materi`
--

INSERT INTO `tb_materi` (`id_materi`, `id_kategori`, `judul`, `file`) VALUES
(19, 1, 'Nasionalisme dan Patriotisme', 'Nasionalisme_dan_Patriotisme.pdf'),
(20, 1, 'Integritas', 'Integritas.pdf'),
(21, 2, 'Aljabar', 'Aljabar.pdf'),
(22, 2, 'Aritmatika Sosial', 'Aritmatika Sosial.pdf'),
(23, 2, 'Aritmetika dan Geometri', 'Aritmetika dan Geometri.pdf'),
(24, 2, 'Bangun Datar', 'BANGUN DATAR.pdf'),
(25, 2, 'Bangun Ruang', 'BANGUN RUANG.pdf'),
(26, 2, 'Deret Angka dan Huruf', 'Deret Angka dan Huruf.pdf'),
(27, 2, 'Deret Gambar', 'Deret Gambar.pdf'),
(28, 2, 'Eksponen', 'Eksponen.pdf'),
(29, 2, 'Himpunan', 'Himpunan.pdf'),
(30, 2, 'Mean', 'Mean.pdf'),
(31, 2, 'Operasi Bilangan Pecahan', 'Operasi Bilangan Pecahan.pdf'),
(32, 2, 'Peluang', 'Peluang.pdf'),
(33, 2, 'Pemahaman Bacaan', 'Pemahaman Bacaan.pdf'),
(34, 2, 'Perbandingan', 'Perbandingan.pdf'),
(35, 2, 'Persamaan Kuadrat', 'Persamaan Kuadrat.pdf'),
(36, 2, 'Persamaan Linier Dua Variabel', 'Persamaan Linier Dua Variabel.pdf'),
(37, 2, 'Persamaan Linier Satu Variabel', 'Persamaan Linier Satu Variabel.pdf'),
(38, 2, 'Persamaan Linier Tiga Variabel', 'Persamaan Linier Tiga Variabel.pdf'),
(39, 2, 'Persentase', 'Persentase.pdf'),
(40, 2, 'Sinonim Antonim Analogi', 'Sinonim antonim analogi.pdf'),
(41, 2, 'Sudut', 'Sudut.pdf'),
(42, 2, 'Tabel dan Diagram', 'Tabel dan Diagram.pdf'),
(43, 2, 'Teori Bilangan', 'Teori Bilangan.pdf'),
(44, 2, 'Waktu, Jarak, Kecepatan', 'Waktu, Jarak, Kecepatan.pdf'),
(45, 1, 'Bela Negara', 'Bela Negara.pdf'),
(46, 1, 'Bhinneka Tunggal Ika', 'Bhinneka Tunggal Ika.pdf'),
(47, 1, 'Pancasila - 45 Butir Pengamalan Pancasila', 'Pancasila - 45 Butir Pengamalan Pancasila.pdf'),
(48, 1, 'Pancasila - Fungsi dan Kedudukan Pancasila', 'Pancasila - Fungsi dan Kedudukan Pancasila.pdf'),
(49, 1, 'Pancasila - Lambang dan Simbol Negara', 'Pancasila - Lambang dan Simbol Negara.pdf'),
(50, 1, 'Pancasila - Sejarah Pembentukan Pancasila', 'Pancasila - Sejarah Pembentukan Pancasila .pdf'),
(51, 1, 'UUD 1945 - Amandemen UUD 1945', 'UUD 1945 - Amandemen UUD 1945.pdf'),
(52, 1, 'UUD 1945 - Sejarah Pembentukan UUD 1945', 'UUD 1945 - Sejarah Pembentukan UUD 1945.pdf'),
(53, 1, 'BPUPKI', 'BPUPKI.pdf'),
(54, 1, 'Demokrasi', 'Demokrasi.pdf'),
(55, 1, 'Konflik Indonesia dengan Belanda', 'Konflik Indonesia dengan Belanda.pdf'),
(56, 1, 'Pemberontakan di Daerah', 'Pemberontakan di Daerah.pdf'),
(57, 1, 'Pendudukan Militer Jepang di Indonesia', 'Pendudukan Militer Jepang di Indonesia.pdf'),
(58, 1, 'Pergerakan Nasional', 'Pergerakan Nasional.pdf'),
(59, 1, 'PPKI', 'PPKI.pdf'),
(60, 1, 'Proklamasi Kemerdekaan', 'Proklamasi Kemerdekaan.pdf'),
(61, 1, 'SIstem Pemerintahan Indonesia', 'SIstem Pemerintahan Indonesia.pdf'),
(62, 1, 'Wawasan Nusantara', 'Wawasan Nusantara.pdf'),
(63, 3, 'Bekerja Sama dalam Kelompok', 'Bekerja Sama dalam Kelompok.pdf'),
(64, 3, 'Efisiensi Kerja Skala Prioritas', 'Efisiensi Kerja Skala Prioritas.pdf'),
(65, 3, 'Inisiatif', 'Inisiatif.pdf'),
(66, 3, 'Integritas Diri', 'Integritas Diri.pdf'),
(67, 3, 'Kejujuran', 'Kejujuran.pdf'),
(68, 3, 'Kemampuan Bekerja Mandiri dan Tuntas Tanggung Jawab', 'Kemampuan Bekerja Mandiri dan Tuntas Tanggung Jawab.pdf'),
(69, 3, 'Kemampuan Beradaptasi', 'Kemampuan Beradaptasi.pdf'),
(70, 3, 'Kemampuan Pengendalian Diri', 'Kemampuan Pengendalian Diri.pdf'),
(71, 3, 'Kemauan dan Kemampuan Belajar Berkelanjutan', 'Kemauan dan Kemampuan Belajar Berkelanjutan.pdf'),
(72, 3, 'Kepedulian Lingkungan', 'Kepedulian Lingkungan.pdf'),
(73, 3, 'Kepemimpinan dan Mengoordinir Orang Lain', 'Kepemimpinan dan Mengoordinir Orang Lain.pdf'),
(74, 3, 'Kepercayaan Diri', 'Kepercayaan Diri.pdf'),
(75, 3, 'Ketegasan', 'Ketegasan.pdf'),
(76, 3, 'Kreatifitas Kerja dan Inovasi', 'Kreatifitas Kerja dan Inovasi.pdf'),
(77, 3, 'Menghargai Orang Lain', 'Menghargai Orang Lain.pdf'),
(78, 3, 'Orientasi Pada Pelayanan', 'Orientasi Pada Pelayanan.pdf'),
(79, 3, 'Semangat Berprestasi', 'Semangat Berprestasi.pdf'),
(80, 3, 'Teknik Pemecahan Masalah (Problem Solving)', 'Teknik Pemecahan Masalah (Problem Solving).pdf'),
(81, 3, 'Toleransi', 'Toleransi.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tb_peserta`
--

CREATE TABLE `tb_peserta` (
  `kode_peserta` int(11) NOT NULL,
  `nama_peserta` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `verified` varchar(1) NOT NULL DEFAULT '0',
  `tipe_peserta` varchar(11) NOT NULL DEFAULT 'free',
  `kesempatan` varchar(11) NOT NULL DEFAULT '2',
  `sisa_kesempatan` int(11) NOT NULL,
  `tempat_lahir` varchar(32) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_hp` char(13) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_peserta`
--

INSERT INTO `tb_peserta` (`kode_peserta`, `nama_peserta`, `email`, `username`, `password`, `verified`, `tipe_peserta`, `kesempatan`, `sisa_kesempatan`, `tempat_lahir`, `tgl_lahir`, `no_hp`, `alamat`, `status`) VALUES
(5, 'Hanif Mukkorrobin', 'hanifmukkorrobin@gmail.com', 'hanif', 'hanifdesember', '1', 'premium', '2', 0, 'Banjarnegara', '2021-07-01', '085640988663', 'Banjarnegara', 1),
(14, 'Aninda Cyntia', 'anindaacyntia@gmail.com', 'anindacyntia', 'admin01', '1', 'premium', '2', 0, 'Cirebon', '1995-12-01', '089619965254', 'Kos Hijau Blimbingsari No.28B Yogyakarta', 1),
(17, 'Dian', 'namasayaaninda@gmail.com', 'diaandian', 'admin01', '1', 'free', '2', 1, 'Bandung', '1990-11-23', '081395532306', 'Bandung', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_premium`
--

CREATE TABLE `tb_premium` (
  `id_premium` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `banyak_paket` int(11) NOT NULL,
  `sisa_paket` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_premium`
--

INSERT INTO `tb_premium` (`id_premium`, `id_peserta`, `banyak_paket`, `sisa_paket`, `id_admin`) VALUES
(6, 5, 4, 2, 1),
(9, 14, 4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_reset_password`
--

CREATE TABLE `tb_reset_password` (
  `email` varchar(100) NOT NULL,
  `token` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_reset_password`
--

INSERT INTO `tb_reset_password` (`email`, `token`) VALUES
('hanifmukkorrobin@gmail.com', 'a7684b9f39f4df3b10504ce1de8735a2610bac2a'),
('hanifmukkorrobin@gmail.com', '349bca489c066d11ca5895687bf8317ce714775b'),
('hanifmukkorrobin@gmail.com', '7cf9783b30fc2d26db7137ed09cf782c7bbbe1bd'),
('hanifmukkorrobin@gmail.com', '4f00a43364dc7630b3bcc2b20260685de672a94e'),
('hanifmukkorrobin@gmail.com', 'b83707d23f2d0ecf9728a0f51558b6d539a1e25d'),
('hanifmukkorrobin@gmail.com', '2a67a0681dbdf9b191bb9062e5bb805bcab19123'),
('hanifmukkorrobin@gmail.com', '689557fef794ab8477dcb484ab5579f351581875'),
('hanifmukkorrobin@gmail.com', 'dadb941d5eccfc71bb3142992347cac85b70c1af'),
('hanifmukkorrobin@gmail.com', '599b8e30864c4eacc69cefd064e96e001be8ef6d'),
('hanifmukkorrobin@gmail.com', 'b239479bec8d3c7fea6a99c85ad13423f209cfb1'),
('hanifmukkorrobin@gmail.com', 'fcf80fe4addecfc1ae4c858996cf666137b99846'),
('hanifmukkorrobin@gmail.com', '49643e9f2f9ea69429809c628e42f0817c0a59b1'),
('hanifmukkorrobin@gmail.com', 'f751cef5a463ec40a10ff3cd88a06f8458462b38'),
('hanifmukkorrobin@gmail.com', '9a155a1d0fa8caaa393e0412546c95058fd7c148'),
('namasayaaninda@gmail.com', '84b2268a25cb474fa534bd605621ed3508a8d866');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `tipe_soal` varchar(11) NOT NULL,
  `soal` text NOT NULL,
  `j1` varchar(225) NOT NULL,
  `j2` varchar(225) NOT NULL,
  `j3` varchar(225) NOT NULL,
  `j4` varchar(225) NOT NULL,
  `j5` varchar(225) NOT NULL,
  `kunci` varchar(225) NOT NULL,
  `skor` int(15) NOT NULL,
  `pembahasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `id_kategori`, `tipe_soal`, `soal`, `j1`, `j2`, `j3`, `j4`, `j5`, `kunci`, `skor`, `pembahasan`) VALUES
(280, 1, 'tryout', 'Pancasila sebagai jika dan kepribadian bangsa, maksudnya adalah....', 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 'Kehidupan bangsa indonesia sesuai dengan kepribadiannya', 'Pembangunan dilaksanakan mengacu pada standar nilai pancasila', 'Selalu menunjukkan bangsa dan negaranya', 'Menjadi sumber ukuran baik atau buruk adalah kepribadiannya', 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain', 5, 'Bangsa Indonesia memiliki ciri khas yang tidak dimiliki orang lain. Pancasila merupakan dasar negara Indonesia, sumber dari segala sumber hukum Indonesia. Pancasila menjadi ciri jiwa dan kepribadian bangsa yang berarti bangsa Indonesia memiliki ciri khas yang tidak dimiliki oleh orang lain'),
(281, 1, 'tryout', 'Pancasila sebagai dasar negara pada hakikatnya telah menjadikan bangsa Indonesia berpancasila dalam tiga prakara atau tiga asas, yaitu ...', 'Ketuhanan, Kemanusiaan, Persatuan', 'Kemanusiaan, Persatuan, Kerakyatan', 'Persatuan, Kerakyatan, Keadilan', 'Kerakyatan, Keadilan, Kebudayaan', 'Kebudayaan, Religius, Kenegaraan', 'Kebudayaan, Religius, Kenegaraan', 5, 'Asas kebudayaan, secara Yuridis Pancasila telah dimiliki oleh Bangsa Indonesia\r\ndalam hal adat istiadat dan kebudayaan.\r\n Asas religius, toleransi beragama yang didasarkan pada nilai-nilai religius telah\r\nmengakar kuat di dalam kehidupan sehari-hari masyarakat Indonesia.\r\n Asas kenegaraan, karena Pancasila merupakan jati diri bangsa dan disahkan\r\nmenjadi dasar Negara, maka secara langsung Bangsa Indonesia ber-Pancasila\r\nsebagai asas kenegaraan'),
(282, 1, 'tryout', 'Rumusan Pancasila yang sah dan benar tercantum dalam ..', 'Alenia ke-1', 'Batang Tubuh UUD 1945', 'Penjelasan', 'Alenia ke-4', 'Penutup', 'Alenia ke-4', 5, 'Rumusan Pancasila yang sah dan benar tercantum dalam Pembukaan UUD 1945 alenia\r\nke empat. Yang berbunyi:\r\n“Kemudian daripada itu untuk membentuk suatu Pemerintah Negara Indonesia yang\r\nmelindungi segenap bangsa Indonesia dan seluruh tumpah darah Indonesia dan untuk\r\nmemajukan kesejahteraan umum, mencerdaskan kehidupan bangsa, dan ikut\r\nmelaksanakan ketertiban dunia yang berdasarkan kemerdekaan, perdamaian abadi dan\r\nkeadilan sosial, maka disusunlah Kemerdekaan Kebangsaan Indonesia itu dalam suatu\r\nUndang-Undang Dasar Negara Indonesia, yang terbentuk dalam suatu susunan Negara\r\nRepublik Indonesia yang berkedaulatan rakyat dengan berdasar kepada Ketuhanan Yang\r\nMaha Esa, Kemanusiaan yang adil dan beradab, Persatuan Indonesia dan Kerakyatan\r\nyang dipimpin oleh hikmat kebijaksanaan dalam Permusyawaratan/Perwakilan, serta\r\ndengan mewujudkan suatu Keadilan sosial bagi seluruh rakyat Indonesia.”'),
(283, 1, 'tryout', 'Meskipun Kepala negara tidak bertanggung jawab kepada Dewan Perwakilan Rakyat, ia bukan “diktator”. Pernyataan ini artinya...', 'Semua jawaban salah', 'Kekuasaan terbatas ', 'Kekuasaan tidak terbatas', 'Kekuasaan tidak tak terbatas', 'Kekuasaan Tak Terhingga', 'Kekuasaan tidak terbatas', 5, 'Jawaban sudah cukup jelas'),
(284, 1, 'tryout', 'Pancasila sebagai norma dasar mengandung makna bahwa nilainya bersifat ...', 'Fleksibel', 'Normatif', 'Rigid', 'Imperatif', 'Semantik', 'Normatif', 5, 'Bahwa pancasila mengungkapkan seperangkat norma atau kaidah yang membimbing dan\r\nmenjadi kritera pencapaian tujuan bangsa indonesia'),
(285, 1, 'tryout', 'Hubungan atau kaitan antar dasar Negara dengan konstitusi adalah….', 'Dasar negara adalah pedoman penyelenggaraan pemerintahan yang dijabarkan lebih lanjut dalam konstitusi.', 'Nilai-nilai yang ada dalam konstitusi lebih lanjut dioperasionalkan dalam dasar Negara.', 'Konstitusi adalah bagian dari dasar Negara', 'Dasar negara tidak bisa dirubah sedangkan konstitusi boleh dirubah', 'Dasar negara berisi prinsip-prinsip hidup bernegara yang dijabarkan melalui konstitusi ke dalam berbagai aturan hukum.', 'Dasar negara berisi prinsip-prinsip hidup bernegara yang dijabarkan melalui konstitusi ke dalam berbagai aturan hukum.', 5, 'Hubungan atau kaitan antara dasar negara dengan konstitusi antara lain: \r\n1) Dasar negara merupakan sumber segala sumber hukum (sumber tertib hukum) yang berisi prinsip-prinsip bernegara yang dijabarkan ke dalam suatu konstitusi suatu negara.\r\n2) Dasar negara merupakan suasana kebatinan (Geistlichenhintergrund) dari konstitusi.\r\n3) Dasar negara sebagai cita-cita hukum diwujudkan dalam hukum dasar negara (konstitusi).'),
(286, 1, 'tryout', 'Pancasila berisi anggapan-anggapan dasar yang merupakan kerangka keyakinan yangberfungsi sebagai acuan, pedoman dalam perencanaan, pelaksanaan, pengawasan dan pemanfaatan hasil-hasil pembangunan, hal ini berarti pancasila sebagai ….', 'Pandangan hidup bangsa Indonesia', 'Paradigma pembangunan', 'Sumber dari segala sumber hukum', 'Jiwa dan kepribadian bangsa Indonesia', 'Dasar negara Republik Indonesia', 'Paradigma pembangunan', 5, 'Pancasila berisi anggapan-anggapan dasar yang merupakan kerangka keyakinan yang\r\nberfungsi sebagai acuan, pedoman dalam perencanaan, pelaksanaan, pengawasan dan\r\npemanfaatan hasil-hasil pembangunan, hal ini berarti pancasila sebagai Paradigma\r\npembangunan.\r\nPancasila berisi anggapan-anggapan dasar yang merupakan kerangka keyakinan yang\r\nberfungsi sebagai acuan, pedoman dalam perencanaan, pelaksanaan, pengawasan, dan\r\npemanfaatan ha'),
(287, 1, 'tryout', 'Negara adalah alat masyarakat untuk mengatur hubungan antara manusia dalam masyarakat tersebut. Pernyataan tersebut merupakan pengertian negara ditinjau dari segi negara sebagai....', 'Organisasi politik', 'Organisasi kekuasaan', 'Organisasi integralistik', 'Organisasi kemasyarakatan', 'Organisasi sosial', 'Organisasi kekuasaan', 5, 'Negara sebagai organisasi kekuasaan Negara adalah alat masyarakat yang mempunyai kekuasaan untuk mengatur hubungan\r\nantara manusia dalam masyarakat tersebut. Pengertian ini dikemukakan oleh Logemann dan Harold J. Laski. Logemann menyatakan bahwa negara adalah organisasi kekuasaan\r\nyang bertujuan mengatur masyarakatnya dengan kekuasaannya itu. Negara sebagai organisasi kekuasaan pada hakekatnya merupakan suatu tata kerja sama untuk membuat\r\nsuatu kelompok manusia berbuat atau bersikap sesuai dengan kehendak negara itu.'),
(288, 1, 'tryout', 'Demokrasi adalah pemerintahan yang berasal dari rakyat, dilakukan oleh rakyat, dan untuk kepentingan rakyat sehingga kedaulatan berada di tangan rakyat. Kedaulatan rakyat\r\nsepenuhnya dilakukan oleh ....', 'DPR dan MPR', 'DPA dan BPK', 'Presiden', 'DPR', 'MPR', 'DPR dan MPR', 5, 'Kedaulatan rakyat sepenuhnya dilakukan oleh DPR dan MPR sebagai lembaga legislatif.'),
(289, 1, 'tryout', 'Nilai-nilai pengembangan yang dimiliki dan dilakukan secara terus-menerus dalam mengembangkan nilai dasar yang dimiliki oleh Pancasila, merupakan nilai...', 'Nilai Instrumental', 'Nilai Materiel', 'Nilai Vital', 'Nilai Kerohanian', 'Agama', 'Nilai Instrumental', 5, 'Bahwa nilai instrumental, yaitu nilai-nilai pengembangan yang dimiliki dan dilakukan\r\nsecara terus-menerus dalam mengembangkan nilai dasar yang dimiliki oleh Pancasila.\r\nNilai dasar Pancasila adalah nilai ketuhanan, nilai kemanusiaan, nilai persatuan, nilai\r\nkerakyatan, dan nilai keadilan.\r\n- Nilai instrumental adalah nilai yang menjadi pedoman pelaksanaan dari nilai dasar\r\ntersebut.\r\n- Nilai praksis merupakan penjabaran lebih lanjut dari nilai instrumental dalam kehidupan\r\nyang lebih nyata dengan demikian nilai praksis merupakan pelaksanaan secara nyata dari\r\nnilai-nilai dasar dan nilai-nilai instrumental.\r\nAdapun:\r\n- Nilai materiel ialah nilai yang dilihat dari hasil guna dari sesuatu, seperti benda bagi\r\nmanusia.\r\n- Nilai vital ialah sesuatu yang berguna bagi manusia untuk kegiatan aktivitasnya\r\n- Nilai kerohanian ialah segala sesuatu yang bernilai bagi rohani manusia itu.'),
(290, 1, 'tryout', 'Dalam kehidupan bernegara, Pancasila berperan sebagai...', 'Dasar negara', 'Dasar kenegaraan', 'Dasar beragama', 'Dasar ketatanegaraan', 'Dasar Ketuhanan', 'Dasar negara', 5, 'Jawaban sudah cukup jelas'),
(291, 1, 'tryout', 'Rumusan Pancasila yang resmi terdapat dalam...', 'Pidato Bung Karno', 'Proklamasi 17 Agustus 1945', 'Pembukaan UUD 1945', 'Piagam Jakarta', 'Semua Benar', 'Pembukaan UUD 1945', 5, 'Jawaban sudah cukup jelas'),
(292, 1, 'tryout', 'Dalam sumber tata hukum di Indonesia, Pancasila dijadikan sebagai', 'Sumber dari segala sumber hukum', 'Hukum tertinggi di Indonesia', 'Hukum tertulis tertinggi di Indonesia', 'Setingkat dengan UUD 1945', 'Semua Benar', 'Sumber dari segala sumber hukum', 5, 'Jawaban sudah cukup jelas'),
(293, 1, 'tryout', 'Pancasila bagi bangsa Indonesia merupakan:', 'Pandangan hidup', 'Falsafah dan dasar negara', 'Sumber hukum', 'A dan B Benar', 'Semua Benar', 'Pandangan hidup', 5, 'Jawaban sudah cukup jelas'),
(294, 1, 'tryout', 'Tata cara mengucapkan Pancasila pada upacara-upacara resmi ditetapkan pada :', 'TAP MPR RI No.II/MPR/1978', ' INPRES No.12 Tahun 1968', 'UU No.5 Tahun 1985', 'TAP MPR No.I/MPR/1983', 'Semua Benar', 'TAP MPR No.I/MPR/1983', 5, 'Jawaban sudah cukup jelas'),
(295, 1, 'tryout', 'Hubungan sosial yang selaras, serasi, seimbang antara individu dan masyarakat dijiwai oleh nilai-nilai Pancasila, yaitu:', 'Sila pertama', 'Sila kedua', 'Sila ketiga', 'Sila keempat', 'Sila kelima', 'Sila kedua', 5, 'Jawaban sudah cukup jelas'),
(296, 1, 'tryout', 'Anggota PWI (Persatuan Wartawan Indonesia) berasal dari berbagai suku-bangsa di Indonesia. Mereka mempunyai kesetiaan dalam kelompok kesukuan masing-masing dan kesetiaan dalam kelompok profesi sehingga terjadi interseksi sosial atas dasar...', 'Pendidikan dan Pekerjaan', 'Profesi dan Kesukuan', 'Organisasi dan Profesi', 'PW! dan Suku-Bangsa', 'Kesetiaan dan Keanggotaan', 'Pendidikan dan Pekerjaan', 5, 'Jawaban sudah cukup jelas'),
(297, 1, 'tryout', 'Negara Indonesia berdasar atas Hukum (Rechtsstaat), tidak berdasar atas...', 'Kekuasaan belaka', 'Lembaga negara', 'Kedaulatan rakyat', 'Majelis Permusyawaratan Rakyat', 'Kekuasaan tertinggi', 'Kekuasaan belaka', 5, 'Jawaban sudah cukup jelas'),
(298, 1, 'tryout', 'Pemerintah berdasar atas sistem konstitusi (hukum dasar), tidak bersifat absolutisme. Apa yang dimaksud dengan absolutisme...', 'Kekuasaan yang terbatas', 'Kekuasaan yang sangat terbatas', 'Kekuasaan yang tidak tak terbatas', 'Kekuasaan yang tidak terbatas', 'Kekuasaan tak ternilai', 'Kekuasaan yang tidak terbatas', 5, 'Jawaban sudah cukup jelas'),
(299, 1, 'tryout', 'Presiden ialah penyelenggara pemerintah negara yang tertinggi di bawahnya...', 'Ketua MPR', 'Ketua DPR', 'MPR', 'DPR', 'DPRD', 'MPR', 5, 'Jawaban sudah cukup jelas'),
(300, 1, 'tryout', 'Presiden ialah penyelenggara pemerintah negara yang tertinggi, sehingga menjalankan roda pemerintahan dengan cara consentration of power and responsibility upon the President. Apa yang dimaksud dengan istilah di atas...', 'Pemusatan kekuasaan dan tanggung jawab oleh Presiden', 'Kekuasaan Presiden tidak terbatas', 'Presiden memiliki kekuasaan dan tanggung jawab yang lebih tinggi dari lembaga  tinggi Negara lainnya', 'Dalam menjalankan pemerintahan negara kekuasaan dan tanggung jawab adalah di tangan Presiden', 'Semua Benar', 'Dalam menjalankan pemerintahan negara kekuasaan dan tanggung jawab adalah di tangan Presiden', 5, 'Jawaban sudah cukup jelas'),
(301, 1, 'tryout', 'Presiden ialah Kepala kekuasaan eksekutif dalam Negara. Untuk itu Presiden memiliki pouvoir reglementair. Apa maksudnya...', 'Kekuasaan untuk menetapkan peraturan pemerintah', 'Kekuasaan untuk menjalankan undang-undang', 'Kekuasaan untuk menetapkan undang-undang', ' Semua jawaban salah', 'A dan B benar', 'Kekuasaan untuk menetapkan peraturan pemerintah', 5, 'Jawaban sudah cukup jelas'),
(302, 1, 'tryout', 'Pemerintahan daerah adalah penyelenggaraan urusan pemerintahan oleh pemerintah daerah dan DPRD menurut asas otonomi dan tugas pembantuan. Yang dimaksud dengan tugas pembantuan adalah...', 'Penyerahan wewenang pemerintahan oleh pemerintah kepada daerah otonom untuk mengurus pemerintahan dalam NKRI.', 'Pelimpahan wewenang pemerintahan oleh pemerintah kepada gubernur sebagai wakil pemerintah kepada instansi vertikal di wilayah tertentu.', 'Penugasan dari pemerintah kepada daerah dan atau desa dari pemerintah provinsi kepada kabupaten/kota dan atau desa untuk melakukan tugas tertentu.', 'Wewenang, hak dan kewajiban daerah otonom untuk mengatur dan mengurus sendiri urusan pemerintah sesuai dengan peraturan perundang-undangan.', 'Semua jawaban benar', 'Penugasan dari pemerintah kepada daerah dan atau desa dari pemerintah provinsi kepada kabupaten/kota dan atau desa untuk melakukan tugas tertentu.', 5, 'Jawaban sudah cukup jelas'),
(303, 1, 'tryout', 'Hak, wewenang dan kewajiban daerah otonomi untuk memgatur dan mengurus sendiri urusan pemerintahan dan kepentingan setempat sesuai dengan peraturan perundang undangan disebut...', 'Daerah otonomi', 'Prinsip otonomi daerah', 'Otonomi daerah', 'Asas-asas otonomi daerah', 'Semua jawaban salah', 'Prinsip otonomi daerah', 5, 'Jawaban sudah cukup jelas'),
(304, 1, 'tryout', 'Daerah otonom adalah...', 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri', 'Kesatuan daerah yang mempunyai perangkat dan pemerintahan sendiri, mengurus kepentingan masyarakat di daerah menurut prakarsa sendiri.', 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri berdasarkan aspirasi masyarakat dalam sistem NKRI.', 'Hak wewenang, dan kewajiban untuk mengatur dan mengurus sendiri urusan pemerintah dan kepentingan masyarakat setempat sesuai dengan peraturan perundang undangan.', 'Semua jawaban benar', 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri berdasarkan aspirasi masyarakat dalam sistem NKRI.', 5, 'Jawaban sudah cukup jelas'),
(305, 1, 'tryout', 'Peraturan yang mengatur tentang pelaksanaan otonomi daerah, yaitu...', 'UU No. 20 Tahun 2003', 'UU No. 32 Tahun 2004', 'UU No. 9 Tahun 1998', 'UU No. 39 Tahun 1999', 'Semua jawaban salah', 'UU No. 32 Tahun 2004', 5, 'Jawaban sudah cukup jelas'),
(306, 1, 'tryout', 'Undang-Undang No. 32 Tahun 2004 mengatur tentang...', 'Pemerintahan Daerah', 'Otonomi Daerah', 'Pemerintahan Otonomi', 'Daerah Otonom', 'Semua jawaban benar', 'Pemerintahan Daerah', 5, 'Jawaban sudah cukup jelas'),
(307, 1, 'tryout', 'Yang disebut daerah otonom adalah...', 'Negara', 'Kabupaten', 'Kecamatan', 'Kelurahan', 'Provinsi', 'Kabupaten', 5, 'Jawaban sudah cukup jelas'),
(308, 1, 'tryout', 'Pasal berapa saja UUD 1945 pertama kali diamandemen...', 'Pasal 5, 7,9, 13, 14, 15, 17, 20, dan 21', 'B. Pasal 5, 7,9, 13, 14, 15, 17, 20, dan 22', 'Pasal5, 7,9, 13,14, 15, 17, 20, dan 23', 'Pasal 5, 7,9, 13, 14, 15, 17, 20, dan 24', 'Pasal 5, 7,9, 13, 14, 15, 17, 22, dan 23', 'Pasal 5, 7,9, 13, 14, 15, 17, 20, dan 21', 5, 'Jawaban sudah cukup jelas'),
(309, 1, 'tryout', 'Pertemuan APEC pada tanggal 14-15 November 2009 di Singapura membahas….', 'Perjanjian Ekstradisi', 'Perjanjian Ekspor Impor', 'Perubahan Iklim Dunia', 'Kerjasama Ekonomi Global', 'Krisis Ekonomi Global', 'Perubahan Iklim Dunia', 5, 'Para pemimpin ekonomi negara-negara anggota Forum kerjasama ekonomi Asia Pasifik (APEC) melakukan pertemuan dengan Perdana Menteri Denmark, Lars Lokke Rasmussen ntuk membahas persiapan pertemuan PBB tentang Perubahan Iklim di Denmark, Desember 2009.'),
(310, 2, 'tryout', 'Diketahui barisan aritmatika dengan U2 + U5 + U20 = 54, Suku ke-9 barisan tersebut adalah', '16', '17', '18', '19', '20', '18', 5, 'Pada dasarnya, untuk mengerjakan soal seperti ini yang perlu kita lakukan adalah mencari nilai suku pertama (a) dan beda barisan (b). Akan tetapi, pada sebagian soal kita tidak dapat menentukan nilai a dan b sehingga yang harus kita lakukan adalah melihat hubungan antara persamaan yang ditanya dengan persamaan yang diketahui. Dari soal diperoleh persamaan: U2 + U5 + U20 = 54\r\n\r\n(a+ b) + (a+ 4b) + (a+ 19b) = 54\r\n\r\n3a + 24b = 54\r\n\r\na+ 8b=18\r\n\r\nRumus untuk menghitung suku ke-9 adalah sebagai berikut :\r\nU9 =a+ 8b\r\n\r\nU9=a+8b=18\r\n'),
(311, 2, 'tryout', 'Dalam Suatu Barisan Aritmatika , jika U3+U7 = 56 dan U6+U10 = 86, maka suku ke-2 barisan aritmatika tersebut sama dengan ... ', '13', '16', '20', '24', '28', '13', 5, 'Dari soal diperoleh dua persamaan sebagai berikut :\r\nU3 + U7 = 56\r\n\r\n(a + 2b) + (a + 6b) = 56\r\n\r\n2a + 8b = 56\r\n\r\na+ 4b = 28.\r\n\r\nU6 + U10 = 86\r\n\r\n(a + 5b) + (a + 9b) = 86\r\n\r\n2a+ 14b = 86\r\n\r\na+ 7b = 43.\r\n\r\nDari dua persamaan di atas, nilai a dan b dapat dihitung dengan menggunakan metode substitusi\r\nsebagai berikut:\r\n\r\na+ 4b = 28 > a = 28 - 4b — substitusi ke persamaan (2).\r\na+ 7b =43\r\n28 - 4b + 7b = 43\r\n\r\n28+ 3b = 43\r\n\r\n3b=15\r\n\r\nb=5\r\n\r\nKarena b = 5, maka a = 28 - 4(5) = 28 - 20 =8.\r\n\r\nJadi, suku ke-2 barisan aritmatika tersebut adalah :\r\n\r\nU2=a+b\r\nU2=84+5\r\nU2=13\r\n'),
(312, 2, 'tryout', 'Diketahui U2+24 =  12 dan U3+U5 = 16, , maka suku ke - 7 adalah ...', '30', '28', '22', '18', '14', '14', 5, 'Dari soal diperoleh dua persamaan sebagai berikut :\r\n(1)U2+U4=12\r\n\r\n(a+b) + (a+3b)=12\r\n\r\n2a+4b=12\r\n\r\na+2b=6.\r\n\r\n(2) U3 + U5 =16\r\n\r\n(a + 2b) + (a + 4b) = 16\r\n2a+ 6b=16\r\na+3b=8.\r\n\r\nDari dua persamaan di atas, nilai a dan b dapat dihitung dengan menggunakan metode substitusi\r\nsebagai berikut:\r\n\r\na+ 2b =6—a=6- 2b —> substitusi ke persamaan (2).\r\n\r\na+3b=8\r\n6-2b+3b=8\r\n6+b=8\r\nb=2\r\n\r\nKarena b = 2, maka a = 6 - 2(2)=6-4=2.\r\n\r\nJadi, suku pertama barisan itu adalah 2 dan suku ke-7 barisan aritmatika tersebut adalah :\r\nU7 =a+ 6b\r\n\r\nU7 =2 + 6(2)\r\n\r\nU7 =14'),
(313, 2, 'tryout', 'Baris Aritmatik, U1+U10+U19 = 96,  Suku ke -10 adalah....', '22', '27', '32', '37', '42', '32', 5, 'Dari soal diperoleh persamaan sebagai berikut :\r\nU1 + U10+ U19 = 96\r\n\r\nata+9b+a+18b=96\r\n\r\n3a+27b = 96\r\n\r\na+ 9b = 32\r\n\r\nSuku ke-10 barisan aritmatika tersebut adalah :\r\nU10=a+ 9b\r\nU10=a+ 9b = 32\r\n'),
(314, 2, 'tryout', 'Jika U2 + U15 + U40 = 165, maka suku ke 19 barisan tersebut adalah', '10', '19', '28.5', '55', '82.5', '55', 5, 'Dari soal diperoleh persamaan sebagai berikut:\r\nU2 + U15 + U40 = 165\r\n\r\na+b+a+14b+a+39b=165\r\n\r\n3a + 54b = 165\r\n\r\na+18b=55\r\n\r\nSuku ke-19 barisan aritmatika tersebut adalah :\r\nU19=a+ 18b\r\nU19=55\r\n'),
(315, 2, 'tryout', '(55 + 33)*2 = ....', '8025', '7225', '7175', '9025', '7125', '7225', 5, '(55 + 30)? = 85 x 85\r\n= 7.225\r\n'),
(316, 2, 'tryout', '3 adalah berapa persen dar 20?', '0.6', '15', '0.66', '0.15', '6.6666666666667', '15', 5, '3/20 x 100 =\r\n300/20 = 15.\r\n'),
(317, 2, 'tryout', 'Ada 2 roda, roda pertama berputar 9 kali, roda kedua 24 kali. Jika roda pertama berputar 27 kali, berapa kali roda kedua berputar?', '74 kali', '92 Kali', '84 Kali', '72 Kali', '82 Kali', '72 Kali', 5, 'Roda | Roda II\r\nBerputar 9 kali Berputar 24 kali\r\nBerputar 27 kali x kali \r\n9/ 24 = 27/x\r\n9x = 648\r\nx = 648/ 9\r\n= 72'),
(318, 2, 'tryout', 'Nilai ujian Rudi termasuk urutan 16 dari atas dan juga urutan 16 dari bawah dalam kelasnya. Berapa banyak siswa yang berada di dalam kelas Rudi?', '30 Orang', '16 Orang', '31 Orang', '32 Orang', '26 Orang', '31 Orang', 5, 'Yang nilainya lebih besar dari Rudi: 15 orang.\r\nYang nilainya lebih kecil dari Rudi: 15 orang.\r\nRudi sendiri: 1 orang = 15 + 15 + 1 = 31 orang.'),
(319, 2, 'tryout', '73 x 2 2/4 = 2/14', '6.625', '2.25', '6.1875', '97/16', '36/44', '6.1875', 5, '2 1/4 : 4/11\r\n= 9/4 x 11/4\r\n= 99/16 = 6 3/16'),
(321, 2, 'tryout', 'Random = ....', 'Secara acak', 'Mendasar', 'Minimal', 'Keseluruhan', 'Maksimal', 'Secara Acak', 5, 'Jawaban sudah cukup jelas'),
(322, 2, 'tryout', 'Siklus = ....', 'Derajat', 'Proses', 'Kelas', 'Rangkaian', 'Daur', 'Daur', 5, 'Jawaban sudah cukup jelas'),
(323, 2, 'tryout', 'Relasi = ....', 'Tetangga', 'Langganan', 'Kontak', 'Rekanan', 'Urusan', 'Rekanan', 5, 'Jawaban sudah cukup jelas'),
(324, 2, 'tryout', 'Futuristis = ....', 'Indah dan nyaman', 'Menuju masa depan', 'Teknologi tinggi', 'Canggih', 'Nyaman', 'Menuju masa depan', 5, 'Jawaban sudah cukup jelas'),
(325, 2, 'tryout', 'ASA = ....', 'Tampak', 'Harapan', 'Diri', 'Percaya', 'Perasaan', 'Harapan', 5, 'Jawaban sudah cukup jelas'),
(326, 2, 'tryout', 'Imajinasi = ....', 'Inkarnasi', 'Khayalan', 'Harapan', 'Bohong', 'Ingatan', 'Khayalan', 5, 'Jawaban sudah cukup jelas'),
(327, 2, 'tryout', 'Rabat = .....', 'Harga jual', 'Nilai jual', 'Pembayaran', 'Potongan harga', 'Keuntungan', 'Nilai jual', 5, 'Jawaban sudah cukup jelas'),
(328, 2, 'tryout', 'Oval = ....', 'Busur', 'Bundar', 'Bulat', 'Bulat telur', 'Lonjong', 'Bulat telur', 5, 'Jawaban sudah cukup jelas'),
(329, 2, 'tryout', 'Proteksi = ....', 'Bantuan', 'Pengawasan', 'Perlindungan', 'Penjagaan', 'Pengamanan', 'Perlindungan', 5, 'Jawaban sudah cukup jelas'),
(330, 2, 'tryout', 'Tidak semua lulusan SMA yang pandai lolos ujian CPNS. Semua lulusan SMA yang bodoh tidak lolos ujian CPNS. Tidak semua lulusan SMA yang pandai selalu mempunyai nilai ijazah yang lebih baik daripada yang lebih bodoh. Banu mempunyai nilai ijazah yang lebih buruk daripada Dimas.', 'Tidak mungkin Dimas akan lolos ujian CPNS.', 'Dimas lebih pandai daripada Banu.', 'Tidak mungkin Banu dan Dimas adalah satu alumni.', 'Tidak mungkin Banu akan lolos ujian CPNS.', 'Mungkin Banu dan Dimas akan lolos ujian CPNS.', 'Mungkin Banu dan Dimas akan lolos ujian CPNS.', 5, 'Jawaban sudah cukup jelas'),
(331, 2, 'tryout', 'Ketika bapak dan ibu Sugiono menikah, masing-masing telah memiliki seorang anak. Sekarang, Sugiono lahir persis setahun setelah perkawinan tersebut, dan memiliki 4 saudara.', 'Sugiono merupakan anak tertua dalam keluarga.', 'Sugiono merupakan anak tunggal dari perkawinan kedua.', 'Sugiono tidak memiliki saudara tiri.', 'Sugiono memiliki 2 orang adik kandung.', 'Sugiono memiliki 4 orang adik.', 'Sugiono memiliki 2 orang adik kandung.', 5, 'Jawaban sudah cukup jelas'),
(332, 2, 'tryout', 'Semua siswa SMP Harapanjaya pandai. Sebagian besar siswa SMP Harapanjaya berasal dari keluarga kaya.', 'Semua siswa yang kaya adalah siswa yang pandai.', 'Semua siswa SMP Harapanjaya pandai dan kaya.', 'Semua siswa yang pandai adalah siswa SMP Harapanjaya.', 'Sebagian besar siswa yang kaya dan pandai adalah siswa SMP Harapanjaya.', 'Sebagian besar siswa SMP Harapanjaya kaya dan pandai.', 'Sebagian besar siswa SMP Harapanjaya kaya dan pandai.', 5, 'Jawaban sudah cukup jelas'),
(333, 2, 'tryout', 'Kenari terbang ke barat. Kenari adalah burung.', 'Tidak setiap Kenari yang terbang ke Barat adalah burung.', 'Tidak semua burung Kenari terbang ke barat.', 'Beberapa burung terbang ke barat.', 'Burung bukan Kenari.', 'Semua kenari adalah Kenari.', 'Beberapa burung terbang ke barat.', 5, 'Jawaban sudah cukup jelas'),
(334, 2, 'tryout', 'Dalam suatu perjamuan makan, jika disajikan nasi goreng maka bebek goreng juga disajikan. Jika bebek goreng disajikan, maka jus buah juga disajikan.', 'Jika jus buah disajikan, maka nasi goreng juga disajikan.', 'Jika nasi goreng tidak disajikan, maka jus buah tidak disajikan.', 'Jika jus buah disajikan, maka bebek goreng juga disajikan.', 'Jika jus buah tidak disajikan, maka nasi goreng tidak disajikan.', 'Jika bebek goreng disajikan, maka nasi goreng juga disajikan.', 'Jika jus buah disajikan, maka nasi goreng juga disajikan.', 5, 'Jawaban sudah cukup jelas'),
(335, 2, 'tryout', 'Semua mahasiswa diminta mempersiapkan diri untuk ujian. Sebagian mahasiswa mendapat nilai baik dalam ujian.', 'Sebagian mahasiswa yang tidak mempersiapkan diri dan tidak mendapat nilai baik, tidak lulus ujian.', 'Semua mahasiswa mempersiapkan diri dan mendapat nilai baik.', 'Semua mahasiswa mempersiapkan diri.', 'Sebagian mahasiswa sudah diminta mempersiapkan diri dan mendapat nilai', 'Sebagian mahasiswa tidak mempersiapkan diri tapi mendapat nilai baik', 'Sebagian mahasiswa yang tidak mempersiapkan diri dan tidak mendapat nilai baik, tidak lulus ujian.', 5, 'Jawaban sudah cukup jelas'),
(336, 2, 'tryout', 'Keluarga Adibuana mempunyai lima orang anak. Komar Buana lahir sebelum Rudi Buan Rudi Buana lahir sesudah Candra Buana, tetapi sebelum Sono Buan Candra Buana lahir sesudah Komar Buan Wilujeng Buana lahir sesudah Sono Buana.', 'Komar Buana paling tua.', 'Rudi Buana lebih tua daripada Candra Buana.', 'Candra Buana paling tua.', 'Candra Buana lebih muda daripada Sono Buana.', 'Wilujeng Buana paling tua.', 'Komar Buana paling tua.', 5, 'Jawaban sudah cukup jelas'),
(337, 2, 'tryout', 'Semua wisatawan mempunyai paspor. Sebagian wisatawan membawa kamera', 'Sebagian wisatawan yang membawa kamera tidak mempunyai paspor.', 'Semua wisatawan mempunyai paspor dan membawa kamera.', 'Semua yang membawa kamera adalah wisatawan.', 'Sebagian wisatawan yang membawa kamera mempunyai paspor.', 'Sebagian wisatawan yang membawa kamera tidak mempunyai paspor.', 'Sebagian wisatawan yang membawa kamera mempunyai paspor.', 5, 'Jawaban sudah cukup jelas'),
(338, 2, 'tryout', 'Semua karyawan harus hadir dalam rapat rutin. Sementara cleaning service adalah karyawan.', 'Semua cleaning service hadir dalam rapat rutin.', 'Semua yang hadir bukan cleaning service.', 'Sementara peserta rapat rutin bukan cleaning service.', 'Semua yang hadir dalam rapat rutin adalah cleaning service.', 'Sementara peserta rapat rutin adalah cleaning service.', 'Semua cleaning service hadir dalam rapat rutin.', 5, 'Jawaban sudah cukup jelas'),
(339, 2, 'tryout', 'Semua sepeda motor dilengkapi spedometer. Sebagian sepeda motor berwarna hitam.', 'Sebagian sepeda motor berwarna hitam dan tidak dilengkapi spedometer.', 'Semua sepeda motor berwarna hitam dan dilengkapi spedometer.', 'Semua sepeda motor berwarna hitam dan dilengkapi spedometer.', 'Semua sepeda motor tidak berwarna hitam dan dilengkapi spedometer.', 'Sebagian sepeda motor tidak berwarna hitam dan tidak dilengkapi spedometer', 'Sebagian sepeda motor tidak berwarna hitam dan tidak dilengkapi spedometer', 5, 'Jawaban sudah cukup jelas'),
(340, 2, 'tryout', 'Kayu : …. = Beras : Nasi Goreng', 'Pasak', 'Kursi Tamu', 'Gelondongan', 'Papan', 'Tripleks', 'Kursi Tamu', 5, 'Beras jika dimasak bisa menjadi nasi goreng. Kayu jika diolah bisa menjadi kursi tamu.'),
(341, 2, 'tryout', 'Jika Resna meminum obat maka dia sembuh. Jika Resna sembuh maka dia akan berangkat kerja. Ternyata Resna tidak masuk kerja. Berarti …..', 'Resna tidak minum obat dan tidak sembuh', 'Resna minum obat', 'Resna tidak minum obat', 'Resna minum obat dan tidak sembuh', 'Resna tidak minum obat dan sembuh', 'Resna tidak minum obat dan tidak sembuh', 5, 'Resna tidak minum obat dan tidak sembuh artinya Resna akan sembuh dan berangkat kerja jika minum obat. Jadi pernyataan yang dapat disimpulkan bahwa Resna tidak minum obat dan tidak sembuh'),
(342, 2, 'tryout', '(24! - 21!)/20! = ……', '255003', '228004', '335003', '335004', '533003', '255003', 5, '(24x23x22x21x …. -21x..)/20x19x18x.. = (21! (24x23x22 -1))/20! = 21 x 12.143 = 255.003'),
(343, 2, 'tryout', 'Berapa 30% dari 165 ?', '4.95', '49.5', '49.05', '495', '4950', '49.5', 5, '30/100 x 165 = 49.5'),
(344, 2, 'tryout', '4.036 : 0.04 = …….', '1009', '0.42291666666667', '10.9', '100.9', '109', '100.9', 5, '4.036 : 0.04 = 4036 : 40 = 100.9'),
(345, 3, 'tryout', 'Anda sedang buru-buru ke kantor karena ada rapat\nmendadak dengan atasan Anda, tetapi Anda\nmendapati piring pecah di lantai dapur rumah Anda\nyang dapat membahayakan orang lain. Tindakan\nAnda…', 'Membiarkan saja dan buru-buru berangkat ke kantor', 'Menelepon teman Anda untuk menggantikan Anda rapat', 'Menelepon teman bahwa Anda sedikit terlambat\ndatang dan membersihkan pecahan piring', 'Membersihkan pecahan tersebut lalu datang\nterlambat', 'Menutup pecahan piring dengan kain karena\nburu-buru agar tidak terlambat rapat dengan\natasan Anda', 'Menutup pecahan piring dengan kain karena\nburu-buru agar tidak terlambat rapat dengan\natasan Anda', 5, 'Lebih bisa diterima Karena mengingat\r\nwaktu mendesak, perlu cara yang ringkas'),
(346, 3, 'tryout', 'Anda sedang mengendarai motor dengan agak\nterburu-buru karena khawatir terlambat sampai\ndikantor. Ditengah perjalanan, dari jauh terlihat ada\nsepasang laki- laki dan perempuan berpakaian serba\nputih-hitam menghentikan setiap keendaraan yang\nmelintas dihadapannya dengan panik, namun\nsepertinya tidak mendapat respon yang baik. Motor\nAnda pun di stop, laki-laki itu meminta bantuan Anda\nuntuk mengantarkan istrinya yang akan\nmekaksanakan ujian CAT CPNS dalam waktu kurang\nlebih 30 menit lagi, karena motor yang mereka\ntumpangi mengalami bocor ban dan sedang ditangani\noleh bengkel. Rupanya tempat yang dituju kebetulan\nsatu arah, namun bukanlah jalur tercepat yang biasa\nAnda lewati untuk sampai dikantor. Yang akan Anda\nlakukan adalah...', 'Menyarankan kepada laki-laki itu agar sebaiknya\nistrinya naik ojeg saja dan mengatakan bahwa saya\nsedang terburu-buru.', 'Menolaknya dengan tegas karena saya tidak ingin\nterlambat', 'Mengantarkan istrinya dengan syarat harus\nmembayar ongkos', 'Mengantarkan hanya setengah jalan karena saya\nharus melintasi jalur yang berbeda untuk cepat\nsampai dikantor.', 'Mengantarkan istrinya sampai ketempat yang dituju meskipun dengan konsekuensi pasti saya\nakan terlambat sampai dikantor.', 'Mengantarkan hanya setengah jalan karena saya\nharus melintasi jalur yang berbeda untuk cepat\nsampai dikantor.', 5, 'Agak lebih realistis dan masih ada\r\nkepedulian'),
(347, 3, 'tryout', 'Anda ditugasi atasan anda berdinas keluar\r\npulau.Anda berencana pergi dengan menggunakan\r\ntransportasi udara. Setelah lama menunggu,\r\nakhirnya pesawat yang rencananya akan anda naiki\r\ntelah datang. Namun di sisi lain anda melihat\r\nseorang nenek yang sedang kebingungan. Sikap\r\nanda .......', 'Membantu nenek tersebut menyelesaikan masalahnya', 'Pergi meninggalkan nenek tersebut karena anda harus segera naik pesawat', 'Merasa kasihan terhadap nenek tersebut tapi apalah daya anda tidak dapat membantu nenek tersebut', 'Merasa iba dan dengan sangat berhati-hati membantu nenek tersebut', 'Merasa kasihan terhadap nenek tersebut tapi apalah daya anda tidak dapat membantu nenek tersebut', 'Pergi meninggalkan nenek tersebut karena anda harus segera naik pesawat', 5, 'Karena pemberangkatan dipesawat tidak\r\nbisa lambat, yang memungkin memberitahukan\r\nsatpam yang berkeliaran di bandara yang biasanya\r\nbanyak.'),
(348, 3, 'tryout', 'Anda memiliki seorang teman yang bercerita kepada\nanda dan mengeluhkan suami nya yang pecandu\nnarkoba. Dan memohon bantuan karena dia sudah\nkehabisan cara menghadapi suami nya. Anda sangat\nprihatin melihat teman anda yg sangat tertekan itu.\nAnda memiliki sahabat yang bekerja di Lembaga yg\nmerehabilitasi pecandu narkotika (lupa tadi apa nama\nnya) maka tindakan anda...', 'Memberi nomor telepon teman, agar dia segera\nmendaftarkan suami nya di rehabilitasi', 'Memberi nomor teman dan memperkenalkan teman\nanda yg bermasalah kepada teman anda yg jadi petugas', 'Menelpon teman dan memintanya mendaftarkan\nsuami teman yg harus di rehabilitasi', 'Menyarankannya agar segera mendaftar di lembaga\nrehabilitasi tersebut.', 'Tidak melakukan apapun karena dia harus nya tau\nsendiri tempat merehabilitasi dimana', 'Menyarankannya agar segera mendaftar di lembaga\nrehabilitasi tersebut.', 5, 'Sebatas saran terlebih dahulu tidak\r\nlangsung reaksioner'),
(349, 3, 'tryout', 'Atasan anda menugaskan anda membuat sebuah tim\nuntuk menyelesaikan sebuah masalah pekerjaan di\nkantor anda, tetapi di kantor anda terdiri dari orang2\ndari berbagai macam latar belakang suku yg berbeda\ndengan anda. Bagamana sikap anda…', 'Membuat sebuah kelompok yang solid dari orang-orang yang\nsepemahaman dengan saya karena kekompakan itu\npenting.', 'Memilih orang-orang dari berbagai latar belakang agar\ntidak ada kecemburuan sosial.', 'Memilih orang-orang dari berbagai latar belakang yang\nberbeda agar dapat memperoleh bermacam saran\ndan masukan.', 'Membuka kesempatan bagi siapapun yang memiliki\nkemauan dan kemampuan bekerja tim.', 'Membuka kesempatan bagi siapapun yang memiliki\nkemauan dan kemampuan bekerja tim tanpa\nmembedakan latar belakang.', 'Memilih orang-orang dari berbagai latar belakang yang\nberbeda agar dapat memperoleh bermacam saran\ndan masukan.', 5, 'Memilih karena kita ditugaskan untuk\r\nmembuat, bukan membuka kesempatan kurang\r\ntepat (Kemampuan menggerakkan dan mengkoordinir\r\norang lain)'),
(350, 3, 'tryout', 'Seorang teman anda mencuri ide dan gagasan anda\ndan mempresentasikan nya didepan pejabat daerah\nsehingga mendapatkan penghargaan. Sikap anda\nadalah ………', 'Diam saja dan menyelamatkannya atas prestasi\ntersebut', 'Mencari bukti untuk melaporkannya kepada panitia\nkarena plagiarisme itu adalah tindakan\nburuk.', 'Berbisik keatasnya dan melaporkan nya.', 'Menegurnya karena hal yang dia lakukan itu tidak\nbaik.', 'Segera naik keatas panggung untuk melakukan\nklarifikasi bahwasanya itu adalah ide saya', 'Menegurnya karena hal yang dia lakukan itu tidak\nbaik.', 5, 'Soalnya yg dicuri baru\r\nide dan gagasan. bukan dalam\r\nbentuk tulisan/publikasi'),
(351, 3, 'tryout', 'Di tempat anda bekerja, bagian HRD kesulitan ketika\r\nmenyeleksi pegawai baru karena sistem lama yang\r\nmasih manual. Jika Anda seorang praktisi IT, Apa yg\r\nanda lakukan untuk mengatasi hal tersebut...', 'Menyewa konsultan IT dan membangun sistem untuk mempermudah proses seleksi.', 'Mempelajari permasalahannya lalu membuat sistem mandiri', 'Membuat sistem mandiri seadanya sesuai kemampuan', 'Meminta teman anda yang ahli IT untuk membuat sistem mandiri', 'Membeli sistem dari perusahaan lain yang sudah jadi', 'Mempelajari permasalahannya lalu membuat sistem mandiri', 5, 'Karena disini kita dianggap sebagai praktisi / pelaksana sesuai dalam bidang keahlian'),
(352, 3, 'tryout', 'Salah satu anggota tim anda melakukan kesalahan fatal\ndalam tugasnya karna kurangnya pemahaman dia\ntentang teknologi informasi. Sebagai ketua tim apa yang\nanda lakukan....', 'Mengumpulkan semua anggota tim dan membahas serta mencari jalan keluar dr permasalahan tim.', 'Mengundang ahli IT untuk memberikan\npengetahuan kepada tim tentang cara penggunaan\nteknologi informasi.', 'Mengundang ahli IT untuk memberikan\npengetahuan kepada tim tentang pentingnya\nteknologi informasi dan pelatihan cara penggunaan\nteknologi informasi.', 'Mengumpulkan anggota tim dan membahas\npermasalahan anggota tim yang bermasalah tersebut.', 'Mengeluarkannya dari tim', 'Mengumpulkan anggota tim dan membahas\npermasalahan anggota tim yang bermasalah tersebut.', 5, 'yang bermasalah satu orang, jadi\r\nharus didiskusikan bersama tentang\r\nmasalah nya tersebut. Kalau opsi A tidak tepat\r\nsasaran bahasa nya'),
(353, 3, 'tryout', 'Pada saat anda sedang mengerjakan sebuah pekerjaan\npenting tiba-tiba anda menemukan sebuah kejanggalan\npada sistem informasi yang anda gunakan dan bisa\nberakibat bocornya data perusahaan ke publik.\nBagaimana sikap anda...', 'Menyuruh semua rekan kerja untuk menghentikan\npenggunaan sistem itu.', 'Saat itu juga anda menghentikan penggunaan sistem\nitu.', 'Melaporkan kepada atasan apakah harus berhenti\nmenggunakan sistem itu.', 'Menyelesaikan pekerjaan penting tersebut lebih dulu\nkemudian menghentikan penggunaan sistem itu.', 'Menyelesaikan pekerjaan penting tersebut lebih dulu\nkemudian melaporkan ke atasan tentang masalah\npada sistem itu', 'Melaporkan kepada atasan apakah harus berhenti\nmenggunakan sistem itu.', 5, 'Yang mengerjakan saat itu anda, dan\r\nposisinya sebagai bawahan, jadi wajib melaporkan\r\ndulu keatasan untuk langkah selanjutnya'),
(354, 3, 'tryout', 'Anda mempunyai klien yang telah bertahun -\r\ntahun di perusahaan anda, suatu ketika klien tersebut di\r\ntangani oleh rekan kerja anda dan rekan kerja tersebut\r\nmelakukan suatu tindakan yang tidak disenangi oleh\r\nklien tersebut. Bagaimana sikap anda dalam situasi tersebut?', 'Meminta maaf atas nama rekan kerja anda', 'Mengucapkan terimakasih banyak kepada klien tersebut dan menjadikan sebagai tolak ukur kinerja anda', 'Mendengarkan keluhan tersebut  dengan seksama dan akan di tindak lanjuti.', 'Mendengarkan keluhan tersebut dengan seksama dan langsung chatting ke rekan kerja anda yang dimaksudkan.', 'Mendengarkan keluhan tersebut dengan seksama dan akan melaporkan ke atasan/pihak yang bewenang.', 'Meminta maaf atas nama rekan kerja anda', 5, 'Tindakan yang tidak disenangi \'bukan melanggar aturan\'.\r\nhubungannya pribadi, jadi cukup meminta maaf\r\ndan tidak melanjutkan masalah'),
(355, 3, 'tryout', 'Anda adalah seorang karyawan apotek. Seorang pembeli ingin membeli obat-obatan tertentu yang harus menggunakan resep dokter karena bisa membahayakan kesehatan. Dia tidak mempunyai resep itu. Namun pembeli tersebut memaksa ingin membelinya dan dia memberikan sejumlah uang kepada agar mau memberikan obat tersebut. Apa yang Anda lakukan?', 'Saya memberikan obat tersebut kepadanya, toh tak ada yang tahu', 'Saya ragu-ragu keputusan apa yang saya ambil', 'Saya berkonsultasi kepada rekan sejawat dulu', 'Saya menolaknya dengan mantap', 'Saya menerima uang tersebut dan memberikan obatnya', 'Saya menolaknya dengan mantap', 5, 'Jawaban sudah cukup jelas'),
(356, 3, 'tryout', 'Atasan Anda melakukan rekayasa laporan keuangan kantor, maka Anda', 'Dalam hati tidak menyetujui hal tersebut', 'Hal tersebut sering terjadi di kantor manapun', 'Mengingatkan dan melaporkan kepada yang berwenang', 'Tidak ingin terlibat dalam proses rekayasa tersebut', 'Hal semacam itu memang sudah menjadi tradisi yang tidak baik di Indonesia', 'Mengingatkan dan melaporkan kepada yang berwenang', 5, 'Jawaban sudah cukup jelas'),
(357, 3, 'tryout', 'Andi, teman karib Anda, melakukan kecurangan absensi. Maka Anda...', ' Mentoleransi sebab baru kali ini Andi melakukannya', 'Rekan kerja yang lain juga melakukannya, jadi tidaklah mengapa', 'Mengingatkan dan menegur', 'Menegur dan melaporkan apa adanya kepada atasan', 'Menanyakan kepadanya mengapa dia melakukan hal tersebut', 'Menegur dan melaporkan apa adanya kepada atasan', 5, 'Jawaban sudah cukup jelas'),
(358, 3, 'tryout', 'Saya ditugaskan pimpinan untuk menjadi notulen dalam rapat Badan Pertimbangan Jabatan dan Kepangkatan. Respon saya adalah ...', 'Berusaha menghindari rekan yang membujuk untuk mengetahui hasil keputusan rapat', 'Dengan bangga saya akan menceritakan kepada rekan sejawat saya hasil keputusan rapat', 'Memberitahukan anggota keluarga tentang hasil keputusan rapat', 'Memberitahukan sahabat saya di kantor tentang hasil keputusan rapat', 'Tidak akan membocorkan hasil keputusan rapat karena bukan wewenang saya', 'Tidak akan membocorkan hasil keputusan rapat karena bukan wewenang saya', 5, 'Jawaban sudah cukup jelas'),
(359, 3, 'tryout', 'Organisasi sedang mengalami permasalahan internal seputar manajemen keuangan. Pendapat saya terhadap kondisi ini adalah... ', 'Saya akan menjaga kerahasiaan permasalahan yang terjadi dan mencoba advertisement memberikan alternatif solusi kepada pimpinan', 'Seharusnya pimpinan puncak dapat menindak tegas yang terlibat dalam masalah ini', 'Tidak mempersoalkan masalah tersebut karena bukan bagian tugas saya', 'Pastikan bahwa kepala keuangan bertanggung jawab penuh terhadap masalah ini', 'Perlu membeberkan permasalahan kepada seluruh jajaran organisasi', 'Saya akan menjaga kerahasiaan permasalahan yang terjadi dan mencoba advertisement memberikan alternatif solusi kepada pimpinan', 5, 'Jawaban sudah cukup jelas'),
(360, 3, 'tryout', 'Atasan Anda menetapkan target tugas harus selesai pada deadline 27 bulan ini, maka...', 'Saya akan selesaikan tepat pada tanggal 27', 'Kalau tugas lain menumpuk, saya akan minta izin untuk menyelesaikan barang satu atau dua hari sesudah deadline', 'Saya mencoba menyelesaikan tanggal 26 jika memungkinkan', 'Saya meminta tolong rekan lain agar tidak terlambat deadline', 'Saya menegosiasikan deadline yang ditetapkan atasan tersebut dengan baik- baik agar tidak terlalu memberatkan', 'Saya mencoba menyelesaikan tanggal 26 jika memungkinkan', 5, 'Jawaban sudah cukup jelas'),
(361, 3, 'tryout', 'Bulan depan ada kesempatan untuk ikut kompetisi dalam bidang yang saya senangi, maka saya', 'Tidak ikut kompetisi', 'Mempersiapkan diri guna memenangkan persaingan', 'Ikut jika ada kemungkinan saya menang.', 'Tidak ikut saja daripada kalah', 'Saya ikut, karena saya pasti memenangkan persaingan', 'Mempersiapkan diri guna memenangkan persaingan', 5, 'Jawaban sudah cukup jelas'),
(362, 3, 'tryout', 'Ketika gagal mencapai sesuatu yang diinginkan, saya', 'Mencari dengan saksama siapa yang turut bertanggung jawab terhadap kegagalan saya tersebut', 'Mengambil waktu untuk menenangkan diri', 'Bersedih hati', 'Melakukan introspeksi dan memperbaiki kekurangan penyebab kegagalan.', 'Meminta bantuan orang-orang terdekat', 'Melakukan introspeksi dan memperbaiki kekurangan penyebab kegagalan.', 5, 'Jawaban sudah cukup jelas'),
(363, 3, 'tryout', 'Anda adalah seorang karyawan di Perusahaan Perdagangan. Anda memahami bahwa Indonesia memiliki keunggulan \"keunggulan mutlak\" dalam perdagangan internasional untuk beberapa jenis produk. Apa visi Anda terhadap kondisi tersebut?', ' Saya mengusulkan kepada atasan untuk mengoptimalkan perdagangan produk-produk tersebut, karena memiliki keunggulan harga murah dan ketersediaan barang', 'Hal itu mungkin sudah ditangani oleh karyawan lainnya, karena di kantor Kementerian Perdagangan ada banyak rekan lain', 'Saya kurang berani mengusulkan ini itu kepada pimpinan', 'Saya kurang yakin produk Indonesia mampu bersaing di pasar internasional', 'Saya tanyakan terlebih dulu pendapat rekan lain mengenai hal ini.', 'Saya mengusulkan kepada atasan untuk mengoptimalkan perdagangan produk-produk tersebut, karena memiliki keunggulan harga murah dan ketersediaan barang', 5, 'Jawaban sudah cukup jelas'),
(364, 3, 'tryout', 'Bagi saya, untuk menjadi pegawai negeri sipil yang sukses, saya harus melakukan...', 'Mengikuti perintah dan arahan pimpinan secara loyal dan penuh kepatuhan', 'Melakukan pekerjaan yang terbaik dengan standar kinerja yang tinggi', 'Mengembangkan hal-hal baru yang belum pernah diciptakan sebelumnya', ' Menciptakan hubungan baik dengan setiap orang, rekan kerja dan pimpinan', 'Bekerja sesuai dengan ketentuan yang telah ditetapkan oleh pimpinan', 'Melakukan pekerjaan yang terbaik dengan standar kinerja yang tinggi', 5, 'Jawaban sudah cukup jelas'),
(365, 3, 'tryout', 'Setiap hari, saya masuk kantor paling cepat dibandingkan pegawai lainnya. Yang saya lakukan setelah tiba adalah...', 'Masuk ke ruangan dan membaca koran', 'Santai di luar gedung kantor untuk menikmati udara pagi', 'Masuk ke ruangan dan mengobrol dengan rekan sejawat', 'Masuk ke ruangan dan membuat rencana kerja', 'Masuk ke ruangan dan memulai pekerjaan yang tertunda kemarin', 'Masuk ke ruangan dan membuat rencana kerja', 5, 'Jawaban sudah cukup jelas'),
(366, 3, 'tryout', 'Saya diminta untuk lembur kerja sedangkan saya sudah berjanji kepada anak saya untuk mengantarnya ke pesta ulang tahun temannnya. Sikap saya...', 'Pulang dengan diam-diam tanpa sepengetahuan pimpinan', 'Berpura-pura sakit agar dapat diizinkan untuk segera pulang', 'Menghubungi anak saya dengan menjelaskan agar naik taksi saja', 'Bekerja lembur, karena yakin anak saya pasti memaklumi', 'Meminta izin pimpinan mengantar anak saya kemudian kembali ke kantor untuk bekerja lembur', 'Meminta izin pimpinan mengantar anak saya kemudian kembali ke kantor untuk bekerja lembur', 5, 'Jawaban sudah cukup jelas'),
(367, 3, 'tryout', 'Jika saya memiliki bawahan yang kompetensinya rendah, maka...', 'Saya menuntutnya untuk meningkatkan kemampuannya', 'Saya menegaskan bila dia tidak meningkatkan kemampuannya, maka saya tidak segan untuk memberhentikannya', 'Saya akan memberhentikannya dengan segera', 'Saya meminta atasan untuk memindahkannya ke unit lain', 'Saya membimbingnya dan memintanya untuk meningkatkan kemampuannya', 'Saya membimbingnya dan memintanya untuk meningkatkan kemampuannya', 5, 'Jawaban sudah cukup jelas'),
(368, 3, 'tryout', 'Seluruh pekerjaan telah selesai saya kerjakan namun jam kerja hari ini masih tersisa sekitar dua jam lebih.', 'Mumpung masih di kantor dengan fasilitas internet, maka saya pergunakan untuk mengakses situs jaringan sosial facebook', 'Setelah lelah bekerja hari ini, saya rasa tidak ada salahnya saya mengobrol dengan rekan-rekan kerja lain untuk sekadar mengisi waktu', 'Saya lebih suka membaca tabloid infotainment', 'Saya pergunakan chatting dengan kawan lama', 'Saya pergunakan untuk membaca buku-buku pengembangan diri', 'Saya pergunakan untuk membaca buku-buku pengembangan diri', 5, 'Jawaban sudah cukup jelas'),
(369, 3, 'tryout', 'Menurut rekan-rekan saya, saya ini adalah orang yang...', 'Tidak memiliki ketekunan dalam pekerjaan rutin', 'Memiliki ketekunan rendah', 'Terkadang tekun', 'Terkadang mudah jengkel dan kurang tekun mengerjakan sesuatu', 'Cukup tekun', 'Cukup tekun', 5, 'Jawaban sudah cukup jelas'),
(370, 3, 'tryout', 'Orang yang lembur, menurut anda ........', 'Banyak Pekerjaan', 'Suka Menunda Pekerjaan', 'Tidak Punya Kehidupan Luar', 'Pekerja Keras', 'Terlalu Loyal pada Pekerjaan', 'Banyak Pekerjaan', 5, 'Jawaban sudah cukup jelas'),
(371, 3, 'tryout', 'Saya baru saja dimutasikan ke unit lain yang sama sekali baru bagi saya. Sikap saya adalah...', 'Berusaha memahami mekanisme kerja unit melalui arsip dan aturan kebijakan', 'Jarang masuk karena belum jelas apa yang harus dikerjakan', 'Duduk-duduk saja sambil menunggu perintah atasan', 'Berusaha mempelajari dan memahami mekanisme kerja unit melalui rekan sejawat', 'Mengamati proses pekerjaan yang dilakukan rekan sejawat', 'Berusaha mempelajari dan memahami mekanisme kerja unit melalui rekan sejawat', 5, 'Jawaban sudah cukup jelas'),
(372, 3, 'tryout', 'Sikap saya terhadap perubahan-perubahan, ide-ide baru dan cara-cara baru dalam melaksanakan suatu pekerjaan adalah...', 'Stabilitas dalam bekerja lebih penting', 'Perubahan adalah sesuatu yang pasti', 'Perubahan bukan jaminan keberhasilan pekerjaan', 'Dengan adanya perubahan, kondisi kerja pasti lebih baik', 'Keberhasilan pekerjaan tergantung jenis perubahan, ide, dan cara-cara baru tersebut.', 'Keberhasilan pekerjaan tergantung jenis perubahan, ide, dan cara-cara baru tersebut.', 5, 'Jawaban sudah cukup jelas'),
(373, 3, 'tryout', 'Terjadi pergantian pimpinan di unit kerja saya. Sikap saya adalah...', 'Tidak peduli', 'Berusaha mengenal dan memahami visi dan misi pimpinan baru', 'Tidak berusaha mendekati pimpinan baru karena takut dicap penjilat', 'Berusaha mengenal pribadi pimpinan baru', 'Pergantian pimpinan itu sesuatu yang biasa', 'Berusaha mengenal pribadi pimpinan baru', 5, 'Jawaban sudah cukup jelas'),
(374, 3, 'tryout', 'Saya diutus mengikuti suatu diklat. Oleh panitia penyelenggara saya ditempatkan sekamar dengan orang yang tidak saya kenal yang berasal dari kota lain. Sikap saya adalah...', 'Mengajukan keberatan tetapi akhirnya menerima aturan panitia', 'Protes keras dan minta ditempatkan sendiri saja', 'Mengajukan keberatan dan minta ditempatkan dengan minimal orang yang dikenal', 'Menerima aturan panitia dan berusaha mengenal dan memahami teman sekamar', 'Menerima aturan panitia', 'Menerima aturan panitia dan berusaha mengenal dan memahami teman sekamar', 5, 'Jawaban sudah cukup jelas'),
(375, 3, 'tryout', 'Jika saya sedang marah kepada orang lain,', 'Saya susah memberitahukannya', 'Saya marah dengan diam mengacuhkannya', 'Saya memberitahukan kesalahannya', 'Saya tampar wajahnya', 'Kalau memang keterlaluan baru saya tampar wajahnya', 'Saya memberitahukan kesalahannya', 5, 'Jawaban sudah cukup jelas'),
(376, 3, 'tryout', 'Dibandingkan dengan rekan-rekan kerja saya yang lain, gaya kemarahan saya adalah', 'Saya sering marah seperti lazimnya rekan lain', 'Kemarahan saya lebih dahsyat dari rekan lain', 'Saya tidak pernah marah', 'Saya marah jika memang diperlukan untuk perbaikan kondisi agar lebih baik', 'Saya cenderung lebih pemarah dari rekan lain', 'Saya marah jika memang diperlukan untuk perbaikan kondisi agar lebih baik', 5, 'Jawaban sudah cukup jelas'),
(377, 3, 'tryout', 'Apa pendapat Anda tentang marah ?', 'Marah itu buruk', 'Marah itu buruk sekali', 'Marah itu tidak baik', 'Marah itu bisa baik bisa buruk', 'Marah itu tidak diperlukan', 'Marah itu bisa baik bisa buruk', 5, 'Jawaban sudah cukup jelas'),
(378, 3, 'tryout', 'Pendapat saya tentang kesabaran,', 'Sabar itu memang mudah diucapkan namun sulit dilakukan', 'Bersabar adalah hal paling sulit dalam hidup saya', 'Bersabar adalah hal paling mudah dalam hidup saya', 'Sabar itu ada batasnya', 'Mustahil ada orang yang selalu bisa bersabar terhadap semua kasus kehidupan', 'Bersabar adalah hal paling sulit dalam hidup saya', 5, 'Jawaban sudah cukup jelas'),
(379, 3, 'tryout', 'Anda dipindahkan di bidang lain di kantor anda, maka anda akan .......', 'Merasa Takut', 'Merasa Tidak Pantas', 'Segera mempelajari SOP-nya', 'Menolaknya', 'Biasa Saja', 'Segera mempelajari SOP-nya', 5, 'Jawaban sudah cukup jelas'),
(380, 3, 'tryout', 'Menghadapi masalah yang pelik, saya...', 'Merasa pesimis mampu mengatasinya', 'Harus ada yang membantu saya menghadapinya', 'Akan berusaha sekuat mungkin memecahkannya', 'Tidak adil bila saya harus menyelesaikannya sendiri', 'Bertanya-tanya mungkinkah saya mampu mengatasinya', 'Akan berusaha sekuat mungkin memecahkannya', 5, 'Jawaban sudah cukup jelas');
INSERT INTO `tb_soal` (`id_soal`, `id_kategori`, `tipe_soal`, `soal`, `j1`, `j2`, `j3`, `j4`, `j5`, `kunci`, `skor`, `pembahasan`) VALUES
(381, 3, 'tryout', 'Saya ditugaskan di front office untuk melayani tamu pimpinan. Pada saat pimpinan saya tidak berada di tempat dan ada tamu pimpinan yang memerlukan keputusan segera, sedangkan atasan tidak dapat dihubungi, maka sikap saya adalah...', 'Mengambil keputusan meskipun tanpa petunjuk atasan selama tidak bertentangan dengan kebijakan umum pimpinan', 'Tidak berani mengambil keputusan tanpa petunjuk atasan saya', 'Ragu-ragu dalam mengambil keputusan tanpa petunjuk atasan saya', 'Menunda-nunda pengambilan keputusan tanpa petunjuk atasan saya', 'Mengambil keputusan tanpa petunjuk atasan karena keadaan sangat mendesak', 'Mengambil keputusan meskipun tanpa petunjuk atasan selama tidak bertentangan dengan kebijakan umum pimpinan', 5, 'Jawaban sudah cukup jelas'),
(382, 3, 'tryout', 'Dalam melaksanakan suatu tugas yang dipercayakan kepada saya, saya...', 'Menyadari bahwa keputusan pimpinan diperlukan jika keputusan tersebut di luar wewenang saya', 'Berani mengambil keputusan karena tugas tersebut telah dipercayakan kepada saya', 'Selalu menunggu keputusan pimpinan', 'Tidak berani mengambil keputusan sendiri', 'Selalu mencari alternatif lain agar tidak mengambil keputusan sendiri', 'Berani mengambil keputusan karena tugas tersebut telah dipercayakan kepada saya', 5, 'Jawaban sudah cukup jelas'),
(383, 3, 'tryout', 'Jika suatu rencana kerja terlihat rumit, maka...', 'Saya tidak mau repot-repot mencobanya', 'Saya khawatir jika mencobanya dan gagal', 'Saya berani mencoba setelah mempertimbangkan risikonya', 'Saya minta pendapat istri', 'Yang penting saya coba dulu', 'Saya berani mencoba setelah mempertimbangkan risikonya', 5, 'Jawaban sudah cukup jelas'),
(384, 3, 'tryout', 'Saya ditugaskan menggantikan rekan yang sedang sakit di ruang administrasi. Ada beberapa pelanggan melakukan komplain dan meminta ganti rugi. Sedangkan atasan saya juga tidak sedang berada di tempat maka saya .....', 'Mengambil keputusan dengan menunggu petunjuk atasan', 'Tidak berani mengambil keputusan tanpa petunjuk atasan saya', 'Ragu - ragu dalam mengambil keputusan tanpa petunjuk atasan saya', 'Menunda-nunda pengambilan keputusan tanpa petunjuk atasan saya', 'Mengambil keputusan tanpa petunjuk atasan karena keadaan mendesak', 'Mengambil keputusan dengan menunggu petunjuk atasan', 5, 'Jawaban sudah cukup jelas\r\n\r\n- Poin 5 : a\r\n- Poin 4 : e\r\n- Poin 3 : c\r\n- Poin 2 : d\r\n- Poin 1 : b'),
(385, 3, 'tryout', 'Hasil dari rapat dengan atas kemarin adalah bahwa mulai hari ini saya akan dipindahkan ke devisi lain, dan di devisi tersebut saya sama sekali tidak mengenal karyawan-karyawan yang lain. Maka sikap saya adalah....', 'Menerima dengan perasaan kecewa dan bekerja dengan malas-malasan agar dipindahkan ke devisi yang lain saja', 'Menerima pemindahan, tetapi langsung mengajukan pindah bagian', 'Langsung mengerjakan tugas yang diberikan pada saya di devisi tersebut tanpa memedulikan apa-apa', 'Menolak pemindahan ke devisi tersebut', 'Berusaha secepatnya mengenal rekan kerja yang lain agar tercipta suasana kerja yang nyaman', 'Berusaha secepatnya mengenal rekan kerja yang lain agar tercipta suasana kerja yang nyaman', 5, 'Materi dalam soal ini membahas tentang aspek kemampuan beradaptasi. Ini menunjukkan bahwa anda memiliki kemampuan yang baik dalam menyesuaikan diri.'),
(386, 3, 'tryout', 'Dalam dunia kerja, Anda akan bertemu dengan orang-orang dari latar belakang yang berbeda. Terkadang ada orang yang cuek dan acuh tak acuh, ada juga yang sangat aktif mengkritik dan menyuarakan pendapatnya terhadap anda, sikap anda...', 'Bersifat terbuka terhadap kritik atau masukan', 'Menjadikan kritikan sebagai masukan yang membangun agar anda bisa menjadi pribadi yang lebih baik lagi', 'Saya jadikan kritikan sebagai bahan evaluasi diri', 'Berusaha menerima setiap kritikan yang dilontarkan untuk anda', 'Memahami karakter setiap orang yang anda temui', 'Bersifat terbuka terhadap kritik atau masukan', 5, 'Indikator kesadaran diri, dan bersikap dewasa dalam menghadapi permasalahan agar tujuan tercapai, kita harus bersifat terbuka dan tidak mudah tersulut emosi jika ada orang lain yang mengkritik kita, terkadang kritikan bisa menjadikan anda menjadi orang lebih baik dan evaluasi diri'),
(387, 3, 'tryout', 'Siang ini anda menerima panggilan untuk proses rekrutmen pada sebuah perusahaan. Ketika anda berangkat untuk mengikuti rekrutmen tersebut di tengah perjalanan anda melihat kerumunan orang di pinggir jalan dan ternyata telah terjadi kecelakaan dengan korban tabrak lari, sedangkan anda harus sesegera mungkin sampai di perusahaan untuk memulai seleksi, maka sikap anda....', 'Tetap melanjutkan perjalanan untuk tepat waktu mengikuti tes pekerjaan', 'Mengabaikannya karena harus mengikuti tes yang akan dimulai sebentar lagi', 'Tetap melanjutkan perjalanan setelah yakin ada orang lain yang menolong', 'Menolongnya, kemudian membawanya ke rumah sakit atau kantor polisi', 'Mengejar pelaku tabrak lari dan memintanya untuk bertanggung jawab atas perbuatannya', 'Tetap melanjutkan perjalanan untuk tepat waktu mengikuti tes pekerjaan', 5, 'Anda akan mengikuti tes kerja ada kecelakaan, Indikator kedisiplin, sedangkan anda sudah diharapkan kedatangannya tepat waktu untuk mengikuti proses seleksi maka langkah yang paling tepat adalah A, tetap melanjutkan perjalanan, kata kunci telah terjadi pada saat anda sampai dan disana ada banyak orang lain yang bisa membantu'),
(388, 3, 'tryout', 'Anda bekerja sebagai tenaga administrasi di salah satu instansi pemerintah. Hampir setiap harinya anda dihadapkan dengan pekerjaan-pekerjaan yang cukup padat. Bagaimana anda menyelesaikan pekerjaan anda.....', 'Menyelesaikan dengan mandiri', 'Saya akan membantu rekan kerja yang butuh bantuan meskipun pekerjaan saya cukup banyak ', 'Saya berusaha menyelesaikannya sendiri sembari meminta bantuan rekan kerja lain', 'Meminta bantuan dan secara bersama-sama menyelesaikannya meski kadang diselesaikannya secara personal', 'Meminta bantuan rekan kerja jika diperlukan', 'Saya berusaha menyelesaikannya sendiri sembari meminta bantuan rekan kerja lain', 5, 'Tujuan dari soal ini adalah untuk mengetahui bagaimana upaya anda untuk bertanggung jawab menyelesaikan pekerjaan pribadi anda. Menyelesaikan pekerjaan secara mandiri adalah pilihan yang baik, namun bekerja dengan memanfaatkan jejaring kerja akan lebih baik jika diperlukan'),
(389, 3, 'tryout', 'Hampir semua pegawai di kantor instansi saya meminta uang tanda terima kasih atas pengurusan surat izin tertentu. Namun menurut peraturan kantor, hal itu tidaklah diperbolehkan, maka saya...', 'Ikut melakukannya karena bagaimanapun juga kawan-kawan kantor juga melakukannya', 'Melakukannya hanya Jika terpaksa membutuhkan uang tambahan untuk keperluan keluarga, sebab gaji kantor memang kecil', 'Terkadang saja melakukan hal tersebut', 'Berusaha semampunya untuk tidak melakukannya', 'Tidak ingin melakukannya sama sekali', 'Tidak ingin melakukannya sama sekali', 5, 'Jawaban sudah cukup jelas'),
(393, 1, 'latihan', 'Perbuatan berikut yang mencerminkan pengamalan sila kedua pancasila adalah ...', 'Menciptakan senjata nuklir', 'Mengembangkan ilmu pengetahuan untuk kesejahteraan manusia', 'Melakukan perundingan dengan Negara lain mengenai batas Negara agar tidak terjadi konflik', 'Menjadi inisiator penggalangan dana sebagai modal usaha untuk tetangga yang kurang mampu', 'Ikut berpartisipasi dalam kegiatan gotong royong yang dilakukan di lingkungan RT', 'Menjadi inisiator penggalangan dana sebagai modal usaha untuk tetangga yang kurang mampu', 5, 'Menjadi inisiator penggalangan dana sebagai modal usaha untuk tetangga yang kurang mampu (Kemanusiaan)'),
(394, 1, 'latihan', 'Salah satu unsur dasar Wawasan Nusantara adalah wadah yang merupakan batas ruang lingkup wilayah nusantara, ditentukan oleh lautan yang di dalamnya terdapat gugusan ribuan pulau yang saling dihubungkan oleh perairan (Kepulauan). Konsepsi berpikir atau paradigma Wawasan Nusantara ini dilandasi oleh pemikiran bahwa. . .', 'Pulau pulau dipisahkan oleh laut dan selat', 'Laut yang ditebari oleh pulau pulau', 'Laut dan selat merupakan satu kesatuan', 'Rangkaian pulau pulau dalam laut', 'Pulau adalah aset berharga negara', 'Laut yang ditebari oleh pulau pulau', 5, 'Laut yang ditebari oleh pulau pulau karena yang dominan lautan bukan daratan atau laut,\r\ndan bukan juga selat yang merupakan satu kesatuan.'),
(398, 1, 'latihan', 'Daerah otonom adalah...', 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri', 'Kesatuan daerah yang mempunyai perangkat dan pemerintahan sendiri, mengurus kepentingan masyarakat di daerah menurut prakarsa sendiri.', 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri berdasarkan aspirasi masyarakat dalam sistem NKRI.', 'Hak wewenang, dan kewajiban untuk mengatur dan mengurus sendiri urusan pemerintah dan kepentingan masyarakat setempat sesuai dengan peraturan perundang undangan.', 'Semua jawaban benar', 'Kesatuan masyarakat hukum yang mempunyai batas wilayah tertentu berwenang mengatur dan mengurus kepentingan masyarakat setempat menurut prakarsa sendiri berdasarkan aspirasi masyarakat dalam sistem NKRI.', 5, 'Jawaban sudah cukup jelas'),
(400, 1, 'latihan', 'Hubungan atau kaitan antar dasar Negara dengan konstitusi adalah….', 'Dasar negara adalah pedoman penyelenggaraan pemerintahan yang dijabarkan lebih lanjut dalam konstitusi.', 'Nilai-nilai yang ada dalam konstitusi lebih lanjut dioperasionalkan dalam dasar Negara', 'Konstitusi adalah bagian dari dasar Negara', 'Dasar negara tidak bisa dirubah sedangkan konstitusi boleh dirubah', 'Dasar negara berisi prinsip-prinsip hidup bernegara yang dijabarkan melalui konstitusi ke dalam berbagai aturan hukum.', 'Dasar negara berisi prinsip-prinsip hidup bernegara yang dijabarkan melalui konstitusi ke dalam berbagai aturan hukum.', 5, 'Hubungan atau kaitan antara dasar negara dengan konstitusi antara lain:\r\n1) Dasar negara merupakan sumber segala sumber hukum (sumber tertib hukum) yang\r\nberisi prinsip-prinsip bernegara yang dijabarkan ke dalam suatu konstitusi suatu negara.\r\n2) Dasar negara merupakan suasana kebatinan (Geistlichenhintergrund) dari konstitusi.\r\n3) Dasar negara sebagai cita-cita hukum diwujudkan dalam hukum dasar negara\r\n(konstitusi).\r\n'),
(408, 1, 'latihan', 'Jika presiden dan wakil presiden mangkat, berhenti, diberhentikan atau tidak dapat melaksanakan kewajibannya dalam masa jabatan secara bersamaan, maka pelaksanaan tugas kepresidenan adalah ……', 'Ketua MPR, Ketua DPR', 'Ketua MPR, Ketua DPR dan para Menteri', 'MA dan Menteri Dalam Negeri', 'MA, Jaksa Agung dan para Menteri', 'Menteri Dalam Negeri, Menteri Luar Negeri dan Menteri Pertahanan', 'Menteri Dalam Negeri, Menteri Luar Negeri dan Menteri Pertahanan', 5, 'Jawaban sudah cukup jelas'),
(409, 1, 'latihan', 'Pasal 29 UUD 1945 ayat (2) menyatakan negara menjamin kemerdekaan tiap-tiap penduduk untuk memeluk agamanya masing-masing dan beribadat menurut agama dan kepercayaannya itu. Oleh karena itu, kebebasan beragama diartikan sebagai ....', 'Kebebasan yang bersumber pada martabat manusia sebagai makhluk ciptaan Tuhan', 'Kebebasan untuk menentukan dan memilih agama yang dianut serta berpindah-pindah', 'Kebebasan dalam menjalankan ibadah kapan saja dan dimana saja', 'Kebebasan melakukan penyembahan dan membentuk aliran baru keagamaan', 'Kebebasan untuk memeluk atau tidak memeluk salah satu agama resmi', 'Kebebasan dalam menjalankan ibadah kapan saja dan dimana saja', 5, 'Jawaban sudah cukup jelas'),
(415, 1, 'latihan', 'Presiden ialah penyelenggara pemerintah negara yang tertinggi, sehingga menjalankan roda pemerintahan dengan cara consentration of power and responsibility upon the President. Apa yang dimaksud dengan istilah di atas...', 'Pemusatan kekuasaan dan tanggung jawab oleh Presiden', 'Kekuasaan Presiden tidak terbatas', 'Presiden memiliki kekuasaan dan tanggung jawab yang lebih tinggi dari lembaga  tinggi Negara lainnya', 'Dalam menjalankan pemerintahan negara kekuasaan dan tanggung jawab adalah di tangan Presiden', 'Semua Benar', 'Dalam menjalankan pemerintahan negara kekuasaan dan tanggung jawab adalah di tangan Presiden', 5, 'Jawaban sudah cukup jelas'),
(420, 2, 'latihan', 'Kayu : …. = Beras : Nasi Goreng', 'Pasak', 'Kursi Tamu', 'Gelondongan', 'Papan', 'Tripleks', 'Kursi Tamu', 5, 'Beras jika dimasak bisa menjadi nasi goreng. Kayu jika diolah bisa menjadi kursi tamu.'),
(424, 2, 'latihan', '4.036 : 0.04 = …….', '1009', '0.42291666666667', '10.9', '100.9', '109', '100.9', 5, '4.036 : 0.04 = 4036 : 40 = 100.9'),
(425, 2, 'latihan', '8, 12, 10, 15, 12, 18, …..', '12', '14', '15', '16', '17', '14', 5, 'Seri tersebut mengikuti pola:\r\nn1 + 4 = n2 ; 8 + 4 = 12\r\nn2 – 2 = n3 ; 12-2 =10\r\nn3 + 5 = n4 ; 10+ 5= 15\r\nn4 – 3 = n5 ; 15-3=12\r\nn5 + 6 = n6 ; 12 + 6 =18\r\nn6 – 4 = n7 ; 18 -4 =14\r\n'),
(431, 2, 'latihan', 'G, H, I, M, N, J, K, L, M, N, …, ...', 'M, N', 'N, M', 'O, P', 'P, O', 'P, Q', 'A. M, N', 5, 'Urutan abjad GHI JKL MNO dst . . .\r\nDiselingi MN'),
(436, 2, 'latihan', 'Tembakau : Rokok : Kanker = ', 'Kambing : Gulai : Darah Tinggi', 'Kelapa : Minyak : Goreng', 'Benang : Pintal : Pakaian', 'Rambut : Shampo ', 'Rumah', ' Kambing : Gulai : Darah Tinggi', 5, 'Jawaban sudah cukup jelas'),
(437, 2, 'latihan', 'Sinonim : Tangkal = ….', 'Cegah', 'Tak mempan', 'Lelang', 'Rangkul', 'Mempan', 'Cegah', 5, 'Menolak (bala, roh halus, penyakit, dsb); mencegah bencana dsb'),
(439, 2, 'latihan', 'Berat rata-rata sekelompok siswa adalah 54 kg. Berat rata-rata siswa putri dari kelompok tersebut 48 kg sedangkan berat rata-rata siswa putranya 62 kg. Berapakah perbandingan jumlah siswa putra dan putri pada kelompok tersebut?', ' 7 : 4', '4 : 3', '2 : 3', '3 : 4', '4 : 7', ' 3 : 4', 5, 'Putri = X\r\nPutra = Y\r\n48x + 62 y = 54(× + y)\r\n48× + 62y = 54x + 54y\r\n-6× = -8y\r\nY/× = 6/8\r\nY/X = 3 : 4'),
(443, 2, 'latihan', 'Militan =', 'Anti Penindasan', 'Ideologi', 'Agresif', 'Brutal', 'Penggolongan', 'Agresif', 5, 'Jawaban sudah cukup jelas'),
(448, 2, 'latihan', 'Semua mahasiswa diminta mempersiapkan diri untuk ujian. Sebagian mahasiswa mendapat nilai baik dalam ujian.', 'Sebagian mahasiswa yang tidak mempersiapkan diri dan tidak mendapat nilai baik, tidak lulus ujian.', 'Semua mahasiswa mempersiapkan diri dan mendapat nilai baik.', 'Semua mahasiswa mempersiapkan diri.', 'Sebagian mahasiswa sudah diminta mempersiapkan diri dan mendapat nilai', 'Sebagian mahasiswa tidak mempersiapkan diri tapi mendapat nilai baik', ' Sebagian mahasiswa yang tidak mempersiapkan diri dan tidak mendapat nilai baik, tidak lulus ujian.', 5, 'Jawaban sudah cukup jelas'),
(456, 3, 'latihan', 'Dalam dunia kerja, Anda akan bertemu dengan orang-orang dari latar belakang yang berbeda. Terkadang ada orang yang cuek dan acuh tak acuh, ada juga yang sangat aktif mengkritik dan menyuarakan pendapatnya terhadap anda, sikap anda...', 'Bersifat terbuka terhadap kritik atau masukan', 'Menjadikan kritikan sebagai masukan yang membangun agar anda bisa menjadi pribadi yang lebih baik lagi', 'Saya jadikan kritikan sebagai bahan evaluasi diri', 'Berusaha menerima setiap kritikan yang dilontarkan untuk anda', 'Memahami karakter setiap orang yang anda temui', 'Bersifat terbuka terhadap kritik atau masukan', 5, 'Indikator kesadaran diri, dan bersikap dewasa dalam menghadapi permasalahan agar tujuan tercapai, kita harus bersifat terbuka dan tidak mudah tersulut emosi jika ada orang lain yang mengkritik kita, terkadang kritikan bisa menjadikan anda menjadi orang lebih baik dan evaluasi diri'),
(457, 3, 'latihan', 'Siang ini anda menerima panggilan untuk proses rekrutmen pada sebuah perusahaan. Ketika anda berangkat untuk mengikuti rekrutmen tersebut di tengah perjalanan anda melihat kerumunan orang di pinggir jalan dan ternyata telah terjadi kecelakaan dengan korban tabrak lari, sedangkan anda harus sesegera mungkin sampai di perusahaan untuk memulai seleksi, maka sikap anda....', 'Tetap melanjutkan perjalanan untuk tepat waktu mengikuti tes pekerjaan', 'Mengabaikannya karena harus mengikuti tes yang akan dimulai sebentar lagi', 'Tetap melanjutkan perjalanan setelah yakin ada orang lain yang menolong', 'Menolongnya, kemudian membawanya ke rumah sakit atau kantor polisi', 'Mengejar pelaku tabrak lari dan memintanya untuk bertanggung jawab atas perbuatannya', 'Tetap melanjutkan perjalanan untuk tepat waktu mengikuti tes pekerjaan', 5, 'Anda akan mengikuti tes kerja ada kecelakaan, Indikator kedisiplin, sedangkan anda sudah diharapkan kedatangannya tepat waktu untuk mengikuti proses seleksi maka langkah yang paling tepat adalah A, tetap melanjutkan perjalanan, kata kunci telah terjadi pada saat anda sampai dan disana ada banyak orang lain yang bisa membantu'),
(458, 3, 'latihan', 'Anda bekerja sebagai tenaga administrasi di salah satu instansi pemerintah. Hampir setiap harinya anda dihadapkan dengan pekerjaan-pekerjaan yang cukup padat. Bagaimana anda menyelesaikan pekerjaan anda.....', 'Menyelesaikan dengan mandiri', 'Saya akan membantu rekan kerja yang butuh bantuan meskipun pekerjaan saya cukup banyak ', 'Saya berusaha menyelesaikannya sendiri sembari meminta bantuan rekan kerja lain', 'Meminta bantuan dan secara bersama-sama menyelesaikannya meski kadang diselesaikannya secara personal', 'Meminta bantuan rekan kerja jika diperlukan', 'Saya berusaha menyelesaikannya sendiri sembari meminta bantuan rekan kerja lain', 5, 'Tujuan dari soal ini adalah untuk mengetahui bagaimana upaya anda untuk bertanggung jawab menyelesaikan pekerjaan pribadi anda. Menyelesaikan pekerjaan secara mandiri adalah pilihan yang baik, namun bekerja dengan memanfaatkan jejaring kerja akan lebih baik jika diperlukan'),
(491, 3, 'latihan', 'Anda sedang mengendarai motor dengan agak\nterburu-buru karena khawatir terlambat sampai\ndikantor. Ditengah perjalanan, dari jauh terlihat ada\nsepasang laki- laki dan perempuan berpakaian serba\nputih-hitam menghentikan setiap keendaraan yang\nmelintas dihadapannya dengan panik, namun\nsepertinya tidak mendapat respon yang baik. Motor\nAnda pun di stop, laki-laki itu meminta bantuan Anda\nuntuk mengantarkan istrinya yang akan\nmekaksanakan ujian CAT CPNS dalam waktu kurang\nlebih 30 menit lagi, karena motor yang mereka\ntumpangi mengalami bocor ban dan sedang ditangani\noleh bengkel. Rupanya tempat yang dituju kebetulan\nsatu arah, namun bukanlah jalur tercepat yang biasa\nAnda lewati untuk sampai dikantor. Yang akan Anda\nlakukan adalah...', 'Menyarankan kepada laki-laki itu agar sebaiknya\nistrinya naik ojeg saja dan mengatakan bahwa saya\nsedang terburu-buru.', 'Menolaknya dengan tegas karena saya tidak ingin\nterlambat', 'Mengantarkan istrinya dengan syarat harus\nmembayar ongkos', 'Mengantarkan hanya setengah jalan karena saya\nharus melintasi jalur yang berbeda untuk cepat\nsampai dikantor.', 'Mengantarkan istrinya sampai ketempat yang dituju meskipun dengan konsekuensi pasti saya\nakan terlambat sampai dikantor.', 'Mengantarkan hanya setengah jalan karena saya\nharus melintasi jalur yang berbeda untuk cepat\nsampai dikantor.', 5, 'Agak lebih realistis dan masih ada\r\nkepedulian'),
(492, 3, 'latihan', 'Anda ditugasi atasan anda berdinas keluar\r\npulau.Anda berencana pergi dengan menggunakan\r\ntransportasi udara. Setelah lama menunggu,\r\nakhirnya pesawat yang rencananya akan anda naiki\r\ntelah datang. Namun di sisi lain anda melihat\r\nseorang nenek yang sedang kebingungan. Sikap\r\nanda .......', 'Membantu nenek tersebut menyelesaikan masalahnya', 'Pergi meninggalkan nenek tersebut karena anda harus segera naik pesawat', 'Merasa kasihan terhadap nenek tersebut tapi apalah daya anda tidak dapat membantu nenek tersebut', 'Merasa iba dan dengan sangat berhati-hati membantu nenek tersebut', 'Membantu nenekt ersebut menyelesaikan masalahnya', 'Pergi meninggalkan nenek tersebut karena anda harus segera naik pesawat', 5, 'Karena pemberangkatan dipesawat tidak bisa lambat, yang memungkin memberitahukan\r\nsatpam yang berkeliaran di bandara yang biasanya banyak.'),
(496, 3, 'latihan', 'Di tempat anda bekerja, bagian HRD kesulitan ketika\r\nmenyeleksi pegawai baru karena sistem lama yang\r\nmasih manual. Jika Anda seorang praktisi IT, Apa yg\r\nanda lakukan untuk mengatasi hal tersebut...', 'Menyewa konsultan IT dan membangun sistem untuk mempermudah proses seleksi.', 'Mempelajari permasalahannya lalu membuat sistem mandiri', 'Membuat sistem mandiri seadanya sesuai kemampuan', 'Meminta teman anda yang ahli IT untik membuat sistem mandiri', 'Membeli sistem dari perusahaan lain yang sudah jadi', 'Mempelajari permasalahannya lalu membuat sistem mandiri', 5, 'Karena disini kita dianggap sebagai praktisi / pelaksana sesuai dalam bidang keahlian'),
(497, 3, 'latihan', 'Salah satu anggota tim anda melakukan kesalahan fatal\r\ndalam tugasnya karna kurangnya pemahaman dia\r\ntentang teknologi informasi. Sebagai ketua tim apa yang\r\nanda lakukan....', 'Mengumpulkan semua anggota tim dan membahas serta mencari jalan keluar dr permasalahan tim.', 'Mengundang ahli IT untuk memberikanpengetahuan kepada tim tentang cara penggunaanteknologi informasi.', 'Mengundang ahli IT untuk memberikanpengetahuan kepada tim tentang pentingnyateknologi informasi dan pelatihan cara penggunaanteknologi informasi.', 'Mengumpulkan anggota tim dan membahaspermasalahan anggota tim yang bermasalah tersebut.', 'Mengeluarkannya dari tim', 'Mengumpulkan anggota tim dan membahaspermasalahan anggota tim yang bermasalah tersebut.', 5, 'Yang bermasalah satu orang, jadi\r\nharus didiskusikan bersama tentang\r\nmasalah nya tersebut. Kalau opsi A tidak tepat\r\nsasaran bahasa nya'),
(498, 3, 'latihan', 'Pada saat anda sedang mengerjakan sebuah pekerjaan\npenting tiba-tiba anda menemukan sebuah kejanggalan\npada sistem informasi yang anda gunakan dan bisa\nberakibat bocornya data perusahaan ke publik.\nBagaimana sikap anda...', 'Menyuruh semua rekan kerja untuk menghentikan\npenggunaan sistem itu.', 'Saat itu juga anda menghentikan penggunaan sistem\nitu.', 'Melaporkan kepada atasan apakah harus berhenti\nmenggunakan sistem itu.', 'Menyelesaikan pekerjaan penting tersebut lebih dulu\nkemudian menghentikan penggunaan sistem itu.', 'Menyelesaikan pekerjaan penting tersebut lebih dulu\nkemudian melaporkan ke atasan tentang masalah\npada sistem itu', 'Melaporkan kepada atasan apakah harus berhenti\nmenggunakan sistem itu.', 5, 'Yang mengerjakan saat itu anda, dan\r\nposisinya sebagai bawahan, jadi wajib melaporkan\r\ndulu keatasan untuk langkah selanjutnya'),
(499, 3, 'latihan', 'Anda mempunyai klien yang telah bertahun - tahun di perusahaan anda, suatu ketika klien tersebut di\r\ntangani oleh rekan kerja anda dan rekan kerja tersebut melakukan suatu tindakan yang tidak disenangi oleh\r\nklien tersebut. Bagaimana sikap anda dalam situasi tersebut?', 'Meminta maaf atas nama rekan kerja anda', 'Mengucapkan terimakasih banyak kepada klien tersebut dan menjadikan sebagai tolak ukur kinerja anda', 'Mendengarkan keluhan tersebut  dengan seksama dan akan ditindaklanjuti.', 'Mendengarkan keluhan tersebut dengan seksama dan langsung chatting ke rekan kerja anda yang dimaksudkan.', 'Mendengarkan keluhan tersebut dengan seksama dan akan melaporkan ke atasan/pihak yang bewenang.', 'Meminta maaf atas nama rekan kerja anda', 5, 'Tindakan yang tidak disenangi \'bukan melanggar aturan\'.\r\nhubungannya pribadi, jadi cukup meminta maaf\r\ndan tidak melanjutkan masalah'),
(500, 2, 'tryout', 'GUDANG : BARANG = ...... : .......', 'Lama : Baru', 'Buku : Perpustakaan', 'Tertutup : Terbuka', 'Bank : Deposit', 'Bangunan : Antik', 'Bank : Deposit', 5, 'Jawaban yang paling tepat adalah D. Simpanan yang ada di GUDANG adalah BARANG, demikian juga simpanan yang ada di BANK adalah DEPOSIT.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_verifikasi_email`
--

CREATE TABLE `tb_verifikasi_email` (
  `email` varchar(100) NOT NULL,
  `kode_otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_verifikasi_email`
--

INSERT INTO `tb_verifikasi_email` (`email`, `kode_otp`) VALUES
('jono@example.com', 690325),
('namasayaaninda@gmail.com', 281149),
('namasayaaninda@gmail.com', 356880),
('anindaacyntia@gmail.com', 465135);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_informasi`
--
ALTER TABLE `tb_informasi`
  ADD PRIMARY KEY (`id_informasi`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_lembar_soal`
--
ALTER TABLE `tb_lembar_soal`
  ADD PRIMARY KEY (`id_lembar_soal`);

--
-- Indexes for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `tb_peserta`
--
ALTER TABLE `tb_peserta`
  ADD PRIMARY KEY (`kode_peserta`);

--
-- Indexes for table `tb_premium`
--
ALTER TABLE `tb_premium`
  ADD PRIMARY KEY (`id_premium`);

--
-- Indexes for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_informasi`
--
ALTER TABLE `tb_informasi`
  MODIFY `id_informasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_lembar_soal`
--
ALTER TABLE `tb_lembar_soal`
  MODIFY `id_lembar_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1211;

--
-- AUTO_INCREMENT for table `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `tb_peserta`
--
ALTER TABLE `tb_peserta`
  MODIFY `kode_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_premium`
--
ALTER TABLE `tb_premium`
  MODIFY `id_premium` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
