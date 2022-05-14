-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sistem_pmb
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calon_mahasiswa`
--

DROP TABLE IF EXISTS `calon_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calon_mahasiswa` (
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tempat_lahir` varchar(35) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `provinsi` varchar(35) NOT NULL,
  `kabupaten` varchar(35) NOT NULL,
  `kecamatan` varchar(35) NOT NULL,
  `alamat_detail` varchar(35) NOT NULL,
  `kode_pos` char(6) NOT NULL,
  `nomor_handphone` char(12) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `pekerjaan_ayah` varchar(35) NOT NULL,
  `pendidikan_terakhir_ayah` enum('Tidak Sekolah','SD','SLTP/Sederajat','SLTA/Sederajat','D1/D2/D3','D4/S1','S2','S3') DEFAULT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(35) NOT NULL,
  `pendidikan_terakhir_ibu` enum('Tidak Sekolah','SD','SLTP/Sederajat','SLTA/Sederajat','D1/D2/D3','D4/S1','S2','S3') DEFAULT NULL,
  `jumlah_saudara` char(2) DEFAULT NULL,
  `penghasilan_bulanan` decimal(15,2) NOT NULL,
  PRIMARY KEY (`nisn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calon_mahasiswa`
--

LOCK TABLES `calon_mahasiswa` WRITE;
/*!40000 ALTER TABLE `calon_mahasiswa` DISABLE KEYS */;
INSERT INTO `calon_mahasiswa` VALUES ('9990101001','Budi Suaka Rahmat','budisr@mail.com','Laki-laki','Jakarta','1998-10-20','DKI Jakarta','Jakarta Pusat','Menteng','Kp. Kedo RT 01 RW 05','10310','08199908223','Reza Al-untung','Karyawan Swasta','D4/S1','Jenny Mutiara','Guru','D4/S1','2',15000000.00),('9990101002','Asep Muhamad Rahman','amrahman@mail.com','Laki-laki','Bandung','1999-07-05','Jawa Barat','Bandung','Arcamanik','Perumahan Sukajati No. 05','40293','08299908221','Yu Zhong','Wiraswasta','SLTA/Sederajat','Betty','IRT','S2','1',12000000.00),('9990101003','Feni Nurahmasari','fenins@mail.com','Perempuan','Kediri','2000-10-06','Jawa Timur','Kediri','Grogol','Perumahan Agyawacana No. 10','64151','08729991234','Erga Rahman','Arsitek','S2','Kagura','IRT','SLTA/Sederajat','',20000000.00);
/*!40000 ALTER TABLE `calon_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histori_akademik`
--

DROP TABLE IF EXISTS `histori_akademik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histori_akademik` (
  `kode_histori` int(11) NOT NULL AUTO_INCREMENT,
  `nisn` varchar(15) DEFAULT NULL,
  `npsn` varchar(10) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_lulus` date NOT NULL,
  `nilai_akhir` float NOT NULL,
  PRIMARY KEY (`kode_histori`),
  KEY `fk_histori_mahasiswa` (`nisn`),
  KEY `fk_histori_sekolah` (`npsn`),
  CONSTRAINT `fk_histori_mahasiswa` FOREIGN KEY (`nisn`) REFERENCES `calon_mahasiswa` (`nisn`),
  CONSTRAINT `fk_histori_sekolah` FOREIGN KEY (`npsn`) REFERENCES `sekolah_sebelumnya` (`npsn`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histori_akademik`
--

LOCK TABLES `histori_akademik` WRITE;
/*!40000 ALTER TABLE `histori_akademik` DISABLE KEYS */;
INSERT INTO `histori_akademik` VALUES (16,'9990101001','20100216','2013-06-01','2016-05-15',85),(17,'9990101002','20219271','2015-06-01','2018-05-15',90),(18,'9990101003','69765030','2013-06-01','2018-05-15',87);
/*!40000 ALTER TABLE `histori_akademik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_studi`
--

DROP TABLE IF EXISTS `program_studi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_studi` (
  `kode_prodi` varchar(15) NOT NULL,
  `nama_prodi` varchar(25) NOT NULL,
  PRIMARY KEY (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_studi`
--

LOCK TABLES `program_studi` WRITE;
/*!40000 ALTER TABLE `program_studi` DISABLE KEYS */;
INSERT INTO `program_studi` VALUES ('PROD01','Teknik Komputer'),('PROD02','Teknik Mesin'),('PROD03','Teknik Arsitektur');
/*!40000 ALTER TABLE `program_studi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrasi`
--

DROP TABLE IF EXISTS `registrasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrasi` (
  `kode_registrasi` int(11) NOT NULL AUTO_INCREMENT,
  `nisn` varchar(15) DEFAULT NULL,
  `kode_prodi` varchar(15) NOT NULL,
  `tanggal_registrasi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_registrasi`),
  UNIQUE KEY `fk_nisn` (`nisn`),
  KEY `fk_registrasi_prodi` (`kode_prodi`),
  CONSTRAINT `fk_registrasi_mahasiswa` FOREIGN KEY (`nisn`) REFERENCES `calon_mahasiswa` (`nisn`),
  CONSTRAINT `fk_registrasi_prodi` FOREIGN KEY (`kode_prodi`) REFERENCES `program_studi` (`kode_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrasi`
--

LOCK TABLES `registrasi` WRITE;
/*!40000 ALTER TABLE `registrasi` DISABLE KEYS */;
INSERT INTO `registrasi` VALUES (2,'9990101001','PROD02','2021-06-07 03:14:48'),(3,'9990101002','PROD01','2021-06-07 03:22:16'),(4,'9990101003','PROD03','2021-06-07 03:28:42');
/*!40000 ALTER TABLE `registrasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekolah_sebelumnya`
--

DROP TABLE IF EXISTS `sekolah_sebelumnya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sekolah_sebelumnya` (
  `npsn` varchar(10) NOT NULL,
  `nama_sekolah` varchar(50) DEFAULT NULL,
  `jenjang` enum('SMA','SMK','D3') NOT NULL,
  PRIMARY KEY (`npsn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah_sebelumnya`
--

LOCK TABLES `sekolah_sebelumnya` WRITE;
/*!40000 ALTER TABLE `sekolah_sebelumnya` DISABLE KEYS */;
INSERT INTO `sekolah_sebelumnya` VALUES ('20100216','SMAN 1 Jakarta','SMA'),('20219271','SMAN 1 Bandung','SMA'),('69765030','SMKN 1 Grogol','SMK');
/*!40000 ALTER TABLE `sekolah_sebelumnya` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-07 11:19:26
