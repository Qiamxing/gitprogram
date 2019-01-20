-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: dr
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add goods',8,'add_goods'),(23,'Can change goods',8,'change_goods'),(24,'Can delete goods',8,'delete_goods'),(25,'Can add allimg',9,'add_allimg'),(26,'Can change allimg',9,'change_allimg'),(27,'Can delete allimg',9,'delete_allimg'),(28,'Can add goodslist',10,'add_goodslist'),(29,'Can change goodslist',10,'change_goodslist'),(30,'Can delete goodslist',10,'delete_goodslist'),(31,'Can add goodsimg',11,'add_goodsimg'),(32,'Can change goodsimg',11,'change_goodsimg'),(33,'Can delete goodsimg',11,'delete_goodsimg'),(34,'Can add cart',12,'add_cart'),(35,'Can change cart',12,'change_cart'),(36,'Can delete cart',12,'delete_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(9,'dr','allimg'),(12,'dr','cart'),(8,'dr','goods'),(11,'dr','goodsimg'),(10,'dr','goodslist'),(7,'dr','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-10 14:49:24.822619'),(2,'auth','0001_initial','2019-01-10 14:49:27.749347'),(3,'admin','0001_initial','2019-01-10 14:49:28.157174'),(4,'admin','0002_logentry_remove_auto_add','2019-01-10 14:49:28.208930'),(5,'contenttypes','0002_remove_content_type_name','2019-01-10 14:49:28.398080'),(6,'auth','0002_alter_permission_name_max_length','2019-01-10 14:49:28.643130'),(7,'auth','0003_alter_user_email_max_length','2019-01-10 14:49:28.855620'),(8,'auth','0004_alter_user_username_opts','2019-01-10 14:49:28.886860'),(9,'auth','0005_alter_user_last_login_null','2019-01-10 14:49:28.984174'),(10,'auth','0006_require_contenttypes_0002','2019-01-10 14:49:28.989862'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-10 14:49:29.010082'),(12,'auth','0008_alter_user_username_max_length','2019-01-10 14:49:29.173541'),(13,'sessions','0001_initial','2019-01-10 14:49:29.257983'),(14,'dr','0001_initial','2019-01-10 14:52:33.990604'),(15,'dr','0002_auto_20190110_1534','2019-01-10 15:34:44.891927'),(16,'dr','0003_goods','2019-01-12 08:56:28.385371'),(17,'dr','0004_allimg','2019-01-12 09:09:04.187413'),(18,'dr','0005_auto_20190112_1406','2019-01-12 14:06:38.042236'),(19,'dr','0006_auto_20190112_1439','2019-01-12 14:39:18.153279'),(20,'dr','0007_auto_20190112_1504','2019-01-12 15:04:55.255591'),(21,'dr','0008_auto_20190114_0910','2019-01-14 09:10:46.938071'),(22,'dr','0009_auto_20190114_0913','2019-01-14 09:13:21.022217'),(23,'dr','0010_auto_20190115_0907','2019-01-15 09:07:36.938100'),(24,'dr','0011_auto_20190115_0923','2019-01-15 09:24:01.335415'),(25,'dr','0012_auto_20190116_0857','2019-01-16 08:57:36.023190');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lkgtfu0izt8700f23ojz2hhzyu12loir','N2RjNmZmZjgyNDE5NmZkOGRjNjM5ZGQwM2YzMjcxNzc0Y2FhY2Q5Yjp7InRva2VuIjoiZWJiNzlmMGZkZGU2Nzc0ZDA2YTYxZTdkZTRmYjU5ZjQifQ==','2019-01-30 09:39:22.992900');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_allimg`
--

DROP TABLE IF EXISTS `dr_allimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_allimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dr_allimg_goods_id_6b756ca3_fk_dr_goods_id` (`goods_id`),
  CONSTRAINT `dr_allimg_goods_id_6b756ca3_fk_dr_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `dr_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_allimg`
--

LOCK TABLES `dr_allimg` WRITE;
/*!40000 ALTER TABLE `dr_allimg` DISABLE KEYS */;
INSERT INTO `dr_allimg` VALUES (1,'477065b454fe49369e925ebe7cea84d6.gif','static/477065b454fe49369e925ebe7cea84d6.gif',NULL),(2,'20160512095855640aba3b23.jpg','static/20160512095855640aba3b23.jpg',NULL),(3,'drlogo.png','static/drlogo.png',NULL),(4,'1474875797.jpg','static/1474875797.jpg',NULL),(5,'2015093019140361614ead1d.jpg','static/2015093019140361614ead1d.jpg',NULL),(6,'br_right.png','static/br_right.png',NULL),(7,'drimg.jpg','static/drimg.jpg',NULL),(8,'invitebg.jpg','static/invitebg.jpg',NULL),(9,'login2.jpg','static/login2.jpg',NULL),(10,'yzts_word.png','static/yzts_word.png',NULL),(11,'2015092819013563a1e7c5d7.jpg','static/2015092819013563a1e7c5d7.jpg',NULL),(12,'navright1.jpg','static/navright1.jpg',NULL),(13,'yzts_wrong.png','static/yzts_wrong.png',NULL),(14,'20141211170306c60c5d8029.jpg','static/20141211170306c60c5d8029.jpg',NULL),(15,'server2.png','static/server2.png',NULL),(16,'20160728121853501133b1c9.jpg','static/20160728121853501133b1c9.jpg',NULL),(17,'cxit.jpg','static/cxit.jpg',NULL),(18,'com.jpg','static/com.jpg',NULL),(19,'20150928184958b148a531bc.jpg','static/20150928184958b148a531bc.jpg',NULL),(20,'foot-servise_hover.png','static/foot-servise_hover.png',NULL),(21,'nav_rp.jpg','static/nav_rp.jpg',NULL),(22,'20150129114316f8a2465758.jpg','static/20150129114316f8a2465758.jpg',NULL),(23,'black_icon.png','static/black_icon.png',NULL),(24,'20140902094335966c32bf74.jpg','static/20140902094335966c32bf74.jpg',NULL),(25,'zhdarryjewelryf15002_1.jpg','static/zhdarryjewelryf15002_1.jpg',NULL),(26,'all-right_w.png','static/all-right_w.png',NULL),(27,'cxit_click.jpg','static/cxit_click.jpg',NULL),(28,'2016051209532043fae2bfab.jpg','static/2016051209532043fae2bfab.jpg',NULL),(29,'toporb.png','static/toporb.png',NULL),(30,'mb.png','static/mb.png',NULL),(31,'2016051209514975606370b9.jpg','static/2016051209514975606370b9.jpg',NULL),(32,'ico-sata.gif','static/ico-sata.gif',NULL),(33,'drword.png','static/drword.png',NULL),(34,'checkdt.jpg','static/checkdt.jpg',NULL),(35,'20160819143418d45968d484.jpg','static/20160819143418d45968d484.jpg',NULL),(36,'footer_rp.jpg','static/footer_rp.jpg',NULL),(37,'2016052414305878c82bc1be.jpg','static/2016052414305878c82bc1be.jpg',NULL),(38,'201409031259093e45b5ecf0.jpg','static/201409031259093e45b5ecf0.jpg',NULL),(39,'black_icon (1).png','static/black_icon (1).png',NULL),(40,'20150930191409893f12c808.jpg','static/20150930191409893f12c808.jpg',NULL),(41,'share.png','static/share.png',NULL),(42,'sx_hover.jpg','static/sx_hover.jpg',NULL),(43,'20160512095220956ee71323.jpg','static/20160512095220956ee71323.jpg',NULL),(44,'ylxg.jpg','static/ylxg.jpg',NULL),(45,'icon_servie.png','static/icon_servie.png',NULL),(46,'drsq2.jpg','static/drsq2.jpg',NULL),(47,'20160620101350d2f9fcb5a8.jpg','static/20160620101350d2f9fcb5a8.jpg',NULL),(48,'right_d.png','static/right_d.png',NULL),(49,'right-hover.png','static/right-hover.png',NULL),(50,'20160823113711835d67b5f6.jpg','static/20160823113711835d67b5f6.jpg',NULL),(51,'ew_sx.jpg','static/ew_sx.jpg',NULL),(52,'new.jpg','static/new.jpg',NULL),(53,'rightbig.png','static/rightbig.png',NULL),(54,'sgjn_tc.jpg','static/sgjn_tc.jpg',NULL),(55,'icon_lt.png','static/icon_lt.png',NULL),(56,'ttcloese.png','static/ttcloese.png',NULL),(57,'201509301425347b86245a0e.jpg','static/201509301425347b86245a0e.jpg',NULL),(58,'20150930142541594d0d7e3e.jpg','static/20150930142541594d0d7e3e.jpg',NULL),(59,'2015012912125452b30a7236.jpg','static/2015012912125452b30a7236.jpg',NULL),(60,'bd.png','static/bd.png',NULL),(61,'fd_hover.jpg','static/fd_hover.jpg',NULL),(62,'leftorr.png','static/leftorr.png',NULL),(63,'sbg1.jpg','static/sbg1.jpg',NULL),(64,'sx.jpg','static/sx.jpg',NULL),(65,'all-right.png','static/all-right.png',NULL),(66,'ico-otherLogin.png','static/ico-otherLogin.png',NULL),(67,'dzzx_hover.jpg','static/dzzx_hover.jpg',NULL),(68,'sxkf_hover.jpg','static/sxkf_hover.jpg',NULL),(69,'20160512095039a409d80aac.jpg','static/20160512095039a409d80aac.jpg',NULL),(70,'a_hover.jpg','static/a_hover.jpg',NULL),(71,'sm_boreder.png','static/sm_boreder.png',NULL),(72,'20160728121840df1dceaa07.jpg','static/20160728121840df1dceaa07.jpg',NULL),(73,'icon_store.png','static/icon_store.png',NULL),(74,'dr.png','static/dr.png',NULL),(75,'mobile.png','static/mobile.png',NULL),(76,'201609061049005f2727dc35.jpg','static/201609061049005f2727dc35.jpg',NULL),(77,'2016-1.jpg','static/2016-1.jpg',NULL),(78,'thing_left.png','static/thing_left.png',NULL),(79,'ring5.jpg','static/ring5.jpg',NULL),(80,'server1.png','static/server1.png',NULL),(81,'201603301519256b9cccee8f.jpg','static/201603301519256b9cccee8f.jpg',NULL),(82,'201605241429181230fbb4e0.jpg','static/201605241429181230fbb4e0.jpg',NULL),(83,'right_line.jpg','static/right_line.jpg',NULL),(84,'totop.jpg','static/totop.jpg',NULL),(85,'2016051209485721e5c3298a.jpg','static/2016051209485721e5c3298a.jpg',NULL),(86,'server3.png','static/server3.png',NULL),(87,'dzzx.jpg','static/dzzx.jpg',NULL),(88,'all-right_y.png','static/all-right_y.png',NULL),(89,'word_right.png','static/word_right.png',NULL),(90,'2014092610543039082c76fd.jpg','static/2014092610543039082c76fd.jpg',NULL),(91,'wr_left.png','static/wr_left.png',NULL),(92,'drstorebg.jpg','static/drstorebg.jpg',NULL),(93,'close_hover.jpg','static/close_hover.jpg',NULL),(94,'201608311843081518eaf9ad.jpg','static/201608311843081518eaf9ad.jpg',NULL),(95,'propose_leftbg.jpg','static/propose_leftbg.jpg',NULL),(96,'navleft1.jpg','static/navleft1.jpg',NULL),(97,'kfu.gif','static/kfu.gif',NULL),(98,'20150930190558ba3bac51e0.jpg','static/20150930190558ba3bac51e0.jpg',NULL),(99,'201603151634299c0c326cab.jpg','static/201603151634299c0c326cab.jpg',NULL),(100,'fhdb.jpg','static/fhdb.jpg',NULL),(101,'shopmap.jpg','static/shopmap.jpg',NULL),(102,'20150928185451092acd12d8.jpg','static/20150928185451092acd12d8.jpg',NULL),(103,'otherLoginHr.png','static/otherLoginHr.png',NULL),(104,'201609281803296c71b4bfd6.jpg','static/201609281803296c71b4bfd6.jpg',NULL),(105,'20160512095257112c7093f6.jpg','static/20160512095257112c7093f6.jpg',NULL),(106,'2016-2.jpg','static/2016-2.jpg',NULL),(107,'ico-uinput.png','static/ico-uinput.png',NULL),(108,'shkf.png','static/shkf.png',NULL),(109,'2016-4.jpg','static/2016-4.jpg',NULL),(110,'next.png','static/next.png',NULL),(111,'thing_right.png','static/thing_right.png',NULL),(112,'201605120951586404e36dd9.jpg','static/201605120951586404e36dd9.jpg',NULL),(113,'sxkf.jpg','static/sxkf.jpg',NULL),(114,'server5.png','static/server5.png',NULL),(115,'subnav_line.png','static/subnav_line.png',NULL),(116,'sm_repeat.png','static/sm_repeat.png',NULL),(117,'nexthover.png','static/nexthover.png',NULL),(118,'kfu_hover.jpg','static/kfu_hover.jpg',NULL),(119,'topnav.jpg','static/topnav.jpg',NULL),(120,'ques.jpg','static/ques.jpg',NULL),(121,'tc_border.png','static/tc_border.png',NULL),(122,'drz.png','static/drz.png',NULL),(123,'20160512095117bbc8c337e8.jpg','static/20160512095117bbc8c337e8.jpg',NULL),(124,'hover.jpg','static/hover.jpg',NULL),(125,'2016081011165194412bb2d4.jpg','static/2016081011165194412bb2d4.jpg',NULL),(126,'tc_close.png','static/tc_close.png',NULL),(127,'2016-5.jpg','static/2016-5.jpg',NULL),(128,'20160512095109a18882e57d.jpg','static/20160512095109a18882e57d.jpg',NULL),(129,'nav_rp.png','static/nav_rp.png',NULL),(130,'dr_star_bg.jpg','static/dr_star_bg.jpg',NULL),(131,'mask.jpg','static/mask.jpg',NULL),(132,'20160330151910e264570ec2.jpg','static/20160330151910e264570ec2.jpg',NULL),(133,'ico-bannerbtn.png','static/ico-bannerbtn.png',NULL),(134,'erwei.png','static/erwei.png',NULL),(135,'word_left.png','static/word_left.png',NULL),(136,'201605120958480a5eaf9319.jpg','static/201605120958480a5eaf9319.jpg',NULL),(137,'bottom.png','static/bottom.png',NULL),(138,'icon_footer.png','static/icon_footer.png',NULL),(139,'server6.png','static/server6.png',NULL),(140,'Darry Ring(DR真爱戒指)戴瑞珠宝官方网站   求婚钻戒领导品牌.png','static/Darry Ring(DR真爱戒指)戴瑞珠宝官方网站   求婚钻戒领导品牌.png',NULL),(141,'201510211002457eb68c35c3.jpg','static/201510211002457eb68c35c3.jpg',NULL),(142,'20160512095843e410458e7d.jpg','static/20160512095843e410458e7d.jpg',NULL),(143,'201609281803564c831acceb.jpg','static/201609281803564c831acceb.jpg',NULL),(144,'other_border.png','static/other_border.png',NULL),(145,'wb.jpg','static/wb.jpg',NULL),(146,'serv.jpg','static/serv.jpg',NULL),(147,'tel.png','static/tel.png',NULL),(148,'2015081318151576e08c7f5c.jpg','static/2015081318151576e08c7f5c.jpg',NULL),(149,'prehover.png','static/prehover.png',NULL),(150,'ew.jpg','static/ew.jpg',NULL),(151,'close.jpg','static/close.jpg',NULL),(152,'2014082814203071a0d2f4c6.jpg','static/2014082814203071a0d2f4c6.jpg',NULL),(153,'quanguo.jpg','static/quanguo.jpg',NULL),(154,'jiathis_ico.png','static/jiathis_ico.png',NULL),(155,'20160627123305305802dde0.jpg','static/20160627123305305802dde0.jpg',NULL),(156,'buy.jpg','static/buy.jpg',NULL),(157,'201409011559313d34c1c807.jpg','static/201409011559313d34c1c807.jpg',NULL),(158,'kzyl.jpg','static/kzyl.jpg',NULL),(159,'icon_star.png','static/icon_star.png',NULL),(160,'pre.png','static/pre.png',NULL),(161,'20150714152021089c7e0a27.jpg','static/20150714152021089c7e0a27.jpg',NULL),(162,'show_rp.jpg','static/show_rp.jpg',NULL),(163,'ico-shopmapjt.jpg','static/ico-shopmapjt.jpg',NULL),(164,'20150930142538cbe03e4608.jpg','static/20150930142538cbe03e4608.jpg',NULL),(165,'c3.jpg','static/c3.jpg',NULL),(166,'20160512094941cf1ef5093c.jpg','static/20160512094941cf1ef5093c.jpg',NULL),(167,'shoop_nav.jpg','static/shoop_nav.jpg',NULL),(168,'kfhelp.png','static/kfhelp.png',NULL),(169,'201605241430124b8d8f7d11.jpg','static/201605241430124b8d8f7d11.jpg',NULL),(170,'counter.gif','static/counter.gif',NULL),(171,'201601231615193fbf3ca618.jpg','static/201601231615193fbf3ca618.jpg',NULL),(172,'c1.jpg','static/c1.jpg',NULL),(173,'server4.png','static/server4.png',NULL),(174,'ewm.jpg','static/ewm.jpg',NULL),(175,'20160315163555a3b5127646.jpg','static/20160315163555a3b5127646.jpg',NULL),(176,'201605120952284ff4210942.jpg','static/201605120952284ff4210942.jpg',NULL),(177,'telleft.png','static/telleft.png',NULL),(178,'20160512095047199bfd25e1.jpg','static/20160512095047199bfd25e1.jpg',NULL),(179,'icon_ring.png','static/icon_ring.png',NULL),(180,'201608311843081518eaf9ad (1).jpg','static/201608311843081518eaf9ad (1).jpg',NULL),(181,'mobile_hover.png','static/mobile_hover.png',NULL),(182,'onelife.png','static/onelife.png',NULL),(183,'bc.png','static/bc.png',NULL),(184,'20141208151441cc5ac80d54.jpg','static/20141208151441cc5ac80d54.jpg',NULL),(185,'icon-right.png','static/icon-right.png',NULL),(186,'lright.jpg','static/lright.jpg',NULL),(187,'invitehead.jpg','static/invitehead.jpg',NULL),(188,'201609281804056706a5a051.jpg','static/201609281804056706a5a051.jpg',NULL),(189,'ico-shares.png','static/ico-shares.png',NULL),(190,'ring_bottom.png','static/ring_bottom.png',NULL),(191,'20150129121254e8cdb1d2f7.jpg','static/20150129121254e8cdb1d2f7.jpg',NULL),(192,'pinktkbg.jpg','static/pinktkbg.jpg',NULL),(193,'bigClose.jpg','static/bigClose.jpg',NULL),(194,'2014082814202901a716bf7e.jpg','static/2014082814202901a716bf7e.jpg',NULL),(195,'phone.png','static/phone.png',NULL),(196,'ipbt.png','static/ipbt.png',NULL),(197,'small_tb.png','static/small_tb.png',NULL),(198,'close.png','static/close.png',NULL),(199,'1474875710.jpg','static/1474875710.jpg',NULL),(200,'zhdarryjewelryf15008_1.jpg','static/zhdarryjewelryf15008_1.jpg',NULL),(201,'hkshop.jpg','static/hkshop.jpg',NULL),(202,'sxzx_hover.jpg','static/sxzx_hover.jpg',NULL),(203,'small_right.png','static/small_right.png',NULL),(204,'2016051209512422c8708f84.jpg','static/2016051209512422c8708f84.jpg',NULL),(205,'xianggang.jpg','static/xianggang.jpg',NULL),(206,'line1.jpg','static/line1.jpg',NULL),(207,'app_ewm.jpg','static/app_ewm.jpg',NULL),(208,'20160928180337d87ca7cc07.jpg','static/20160928180337d87ca7cc07.jpg',NULL),(209,'2016060811463267ab8fc9ed.jpg','static/2016060811463267ab8fc9ed.jpg',NULL),(210,'201606081245596f6d33321d.jpg','static/201606081245596f6d33321d.jpg',NULL),(211,'20150930191406bc384fe971.jpg','static/20150930191406bc384fe971.jpg',NULL),(212,'ok_right.png','static/ok_right.png',NULL),(213,'bk_border.png','static/bk_border.png',NULL),(214,'qq.jpg','static/qq.jpg',NULL),(215,'2016-3.jpg','static/2016-3.jpg',NULL),(216,'2014090312590972b221c6ce.jpg','static/2014090312590972b221c6ce.jpg',NULL),(217,'gdbk.jpg','static/gdbk.jpg',NULL),(218,'201605120949135df716e519.jpg','static/201605120949135df716e519.jpg',NULL),(219,'footer_top.jpg','static/footer_top.jpg',NULL),(220,'sxzx.jpg','static/sxzx.jpg',NULL),(221,'201603301518557a6da101e1.jpg','static/201603301518557a6da101e1.jpg',NULL),(222,'line.jpg','static/line.jpg',NULL),(223,'201605120952411b98144db4.jpg','static/201605120952411b98144db4.jpg',NULL),(224,'counter (1).gif','static/counter (1).gif',NULL),(225,'2015093019140702298d7dbb.jpg','static/2015093019140702298d7dbb.jpg',NULL),(226,'twolife.png','static/twolife.png',NULL),(227,'2016092818034975f9aa98cb.jpg','static/2016092818034975f9aa98cb.jpg',NULL),(228,'db.jpg','static/db.jpg',NULL),(229,'bt-repeat.jpg','static/bt-repeat.jpg',NULL),(230,'wrong.png','static/wrong.png',NULL),(231,'201605120952105afa109cae.jpg','static/201605120952105afa109cae.jpg',NULL),(232,'201605120948477f3b77aceb.jpg','static/201605120948477f3b77aceb.jpg',NULL),(233,'2016060812454522d7889f26.jpg','static/2016060812454522d7889f26.jpg',NULL),(234,'zxkf.gif','static/zxkf.gif',NULL),(235,'201408281420302f3c12ebd5.jpg','static/201408281420302f3c12ebd5.jpg',NULL),(236,'zfgn.jpg','static/zfgn.jpg',NULL),(237,'chongq.jpg','static/chongq.jpg',NULL),(238,'fd.jpg','static/fd.jpg',NULL),(239,'3.gif','static/3.gif',NULL),(240,'close_sgjn.png','static/close_sgjn.png',NULL),(241,'20160825163827930454352b.jpg','static/20160825163827930454352b.jpg',NULL),(242,'nav_rp1.png','static/nav_rp1.png',NULL),(243,'20160614145147c1de1b568e.jpg','static/20160614145147c1de1b568e.jpg',NULL),(244,'20160315163352419be5697c.jpg','static/20160315163352419be5697c.jpg',NULL),(245,'20151009171038c099446b09 (1).jpg','static/20151009171038c099446b09 (1).jpg',NULL),(246,'logo.png','static/logo.png',NULL),(247,'love-it.jpg','static/love-it.jpg',NULL),(248,'login.jpg','static/login.jpg',NULL),(249,'new.png','static/new.png',NULL),(250,'icon.png','static/icon.png',NULL),(251,'yz_ts.png','static/yz_ts.png',NULL),(252,'201609281803202339dedb30.jpg','static/201609281803202339dedb30.jpg',NULL),(253,'foot-servise.png','static/foot-servise.png',NULL),(254,'ico-pagin.png','static/ico-pagin.png',NULL),(255,'20140926105350c9c16868be.jpg','static/20140926105350c9c16868be.jpg',NULL),(256,'fhdb_hover.jpg','static/fhdb_hover.jpg',NULL),(257,'bk_all.png','static/bk_all.png',NULL),(258,'20150930142250b083bc9f9f.jpg','static/20150930142250b083bc9f9f.jpg',NULL),(259,'shopicon.png','static/shopicon.png',NULL),(260,'bread_right.png','static/bread_right.png',NULL),(261,'201605120953093a1e532a95.jpg','static/201605120953093a1e532a95.jpg',NULL),(262,'201502061050359c37df606b.jpg','static/201502061050359c37df606b.jpg',NULL),(263,'getCodeBtn.png','static/getCodeBtn.png',NULL),(264,'icon_yleft.png','static/icon_yleft.png',NULL),(265,'22.jpg','static/22.jpg',NULL),(266,'20151009171038c099446b09.jpg','static/20151009171038c099446b09.jpg',NULL),(267,'leftbig.png','static/leftbig.png',NULL),(268,'tc_close.jpg','static/tc_close.jpg',NULL),(269,'line.png','static/line.png',NULL),(270,'20140903125910f4a940ed90.jpg','static/20140903125910f4a940ed90.jpg',NULL),(271,'icon_yright.png','static/icon_yright.png',NULL),(272,'20160512095001919b72a4d1.jpg','static/20160512095001919b72a4d1.jpg',NULL),(273,'coin_left.png','static/coin_left.png',NULL),(274,'countdownbg.png','static/countdownbg.png',NULL),(275,'sqkef.png','static/sqkef.png',NULL),(276,'ico-error.png','static/ico-error.png',NULL),(277,'201605120949525d78060c25.jpg','static/201605120949525d78060c25.jpg',NULL),(278,'201608311855480a2e0c2951.jpg','static/201608311855480a2e0c2951.jpg',NULL),(279,'20160825163827930454352b (1).jpg','static/20160825163827930454352b (1).jpg',NULL),(280,'c2.jpg','static/c2.jpg',NULL);
/*!40000 ALTER TABLE `dr_allimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_cart`
--

DROP TABLE IF EXISTS `dr_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dr_cart_goods_id_4b765046_fk_dr_goodslist_id` (`goods_id`),
  KEY `dr_cart_user_id_167dea14_fk_dr_user_id` (`user_id`),
  CONSTRAINT `dr_cart_goods_id_4b765046_fk_dr_goodslist_id` FOREIGN KEY (`goods_id`) REFERENCES `dr_goodslist` (`id`),
  CONSTRAINT `dr_cart_user_id_167dea14_fk_dr_user_id` FOREIGN KEY (`user_id`) REFERENCES `dr_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_cart`
--

LOCK TABLES `dr_cart` WRITE;
/*!40000 ALTER TABLE `dr_cart` DISABLE KEYS */;
INSERT INTO `dr_cart` VALUES (1,2,2,1),(2,1,4,1);
/*!40000 ALTER TABLE `dr_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_goods`
--

DROP TABLE IF EXISTS `dr_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_goods`
--

LOCK TABLES `dr_goods` WRITE;
/*!40000 ALTER TABLE `dr_goods` DISABLE KEYS */;
INSERT INTO `dr_goods` VALUES (4,'images/20141211170306c60c5d8029.jpg',17154,103),(5,'images/20150928184958b148a531bc.jpg',13279,191),(6,'images/20150129114316f8a2465758.jpg',14319,112),(7,'images/201409031259093e45b5ecf0.jpg',19893,134),(8,'images/20160620101350d2f9fcb5a8.jpg',18895,181),(9,'images/20160512095039a409d80aac.jpg',17576,175),(10,'images/20160728121840df1dceaa07.jpg',13716,120),(11,'images/20150930190558ba3bac51e0.jpg',17555,143),(12,'images/20160330151910e264570ec2.jpg',17993,113),(13,'images/20160512095843e410458e7d.jpg',17012,143),(14,'images/201409011559313d34c1c807.jpg',14512,177),(15,'images/20150930142538cbe03e4608.jpg',18312,138),(16,'images/20160512094941cf1ef5093c.jpg',17095,143),(17,'images/20160315163555a3b5127646.jpg',13681,165),(18,'images/20141208151441cc5ac80d54.jpg',14525,163),(19,'images/20150129121254e8cdb1d2f7.jpg',10896,119),(20,'images/20150930191406bc384fe971.jpg',14486,139),(21,'images/201408281420302f3c12ebd5.jpg',14436,184),(22,'images/20160614145147c1de1b568e.jpg',14443,157),(23,'images/20140926105350c9c16868be.jpg',10288,109),(24,'images/20150930142250b083bc9f9f.jpg',12820,160),(25,'images/201502061050359c37df606b.jpg',10150,156),(26,'images/20140903125910f4a940ed90.jpg',16143,115);
/*!40000 ALTER TABLE `dr_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_goods_user`
--

DROP TABLE IF EXISTS `dr_goods_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_goods_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dr_goods_user_goods_id_user_id_6ae9597d_uniq` (`goods_id`,`user_id`),
  KEY `dr_goods_user_user_id_63afc0f8_fk_dr_user_id` (`user_id`),
  CONSTRAINT `dr_goods_user_goods_id_70a2447c_fk_dr_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `dr_goods` (`id`),
  CONSTRAINT `dr_goods_user_user_id_63afc0f8_fk_dr_user_id` FOREIGN KEY (`user_id`) REFERENCES `dr_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_goods_user`
--

LOCK TABLES `dr_goods_user` WRITE;
/*!40000 ALTER TABLE `dr_goods_user` DISABLE KEYS */;
INSERT INTO `dr_goods_user` VALUES (2,4,1),(3,5,1),(4,7,1),(1,8,1);
/*!40000 ALTER TABLE `dr_goods_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_goodsimg`
--

DROP TABLE IF EXISTS `dr_goodsimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_goodsimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(100) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dr_goodsimg_goods_id_83f280bb_fk_dr_goodslist_id` (`goods_id`),
  CONSTRAINT `dr_goodsimg_goods_id_83f280bb_fk_dr_goodslist_id` FOREIGN KEY (`goods_id`) REFERENCES `dr_goodslist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_goodsimg`
--

LOCK TABLES `dr_goodsimg` WRITE;
/*!40000 ALTER TABLE `dr_goodsimg` DISABLE KEYS */;
INSERT INTO `dr_goodsimg` VALUES (1,'images/2016060812454522d7889f26.jpg',1),(2,'images/201509301425347b86245a0e.jpg',1),(3,'images/201603301519256b9cccee8f.jpg',1),(4,'images/20160620101350d2f9fcb5a8.jpg',1),(5,'images/2015081318151576e08c7f5c.jpg',2),(6,'images/201509301425347b86245a0e.jpg',2),(7,'images/201603301519256b9cccee8f.jpg',2),(8,'images/20160620101350d2f9fcb5a8.jpg',2),(9,'images/201502061050359c37df606b.jpg',3),(10,'images/201509301425347b86245a0e.jpg',3),(11,'images/201603301519256b9cccee8f.jpg',3),(12,'images/20160620101350d2f9fcb5a8.jpg',3),(13,'images/2014090312590972b221c6ce.jpg',4),(14,'images/201509301425347b86245a0e.jpg',4),(15,'images/201603301519256b9cccee8f.jpg',4),(16,'images/20160620101350d2f9fcb5a8.jpg',4),(17,'images/201502061050359c37df606b.jpg',5),(18,'images/201509301425347b86245a0e.jpg',5),(19,'images/201603301519256b9cccee8f.jpg',5),(20,'images/20160620101350d2f9fcb5a8.jpg',5),(21,'images/20141208151441cc5ac80d54.jpg',6),(22,'images/201509301425347b86245a0e.jpg',6),(23,'images/201603301519256b9cccee8f.jpg',6),(24,'images/201601231615193fbf3ca618.jpg',6),(25,'images/201502061050359c37df606b.jpg',7),(26,'images/201509301425347b86245a0e.jpg',7),(27,'images/201603301519256b9cccee8f.jpg',7),(28,'images/20160620101350d2f9fcb5a8.jpg',7),(29,'images/2014090312590972b221c6ce.jpg',8),(30,'images/201509301425347b86245a0e.jpg',8),(31,'images/201603301519256b9cccee8f.jpg',8),(32,'images/20160620101350d2f9fcb5a8.jpg',8),(33,'images/201502061050359c37df606b.jpg',9),(34,'images/201509301425347b86245a0e.jpg',9),(35,'images/201603301519256b9cccee8f.jpg',9),(36,'images/20160620101350d2f9fcb5a8.jpg',9),(37,'images/201606081245596f6d33321d.jpg',10),(38,'images/201509301425347b86245a0e.jpg',10),(39,'images/201603301519256b9cccee8f.jpg',10),(40,'images/20160620101350d2f9fcb5a8.jpg',10),(41,'images/20140902094335966c32bf74.jpg',11),(42,'images/201509301425347b86245a0e.jpg',11),(43,'images/201603301519256b9cccee8f.jpg',11),(44,'images/20160620101350d2f9fcb5a8.jpg',11),(45,'images/20141208151441cc5ac80d54.jpg',12),(46,'images/201509301425347b86245a0e.jpg',12),(47,'images/201603301519256b9cccee8f.jpg',12),(48,'images/20160620101350d2f9fcb5a8.jpg',12),(49,'images/20141208151441cc5ac80d54.jpg',13),(50,'images/201509301425347b86245a0e.jpg',13),(51,'images/201603301519256b9cccee8f.jpg',13),(52,'images/20160620101350d2f9fcb5a8.jpg',13),(53,'images/2015081318151576e08c7f5c.jpg',14),(54,'images/201509301425347b86245a0e.jpg',14),(55,'images/201603301519256b9cccee8f.jpg',14),(56,'images/20160620101350d2f9fcb5a8.jpg',14),(57,'images/20140902094335966c32bf74.jpg',15),(58,'images/201509301425347b86245a0e.jpg',15),(59,'images/201603301519256b9cccee8f.jpg',15),(60,'images/20160620101350d2f9fcb5a8.jpg',15),(61,'images/2014090312590972b221c6ce.jpg',16),(62,'images/201509301425347b86245a0e.jpg',16),(63,'images/201603301519256b9cccee8f.jpg',16),(64,'images/20160620101350d2f9fcb5a8.jpg',16),(65,'images/201502061050359c37df606b.jpg',17),(66,'images/201509301425347b86245a0e.jpg',17),(67,'images/201603301519256b9cccee8f.jpg',17),(68,'images/20160620101350d2f9fcb5a8.jpg',17),(69,'images/201409031259093e45b5ecf0.jpg',18),(70,'images/201509301425347b86245a0e.jpg',18),(71,'images/201603301519256b9cccee8f.jpg',18),(72,'images/20160620101350d2f9fcb5a8.jpg',18);
/*!40000 ALTER TABLE `dr_goodsimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_goodslist`
--

DROP TABLE IF EXISTS `dr_goodslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_goodslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` varchar(10) NOT NULL,
  `src` varchar(100) NOT NULL,
  `discript` varchar(100) NOT NULL,
  `sale` int(11) NOT NULL,
  `com` int(11) NOT NULL,
  `material1` varchar(10) NOT NULL,
  `material2` varchar(10) NOT NULL,
  `price1` int(11) NOT NULL,
  `price2` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_goodslist`
--

LOCK TABLES `dr_goodslist` WRITE;
/*!40000 ALTER TABLE `dr_goodslist` DISABLE KEYS */;
INSERT INTO `dr_goodslist` VALUES (1,'黑骑士','9999','images/2016060812454522d7889f26.jpg','TRUE LOVE系列 典雅 40分 F色',1341,756,'PT950','白18K金',9898,10008),(2,'黑骑士2','19999','images/2015081318151576e08c7f5c.jpg','TRUE LOVE系列 经典款 30分 F色',2341,4334,'PT980','白18K金',19898,22228),(3,'黑骑士3','29999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 典雅 50分 J色',1241,106,'PT850','白18K金',29898,30000),(4,'黑骑士4','39999','images/2014090312590972b221c6ce.jpg','TRUE LOVE系列 典雅 30分 G色',341,768,'PT750','白18K金',39898,42000),(5,'黑骑士5','49999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 奢华款 70分 J色',45461,5445,'PT950','白24K金',49898,50008),(6,'黑骑士6','59999','images/20141208151441cc5ac80d54.jpg','TRUE LOVE系列 典雅 18分 I-J色',6341,6456,'PT950','白24K金',59898,60008),(7,'黑骑士7','49999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 奢华款 70分 J色',41,76,'PT750','白24K金',49898,50008),(8,'黑骑士8','39999','images/2014090312590972b221c6ce.jpg','TRUE LOVE系列 典雅 30分 G色',123,116,'PT950','白18K金',39898,40008),(9,'黑骑士9','9999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 典雅 40分 F色',5541,226,'PT950','白24K金',9898,10008),(10,'黑骑士10','19999','images/201606081245596f6d33321d.jpg','TRUE LOVE系列 经典款 30分 F色',3111,1116,'PT850','白18K金',19898,20008),(11,'黑骑士','29999','images/20140902094335966c32bf74.jpg','TRUE LOVE系列 典雅 50分 J色',12341,323,'PT950','白24K金',29898,30008),(12,'黑骑士','59999','images/20141208151441cc5ac80d54.jpg','TRUE LOVE系列 典雅 18分 I-J色',4549,4545,'PT950','白18K金',59898,60008),(13,'黑骑士','59999','images/20141208151441cc5ac80d54.jpg','TRUE LOVE系列 典雅 18分 I-J色',12341,326,'PT950','白24K金',59898,60008),(14,'黑骑士','19999','images/2015081318151576e08c7f5c.jpg','TRUE LOVE系列 经典款 30分 F色',12341,876,'PT950','白24K金',59898,60008),(15,'黑骑士','29999','images/20140902094335966c32bf74.jpg','TRUE LOVE系列 典雅 50分 J色',12341,66,'PT950','白24K金',59898,60008),(16,'黑骑士','39999','images/2014090312590972b221c6ce.jpg','TRUE LOVE系列 典雅 30分 G色',12341,22,'PT950','白24K金',59898,60008),(17,'黑骑士','49999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 奢华款 70分 J色',12341,0,'PT950','白24K金',59898,60008),(18,'黑骑士','9999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 典雅 40分 F色',64341,53,'PT950','白24K金',59898,60008),(19,'黑骑士','9999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 典雅 40分 F色',1341,756,'PT950','白24K金',59898,60008),(20,'黑骑士','19999','images/2015081318151576e08c7f5c.jpg','TRUE LOVE系列 经典款 30分 F色',2341,4334,'PT950','白24K金',59898,60008),(21,'黑骑士','29999','images/20140902094335966c32bf74.jpg','TRUE LOVE系列 典雅 50分 J色',1241,106,'PT950','白24K金',59898,60008),(22,'黑骑士','39999','images/20140926105350c9c16868be.jpg','TRUE LOVE系列 典雅 30分 G色',341,768,'PT950','白24K金',59898,60008),(23,'黑骑士','49999','images/2014092610543039082c76fd.jpg','TRUE LOVE系列 奢华款 70分 J色',45461,5445,'PT950','白24K金',59898,60008),(24,'黑骑士','59999','images/20141208151441cc5ac80d54.jpg','TRUE LOVE系列 典雅 18分 I-J色',6341,6456,'PT950','白24K金',59898,60008),(25,'黑骑士','49999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 奢华款 70分 J色',41,76,'PT950','白24K金',59898,60008),(26,'黑骑士','39999','images/2014090312590972b221c6ce.jpg','TRUE LOVE系列 典雅 30分 G色',123,116,'PT950','白24K金',59898,60008),(27,'黑骑士','9999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 典雅 40分 F色',5541,226,'PT950','白24K金',59898,60008),(28,'黑骑士','19999','images/2015081318151576e08c7f5c.jpg','TRUE LOVE系列 经典款 30分 F色',3111,1116,'PT950','白24K金',59898,60008),(29,'黑骑士','29999','images/20140902094335966c32bf74.jpg','TRUE LOVE系列 典雅 50分 J色',12341,323,'PT950','白24K金',59898,60008),(30,'黑骑士','59999','images/20141208151441cc5ac80d54.jpg','TRUE LOVE系列 典雅 18分 I-J色',4549,4545,'PT950','白24K金',59898,60008),(31,'黑骑士','59999','images/20141208151441cc5ac80d54.jpg','TRUE LOVE系列 典雅 18分 I-J色',12341,326,'PT950','白24K金',59898,60008),(32,'黑骑士','19999','images/2015081318151576e08c7f5c.jpg','TRUE LOVE系列 经典款 30分 F色',12341,876,'PT950','白24K金',59898,60008),(33,'黑骑士','29999','images/20140902094335966c32bf74.jpg','TRUE LOVE系列 典雅 50分 J色',12341,66,'PT950','白24K金',59898,60008),(34,'黑骑士','9999','images/201502061050359c37df606b.jpg','TRUE LOVE系列 典雅 40分 F色',64341,53,'PT950','白24K金',59898,60008);
/*!40000 ALTER TABLE `dr_goodslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_user`
--

DROP TABLE IF EXISTS `dr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_user`
--

LOCK TABLES `dr_user` WRITE;
/*!40000 ALTER TABLE `dr_user` DISABLE KEYS */;
INSERT INTO `dr_user` VALUES (1,'18820279897','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','ebb79f0fdde6774d06a61e7de4fb59f4');
/*!40000 ALTER TABLE `dr_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-17 17:42:37
