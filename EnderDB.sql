CREATE DATABASE  IF NOT EXISTS `enderdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `enderdb`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: enderdb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int(8) NOT NULL AUTO_INCREMENT,
  `date_booked` date DEFAULT NULL,
  `date_confirmed` date DEFAULT NULL,
  `date_cancelled` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `class_rating` int(1) DEFAULT NULL,
  `class_feedback` varchar(90) DEFAULT NULL,
  `lecturer_rating` int(1) DEFAULT NULL,
  `lecturer_feedback` varchar(90) DEFAULT NULL,
  `class_id` int(8) NOT NULL,
  `group_id` int(8) DEFAULT NULL,
  `facilitator` varchar(45) NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id_UNIQUE` (`booking_id`),
  KEY `BOOKINGS001_idx` (`class_id`),
  KEY `BOOKINGS002_idx` (`facilitator`),
  KEY `BOOKING003_idx` (`group_id`),
  CONSTRAINT `BOOKING003` FOREIGN KEY (`group_id`) REFERENCES `clientgroups` (`group_id`),
  CONSTRAINT `BOOKINGS001` FOREIGN KEY (`class_id`) REFERENCES `classofferings` (`class_id`),
  CONSTRAINT `BOOKINGS002` FOREIGN KEY (`facilitator`) REFERENCES `clientusers` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11111125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (11111115,'2019-12-18',NULL,'2019-12-21',1202.00,1301.00,3,'Smart guy',3,'i think so',10000001,41679329,'dmurcott7@unesco.org'),(11111116,'2019-01-08',NULL,NULL,100.00,NULL,2,'ok',2,'i think so',10000001,63416203,'skilner2@dailymail.co.uk'),(11111117,'2018-02-12',NULL,NULL,900.00,NULL,NULL,NULL,NULL,NULL,10000001,63416203,'skilner2@dailymail.co.uk'),(11111118,'2019-08-26',NULL,NULL,800.00,NULL,NULL,NULL,NULL,NULL,11111112,31693999,'vclive3@nytimes.com'),(11111119,'2019-12-13',NULL,NULL,4000.00,NULL,NULL,NULL,NULL,NULL,11111111,41679329,'ttraill5@photobucket.com'),(11111120,'2019-12-15',NULL,NULL,125.00,NULL,NULL,NULL,NULL,NULL,11111111,41679329,'dmurcott7@unesco.org'),(11111121,'2019-12-15',NULL,NULL,125.00,NULL,NULL,NULL,NULL,NULL,11111111,41679329,'dmurcott7@unesco.org'),(11111122,'2019-04-30',NULL,NULL,4988.00,NULL,NULL,NULL,NULL,NULL,11111112,15512416,'sreddington0@creativecommons.org'),(11111123,'2019-12-31',NULL,NULL,3525.00,NULL,NULL,NULL,NULL,NULL,10000001,41679329,'dmurcott7@unesco.org'),(11111124,'2019-12-27','2004-06-14',NULL,6574.00,NULL,NULL,NULL,NULL,NULL,11111113,63416203,'skilner2@dailymail.co.uk');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `course_id` int(8) NOT NULL,
  `course_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `course_hours` varchar(8) DEFAULT NULL,
  `course_fee` int(8) DEFAULT NULL,
  `min_students` int(5) DEFAULT NULL,
  `max_students` int(5) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL COMMENT 'O - Offered\nC - Closed',
  `ccp_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `CLASSES001_idx` (`ccp_email`),
  CONSTRAINT `CLASSES001` FOREIGN KEY (`ccp_email`) REFERENCES `culturalclassproviders` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (31338816,'Architecture','local arhitectural styles.','21',942,1,20,'O','ttraill5@photobucket.com'),(42537562,'Cooking','prepare local dishes.','1270',872,5,39,'C','dmurcott7@unesco.org'),(48041108,'Local Sports','playing local sports.','1172',291,4,35,'C','ttraill5@photobucket.com'),(53907968,'Cultural Painting','local painting and techniques.','1106',193,4,50,'C','ttraill5@photobucket.com'),(68798062,'Cultural Art','ethnic art styles.','2157',748,1,50,'O','ttraill5@photobucket.com'),(77452940,'Language','local dialects','793',116,5,11,'C','dmurcott7@unesco.org'),(80560509,'Film','local film reviews.','142',102,8,37,'O','ttraill5@photobucket.com'),(94581547,'History','local history.','2267',101,6,22,'C','ttraill5@photobucket.com'),(96211416,'Cultural Music','play ethnic instruments.','764',347,6,25,'O','ttraill5@photobucket.com'),(97396563,'Cultural Dance','cultural group dances.','251',360,8,32,'O','ttraill5@photobucket.com');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classofferings`
--

DROP TABLE IF EXISTS `classofferings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classofferings` (
  `class_id` int(8) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `venue` varchar(45) DEFAULT NULL COMMENT 'coordinates\\n',
  `date_confirmed` date DEFAULT NULL,
  `date_cancelled` date DEFAULT NULL,
  `num_students` int(5) DEFAULT NULL,
  `lecturer_id` int(8) NOT NULL,
  `course_id` int(8) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `CLASSOFFERINGS002_idx` (`lecturer_id`),
  KEY `CLASSOFFERINGS001_idx` (`course_id`),
  CONSTRAINT `CLASSOFFERINGS001` FOREIGN KEY (`course_id`) REFERENCES `classes` (`course_id`),
  CONSTRAINT `CLASSOFFERINGS002` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`lecturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11111114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classofferings`
--

LOCK TABLES `classofferings` WRITE;
/*!40000 ALTER TABLE `classofferings` DISABLE KEYS */;
INSERT INTO `classofferings` VALUES (10000001,'2019-12-17','Starbucks',NULL,NULL,NULL,85158905,68798062),(11111111,'2019-01-01','11111','2019-02-01',NULL,0,49062064,31338816),(11111112,'2019-12-27','Wendy\'s',NULL,'2019-08-12',NULL,90383842,80560509),(11111113,'2019-12-28','Henry',NULL,NULL,NULL,49062064,42537562);
/*!40000 ALTER TABLE `classofferings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientgroups`
--

DROP TABLE IF EXISTS `clientgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientgroups` (
  `group_id` int(8) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rep_email` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `rep_email_UNIQUE` (`rep_email`),
  CONSTRAINT `CLIENTGROUPS001` FOREIGN KEY (`rep_email`) REFERENCES `clientusers` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=63416204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientgroups`
--

LOCK TABLES `clientgroups` WRITE;
/*!40000 ALTER TABLE `clientgroups` DISABLE KEYS */;
INSERT INTO `clientgroups` VALUES (15512416,'2018-05-05','2020-08-07','sreddington0@creativecommons.org'),(31693999,'2018-05-05','2018-05-05','vclive3@nytimes.com'),(41679329,'2018-05-05','2018-05-05','dmurcott7@unesco.org'),(57907716,'2018-05-05','2020-06-09','lworral1@pinterest.com'),(63416203,'2018-05-05','2020-08-07','skilner2@dailymail.co.uk');
/*!40000 ALTER TABLE `clientgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientusers`
--

DROP TABLE IF EXISTS `clientusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientusers` (
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `addressline1` varchar(45) NOT NULL,
  `addressline2` varchar(45) DEFAULT NULL,
  `country` varchar(45) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `birthday` varchar(45) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `passport_no` int(8) DEFAULT NULL,
  `place_of_issue` varchar(45) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `reg_status` enum('A','D','FA') DEFAULT NULL,
  `reason` varchar(90) DEFAULT NULL,
  `cc_no` int(8) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `CLIENTUSERS001_idx` (`cc_no`),
  CONSTRAINT `CLIENTUSERS001` FOREIGN KEY (`cc_no`) REFERENCES `creditcards` (`cc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientusers`
--

LOCK TABLES `clientusers` WRITE;
/*!40000 ALTER TABLE `clientusers` DISABLE KEYS */;
INSERT INTO `clientusers` VALUES ('dmurcott7@unesco.org','dmurcott7','alsdkfj','Dorian','Murcott','5702 Mosinee Court','25403 Marquette Circle','Greece','Greek','1999-12-13','F',99796901,'Ãlion','2023-05-09','FA','n/a',88888),('groberti4@hexun.com','groberti4','alsdkfj','Giacopo','Roberti','3109 Cody Crossing','6007 Lakewood Gardens Junction','Philippines','Filipino','1977-12-10','M',90486179,'As Sukhnah','2025-12-05','FA','n/a',55555),('kpane9@ifeng.com','kpane9','alsdkfj','Kettie','Pane','70380 Texas Way','111 Kim Parkway','Indonesia','Indonesian','1999-12-13','F',90896302,'Mulyorejo','2023-05-09','A','n/a',12121),('lworral1@pinterest.com','lworral1','alsdkfj','Laurianne','Worral','5 Porter Terrace','1441 Atwood Park','Indonesia','Indonesian','1968-12-07','F',40104161,'Sukasari','2025-12-05','D','incomplete req',22222),('sbowater8@multiply.com','sbowater8','alsdkfj','Selby','Bowater','5 Stuart Center','90879 Fairview Court','China','Chinese','2004-12-14','F',89914541,'Wenci','2025-02-03','D','incomplete req',99999),('skilner2@dailymail.co.uk','skilner2','alsdkfj','Skipper','Kilner','46 Lighthouse Bay Drive','4 Loomis Point','United States','American','2004-12-08','F',66652817,'Lexington','2025-12-05','D','incomplete req',33333),('sreddington0@creativecommons.org','sreddington0','alsdkfj','Shelley','Reddington','102 Cascade Lane','5 Kipling Road','Philippines','Filipino','2004-12-06','F',99299759,'Bressuire','2025-12-05','D','incomplete req',11111),('tchilderhouse6@slate.com','tchilderhouse6','alsdkfj','Travus','Childerhouse','05 Memorial Way','1 Little Fleur Terrace','Brazil','Brazilian','1988-12-12','M',60448653,'Itapicuru','2023-05-09','FA','n/a',77777),('ttraill5@photobucket.com','ttraill5','alsdkfj','Teresita','Traill','4 Del Mar Terrace','1 Sunbrook Alley','Philippines','Filipino','2004-12-11','F',92265658,'LagkadÃ¡s','2025-02-03','D','incomplete req',66666),('vclive3@nytimes.com','vclive3','alsdkfj','Vania','Clive','83033 Hazelcrest Avenue','518 Marcy Junction','Philippines','Filipino','1999-12-13','F',78308864,'Oitui','2025-12-05','A','n/a',44444);
/*!40000 ALTER TABLE `clientusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyusers`
--

DROP TABLE IF EXISTS `companyusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyusers` (
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `date_hired` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `mobile_nos` int(11) DEFAULT NULL,
  `ec_first_name` varchar(45) DEFAULT NULL,
  `ec_last_name` varchar(45) DEFAULT NULL,
  `ec_address` varchar(45) DEFAULT NULL,
  `ec_mobile_nos` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyusers`
--

LOCK TABLES `companyusers` WRITE;
/*!40000 ALTER TABLE `companyusers` DISABLE KEYS */;
INSERT INTO `companyusers` VALUES ('akevern0@ustream.tv','akevern0','qwerty','Mort','Espinha','83935 Corben Park','1990-12-18','2019-09-23','2019-07-03',12345,'Adam','Kevern','2104 Hoffman Trail','12345'),('bbucktharp9@csmonitor.com','bbucktharp9','qwerty','Maryjane','Saddington','1587 Knutson Terrace','1965-08-18','2019-02-05','2018-12-22',12345,'Blondelle','Bucktharp','31938 Jana Drive','12345'),('bfey3@sfgate.com','bfey3','qwerty','Brandi','Darlow','316 Northwestern Way','2005-09-20','2019-09-18','2019-03-01',12345,'Byrle','Fey','321 Shopko Street','12345'),('gspafford4@noaa.gov','gspafford4','qwerty','Savina','Hair','2010 Bellgrove Place','1991-10-02','2019-06-25','2019-08-27',12345,'Gwyn','Spafford','5102 Di Loreto Park','12345'),('kalexandre1@businessweek.com','kalexandre1','qwerty','Lurline','Swinglehurst','97 Eagan Junction','1997-11-07','2019-01-09','2018-12-16',12345,'Kerrin','Alexandre','39002 Nobel Place','12345'),('kbuscher8@biblegateway.com','kbuscher8','qwerty','Ossie','Carlill','2942 Lukken Circle','1982-08-03','2019-06-18','2019-03-04',12345,'Kai','Buscher','47 Merry Pass','12345'),('mfould7@yellowbook.com','mfould7','qwerty','Vidovik','Paddingdon','476 Raven Circle','1969-01-07','2019-12-12','2019-09-29',12345,'Mahmud','Fould','26625 West Drive','12345'),('mhounsome5@digg.com','mhounsome5','qwerty','Lilian','Tremellan','2287 Little Fleur Hill','1983-01-21','2019-11-12','2019-11-14',12345,'Melly','Hounsome','8900 Iowa Street','12345'),('sguest2@woothemes.com','sguest2','qwerty','Datha','Qualtro','2 High Crossing Place','2009-10-09','2019-12-06','2019-05-05',12345,'Stuart','Guest','8825 Butterfield Circle','12345'),('zguerrazzi6@japanpost.jp','zguerrazzi6','qwerty','Robinet','Bowlands','10695 Towne Circle','2007-08-17','2019-03-24','2019-03-31',12345,'Zonda','Guerrazzi','98765 Porter Circle','12345');
/*!40000 ALTER TABLE `companyusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcards` (
  `cc_no` int(8) NOT NULL,
  `cc_exp` date NOT NULL,
  `isActive` enum('Y','N') NOT NULL,
  PRIMARY KEY (`cc_no`),
  UNIQUE KEY `cc_no_UNIQUE` (`cc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
INSERT INTO `creditcards` VALUES (11111,'2022-05-04','Y'),(12121,'2025-02-03','Y'),(22222,'2022-10-09','Y'),(33333,'2024-09-14','N'),(44444,'2021-12-30','Y'),(55555,'2021-01-08','Y'),(66666,'2025-12-05','Y'),(77777,'2025-12-05','Y'),(88888,'2025-12-05','Y'),(99999,'2025-12-05','Y');
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culturalclassproviders`
--

DROP TABLE IF EXISTS `culturalclassproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culturalclassproviders` (
  `email` varchar(45) NOT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `orgposition` varchar(45) DEFAULT NULL,
  `orgworkyears` int(2) DEFAULT NULL,
  `status` enum('A','F','D') DEFAULT NULL COMMENT 'A - Approved\nF - For Approval\nD - Disapproved',
  `reason` varchar(45) DEFAULT NULL COMMENT 'reason for when the ccp is not approved',
  `processor_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `CCP001_idx` (`processor_email`),
  CONSTRAINT `CCP001` FOREIGN KEY (`processor_email`) REFERENCES `managers` (`email`),
  CONSTRAINT `CCP002` FOREIGN KEY (`email`) REFERENCES `serviceproviders` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culturalclassproviders`
--

LOCK TABLES `culturalclassproviders` WRITE;
/*!40000 ALTER TABLE `culturalclassproviders` DISABLE KEYS */;
INSERT INTO `culturalclassproviders` VALUES ('dmurcott7@unesco.org','Kautzer-Kirlin','Payment Adjustment Coordinator',33,'F','n/a','zguerrazzi6@japanpost.jp'),('kpane9@ifeng.com','Wisozk Inc','Sales Associate',13,'A','n/a','mfould7@yellowbook.com'),('skilner2@dailymail.co.uk','Schimmel, Zboncak and White','Operator',11,'D','incomplete req','mfould7@yellowbook.com'),('tchilderhouse6@slate.com','Streich and Sons','Web Developer II',7,'A','n/a','mfould7@yellowbook.com'),('ttraill5@photobucket.com','Balistreri, Pfeffer and Koch','VP Sales',36,'F','n/a','mfould7@yellowbook.com');
/*!40000 ALTER TABLE `culturalclassproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_inclusions`
--

DROP TABLE IF EXISTS `fee_inclusions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_inclusions` (
  `course_id` int(8) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `inclusion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  CONSTRAINT `FEE_INCLUSIONS` FOREIGN KEY (`course_id`) REFERENCES `classes` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_inclusions`
--

LOCK TABLES `fee_inclusions` WRITE;
/*!40000 ALTER TABLE `fee_inclusions` DISABLE KEYS */;
INSERT INTO `fee_inclusions` VALUES (31338816,574.00,'shirt'),(42537562,384.00,'shirt'),(48041108,574.00,'shirt'),(53907968,915.00,'food'),(68798062,243.00,'food'),(77452940,697.00,'shirt'),(80560509,388.00,'shirt'),(94581547,645.00,'shirt'),(96211416,966.00,'shirt'),(97396563,900.00,'food');
/*!40000 ALTER TABLE `fee_inclusions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` int(8) NOT NULL,
  `folder` varchar(45) DEFAULT NULL,
  `filename` varchar(45) DEFAULT NULL,
  `file_type` varchar(4) DEFAULT NULL COMMENT 'PDF, JPEG, PNG',
  `requirement_type` varchar(45) DEFAULT NULL,
  `date_submitted` date DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `date_processed` date DEFAULT NULL,
  `sender` varchar(45) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `file_id_UNIQUE` (`file_id`),
  KEY `FILES001_idx` (`receiver`),
  KEY `FILES002_idx` (`sender`),
  KEY `FILES003_idx` (`requirement_type`),
  KEY `FILES004_idx` (`file_type`),
  CONSTRAINT `FILES001` FOREIGN KEY (`receiver`) REFERENCES `travelofficers` (`email`),
  CONSTRAINT `FILES002` FOREIGN KEY (`sender`) REFERENCES `clientusers` (`email`),
  CONSTRAINT `FILES003` FOREIGN KEY (`requirement_type`) REFERENCES `ref_reqtypes` (`requirement_type`),
  CONSTRAINT `FILES004` FOREIGN KEY (`file_type`) REFERENCES `ref_filetypes` (`file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `group_id` int(8) NOT NULL,
  `accepted` enum('Y','N') NOT NULL,
  `removed` enum('Y','N') NOT NULL,
  `date_invited` date DEFAULT NULL,
  `invitation_id` int(8) NOT NULL,
  `recipient` varchar(45) NOT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `USERS_EMAIL_INVITATIONS_idx` (`recipient`),
  KEY `INVITATIONS001_idx` (`group_id`),
  CONSTRAINT `INVITATIONS001` FOREIGN KEY (`group_id`) REFERENCES `clientgroups` (`group_id`),
  CONSTRAINT `USERS_EMAIL_INVITATIONS` FOREIGN KEY (`recipient`) REFERENCES `clientusers` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES (41679329,'Y','N','2019-12-07',43014032,'sbowater8@multiply.com'),(15512416,'Y','N','2019-08-02',44718949,'kpane9@ifeng.com'),(31693999,'N','Y','2019-08-02',47116620,'lworral1@pinterest.com'),(41679329,'Y','N','2019-12-11',47401909,'tchilderhouse6@slate.com'),(15512416,'Y','N','2019-04-10',58716461,'sbowater8@multiply.com'),(41679329,'N','Y','2019-11-06',68623156,'kpane9@ifeng.com'),(31693999,'Y','Y','2019-12-07',77690015,'groberti4@hexun.com'),(15512416,'N','N','2019-10-11',80579288,'lworral1@pinterest.com'),(15512416,'N','Y','2019-11-06',85874842,'groberti4@hexun.com'),(41679329,'Y','N','2019-12-11',93318222,'vclive3@nytimes.com');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `issue_id` int(8) NOT NULL,
  `issuedesc` varchar(90) DEFAULT NULL,
  `date_issue` date DEFAULT NULL,
  `resolved` enum('Y','N') DEFAULT NULL COMMENT 'Y - Yes\nN - No',
  `sender` varchar(45) DEFAULT NULL,
  `resolver` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `ISSUES002_idx` (`sender`),
  KEY `ISSUES001_idx` (`resolver`),
  CONSTRAINT `ISSUES001` FOREIGN KEY (`resolver`) REFERENCES `managers` (`email`),
  CONSTRAINT `ISSUES002` FOREIGN KEY (`sender`) REFERENCES `clientusers` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (15892929,'too slow','2019-12-04','N','vclive3@nytimes.com','zguerrazzi6@japanpost.jp'),(23470020,'students were noisy','2019-07-16','Y','ttraill5@photobucket.com','kalexandre1@businessweek.com'),(55734572,'lecturer was unprofessional','2019-06-21','Y','groberti4@hexun.com','kalexandre1@businessweek.com'),(59344519,'nobody arrived','2019-11-26','N','tchilderhouse6@slate.com','mfould7@yellowbook.com'),(66413289,'we didn’t get change','2019-05-18','Y','dmurcott7@unesco.org','kalexandre1@businessweek.com'),(79718352,'room was dirty','2019-04-26','Y','groberti4@hexun.com','zguerrazzi6@japanpost.jp'),(83684314,'lecturer was late','2019-04-03','Y','vclive3@nytimes.com','kalexandre1@businessweek.com'),(90971229,'class took too long','2019-08-17','Y','sbowater8@multiply.com','kalexandre1@businessweek.com'),(91562365,'class didn’t start on time','2019-03-10','N','kpane9@ifeng.com','mfould7@yellowbook.com'),(92592106,'room was messy','2019-10-17','N','groberti4@hexun.com','mfould7@yellowbook.com');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `lecturer_id` int(8) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `briefbio` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (49062064,'Crista','Darcey','Psychology','Human Resources Manager','Hires new people in the organization'),(60459333,'Amelia','Cough','Architecture','GIS Technical Architect','studied architecture in school'),(85158905,'Jasun','Gilroy','Engineering','Geological Engineer','works at a known firm'),(90383842,'Justine','Rowan','Engineering','Geological Engineer','has own company'),(94691303,'Doug','Itscovitz','Psychology','Psychologist','works at a clinic');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `email` varchar(45) NOT NULL,
  `isSysAd` enum('Y','N') NOT NULL COMMENT 'Y - Yes\nN - No',
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `MANAGERS001` FOREIGN KEY (`email`) REFERENCES `companyusers` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES ('gspafford4@noaa.gov','Y'),('kalexandre1@businessweek.com','N'),('mfould7@yellowbook.com','N'),('sguest2@woothemes.com','N'),('zguerrazzi6@japanpost.jp','N');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_filetypes`
--

DROP TABLE IF EXISTS `ref_filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_filetypes` (
  `file_type` varchar(4) NOT NULL,
  PRIMARY KEY (`file_type`),
  UNIQUE KEY `file_type_UNIQUE` (`file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_filetypes`
--

LOCK TABLES `ref_filetypes` WRITE;
/*!40000 ALTER TABLE `ref_filetypes` DISABLE KEYS */;
INSERT INTO `ref_filetypes` VALUES ('JPEG'),('PDF'),('PNG');
/*!40000 ALTER TABLE `ref_filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_reqtypes`
--

DROP TABLE IF EXISTS `ref_reqtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_reqtypes` (
  `requirement_type` varchar(45) NOT NULL,
  PRIMARY KEY (`requirement_type`),
  UNIQUE KEY `requirement_type_UNIQUE` (`requirement_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_reqtypes`
--

LOCK TABLES `ref_reqtypes` WRITE;
/*!40000 ALTER TABLE `ref_reqtypes` DISABLE KEYS */;
INSERT INTO `ref_reqtypes` VALUES ('1'),('2'),('3'),('4'),('5'),('6');
/*!40000 ALTER TABLE `ref_reqtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_servicetypes`
--

DROP TABLE IF EXISTS `ref_servicetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_servicetypes` (
  `service_type` char(1) NOT NULL,
  PRIMARY KEY (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_servicetypes`
--

LOCK TABLES `ref_servicetypes` WRITE;
/*!40000 ALTER TABLE `ref_servicetypes` DISABLE KEYS */;
INSERT INTO `ref_servicetypes` VALUES ('A'),('B'),('C'),('D'),('E'),('F');
/*!40000 ALTER TABLE `ref_servicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceproviders`
--

DROP TABLE IF EXISTS `serviceproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceproviders` (
  `email` varchar(45) NOT NULL,
  `service_type` char(1) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `SERVICEPROVIDER002_idx` (`service_type`),
  CONSTRAINT `SERVICEPROVIDER001` FOREIGN KEY (`email`) REFERENCES `clientusers` (`email`),
  CONSTRAINT `SERVICEPROVIDER002` FOREIGN KEY (`service_type`) REFERENCES `ref_servicetypes` (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceproviders`
--

LOCK TABLES `serviceproviders` WRITE;
/*!40000 ALTER TABLE `serviceproviders` DISABLE KEYS */;
INSERT INTO `serviceproviders` VALUES ('dmurcott7@unesco.org','C'),('kpane9@ifeng.com','C'),('skilner2@dailymail.co.uk','C'),('tchilderhouse6@slate.com','C'),('ttraill5@photobucket.com','C');
/*!40000 ALTER TABLE `serviceproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shiftdays`
--

DROP TABLE IF EXISTS `shiftdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shiftdays` (
  `shiftcode` int(8) NOT NULL,
  `days` char(1) NOT NULL,
  PRIMARY KEY (`shiftcode`),
  UNIQUE KEY `shiftcode_UNIQUE` (`shiftcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiftdays`
--

LOCK TABLES `shiftdays` WRITE;
/*!40000 ALTER TABLE `shiftdays` DISABLE KEYS */;
INSERT INTO `shiftdays` VALUES (40337068,'F'),(51704718,'D'),(69651599,'S'),(77625730,'T'),(78700517,'W'),(88004920,'H'),(90818386,'M');
/*!40000 ALTER TABLE `shiftdays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `shiftcode` int(8) NOT NULL,
  `shiftdays` char(1) DEFAULT NULL COMMENT 'M\nT\nW\nT\nF',
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  PRIMARY KEY (`shiftcode`),
  UNIQUE KEY `shiftcode_UNIQUE` (`shiftcode`),
  CONSTRAINT `SHIFTS001` FOREIGN KEY (`shiftcode`) REFERENCES `shiftdays` (`shiftcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (40337068,'F','01:38:00','06:13:00'),(69651599,'S','13:09:00','10:00:00'),(78700517,'W','03:10:00','07:55:00'),(88004920,'H','16:53:00','18:14:00'),(90818386,'M','12:35:00','03:01:00');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int(8) NOT NULL,
  `type` varchar(1) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `cc_no` int(8) DEFAULT NULL,
  `booking_id` int(8) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_id_UNIQUE` (`transaction_id`),
  KEY `TRANSACTIONS001_idx` (`cc_no`),
  KEY `TRANSACTIONS002_idx` (`booking_id`),
  CONSTRAINT `TRANSACTIONS001` FOREIGN KEY (`cc_no`) REFERENCES `creditcards` (`cc_no`),
  CONSTRAINT `TRANSACTIONS002` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelofficers`
--

DROP TABLE IF EXISTS `travelofficers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelofficers` (
  `email` varchar(45) NOT NULL,
  `shiftcode` int(8) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `TO001_idx` (`email`),
  KEY `TO002_idx` (`shiftcode`),
  CONSTRAINT `TO001` FOREIGN KEY (`email`) REFERENCES `companyusers` (`email`),
  CONSTRAINT `TO002` FOREIGN KEY (`shiftcode`) REFERENCES `shifts` (`shiftcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelofficers`
--

LOCK TABLES `travelofficers` WRITE;
/*!40000 ALTER TABLE `travelofficers` DISABLE KEYS */;
INSERT INTO `travelofficers` VALUES ('kbuscher8@biblegateway.com',69651599),('mfould7@yellowbook.com',69651599),('mhounsome5@digg.com',78700517),('bbucktharp9@csmonitor.com',88004920),('bfey3@sfgate.com',90818386);
/*!40000 ALTER TABLE `travelofficers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-15 21:51:22
