-- MySQL dump 10.13  Distrib 5.6.39, for Linux (x86_64)
--
-- Host: localhost    Database: mccProj
-- ------------------------------------------------------
-- Server version	5.6.39-cll-lve

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `Account_Id` varchar(20) NOT NULL,
  `Student_Id` varchar(20) NOT NULL,
  `Token` varchar(20) NOT NULL,
  `TokenValid` enum('Yes','No','','') NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Type` enum('Parent','Student','','') NOT NULL,
  `Current_Sem` varchar(20) NOT NULL,
  `College_Id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Account_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('12426','tseci56','13548','No','eda41@example.net','Student','3','1'),('12641','tseci17','34390','Yes','pagac.donavon@example.net','Parent','3','1'),('13111','tseci90','36958','Yes','yvonne67@example.com','Parent','3','1'),('13290','tseci71','16467','No','casper.anna@example.net','Parent','3','1'),('14557','tseci77','56567','No','assunta.luettgen@example.org','Student','3','1'),('14941','tseci65','14502','Yes','rleuschke@example.com','Student','3','1'),('1522','tseci45','95562','Yes','israel.lubowitz@example.net','Student','3','1'),('15676','tseci45','10693','No','raegan.quigley@example.org','Student','3','1'),('15936','tseci67','69102','Yes','schultz.mayra@example.org','Student','3','1'),('17234','tseci64','74759','Yes','kimberly.jones@example.com','Student','3','1'),('17636','tseci77','39884','No','brycen.funk@example.net','Parent','3','1'),('20787','tseci74','50903','Yes','effie53@example.com','Student','3','1'),('21417','tseci50','25111','Yes','jayne.mohr@example.org','Parent','3','1'),('2205','tseci75','31507','Yes','kbernhard@example.com','Student','3','1'),('2342','tseci16','26997','No','thelma.mertz@example.org','Student','3','1'),('23696','tseci78','67589','Yes','obeer@example.net','Parent','3','1'),('23933','tseci55','97244','Yes','clarissa46@example.com','Student','3','1'),('24070','tseci28','39156','Yes','jovani14@example.com','Student','3','1'),('29069','tseci73','29644','No','leatha.walter@example.com','Student','3','1'),('30323','tseci83','54505','Yes','herminia61@example.org','Parent','3','1'),('32474','tseci61','35674','No','rhilll@example.org','Parent','3','1'),('33214','tseci57','13955','No','jennifer14@example.net','Student','3','1'),('35561','tseci24','24435','No','rsenger@example.org','Parent','3','1'),('36235','tseci51','58665','Yes','jaydon.roberts@example.net','Parent','3','1'),('38326','tseci98','21387','Yes','ryder.hackett@example.org','Student','3','1'),('38337','tseci30','97134','Yes','pwyman@example.com','Student','3','1'),('39254','tseci59','49354','Yes','jaqueline.white@example.com','Parent','3','1'),('39371','tseci64','48961','No','antonetta.auer@example.net','Student','3','1'),('3989','tseci41','74252','No','monahan.brain@example.net','Student','3','1'),('40266','tseci63','17990','Yes','ivory41@example.net','Parent','3','1'),('40683','tseci81','88496','No','alan58@example.com','Parent','3','1'),('40958','tseci14','94927','Yes','burnice.hoppe@example.org','Parent','3','1'),('41288','tseci25','72191','No','oschiller@example.org','Parent','3','1'),('43850','tseci35','98753','Yes','swisozk@example.com','Student','3','1'),('45222','tseci22','15329','No','stephany09@example.com','Parent','3','1'),('45457','tseci17','93465','Yes','yasmine50@example.org','Parent','3','1'),('45601','tseci53','25400','No','aprosacco@example.com','Parent','3','1'),('45674','tseci72','10486','No','monroe15@example.net','Parent','3','1'),('46565','tseci66','21055','Yes','shanelle.mcglynn@example.org','Parent','3','1'),('46880','tseci29','10501','No','toy02@example.net','Student','3','1'),('4730','tseci92','22047','No','gaylord.jennie@example.com','Student','3','1'),('47466','tseci77','80048','No','isabella.ruecker@example.org','Student','3','1'),('47516','tseci44','28688','No','shields.keanu@example.net','Parent','3','1'),('48297','tseci80','80353','No','bernhard.margot@example.org','Parent','3','1'),('51082','tseci95','39365','Yes','woodrow.conn@example.net','Parent','3','1'),('51238','tseci44','62224','Yes','elfrieda48@example.org','Student','3','1'),('53596','tseci10','97225','Yes','jordi47@example.org','Student','3','1'),('53971','tseci50','35771','Yes','dolly.kub@example.com','Student','3','1'),('54304','tseci40','96523','Yes','bruen.amina@example.com','Student','3','1'),('54607','tseci10','42964','Yes','crooks.kelsie@example.org','Parent','3','1'),('55172','tseci27','86133','No','breitenberg.kamille@example.co','Student','3','1'),('56341','tseci42','65848','Yes','camilla.ratke@example.org','Student','3','1'),('57954','tseci08','34270','Yes','bjacobi@example.org','Parent','3','1'),('59718','tseci97','86738','Yes','margaretta44@example.net','Parent','3','1'),('60561','tseci19','28295','No','dickens.alvena@example.com','Student','3','1'),('61091','tseci66','52159','Yes','yrau@example.org','Parent','3','1'),('63032','tseci90','48982','Yes','boehm.nyah@example.net','Parent','3','1'),('6423','tseci97','84221','No','zhermiston@example.org','Parent','3','1'),('64885','tseci48','18480','No','jody.bode@example.com','Parent','3','1'),('65699','tseci96','66855','No','ibruen@example.com','Student','3','1'),('66031','tseci74','59291','No','ferry.shane@example.org','Parent','3','1'),('66068','tseci00','25249','Yes','orunolfsdottir@example.org','Student','3','1'),('66114','tseci69','94808','Yes','nicole.graham@example.com','Parent','3','1'),('67917','tseci79','87311','No','alysson86@example.net','Parent','3','1'),('69971','tseci75','71682','No','johan.schulist@example.net','Parent','3','1'),('70435','tseci68','11272','Yes','flittle@example.net','Parent','3','1'),('73370','tseci27','75029','No','hbayer@example.com','Student','3','1'),('74618','tseci69','33761','Yes','tiffany.kemmer@example.org','Parent','3','1'),('76211','tseci20','49898','Yes','wilderman.vesta@example.org','Parent','3','1'),('77554','tseci47','65728','No','rau.arvilla@example.com','Parent','3','1'),('77562','tseci93','16808','No','ckerluke@example.com','Parent','3','1'),('77616','tseci02','70749','No','bauch.tracy@example.org','Parent','3','1'),('78636','tseci13','44424','Yes','cveum@example.com','Parent','3','1'),('79514','tseci42','17682','No','greenholt.darrin@example.org','Student','3','1'),('79687','tseci29','92211','No','arthur41@example.com','Student','3','1'),('80004','tseci32','23954','No','owolf@example.net','Parent','3','1'),('80428','tseci25','37186','No','pgleichner@example.org','Parent','3','1'),('82245','tseci68','44255','Yes','lacy19@example.net','Student','3','1'),('82932','tseci61','76515','Yes','cheyanne.wisoky@example.net','Student','3','1'),('83079','tseci85','32956','No','stracke.kayla@example.net','Student','3','1'),('83911','tseci80','89709','No','orn.tiffany@example.net','Student','3','1'),('8427','tseci60','65965','No','kunze.lavinia@example.com','Student','3','1'),('85270','tseci09','40951','Yes','dahlia38@example.net','Student','3','1'),('85404','tseci47','53093','No','ustroman@example.org','Parent','3','1'),('85688','tseci56','34046','No','jaskolski.caterina@example.com','Student','3','1'),('8646','tseci65','57837','Yes','jacklyn24@example.com','Student','3','1'),('88148','tseci16','42941','No','tstracke@example.com','Parent','3','1'),('89346','tseci69','27293','No','marietta.balistreri@example.or','Parent','3','1'),('89365','tseci28','16014','Yes','alan62@example.org','Student','3','1'),('89708','tseci62','84496','No','thora.schmitt@example.net','Parent','3','1'),('90147','tseci82','33278','No','conner.hane@example.net','Student','3','1'),('9049','tseci54','29103','No','murray.rick@example.org','Parent','3','1'),('91551','tseci92','41992','No','maria.runolfsdottir@example.ne','Student','3','1'),('92924','tseci25','34441','Yes','michaela.turner@example.com','Student','3','1'),('93973','tseci86','65529','Yes','elliot56@example.org','Parent','3','1'),('94368','tseci12','73564','Yes','brennon57@example.net','Parent','3','1'),('9531','tseci35','88550','No','kyler.armstrong@example.net','Parent','3','1'),('95774','tseci60','10409','Yes','cole.dora@example.org','Parent','3','1'),('96483','tseci70','90730','No','fritsch.reuben@example.org','Parent','3','1'),('9673','tseci44','16487','Yes','heidenreich.norberto@example.c','Student','3','1');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `Admin_Id` varchar(20) NOT NULL,
  `College_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`Admin_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `Student_Id` varchar(20) NOT NULL,
  `College_Id` varchar(20) NOT NULL,
  `Lec_Conducted` int(255) NOT NULL,
  `Lec_Attended` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `College_Id` varchar(20) NOT NULL,
  `College_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`College_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('db5ffc9d5bff5d409e0e77709e5e508cededc8e2','1234',NULL,'2018-03-25 01:08:58',NULL),('43a7a244242c0434003cf4aa9eebf12d6310af32','1234',NULL,'2018-03-25 01:11:37',NULL),('07024682eba4bf2d0e508bfce91705223f96b4f5','20773',NULL,'2018-03-25 02:45:57',NULL);
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_authorization_codes`
--

DROP TABLE IF EXISTS `oauth_authorization_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  `id_token` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_authorization_codes`
--

LOCK TABLES `oauth_authorization_codes` WRITE;
/*!40000 ALTER TABLE `oauth_authorization_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_authorization_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('1234','password','http://localhost/',NULL,NULL,NULL),('20773','kamal1234','http://localhost/',NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_jwt`
--

DROP TABLE IF EXISTS `oauth_jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_jwt`
--

LOCK TABLES `oauth_jwt` WRITE;
/*!40000 ALTER TABLE `oauth_jwt` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_jwt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_scopes`
--

DROP TABLE IF EXISTS `oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_scopes` (
  `scope` varchar(80) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_scopes`
--

LOCK TABLES `oauth_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_users`
--

DROP TABLE IF EXISTS `oauth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_users` (
  `username` varchar(80) NOT NULL DEFAULT '',
  `password` varchar(80) DEFAULT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_users`
--

LOCK TABLES `oauth_users` WRITE;
/*!40000 ALTER TABLE `oauth_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `Subject_Id` varchar(20) NOT NULL,
  `Subject_Semester` varchar(20) NOT NULL,
  `Teacher_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`Subject_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('AOA','3','6'),('CN','3','2'),('COA','3','6'),('DDB','3','4'),('MCC','3','3'),('NPL','3','6');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_record`
--

DROP TABLE IF EXISTS `subject_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_record` (
  `Subject_Id` varchar(20) NOT NULL,
  `Lecture_Attended` int(255) NOT NULL,
  `Lecture_Conducted` int(255) NOT NULL,
  `Student_Id` varchar(255) NOT NULL,
  `Pt1` int(255) NOT NULL,
  `Pt2` int(255) NOT NULL,
  `Sem_Marks` int(255) NOT NULL,
  PRIMARY KEY (`Subject_Id`,`Student_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_record`
--

LOCK TABLES `subject_record` WRITE;
/*!40000 ALTER TABLE `subject_record` DISABLE KEYS */;
INSERT INTO `subject_record` VALUES ('AOA',9,21,'tseci00',5,20,95),('AOA',9,22,'tseci02',17,11,45),('AOA',10,20,'tseci08',19,12,45),('AOA',2,13,'tseci09',20,11,76),('AOA',6,22,'tseci12',7,7,40),('AOA',1,17,'tseci13',19,20,97),('AOA',1,17,'tseci16',15,6,47),('AOA',1,17,'tseci17',9,10,60),('AOA',9,21,'tseci20',5,16,37),('AOA',6,17,'tseci24',13,17,85),('AOA',2,17,'tseci25',7,12,33),('AOA',5,21,'tseci27',9,15,87),('AOA',8,22,'tseci28',13,12,49),('AOA',9,18,'tseci29',7,18,98),('AOA',1,22,'tseci30',14,9,89),('AOA',1,21,'tseci32',7,10,95),('AOA',3,18,'tseci35',13,8,91),('AOA',1,18,'tseci40',11,11,40),('AOA',2,17,'tseci44',9,9,68),('AOA',8,17,'tseci45',9,7,42),('AOA',1,18,'tseci47',10,12,70),('AOA',5,22,'tseci48',6,17,40),('AOA',10,21,'tseci50',18,20,81),('AOA',10,18,'tseci51',15,18,33),('AOA',1,18,'tseci53',20,19,82),('AOA',3,19,'tseci54',17,8,100),('AOA',3,18,'tseci55',5,6,79),('AOA',11,21,'tseci56',6,5,52),('AOA',1,22,'tseci59',13,6,72),('AOA',3,18,'tseci60',16,7,33),('AOA',9,20,'tseci62',19,13,55),('AOA',6,22,'tseci63',20,15,73),('AOA',6,22,'tseci64',17,15,35),('AOA',1,17,'tseci65',5,6,97),('AOA',8,22,'tseci66',16,10,95),('AOA',9,18,'tseci68',16,20,96),('AOA',6,22,'tseci69',7,9,66),('AOA',8,18,'tseci70',14,18,34),('AOA',5,20,'tseci72',9,18,49),('AOA',7,18,'tseci73',20,8,78),('AOA',5,18,'tseci74',14,8,72),('AOA',4,18,'tseci75',9,7,36),('AOA',7,21,'tseci77',17,15,85),('AOA',5,17,'tseci78',11,14,33),('AOA',2,17,'tseci79',5,11,78),('AOA',4,17,'tseci80',9,9,58),('AOA',7,17,'tseci81',9,10,83),('AOA',5,20,'tseci83',19,15,44),('AOA',2,20,'tseci86',10,17,91),('AOA',8,19,'tseci90',14,14,41),('AOA',5,21,'tseci92',9,6,70),('AOA',7,19,'tseci93',7,20,32),('AOA',7,19,'tseci96',6,18,33),('AOA',10,21,'tseci97',5,15,36),('AOA',2,19,'tseci98',7,7,56),('CN',7,14,'tseci00',15,17,32),('CN',4,11,'tseci08',15,9,38),('CN',6,11,'tseci09',14,14,86),('CN',7,11,'tseci10',12,20,59),('CN',10,15,'tseci13',19,5,47),('CN',5,10,'tseci16',9,6,39),('CN',4,11,'tseci17',17,17,68),('CN',4,15,'tseci19',14,7,36),('CN',7,13,'tseci22',8,14,94),('CN',7,10,'tseci25',13,14,81),('CN',1,11,'tseci27',13,14,40),('CN',5,14,'tseci29',19,9,86),('CN',9,10,'tseci30',12,16,44),('CN',5,12,'tseci32',7,20,90),('CN',6,15,'tseci35',10,16,99),('CN',8,10,'tseci41',10,7,86),('CN',5,14,'tseci42',15,17,54),('CN',7,13,'tseci44',13,9,59),('CN',1,11,'tseci47',18,20,79),('CN',2,11,'tseci48',13,9,82),('CN',8,14,'tseci50',16,8,95),('CN',6,14,'tseci51',13,6,99),('CN',9,13,'tseci53',14,7,54),('CN',8,13,'tseci54',17,10,63),('CN',7,11,'tseci55',11,12,56),('CN',7,11,'tseci56',7,14,100),('CN',7,15,'tseci57',14,9,65),('CN',6,14,'tseci59',17,19,86),('CN',6,11,'tseci61',6,8,80),('CN',10,13,'tseci63',13,16,71),('CN',10,15,'tseci64',9,6,64),('CN',9,14,'tseci65',12,5,52),('CN',7,11,'tseci66',13,12,70),('CN',7,10,'tseci67',9,8,71),('CN',5,13,'tseci69',18,17,75),('CN',6,13,'tseci72',14,9,86),('CN',8,15,'tseci73',5,11,51),('CN',5,15,'tseci74',8,10,52),('CN',5,14,'tseci75',14,10,62),('CN',4,11,'tseci77',15,15,91),('CN',3,12,'tseci78',13,14,81),('CN',8,13,'tseci80',5,11,63),('CN',8,10,'tseci81',10,6,81),('CN',10,11,'tseci82',20,6,72),('CN',9,11,'tseci83',6,11,88),('CN',3,10,'tseci85',9,15,98),('CN',5,12,'tseci92',14,12,42),('CN',5,11,'tseci93',7,9,50),('CN',8,11,'tseci96',15,12,36),('COA',7,11,'tseci00',18,19,95),('COA',8,14,'tseci02',6,13,44),('COA',10,15,'tseci08',6,6,60),('COA',9,15,'tseci10',14,18,68),('COA',3,11,'tseci12',12,16,74),('COA',9,16,'tseci13',13,16,97),('COA',2,11,'tseci14',12,13,64),('COA',10,14,'tseci16',8,10,78),('COA',9,15,'tseci17',18,12,48),('COA',11,14,'tseci19',15,14,41),('COA',9,16,'tseci22',17,16,79),('COA',10,12,'tseci24',15,13,53),('COA',9,14,'tseci25',17,9,53),('COA',8,12,'tseci27',6,10,35),('COA',2,12,'tseci28',19,9,90),('COA',3,12,'tseci29',19,20,83),('COA',6,16,'tseci30',20,18,45),('COA',5,12,'tseci35',19,6,57),('COA',4,15,'tseci40',10,14,87),('COA',1,15,'tseci41',14,13,50),('COA',3,12,'tseci42',15,14,52),('COA',4,16,'tseci44',11,19,72),('COA',8,16,'tseci45',16,14,62),('COA',1,16,'tseci47',14,19,40),('COA',2,15,'tseci48',6,15,98),('COA',7,15,'tseci50',13,15,44),('COA',4,15,'tseci51',18,11,77),('COA',10,13,'tseci54',7,5,80),('COA',2,15,'tseci56',10,11,83),('COA',10,16,'tseci59',11,18,75),('COA',10,14,'tseci60',10,18,90),('COA',6,13,'tseci61',11,16,58),('COA',10,13,'tseci63',5,14,67),('COA',8,16,'tseci64',20,8,55),('COA',1,14,'tseci65',10,13,53),('COA',8,16,'tseci66',17,13,91),('COA',5,14,'tseci67',9,18,91),('COA',4,11,'tseci68',16,13,34),('COA',1,12,'tseci69',17,8,61),('COA',3,13,'tseci70',10,15,69),('COA',8,11,'tseci73',7,9,32),('COA',10,12,'tseci74',15,11,57),('COA',9,13,'tseci75',10,9,80),('COA',1,11,'tseci77',17,17,34),('COA',2,11,'tseci78',17,7,36),('COA',7,16,'tseci82',6,7,48),('COA',4,12,'tseci83',10,20,93),('COA',1,14,'tseci85',14,5,61),('COA',8,16,'tseci86',19,5,35),('COA',3,14,'tseci90',16,11,66),('COA',5,11,'tseci92',18,11,43),('COA',9,11,'tseci93',13,14,83),('COA',2,12,'tseci95',18,13,59),('COA',6,13,'tseci96',11,17,98),('COA',10,14,'tseci97',8,19,51),('COA',6,14,'tseci98',16,17,68),('DDB',1,15,'tseci00',9,13,78),('DDB',9,13,'tseci09',5,6,37),('DDB',8,11,'tseci10',7,18,39),('DDB',4,10,'tseci13',6,20,91),('DDB',3,10,'tseci16',18,8,92),('DDB',4,13,'tseci17',7,11,40),('DDB',10,14,'tseci19',8,7,76),('DDB',6,14,'tseci22',14,12,99),('DDB',1,13,'tseci25',6,12,59),('DDB',6,12,'tseci27',9,15,43),('DDB',9,11,'tseci28',10,13,83),('DDB',8,14,'tseci29',13,6,69),('DDB',9,14,'tseci30',11,5,93),('DDB',6,12,'tseci35',5,10,75),('DDB',3,15,'tseci42',16,15,80),('DDB',6,13,'tseci44',9,16,95),('DDB',6,10,'tseci45',6,20,89),('DDB',5,14,'tseci47',6,7,95),('DDB',5,12,'tseci48',6,17,100),('DDB',10,15,'tseci50',13,5,75),('DDB',4,11,'tseci51',17,16,98),('DDB',4,12,'tseci53',12,5,42),('DDB',5,13,'tseci54',6,19,76),('DDB',10,11,'tseci55',9,5,97),('DDB',8,11,'tseci57',6,18,63),('DDB',2,15,'tseci59',20,10,41),('DDB',6,15,'tseci60',20,19,77),('DDB',1,15,'tseci61',12,14,78),('DDB',7,11,'tseci63',15,14,89),('DDB',3,12,'tseci64',11,19,77),('DDB',2,14,'tseci65',11,19,80),('DDB',3,10,'tseci67',11,19,83),('DDB',3,13,'tseci68',5,9,47),('DDB',7,13,'tseci69',17,8,82),('DDB',7,13,'tseci70',15,13,93),('DDB',5,15,'tseci71',20,5,85),('DDB',6,13,'tseci73',15,15,72),('DDB',6,11,'tseci74',20,19,97),('DDB',8,13,'tseci77',10,10,49),('DDB',10,11,'tseci78',14,8,99),('DDB',5,15,'tseci79',13,9,30),('DDB',8,14,'tseci81',11,15,47),('DDB',6,14,'tseci82',15,11,87),('DDB',10,11,'tseci83',16,5,66),('DDB',8,10,'tseci85',11,12,52),('DDB',1,14,'tseci92',13,14,72),('DDB',10,10,'tseci93',13,20,66),('DDB',4,10,'tseci95',11,10,44),('DDB',10,12,'tseci97',6,6,65),('MCC',3,13,'tseci02',20,17,61),('MCC',1,12,'tseci08',6,7,100),('MCC',8,15,'tseci09',15,5,42),('MCC',6,15,'tseci16',14,12,30),('MCC',4,12,'tseci17',16,8,76),('MCC',1,12,'tseci19',11,12,44),('MCC',7,10,'tseci20',5,19,35),('MCC',4,10,'tseci22',17,16,67),('MCC',1,10,'tseci25',7,20,96),('MCC',2,11,'tseci27',12,16,76),('MCC',8,15,'tseci28',20,19,75),('MCC',6,12,'tseci29',16,10,67),('MCC',1,15,'tseci30',20,10,50),('MCC',7,15,'tseci35',13,14,44),('MCC',6,15,'tseci40',5,12,54),('MCC',10,11,'tseci41',10,9,44),('MCC',9,11,'tseci42',10,13,75),('MCC',3,13,'tseci44',14,8,99),('MCC',7,11,'tseci45',15,10,86),('MCC',1,10,'tseci47',13,10,44),('MCC',6,13,'tseci50',9,18,54),('MCC',6,15,'tseci56',13,10,68),('MCC',10,11,'tseci57',8,11,59),('MCC',1,11,'tseci59',9,18,55),('MCC',8,12,'tseci60',9,9,45),('MCC',5,14,'tseci61',15,5,93),('MCC',8,15,'tseci62',17,6,71),('MCC',6,10,'tseci63',13,8,31),('MCC',2,14,'tseci64',15,11,30),('MCC',5,12,'tseci65',16,10,91),('MCC',4,14,'tseci66',18,14,33),('MCC',1,12,'tseci67',19,11,69),('MCC',1,12,'tseci68',14,18,57),('MCC',1,13,'tseci69',13,19,50),('MCC',2,14,'tseci70',5,7,80),('MCC',3,10,'tseci71',11,5,51),('MCC',8,11,'tseci74',17,9,73),('MCC',3,10,'tseci75',7,16,53),('MCC',1,11,'tseci77',9,6,90),('MCC',4,13,'tseci78',9,14,37),('MCC',3,12,'tseci80',7,19,100),('MCC',6,11,'tseci82',9,6,73),('MCC',10,12,'tseci85',8,15,67),('MCC',6,10,'tseci86',11,9,35),('MCC',10,15,'tseci90',9,13,86),('MCC',6,10,'tseci92',7,10,65),('MCC',9,13,'tseci93',17,19,99),('MCC',2,15,'tseci96',6,17,65),('MCC',7,15,'tseci97',12,12,82),('NPL',7,14,'tseci00',16,18,62),('NPL',9,13,'tseci08',6,18,73),('NPL',9,10,'tseci10',14,20,57),('NPL',7,13,'tseci13',9,6,82),('NPL',2,12,'tseci14',19,13,98),('NPL',8,15,'tseci16',18,5,63),('NPL',8,10,'tseci17',18,7,92),('NPL',9,12,'tseci19',11,15,82),('NPL',7,11,'tseci20',11,20,42),('NPL',3,15,'tseci22',6,6,62),('NPL',6,10,'tseci24',18,9,57),('NPL',1,12,'tseci25',9,17,90),('NPL',4,12,'tseci27',17,11,80),('NPL',10,10,'tseci29',9,15,63),('NPL',4,14,'tseci32',18,14,69),('NPL',9,15,'tseci35',14,15,57),('NPL',3,15,'tseci40',8,8,91),('NPL',2,12,'tseci41',15,20,92),('NPL',8,14,'tseci42',9,17,68),('NPL',9,12,'tseci44',5,12,47),('NPL',2,12,'tseci45',15,17,78),('NPL',6,15,'tseci47',9,19,36),('NPL',3,10,'tseci50',16,5,71),('NPL',7,11,'tseci51',20,17,39),('NPL',9,14,'tseci54',19,18,58),('NPL',2,15,'tseci57',5,16,56),('NPL',8,12,'tseci59',17,11,59),('NPL',9,13,'tseci60',11,5,92),('NPL',4,15,'tseci61',11,13,61),('NPL',9,11,'tseci62',17,5,50),('NPL',1,10,'tseci63',5,11,37),('NPL',8,13,'tseci64',13,14,73),('NPL',9,15,'tseci65',17,9,76),('NPL',6,10,'tseci66',9,12,65),('NPL',10,11,'tseci67',7,6,79),('NPL',4,13,'tseci68',18,10,37),('NPL',10,10,'tseci69',18,9,70),('NPL',2,11,'tseci70',11,19,92),('NPL',7,15,'tseci72',14,12,85),('NPL',9,10,'tseci73',11,11,64),('NPL',3,14,'tseci78',18,11,70),('NPL',9,14,'tseci79',18,14,32),('NPL',6,14,'tseci80',18,5,56),('NPL',9,11,'tseci81',15,5,45),('NPL',7,10,'tseci82',20,19,39),('NPL',8,14,'tseci83',9,19,31),('NPL',4,10,'tseci85',15,14,63),('NPL',1,10,'tseci86',10,9,78),('NPL',4,12,'tseci90',11,6,83),('NPL',10,12,'tseci92',13,12,73),('NPL',2,15,'tseci93',15,18,55),('NPL',1,13,'tseci96',5,8,94),('NPL',5,12,'tseci97',13,9,56);
/*!40000 ALTER TABLE `subject_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `Teacher_Id` varchar(20) NOT NULL,
  `College_Id` varchar(20) NOT NULL,
  `College_Name` varchar(20) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Teacher_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('2','1','tsec','2password'),('3','1','tsec','3password'),('4','1','tsec','4password'),('6','1','tsec','6password');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-24 13:59:06
