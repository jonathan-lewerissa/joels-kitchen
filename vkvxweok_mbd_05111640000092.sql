-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: vkvxweok_mbd_05111640000092
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bahan`
--

DROP TABLE IF EXISTS `bahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bahan` (
  `idbahan` int(11) NOT NULL AUTO_INCREMENT,
  `namabahan` varchar(45) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_volatilitas` float DEFAULT NULL,
  PRIMARY KEY (`idbahan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahan`
--

LOCK TABLES `bahan` WRITE;
/*!40000 ALTER TABLE `bahan` DISABLE KEYS */;
INSERT INTO `bahan` VALUES (1,'beras',8983,5066,0.2),(2,'santan',4000,4763,0.2);
/*!40000 ALTER TABLE `bahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detil_bahan_masakan`
--

DROP TABLE IF EXISTS `detil_bahan_masakan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detil_bahan_masakan` (
  `idbahan` int(11) NOT NULL,
  `idmasakan` int(11) NOT NULL,
  `ukuran_bahan` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbahan`,`idmasakan`),
  KEY `fk_masakan_dbm_idx` (`idmasakan`),
  CONSTRAINT `detil_bahan_masakan_ibfk_1` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_masakan_dbm` FOREIGN KEY (`idmasakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detil_bahan_masakan`
--

LOCK TABLES `detil_bahan_masakan` WRITE;
/*!40000 ALTER TABLE `detil_bahan_masakan` DISABLE KEYS */;
/*!40000 ALTER TABLE `detil_bahan_masakan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detil_chef_bahan`
--

DROP TABLE IF EXISTS `detil_chef_bahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detil_chef_bahan` (
  `idplayer` int(11) DEFAULT NULL,
  `idbahan` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  KEY `fk_player_dcb_idx` (`idplayer`),
  KEY `fk_bahan_dcb_idx` (`idbahan`),
  CONSTRAINT `fk_bahan_dcb` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_player_dcb` FOREIGN KEY (`idplayer`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detil_chef_bahan`
--

LOCK TABLES `detil_chef_bahan` WRITE;
/*!40000 ALTER TABLE `detil_chef_bahan` DISABLE KEYS */;
/*!40000 ALTER TABLE `detil_chef_bahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detil_chef_masakan`
--

DROP TABLE IF EXISTS `detil_chef_masakan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detil_chef_masakan` (
  `idchef` int(11) NOT NULL AUTO_INCREMENT,
  `idmasakan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status_bisa_masak` tinyint(1) DEFAULT NULL,
  KEY `fk_masakan_dcm_idx` (`idmasakan`),
  KEY `fk_chef_dcm_idx` (`idchef`),
  CONSTRAINT `fk_chef_dcm` FOREIGN KEY (`idchef`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_masakan_dcm` FOREIGN KEY (`idmasakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detil_chef_masakan`
--

LOCK TABLES `detil_chef_masakan` WRITE;
/*!40000 ALTER TABLE `detil_chef_masakan` DISABLE KEYS */;
/*!40000 ALTER TABLE `detil_chef_masakan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detil_isi_dapur`
--

DROP TABLE IF EXISTS `detil_isi_dapur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detil_isi_dapur` (
  `idmasakan` int(11) NOT NULL,
  `idchef` int(11) DEFAULT NULL,
  `jam_mulai_masak` datetime DEFAULT NULL,
  `nomor_kompor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmasakan`),
  KEY `fk_player_did_idx` (`idchef`),
  CONSTRAINT `fk_masakan_did` FOREIGN KEY (`idmasakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_player_did` FOREIGN KEY (`idchef`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detil_isi_dapur`
--

LOCK TABLES `detil_isi_dapur` WRITE;
/*!40000 ALTER TABLE `detil_isi_dapur` DISABLE KEYS */;
/*!40000 ALTER TABLE `detil_isi_dapur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_bahan`
--

DROP TABLE IF EXISTS `market_bahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_bahan` (
  `idbahan` int(11) DEFAULT NULL,
  `idplayer` int(11) DEFAULT NULL,
  KEY `pk_idbahan_mb_idx` (`idbahan`),
  KEY `pk_idplayer_mb_idx` (`idplayer`),
  CONSTRAINT `pk_idbahan_mb` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_idplayer_mb` FOREIGN KEY (`idplayer`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_bahan`
--

LOCK TABLES `market_bahan` WRITE;
/*!40000 ALTER TABLE `market_bahan` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_bahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_masakan`
--

DROP TABLE IF EXISTS `market_masakan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_masakan` (
  `idmasakan` int(11) DEFAULT NULL,
  `idplayer` int(11) DEFAULT NULL,
  KEY `fk_idplayer_mm_idx` (`idplayer`),
  KEY `fk_idmasakan_mm_idx` (`idmasakan`),
  CONSTRAINT `fk_idmasakan_mm` FOREIGN KEY (`idmasakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idplayer_mm` FOREIGN KEY (`idplayer`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_masakan`
--

LOCK TABLES `market_masakan` WRITE;
/*!40000 ALTER TABLE `market_masakan` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_masakan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masakan`
--

DROP TABLE IF EXISTS `masakan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(45) DEFAULT NULL,
  `lama_pembuatan` int(11) DEFAULT NULL,
  `harga_masakan` int(11) DEFAULT NULL,
  `harga_volatilitas` float DEFAULT NULL,
  PRIMARY KEY (`id_masakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masakan`
--

LOCK TABLES `masakan` WRITE;
/*!40000 ALTER TABLE `masakan` DISABLE KEYS */;
INSERT INTO `masakan` VALUES (1,'Soto',300,11,0.2);
/*!40000 ALTER TABLE `masakan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id_player` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `money` int(11) DEFAULT '100000',
  `type` varchar(10) DEFAULT NULL,
  `energy` int(11) DEFAULT '10',
  `last_login` datetime DEFAULT NULL,
  `kompor_size` int(11) DEFAULT '4',
  PRIMARY KEY (`id_player`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (2,'aaaa','aaaa','aaaa','74b87337454200d4d33f80c4663dc5e5',100000,NULL,10,NULL,4),(3,'bbbb','bbbb','bbbb@gmail.com','098f6bcd4621d373cade4e832627b4f6',100000,NULL,10,'2018-05-16 00:35:17',4),(4,'lita','lita','lita@gmail.com','d6022249ddb33ec5a4e89e31df57cc67',100000,NULL,10,NULL,4);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_harga_beli_bahan`
--

DROP TABLE IF EXISTS `record_harga_beli_bahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_harga_beli_bahan` (
  `id_bahan` int(11) DEFAULT NULL,
  `tanggal_catat` date DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  KEY `id_bahan` (`id_bahan`),
  CONSTRAINT `record_harga_beli_bahan_ibfk_1` FOREIGN KEY (`id_bahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_harga_beli_bahan`
--

LOCK TABLES `record_harga_beli_bahan` WRITE;
/*!40000 ALTER TABLE `record_harga_beli_bahan` DISABLE KEYS */;
INSERT INTO `record_harga_beli_bahan` VALUES (1,'2018-05-15',9820),(2,'2018-05-15',4904),(1,'2018-05-23',6268);
/*!40000 ALTER TABLE `record_harga_beli_bahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_harga_jual_bahan`
--

DROP TABLE IF EXISTS `record_harga_jual_bahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_harga_jual_bahan` (
  `id_bahan` int(11) DEFAULT NULL,
  `tanggal_catat` date DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  KEY `id_bahan` (`id_bahan`),
  CONSTRAINT `record_harga_jual_bahan_ibfk_1` FOREIGN KEY (`id_bahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_harga_jual_bahan`
--

LOCK TABLES `record_harga_jual_bahan` WRITE;
/*!40000 ALTER TABLE `record_harga_jual_bahan` DISABLE KEYS */;
INSERT INTO `record_harga_jual_bahan` VALUES (2,'2018-05-15',4058),(1,'2018-05-23',9000);
/*!40000 ALTER TABLE `record_harga_jual_bahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_harga_masakan`
--

DROP TABLE IF EXISTS `record_harga_masakan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_harga_masakan` (
  `id_masakan` int(11) DEFAULT NULL,
  `tanggal_catat` date DEFAULT NULL,
  `harga_masakan` int(11) DEFAULT NULL,
  KEY `id_masakan` (`id_masakan`),
  CONSTRAINT `record_harga_masakan_ibfk_1` FOREIGN KEY (`id_masakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_harga_masakan`
--

LOCK TABLES `record_harga_masakan` WRITE;
/*!40000 ALTER TABLE `record_harga_masakan` DISABLE KEYS */;
INSERT INTO `record_harga_masakan` VALUES (1,'2018-05-23',10);
/*!40000 ALTER TABLE `record_harga_masakan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stok`
--

DROP TABLE IF EXISTS `stok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stok` (
  `idplayer` int(11) NOT NULL AUTO_INCREMENT,
  `idbahan` int(11) NOT NULL,
  `jumlah` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idplayer`,`idbahan`),
  KEY `fk_idplayer_idx` (`idplayer`),
  KEY `fk_bahan_db_idx` (`idbahan`),
  CONSTRAINT `fk_player_db` FOREIGN KEY (`idplayer`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stok`
--

LOCK TABLES `stok` WRITE;
/*!40000 ALTER TABLE `stok` DISABLE KEYS */;
/*!40000 ALTER TABLE `stok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vkvxweok_mbd_05111640000092'
--

--
-- Dumping routines for database 'vkvxweok_mbd_05111640000092'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_beli_bahan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_beli_bahan`(
	p_idbahan int,
    p_idpenjual int,
    p_idpembeli int
)
BEGIN
	set @harga = (select harga_jual from bahan where idbahan = p_idbahan);
    set @uangpembeli = (select money from player where id_player = p_idpembeli);
    set @uangpenjual = (select money from player where id_player = p_idpenjual);
    if @uangpembeli < @harga then
		select -1, "uang tidak cukup";
	else
		update player set money = @uangpembeli - @harga where id_player = p_idpembeli;
        update player set money = @uangpenjual + @harga where id_player = p_idpenjual;
        update detil_chef_bahan set jumlah = (select jumlah from detil_chef_bahan where idplayer = p_idpembeli and idbahan = p_idbahan) + 1
        where idplayer = p_idpembeli and idbahan = p_idbahan;
        delete from market_bahan where idbahan = p_idbahan and idplayer = p_idpenjual limit 1;
        select 0, "beli bahan berhasil";
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_beli_masakan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_beli_masakan`(
	p_idmasakan int,
    p_idpenjual int,
    p_idpembeli int
)
BEGIN
	set @harga = (select harga_masakan from masakan where id_masakan = p_idmasakan);
    set @uangpembeli = (select money from player where id_player = p_idpembeli);
    set @uangpenjual = (select money from player where id_player = p_idpenjual);
    if @uangpembeli < @harga then
		select -1, "uang tidak cukup";
	else
		update player set money = @uangpembeli - @harga where id_player = p_idpembeli;
        update player set money = @uangpenjual + @harga where id_player = p_idpenjual;
        update detil_chef_masakan set jumlah = (select jumlah from detil_chef_masakan where idplayer = p_idpembeli and idmasakan = p_idmasakan) + 1
        where idplayer = p_idpembeli and idmasakan = p_idmasakan;
        delete from market_masakan where idmasakan = p_idmasakan and idplayer = p_idpenjual limit 1;
        select 0, "beli  masakan berhasil";
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cek_bisa_memasak` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cek_bisa_memasak`(
	p_id_masakan int,
    p_id_player int
)
BEGIN
	set @banyakbahandibutuhkan  = (select count(*) from detil_bahan_masakan where 'idmasakan' = 'p_id_masakan');
    set @banyakbahantersedia = (select count(*) from detil_chef_bahan cross join detil_bahan_masakan 
    where detil_bahan_masakan.idmasakan = p_id_masakan and detil_chef_bahan.idbahan = detil_bahan_masakan.idbahan
    and detil_chef_bahan.idplayer = p_id_player and detil_chef_bahan.jumlah >= detil_bahan_masakan.ukuran_bahan);
    if(@banyakbahantersedia < @banyakbahandibutuhkan) then
		select -1, "bahan tidak cukup";
	else
		update player set kompor_size = (select kompor_size from player where id_player = p_id_player) -1 where id_player = p_id_player;
		set @i = 1;
        while @i <= 4 do
			if not exists(select 1 from detil_isi_dapur where idchef = p_id_player and nomor_kompor = i) then
				insert into detil_isi_dapur values(p_id_masakan, p_id_player, now(), i);
                set @i = 5;
			else set @i = @i + 1;
			end if;
		end while;
        select p_id_player,idbahan, ukuran_bahan from detil_bahan_masakan where idmasakan = p_id_masakan;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cek_matang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cek_matang`(
	p_id_player int
    
)
BEGIN
	set @matang = (select count(*) from detil_isi_dapur cross join masakan 
    where detil_isi_dapur.idmasakan = masakan.id_masakan and idchef = p_id_player 
    and masakan.lama_pembuatan <= time_to_sec(datediff(now(),detil_isi_dapur.jam_mulai_masak)));
    update player set kompor_size = (select kompor_size from player where id_player = p_id_player) + @matang
    where id_player = p_id_player;
    select idchef, idmasakan, nomor_kompor from detil_isi_dapur cross join masakan where detil_isi_dapur.idmasakan = masakan.id_masakan and idchef = p_id_player 
    and masakan.lama_pembuatan <= time_to_sec(datediff(now(),detil_isi_dapur.jam_mulai_masak));
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_edit_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_password`(
	p_username varchar(20),
    p_newpassword varchar(50),
    p_oldpassword varchar(50)
)
BEGIN
	if exists(select 1 from player where username = p_username and password = md5(p_oldpassword)) then
		update player
		set password = md5(p_newpassword)
		where username = p_username and password = md5(p_oldpassword);
		select 1, 'ubah password berhasil';
	else
		select 0, 'old password salah';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_jual_bahan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_jual_bahan`(
	p_idbahan int,
    p_idplayer int
)
BEGIN
	if not exists(select 1 from detil_chef_bahan where idbahan = p_idbahan and idplayer = p_idplayer) then
		set @jumlah = 0;
	else
		set @jumlah = (select jumlah from detil_chef_bahan where idbahan = p_idbahan and idplayer = p_idplayer);
    end if;
    if @jumlah = 0 then
		select -1, "bahan kurang";
	else 
		update detil_chef_bahan set jumlah = @jumlah - 1 where idplayer = p_idplayer and idbahan = p_idbahan;
        insert into market_bahan values (p_idbahan, p_idplayer);
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_jual_masakan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_jual_masakan`(
	p_idmasakan int,
    p_idplayer int
)
BEGIN
	if not exists(select 1 from detil_chef_masakan where idmasakan = p_idmasakan and idplayer = p_idplayer) then
		set @jumlah = 0;
	else
		set @jumlah = (select jumlah from detil_chef_masakan where idmasakan = p_idmasakan and idplayer = p_idplayer);
    end if;
    if @jumlah = 0 then
		select -1, "masakan kurang";
	else 
		update detil_chef_masakan set jumlah = @jumlah - 1 where idplayer = p_idplayer and idmasakan = p_idmasakan;
        insert into market_masakan values (p_idmasakan, p_idplayer);
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`vkvxweok_mbd2018`@`localhost` PROCEDURE `sp_login_player`(

	p_email		VARchar(45),

	p_password	varchar(100)

    )
BEGIN

	IF EXISTS(SELECT 1 FROM `player` 

		where `email`=p_email and `password`= md5(p_password)) THEN

		update `player` set `last_login` = now() where `email` = p_email;

		SELECT 0, "login sukses";

	ELSE

		SELECT -1, "maaf username / password tidak dikenal";

	END IF;

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_register_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`vkvxweok_mbd2018`@`localhost` PROCEDURE `sp_register_player`(

	p_username	varchar(20),

	p_fullname	VARCHAR(45),

	p_email		VARchar(45),

	p_password	varchar(100)	

	)
BEGIN

	if not exists (select 1 from `player` where `email`=p_email) then

		insert into `player`(`username`,`fullname`,`email`,`password`)

		values (p_username,p_fullname,p_email,md5(p_password));

		select 1, "Registration success! Login to continue";

	else

		select -1, "Failure! Email already used.";

	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_dapur_dan_masakan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_dapur_dan_masakan`(
	p_id_player int,
    p_no_kompor int
)
BEGIN
	set @id = (select idmasakan from detil_isi_dapur where idchef = p_id_player and nomor_kompor = p_no_kompor);
    update detil_chef_masakan set jumlah = (select jumlah from detil_isi_dapur where idchef = p_id_player and nomor_kompor = p_no_kompor) +1
    where idchef = p_id_player and nomor_kompor = p_no_kompor;
	delete from detil_isi_dapur where idchef = p_id_player and nomor_kompor = p_no_kompor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_detil_chef_bahan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_detil_chef_bahan`(
	ukuran int,
    p_id_player int,
    p_id_bahan int
)
BEGIN
	set @jumlahbahan = (select jumlah from detil_chef_bahan where idplayer=p_id_player and idbahan = p_id_bahan);
    update detil_chef_bahan set jumlah = @jumlahbahan - ukuran where idplayer=p_id_player and idbahan = p_id_bahan;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_harga_beli_bahan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_harga_beli_bahan`(
	p_id_bahan int
)
BEGIN

	if exists (SELECT 1 FROM `record_harga_beli_bahan` WHERE DATEDIFF(NOW(),`tanggal_catat`)=1) then

		select -1, "Harga hari ini sudah ter-update";

	else

		SET @rnd = (SELECT RAND());

		SET @volatility = (SELECT `harga_volatilitas` FROM `bahan` WHERE p_id_bahan = `idbahan`);

		SET @change_percent = 2 * @volatility * @rnd;

		IF @change_percent > @volatility THEN

			SET @change_percent = @change_percent - (2 * @volatility);

		END IF;

		SET @old_price = (SELECT `harga_beli` FROM `bahan` WHERE p_id_bahan = `idbahan`);

		SET @change_amount = @old_price * @change_percent;

		

		SET @new_price = @old_price + @change_amount;

		

		UPDATE `bahan` SET `harga_beli` = @new_price WHERE p_id_bahan = `idbahan`;

		

		INSERT INTO `record_harga_beli_bahan`(`id_bahan`,`tanggal_catat`,`harga_beli`)

		VALUES (p_id_bahan,SUBDATE(NOW(),1),@old_price);
            

		select 1, "Harga berhasil diupdate";

	end if;

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_harga_jual_bahan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_harga_jual_bahan`(
	p_id_bahan int
)
BEGIN

	IF EXISTS (SELECT 1 FROM `record_harga_jual_bahan` WHERE DATEDIFF(NOW(),`tanggal_catat`)=1) THEN

		SELECT -1, "Harga hari ini sudah ter-update";

	ELSE

		SET @rnd = (SELECT RAND());

		SET @volatility = (SELECT `harga_volatilitas` FROM `bahan` WHERE p_id_bahan = `idbahan`);

		SET @change_percent = 2 * @volatility * @rnd;

		IF @change_percent > @volatility THEN

			SET @change_percent = @change_percent - (2 * @volatility);

		END IF;

		SET @old_price = (SELECT `harga_jual` FROM `bahan` WHERE p_id_bahan = `idbahan`);

		SET @change_amount = @old_price * @change_percent;

		

		SET @new_price = @old_price + @change_amount;

		

		UPDATE `bahan` SET `harga_jual` = @new_price WHERE p_id_bahan = `idbahan`;

		

		INSERT INTO `record_harga_jual_bahan`(`id_bahan`,`tanggal_catat`,`harga_jual`)

		VALUES (p_id_bahan,SUBDATE(NOW(),1),@old_price);

		SELECT 1, "Harga berhasil diupdate";

	END IF;

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_harga_masakan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_harga_masakan`(
	p_id_masakan int
)
BEGIN
	if exists (SELECT 1 FROM `record_harga_masakan` WHERE DATEDIFF(NOW(),`tanggal_catat`)=1) then
		select -1, "Harga hari ini sudah ter-update";
	else
		SET @rnd = (SELECT RAND());
		SET @volatility = (SELECT `harga_volatilitas` FROM `masakan` WHERE `id_masakan` = p_id_masakan);
		SET @change_percent = 2 * @volatility * @rnd;
		IF @change_percent > @volatility THEN
			SET @change_percent = @change_percent - (2 * @volatility);
		END IF;
		SET @old_price = (SELECT `harga_masakan` FROM `masakan` WHERE `id_masakan` = p_id_masakan);
		SET @change_amount = @old_price * @change_percent;
		
		SET @new_price = @old_price + @change_amount;
		
		UPDATE `masakan` SET `harga_masakan` = @new_price WHERE `id_masakan` = p_id_masakan;
		
		INSERT INTO `record_harga_masakan`(`id_masakan`,`tanggal_catat`,`harga_masakan`)
		VALUES (p_id_masakan,SUBDATE(NOW(),1),@old_price);
		select 1, "Harga berhasil diupdate";
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-24 14:54:19
