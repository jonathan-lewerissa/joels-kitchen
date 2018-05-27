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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `bahan` */

insert  into `bahan`(`idbahan`,`namabahan`,`harga_jual`,`harga_beli`,`harga_volatilitas`) values (1,'beras',8983,5066,0.2),(2,'santan',4000,4763,0.2),(3,'Ayam',1200,1000,0.3),(4,'Bawang Putih',70,60,0.1),(5,'Bawang Merah',110,100,0.2),(6,'Lengkuas',100,90,0.4),(7,'Sosis',150,139,0.5),(8,'Telur',280,270,0.1),(9,'Kecap',510,500,0.1),(10,'Wortel',50,40,0.3),(11,'Kentang',190,180,0.4),(12,'Seledri',30,25,0.5),(13,'Daun Bawang',25,20,0.1),(14,'Merica',15,10,0.5),(15,'Kemiri',15,10,0.1),(16,'Pala',20,15,0.2),(17,'Kambing',1250,1200,0.3),(18,'Santan',35,30,0.4);

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

insert  into `detil_bahan_masakan`(`idbahan`,`idmasakan`,`ukuran_bahan`) values (1,1,1),(1,2,1),(3,1,1),(3,3,1),(4,1,3),(4,2,3),(4,4,4),(5,1,5),(5,4,7),(6,1,2),(7,2,1),(8,2,1),(9,2,1),(10,3,1),(11,3,1),(12,3,1),(13,3,1),(14,4,1),(17,4,1),(18,4,1);

/*Table structure for table `detil_chef_bahan` */

DROP TABLE IF EXISTS `detil_chef_bahan`;

CREATE TABLE `detil_chef_bahan` (
  `idplayer` int(11) DEFAULT NULL,
  `idbahan` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  KEY `fk_player_dcb_idx` (`idplayer`),
  KEY `fk_bahan_dcb_idx` (`idbahan`),
  CONSTRAINT `fk_bahan_dcb` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_player_dcb` FOREIGN KEY (`idplayer`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detil_chef_bahan` */

insert  into `detil_chef_bahan`(`idplayer`,`idbahan`,`jumlah`) values (5,3,4),(5,1,4),(5,4,2),(5,5,0),(5,6,3);

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
  `idmasakan` int(11) DEFAULT NULL,
  `idchef` int(11) DEFAULT NULL,
  `jam_mulai_masak` datetime DEFAULT NULL,
  `nomor_kompor` int(11) DEFAULT NULL,
  KEY `fk_player_did_idx` (`idchef`),
  KEY `fk_masakan_did` (`idmasakan`),
  CONSTRAINT `fk_masakan_did` FOREIGN KEY (`idmasakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_player_did` FOREIGN KEY (`idchef`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detil_isi_dapur` */

insert  into `detil_isi_dapur`(`idmasakan`,`idchef`,`jam_mulai_masak`,`nomor_kompor`) values (1,5,'2018-05-27 15:06:13',1),(1,5,'2018-05-27 15:26:35',2),(1,5,'2018-05-27 15:26:43',3),(1,7,'2018-05-27 17:27:29',1),(2,7,'2018-05-27 17:27:36',2),(1,7,'2018-05-27 19:10:08',3);

/*Table structure for table `market_bahan` */

DROP TABLE IF EXISTS `market_bahan`;

CREATE TABLE `market_bahan` (
  `idbahan` int(11) DEFAULT NULL,
  `idplayer` int(11) DEFAULT NULL,
  KEY `pk_idbahan_mb_idx` (`idbahan`),
  KEY `pk_idplayer_mb_idx` (`idplayer`),
  CONSTRAINT `pk_idbahan_mb` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_idplayer_mb` FOREIGN KEY (`idplayer`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `market_bahan` */

/*Table structure for table `market_masakan` */

DROP TABLE IF EXISTS `market_masakan`;

CREATE TABLE `market_masakan` (
  `idmasakan` int(11) DEFAULT NULL,
  `idplayer` int(11) DEFAULT NULL,
  KEY `fk_idplayer_mm_idx` (`idplayer`),
  KEY `fk_idmasakan_mm_idx` (`idmasakan`),
  CONSTRAINT `fk_idmasakan_mm` FOREIGN KEY (`idmasakan`) REFERENCES `masakan` (`id_masakan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idplayer_mm` FOREIGN KEY (`idplayer`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `market_masakan` */

/*Table structure for table `masakan` */

DROP TABLE IF EXISTS `masakan`;

CREATE TABLE `masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(45) DEFAULT NULL,
  `lama_pembuatan` int(11) DEFAULT NULL,
  `harga_masakan` int(11) DEFAULT NULL,
  `harga_volatilitas` float DEFAULT NULL,
  PRIMARY KEY (`id_masakan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `masakan` */

insert  into `masakan`(`id_masakan`,`nama_masakan`,`lama_pembuatan`,`harga_masakan`,`harga_volatilitas`) values (1,'Soto',300,11,0.2),(2,'Nasi Goreng',240,1000,0.2),(3,'Sop',200,2500,0.2),(4,'Gulai',600,5000,0.4);

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `player` */

insert  into `player`(`id_player`,`username`,`fullname`,`email`,`password`,`money`,`type`,`energy`,`last_login`,`kompor_size`) values (2,'aaaa','aaaa','aaaa','74b87337454200d4d33f80c4663dc5e5',100000,NULL,10,NULL,4),(3,'bbbb','bbbb','bbbb@gmail.com','098f6bcd4621d373cade4e832627b4f6',100000,NULL,10,'2018-05-16 00:35:17',4),(4,'lita','lita','lita@gmail.com','d6022249ddb33ec5a4e89e31df57cc67',100000,NULL,10,NULL,4),(5,'nurlita','Lita','nurlita16@mhs.if.its.ac.id','952ec79417b8f841757747a448a7bc3f',100000,NULL,10,'2018-05-27 16:04:09',4),(6,'litaaa','Lita','nurlitadf17@gmail.com','952ec79417b8f841757747a448a7bc3f',100000,NULL,10,NULL,4),(7,'dosen','dosen','dosen@dosen.com','e54e7968130c3483281515d83d2811f3',100000,NULL,10,'2018-05-27 18:55:06',4);

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

insert  into `record_harga_beli_bahan`(`id_bahan`,`tanggal_catat`,`harga_beli`) values (1,'2018-05-15',9820),(2,'2018-05-15',4904),(1,'2018-05-23',6268);

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

insert  into `record_harga_jual_bahan`(`id_bahan`,`tanggal_catat`,`harga_jual`) values (2,'2018-05-15',4058),(1,'2018-05-23',9000);

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

insert  into `record_harga_masakan`(`id_masakan`,`tanggal_catat`,`harga_masakan`) values (1,'2018-05-23',10);

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

/* Procedure structure for procedure `sp_beli_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_beli_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_beli_bahan`(`p_idbahan` INT, `p_idpenjual` INT, `p_idpembeli` INT)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_beli_masakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_beli_masakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_beli_masakan`(`p_idmasakan` INT, `p_idpenjual` INT, `p_idpembeli` INT)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cek_bisa_memasak` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cek_bisa_memasak` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cek_bisa_memasak`(IN `p_id_player` INT, `p_id_masakan` INT)
BEGIN
	set @banyakbahandibutuhkan  = (select count(*) from detil_bahan_masakan where 'idmasakan' = 'p_id_masakan');
    set @banyakbahantersedia = (select count(*) from detil_chef_bahan cross join detil_bahan_masakan 
    where detil_bahan_masakan.idmasakan = p_id_masakan and detil_chef_bahan.idbahan = detil_bahan_masakan.idbahan
    and detil_chef_bahan.idplayer = p_id_player and detil_chef_bahan.jumlah >= detil_bahan_masakan.ukuran_bahan);
	if(@banyakbahantersedia < @banyakbahandibutuhkan) then
		select -1, "bahan tidak cukup";
	else
		set @kompor = (select kompor_size from player where id_player = p_id_player);
		if @kompor = 0 then
			select -1 as 'error';
		else
			update player set kompor_size = @kompor where id_player = p_id_player;
			set @i = 1;
			while @i <= 4 do
				if not exists(select 1 from detil_isi_dapur where idchef = p_id_player and nomor_kompor = @i) then
					insert into detil_isi_dapur values(p_id_masakan, p_id_player, now(), @i);
					set @i = 5;
				else set @i = @i + 1;
				end if;
			end while;
		end if;
        select p_id_player,idbahan, ukuran_bahan from detil_bahan_masakan where idmasakan = p_id_masakan;
    end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cek_matang` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cek_matang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cek_matang`(`p_id_player` INT)
BEGIN
	set @matang = (select count(*) from detil_isi_dapur cross join masakan 
    where detil_isi_dapur.idmasakan = masakan.id_masakan and idchef = p_id_player 
    and masakan.lama_pembuatan <= time_to_sec(datediff(now(),detil_isi_dapur.jam_mulai_masak)));
    update player set kompor_size = (select kompor_size from player where id_player = p_id_player) + @matang
    where id_player = p_id_player;
    select idchef, idmasakan, nomor_kompor from detil_isi_dapur cross join masakan where detil_isi_dapur.idmasakan = masakan.id_masakan and idchef = p_id_player 
    and masakan.lama_pembuatan <= time_to_sec(datediff(now(),detil_isi_dapur.jam_mulai_masak));
    
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_diff_second` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_diff_second` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_diff_second`(`p_idmasakan` INT, `p_id_player` INT, `p_nomorkompor` INT)
BEGIN
	set @lama = (select lama_pembuatan from masakan where id_masakan = p_idmasakan);
	set @waktu = (select jam_mulai_masak from detil_isi_dapur where idchef = p_id_player and nomor_kompor = p_nomorkompor);
	set @diff = time_to_sec(datediff(@waktu, now()));
	select @diff as diff, @waktu;
          
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_edit_password` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_edit_password` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_edit_password`(`p_username` VARCHAR(20), `p_newpassword` VARCHAR(50), `p_oldpassword` VARCHAR(50))
BEGIN
	if exists(select 1 from player where username = p_username and password = md5(p_oldpassword)) then
		update player
		set password = md5(p_newpassword)
		where username = p_username and password = md5(p_oldpassword);
		select 1, 'ubah password berhasil';
	else
		select 0, 'old password salah';
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_jual_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_jual_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_jual_bahan`(`p_idbahan` INT, `p_idplayer` INT)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_jual_masakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_jual_masakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_jual_masakan`(`p_idmasakan` INT, `p_idplayer` INT)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_list_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_list_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bahan`(IN `p_idmasakan` INT)
    NO SQL
select * from bahan cross join detil_bahan_masakan
where detil_bahan_masakan.idmasakan = p_idmasakan and detil_bahan_masakan.idbahan = bahan.idbahan */$$
DELIMITER ;

/* Procedure structure for procedure `sp_login_player` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_login_player` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_player`(IN `p_username` VARCHAR(45), IN `p_password` VARCHAR(100))
BEGIN
	IF EXISTS(SELECT 1 FROM `player` 
		where `username`=p_username and `password`= md5(p_password)) THEN
		update `player` set `last_login` = now() where `username` = p_username;
		SELECT * from player where username = p_username;
	ELSE
		SELECT -1 as error, "maaf username / password tidak dikenal";
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_player_rank` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_player_rank` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`vkvxweok_mbd2018`@`localhost` PROCEDURE `sp_player_rank`()
BEGIN
	select `username`,`money` from `player` order by `money` desc,`username` asc;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_register_player` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_register_player` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_register_player`(IN `p_username` VARCHAR(20), IN `p_fullname` VARCHAR(45), IN `p_email` VARCHAR(45), IN `p_password` VARCHAR(100))
BEGIN
	if not exists (select 1 from `player` where `email`=p_email) and not exists (select 1 from `player` where `username`=p_username) then
		insert into `player`(`username`,`fullname`,`email`,`password`)
		values (p_username,p_fullname,p_email,md5(p_password));
		select 1, "Registration success! Login to continue";
	else
		select -1 as error, "Failure! Email already used.";
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_show_dapur` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_show_dapur` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_dapur`(IN `p_id_player` INT)
    NO SQL
select * from detil_isi_dapur where idchef = p_id_player */$$
DELIMITER ;

/* Procedure structure for procedure `sp_show_masakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_show_masakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_masakan`()
    NO SQL
select * from masakan */$$
DELIMITER ;

/* Procedure structure for procedure `sp_show_nama_masakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_show_nama_masakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_nama_masakan`(IN `p_idmasakan` INT)
    NO SQL
select nama_masakan from masakan where id_masakan = p_idmasakan */$$
DELIMITER ;

/* Procedure structure for procedure `sp_update_dapur_dan_masakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_update_dapur_dan_masakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_dapur_dan_masakan`(`p_id_player` INT, `p_no_kompor` INT)
BEGIN
	set @id = (select idmasakan from detil_isi_dapur where idchef = p_id_player and nomor_kompor = p_no_kompor);
    update detil_chef_masakan set jumlah = (select jumlah from detil_isi_dapur where idchef = p_id_player and nomor_kompor = p_no_kompor) +1
    where idchef = p_id_player and nomor_kompor = p_no_kompor;
	delete from detil_isi_dapur where idchef = p_id_player and nomor_kompor = p_no_kompor;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_update_detil_chef_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_update_detil_chef_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_detil_chef_bahan`(`ukuran` INT, `p_id_player` INT, `p_id_bahan` INT)
BEGIN
	set @jumlahbahan = (select jumlah from detil_chef_bahan where idplayer=p_id_player and idbahan = p_id_bahan);
    update detil_chef_bahan set jumlah = @jumlahbahan - ukuran where idplayer=p_id_player and idbahan = p_id_bahan;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_update_harga_beli_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_update_harga_beli_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_harga_beli_bahan`(`p_id_bahan` INT)
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
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_update_harga_jual_bahan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_update_harga_jual_bahan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_harga_jual_bahan`(`p_id_bahan` INT)
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
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_update_harga_masakan` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_update_harga_masakan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_harga_masakan`(`p_id_masakan` INT)
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
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
