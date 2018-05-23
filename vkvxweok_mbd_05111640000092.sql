/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.1.32-MariaDB : Database - vkvxweok_mbd_05111640000092
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vkvxweok_mbd_05111640000092` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `vkvxweok_mbd_05111640000092`;

/*Table structure for table `bahan` */

DROP TABLE IF EXISTS `bahan`;

CREATE TABLE `bahan` (
  `idbahan` int(11) NOT NULL AUTO_INCREMENT,
  `namabahan` varchar(45) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_volatilitas` float DEFAULT NULL,
  PRIMARY KEY (`idbahan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bahan` */

insert  into `bahan`(`idbahan`,`namabahan`,`harga_jual`,`harga_beli`,`harga_volatilitas`) values (1,'beras',9000,6268,0.2),(2,'santan',4000,4763,0.2);

/*Table structure for table `detil_bahan_masakan` */

DROP TABLE IF EXISTS `detil_bahan_masakan`;

CREATE TABLE `detil_bahan_masakan` (
  `idbahan` int(11) NOT NULL,
  `idmasakan` int(11) NOT NULL,
  `ukuran_bahan` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbahan`,`idmasakan`),
  KEY `fk_masakan_dbm_idx` (`idmasakan`),
  CONSTRAINT `detil_bahan_masakan_ibfk_1` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_masakan_dbm` FOREIGN KEY (`idmasakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detil_bahan_masakan` */

/*Table structure for table `detil_chef_masakan` */

DROP TABLE IF EXISTS `detil_chef_masakan`;

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

/*Data for the table `detil_chef_masakan` */

/*Table structure for table `detil_isi_dapur` */

DROP TABLE IF EXISTS `detil_isi_dapur`;

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

/*Data for the table `detil_isi_dapur` */

/*Table structure for table `masakan` */

DROP TABLE IF EXISTS `masakan`;

CREATE TABLE `masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(45) DEFAULT NULL,
  `lama_pembuatan` int(11) DEFAULT NULL,
  `harga_masakan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_masakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `masakan` */

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `id_player` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` char(100) DEFAULT NULL,
  `money` int(11) DEFAULT '100000',
  `type` varchar(10) DEFAULT NULL,
  `energy` int(11) DEFAULT '10',
  `last_login` datetime DEFAULT NULL,
  `kompor_size` int(11) DEFAULT '4',
  PRIMARY KEY (`id_player`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `player` */

insert  into `player`(`id_player`,`username`,`fullname`,`email`,`password`,`money`,`type`,`energy`,`last_login`,`kompor_size`) values (2,'aaaa','aaaa','aaaa','74b87337454200d4d33f80c4663dc5e5',100000,NULL,10,NULL,4),(3,'bbbb','bbbb','bbbb@gmail.com','098f6bcd4621d373cade4e832627b4f6',100000,NULL,10,'2018-05-16 00:35:17',4);

/*Table structure for table `record_harga_beli_bahan` */

DROP TABLE IF EXISTS `record_harga_beli_bahan`;

CREATE TABLE `record_harga_beli_bahan` (
  `id_bahan` int(11) DEFAULT NULL,
  `tanggal_catat` date DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  KEY `id_bahan` (`id_bahan`),
  CONSTRAINT `record_harga_beli_bahan_ibfk_1` FOREIGN KEY (`id_bahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record_harga_beli_bahan` */

insert  into `record_harga_beli_bahan`(`id_bahan`,`tanggal_catat`,`harga_beli`) values (1,'2018-05-15',9820),(2,'2018-05-15',4904);

/*Table structure for table `record_harga_jual_bahan` */

DROP TABLE IF EXISTS `record_harga_jual_bahan`;

CREATE TABLE `record_harga_jual_bahan` (
  `id_bahan` int(11) DEFAULT NULL,
  `tanggal_catat` date DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  KEY `id_bahan` (`id_bahan`),
  CONSTRAINT `record_harga_jual_bahan_ibfk_1` FOREIGN KEY (`id_bahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record_harga_jual_bahan` */

insert  into `record_harga_jual_bahan`(`id_bahan`,`tanggal_catat`,`harga_jual`) values (1,'2018-05-15',6797),(2,'2018-05-15',4058);

/*Table structure for table `record_harga_masakan` */

DROP TABLE IF EXISTS `record_harga_masakan`;

CREATE TABLE `record_harga_masakan` (
  `id_masakan` int(11) DEFAULT NULL,
  `tanggal_catat` date DEFAULT NULL,
  `harga_masakan` int(11) DEFAULT NULL,
  KEY `id_masakan` (`id_masakan`),
  CONSTRAINT `record_harga_masakan_ibfk_1` FOREIGN KEY (`id_masakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record_harga_masakan` */

/*Table structure for table `stok` */

DROP TABLE IF EXISTS `stok`;

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

/*Data for the table `stok` */

/* Procedure structure for procedure `sp_login_player` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_login_player` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`vkvxweok_mbd2018`@`localhost` PROCEDURE `sp_login_player`(
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
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_register_player` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_register_player` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`vkvxweok_mbd2018`@`localhost` PROCEDURE `sp_register_player`(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_update_harga_beli_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_update_harga_beli_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`vkvxweok_mbd2018`@`localhost` PROCEDURE `sp_update_harga_beli_bahan`()
BEGIN
	if exists (SELECT 1 FROM `record_harga_beli_bahan` WHERE DATEDIFF(NOW(),`tanggal_catat`)=1) then
		select -1, "Harga hari ini sudah ter-update";
	else
		SET @x = 1;
		SET @size = (SELECT COUNT(*) FROM `bahan`);
		
		WHILE @x <= @size DO
			SET @rnd = (SELECT RAND());
			SET @volatility = (SELECT `harga_volatilitas` FROM `bahan` WHERE @x = `idbahan`);
			SET @change_percent = 2 * @volatility * @rnd;
			IF @change_percent > @volatility THEN
				SET @change_percent = @change_percent - (2 * @volatility);
			END IF;
			SET @old_price = (SELECT `harga_beli` FROM `bahan` WHERE @x = `idbahan`);
			SET @change_amount = @old_price * @change_percent;
			
			SET @new_price = @old_price + @change_amount;
			
			UPDATE `bahan` SET `harga_beli` = @new_price WHERE @x = `idbahan`;
			
			INSERT INTO `record_harga_beli_bahan`(`id_bahan`,`tanggal_catat`,`harga_beli`)
			VALUES (@x,SUBDATE(NOW(),1),@old_price);
					
			SET @x = @x + 1;
		END WHILE;
		select 1, "Harga berhasil diupdate";
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_update_harga_jual_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_update_harga_jual_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`vkvxweok_mbd2018`@`localhost` PROCEDURE `sp_update_harga_jual_bahan`()
BEGIN
	IF EXISTS (SELECT 1 FROM `record_harga_jual_bahan` WHERE DATEDIFF(NOW(),`tanggal_catat`)=1) THEN
		SELECT -1, "Harga hari ini sudah ter-update";
	ELSE
		SET @x = 1;
		SET @size = (SELECT COUNT(*) FROM `bahan`);
		
		WHILE @x <= @size DO
			SET @rnd = (SELECT RAND());
			SET @volatility = (SELECT `harga_volatilitas` FROM `bahan` WHERE @x = `idbahan`);
			SET @change_percent = 2 * @volatility * @rnd;
			IF @change_percent > @volatility THEN
				SET @change_percent = @change_percent - (2 * @volatility);
			END IF;
			SET @old_price = (SELECT `harga_beli` FROM `bahan` WHERE @x = `idbahan`);
			SET @change_amount = @old_price * @change_percent;
			
			SET @new_price = @old_price + @change_amount;
			
			UPDATE `bahan` SET `harga_beli` = @new_price WHERE @x = `idbahan`;
			
			INSERT INTO `record_harga_jual_bahan`(`id_bahan`,`tanggal_catat`,`harga_jual`)
			VALUES (@x,SUBDATE(NOW(),1),@old_price);
					
			SET @x = @x + 1;
		END WHILE;
		SELECT 1, "Harga berhasil diupdate";
	END IF;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
