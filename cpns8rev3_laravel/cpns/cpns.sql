-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Jun 2021 pada 08.03
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Struktur dari tabel `tb_admin`
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
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_admin`, `no_telp`, `jenis_kelamin`, `username`, `password`) VALUES
(1, 'Administrator', '08000000000', 'Laki-laki', 'admin', 'qwerty');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_informasi`
--

CREATE TABLE `tb_informasi` (
  `id_informasi` int(11) NOT NULL,
  `judul` varchar(32) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(225) NOT NULL,
  `tgl_upload` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(32) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`, `role`) VALUES
(1, 'TKP', 'Materi'),
(3, 'TIU', 'Materi'),
(4, 'TWK', 'Materi'),
(5, 'Aritmatika', 'Soal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_lembar_soal`
--

CREATE TABLE `tb_lembar_soal` (
  `id_lembar_soal` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `nilai` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_materi`
--

INSERT INTO `tb_materi` (`id_materi`, `id_kategori`, `judul`, `file`) VALUES
(17, 3, 'Aritmatika Sosial', 'Aritmatika Sosial.docx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peserta`
--

CREATE TABLE `tb_peserta` (
  `kode_peserta` int(11) NOT NULL,
  `nama_peserta` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tempat_lahir` varchar(32) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_hp` char(13) NOT NULL,
  `alamat` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_peserta`
--

INSERT INTO `tb_peserta` (`kode_peserta`, `nama_peserta`, `email`, `username`, `password`, `tempat_lahir`, `tgl_lahir`, `no_hp`, `alamat`) VALUES
(1, 'Hanif Mukkorrobin', 'hanifmukkorrobin@gmail.com', 'hanif', 'hanif123', 'Banjarnegara', '2002-12-10', '085640988663', 'Desa Karangsalam, Rt02 Rw 02, Kecamatan Susukan, Kabupaten Banjarnegara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
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
-- Dumping data untuk tabel `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `id_kategori`, `soal`, `j1`, `j2`, `j3`, `j4`, `j5`, `kunci`, `skor`, `pembahasan`) VALUES
(1, 5, 'Diketahui barisan aritmatika dengan U2 + U5 + U20 = 54, Suku ke-9 barisan tersebut adalah', '17', '18', '19', '20', '21', '18', 5, 'Pembahasan: Pada dasarnya, untuk mengerjakan soal seperti ini yang perlu kita lakukan adalah mencari nilai suku pertama (a) dan beda barisan (b). Akan tetapi, pada sebagian soal kita tidak dapat menentukan nilai a dan b sehingga yang harus kita lakukan adalah melihat hubungan antara persamaan yang ditanya dengan persamaan yang diketahui. Dari soal diperoleh persamaan: U2 + U5 + U20 = 54\r\n\r\n(a+ b) + (a+ 4b) + (a+ 19b) = 54\r\n\r\n3a + 24b = 54\r\n\r\na+ 8b=18\r\n\r\nRumus untuk menghitung suku ke-9 adalah sebagai berikut :\r\nU9 =a+ 8b\r\n\r\nU9=a+8b=18');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_informasi`
--
ALTER TABLE `tb_informasi`
  ADD PRIMARY KEY (`id_informasi`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_lembar_soal`
--
ALTER TABLE `tb_lembar_soal`
  ADD PRIMARY KEY (`id_lembar_soal`);

--
-- Indeks untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indeks untuk tabel `tb_peserta`
--
ALTER TABLE `tb_peserta`
  ADD PRIMARY KEY (`kode_peserta`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_informasi`
--
ALTER TABLE `tb_informasi`
  MODIFY `id_informasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_lembar_soal`
--
ALTER TABLE `tb_lembar_soal`
  MODIFY `id_lembar_soal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_peserta`
--
ALTER TABLE `tb_peserta`
  MODIFY `kode_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
