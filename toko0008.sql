-- phpMyAdmin SQL Dump
-- version 5.2.2-dev+20240926.d88c285fee
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 10 Nov 2024 pada 01.49
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko0008`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kd_brg` char(6) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kd_brg`, `nama`, `harga`, `stok`) VALUES
('KD001', 'parfum', 30000, 47);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pel` char(6) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pel`, `nama`, `alamat`) VALUES
('NB001', 'Irsyad', 'Setono'),
('NB002', 'jony', 'Pekalongan, Setono');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_trans` char(6) NOT NULL,
  `id_pel` char(6) NOT NULL,
  `kd_brg` char(6) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `jmlh` int(5) DEFAULT NULL,
  `tanggal_waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_trans`, `id_pel`, `kd_brg`, `total`, `jmlh`, `tanggal_waktu`) VALUES
('B112', 'NB001', 'KD001', 60000, 2, '2024-11-09 13:14:20'),
('B113', 'NB002', 'KD001', 30000, 1, '2024-11-10 07:49:14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pel`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_trans`),
  ADD KEY `id_pel` (`id_pel`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pel`) REFERENCES `pelanggan` (`id_pel`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
