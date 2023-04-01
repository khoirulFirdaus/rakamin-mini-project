-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: rakamin_mini_project
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alamat`
--

DROP TABLE IF EXISTS `alamat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alamat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `judul alamat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nama penerima` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `no telp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `detail_alamat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alamat`
--

LOCK TABLES `alamat` WRITE;
/*!40000 ALTER TABLE `alamat` DISABLE KEYS */;
/*!40000 ALTER TABLE `alamat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_category` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_trx`
--

DROP TABLE IF EXISTS `detail_trx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_trx` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_trx` int NOT NULL,
  `id_log_produk` int NOT NULL,
  `id_toko` int NOT NULL,
  `kuantitas` int NOT NULL,
  `harga_total` int NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trx` (`id_trx`,`id_log_produk`,`id_toko`),
  KEY `fk_id_log_produk` (`id_log_produk`),
  KEY `fk_toko_id_detail_trx` (`id_toko`),
  CONSTRAINT `fk_id_log_produk` FOREIGN KEY (`id_log_produk`) REFERENCES `log_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_trx` FOREIGN KEY (`id_trx`) REFERENCES `trx` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_toko_id_detail_trx` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_trx`
--

LOCK TABLES `detail_trx` WRITE;
/*!40000 ALTER TABLE `detail_trx` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_trx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foto_produk`
--

DROP TABLE IF EXISTS `foto_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foto_produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produk` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `fk_foto_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foto_produk`
--

LOCK TABLES `foto_produk` WRITE;
/*!40000 ALTER TABLE `foto_produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `foto_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_produk`
--

DROP TABLE IF EXISTS `log_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produk` int NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga reseller` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga konsumen` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `id_toko` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_toko` (`id_toko`,`id_category`),
  KEY `fk_log_produk` (`id_produk`),
  KEY `fk_log_produk_category` (`id_category`),
  CONSTRAINT `fk_foto_log_produk` FOREIGN KEY (`id_produk`) REFERENCES `foto_produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_toko_log` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_log_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_log_produk_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_produk`
--

LOCK TABLES `log_produk` WRITE;
/*!40000 ALTER TABLE `log_produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga reseller` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga konsumen` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int NOT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `id_toko` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_toko` (`id_toko`,`id_category`),
  KEY `fk_category` (`id_category`),
  CONSTRAINT `fk_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_toko_produk` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toko`
--

DROP TABLE IF EXISTS `toko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toko` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `url_foto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_toko` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toko`
--

LOCK TABLES `toko` WRITE;
/*!40000 ALTER TABLE `toko` DISABLE KEYS */;
/*!40000 ALTER TABLE `toko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx`
--

DROP TABLE IF EXISTS `trx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `alamat_pengiriman` int NOT NULL,
  `harga_total` int NOT NULL,
  `kode_invoice` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `method_bayar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`,`alamat_pengiriman`),
  KEY `fk_alamat_pengiriman_trx` (`alamat_pengiriman`),
  CONSTRAINT `fk_alamat_pengiriman_trx` FOREIGN KEY (`alamat_pengiriman`) REFERENCES `alamat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_user_trx` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx`
--

LOCK TABLES `trx` WRITE;
/*!40000 ALTER TABLE `trx` DISABLE KEYS */;
/*!40000 ALTER TABLE `trx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `kata_sandi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `notelp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal lahir` date NOT NULL,
  `jenis kelamin` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tentang` text COLLATE utf8mb4_general_ci NOT NULL,
  `pekerjaan` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_provinsi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_kota` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notelp` (`notelp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-01 17:02:30
