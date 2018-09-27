-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: epic_license
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `schoolName` varchar(100) NOT NULL,
  `schoolLogo` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'Aas Mohammad','aas@gmail.com','myschool','jpg2.jpg','2018-04-25 09:47:56','2018-05-23 17:34:17',1,0),(7,'Aditya Baghel','aditya.baghel@rsystems.com','RSI International School','jpg1.jpg','2018-05-09 17:26:30','2018-05-23 17:34:05',1,0),(12,'dsf dsfds','adsfditya.baghel@rsystems.com','RSI Intsernational','call.png','2018-05-10 18:45:42',NULL,1,0),(15,'sferte','adiaatya.baghel@rsystems.com','RSI International dsf','ms450_icon.png','2018-05-10 18:46:44',NULL,1,0),(17,'ssss','nsssssl@rsystems.com','sdfsdf','clender-img.png','2018-05-10 18:47:25',NULL,1,0),(21,'Aditya Baghel','aditya.baghel@rsystesms.com','RSI International','jpg.png','2018-05-22 15:37:56','2018-05-23 17:33:57',1,0),(22,'Aditya Baghels','aditya.baghsel@rsystems.com','RSI International','jpg14.png','2018-05-22 16:13:49','2018-05-23 15:50:06',1,0),(23,'Aditya Baghel','aditya.bafdsghel@rsystems.com','RSI Internationaldfs','jpg15.jpg','2018-05-22 16:34:57','2018-05-23 15:49:22',1,0),(24,'Nitesh Singh','nitesh.singhs@rsystems.com','N S I dfdsfdf','jpg10.png','2018-05-22 16:39:20','2018-05-23 17:33:48',1,0),(38,'Bharat','bharat.sharma1@gmail.com','RSI International','jpg16.png','2018-05-23 15:56:21',NULL,1,0),(39,'Bharat','bharat.sharma2@gmail.com','RSI International','jpg1.png','2018-05-23 15:56:52','2018-05-23 17:34:29',1,0),(40,'Bharat','bharat.sharma3@gmail.com','RSI International','jpg17.png','2018-05-23 15:57:29',NULL,1,0),(41,'Bharat','bharat.sharma4@gmail.com','RSI International','jpg18.jpg','2018-05-23 15:57:51',NULL,1,0),(42,'Bharat','bharat.sharma5@gmail.com','RSI International','jpg.jpg','2018-05-23 15:58:18','2018-05-23 17:33:35',1,0),(43,'Bharat','bharat.sharma6@gmail.com','RSI International','401.png','2018-05-23 15:58:37','2018-05-23 17:33:24',1,0),(65,'Bharat','bharat.sharma12@gmail.com','RSI International','jpg2.png','2018-05-23 18:27:55',NULL,1,0),(66,'Kriti Raj','krajssr@gmail.com','myschool','amp_volumes_page_loading_permissions.png','2018-05-23 18:30:02',NULL,1,0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_history`
--

DROP TABLE IF EXISTS `license_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licenseId` int(11) NOT NULL,
  `licenseFromDate` date NOT NULL,
  `licenseToDate` date NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_history`
--

LOCK TABLES `license_history` WRITE;
/*!40000 ALTER TABLE `license_history` DISABLE KEYS */;
INSERT INTO `license_history` VALUES (1,3,'2018-05-02','2018-05-09',NULL,1,'2018-05-02 16:08:46',NULL),(2,3,'2018-04-10','2018-04-20','',1,'2018-05-02 16:10:10',NULL),(3,3,'2018-07-06','2018-09-20',NULL,1,'2018-05-02 16:11:45',NULL),(4,3,'2018-10-01','2018-10-31',NULL,1,'2018-05-02 16:12:53',NULL),(5,3,'2018-11-01','2018-11-30',NULL,1,'2018-05-02 16:13:13',NULL),(7,27,'2018-05-08','2018-05-10','test',1,'2018-05-09 17:28:31',NULL),(8,28,'2018-05-13','2018-05-30','test1',1,'2018-05-09 17:29:52',NULL),(9,29,'2018-05-06','2018-05-14','test2',1,'2018-05-09 17:30:26',NULL),(10,30,'2018-05-02','2018-05-16','test3',1,'2018-05-09 17:30:56',NULL),(11,31,'2018-05-04','2018-05-16','test6',1,'2018-05-09 17:31:24',NULL),(12,32,'2018-05-07','2018-05-17','tester7',1,'2018-05-09 17:32:12',NULL),(13,33,'2018-05-01','2018-05-18','tester8',1,'2018-05-09 17:33:03',NULL),(14,34,'2018-05-12','2018-05-26','wer',1,'2018-05-09 19:20:19',NULL),(15,35,'2018-05-20','2018-05-31','wer',1,'2018-05-09 19:20:33',NULL),(16,36,'2018-05-20','2018-05-31','wer',1,'2018-05-09 19:20:34',NULL),(17,37,'2018-05-10','2018-05-11','aa',1,'2018-05-10 18:18:45',NULL),(18,37,'2018-05-12','2018-05-27',NULL,1,'2018-05-11 11:41:57',NULL),(19,28,'2018-06-01','2018-06-30',NULL,1,'2018-05-11 18:56:09',NULL),(20,38,'2018-05-12','2018-05-31','test',1,'2018-05-11 19:02:49',NULL),(21,39,'2018-05-12','2018-05-26','hjjhk',1,'2018-05-15 16:16:51',NULL),(22,40,'2018-06-04','2018-06-16','dfds',1,'2018-05-15 16:51:07',NULL),(23,41,'2018-06-02','2018-07-01','test',1,'2018-05-15 19:50:31',NULL),(24,42,'2018-05-22','2018-05-28','afaf',1,'2018-05-22 11:52:51',NULL),(25,43,'2018-05-23','2018-05-31','',1,'2018-05-22 18:50:19',NULL),(26,44,'2018-05-23','2018-05-31','',1,'2018-05-22 18:52:38',NULL),(27,45,'2018-05-23','2018-05-29','',1,'2018-05-22 18:53:32',NULL),(28,46,'2018-05-29','2018-06-16','',1,'2018-05-22 18:54:21',NULL),(29,47,'2018-05-21','2018-05-28','',1,'2018-05-22 18:59:25',NULL),(30,48,'2018-05-23','2018-05-31','',1,'2018-05-22 19:00:47',NULL),(31,49,'2018-05-23','2018-05-29','',1,'2018-05-22 19:01:05',NULL),(32,49,'2018-05-22','2018-05-30',NULL,1,'2018-05-22 19:18:22',NULL),(33,50,'2018-05-23','2018-05-31','',1,'2018-05-23 12:52:25',NULL);
/*!40000 ALTER TABLE `license_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `licenseKey` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (5,4,'xMPo6VjhaYcuQktpZ4OR',NULL,'2018-05-01 10:48:33',NULL,0,0),(18,4,'HKpakDIxdP09WmgzYyfR',NULL,'2018-05-01 12:39:42',NULL,0,0),(21,4,'Lm2jiOEc4Mo9d1IpRtyP',NULL,'2018-05-01 12:43:08','2018-05-01 12:43:13',0,0),(25,4,'Jf3D6rWhLIui241vF7Ql',NULL,'2018-05-01 16:48:34',NULL,0,0),(39,19,'8mx02UOhtlpNXBS7PYes','hjjhk','2018-05-15 16:16:51',NULL,0,0),(46,2,'hrjYdRmMPfE50iAKu7nx','','2018-05-22 18:54:21',NULL,0,0),(47,2,'EmMydqR3jrAzCoi4nakK','','2018-05-22 18:59:25',NULL,0,0),(48,2,'GRrUeSswklvI97dK6Laz','','2018-05-22 19:00:47',NULL,0,0);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_users`
--

DROP TABLE IF EXISTS `system_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8_bin DEFAULT NULL,
  `fullname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(160) COLLATE utf8_bin DEFAULT NULL,
  `salt` varchar(160) COLLATE utf8_bin DEFAULT NULL,
  `user_role_id` int(10) DEFAULT NULL,
  `last_login` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login_ip` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `reset_request_code` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `reset_request_time` datetime DEFAULT NULL,
  `reset_request_ip` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `verification_status` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_users`
--

LOCK TABLES `system_users` WRITE;
/*!40000 ALTER TABLE `system_users` DISABLE KEYS */;
INSERT INTO `system_users` VALUES (1,'admin@admin.com','Admin','8e666f12a66c17a952a1d5e273428e478e02d943','4f6cdddc4979b8.51434094',1,'2018-06-05 14:55:18','10.191.95.53',NULL,NULL,NULL,1,1),(3,'krajss1m@gmail.com','Kr','d7335486fe4b025e83b66f1f5297a5ea8cb0674a','5af03c0c420c27.62710981',1,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,1,1),(9,'krajssr111@gmail.com','Kriti Raj','89e41005f495fd9c2cd44a073d2c7cfc8016c6c4','5afab7e1c7f900.10565256',2,'2018-05-07 18:48:55',NULL,NULL,NULL,NULL,0,1),(10,'sdfsdf@sdfsd.ghg','Kriti Raj101','a0a5a3e42e3eb88b2ebe5cd6b484b9d9079b5fdd','5af06021866311.06305585',2,'2018-05-07 18:52:51',NULL,NULL,NULL,NULL,0,1),(11,'aditya.testbaghel@rsystems.com','test','a7a5f1ba2250b6a70d77b866e75516ba3a549995','5af408975e0a89.61392158',2,'2018-05-10 14:23:43',NULL,NULL,NULL,NULL,0,1),(14,'adsf@rsystems.com','dsfds','cbb48dbf34b1512bd1bf3bee4a8acd82633508e3','5af408f4f26485.25755122',2,'2018-05-10 14:25:16',NULL,NULL,NULL,NULL,0,1),(15,'tessst@gmail.com','testaa','6536487164c91f858eaf35697de1f17e83154a5e','5af40908e286b9.26727859',2,'2018-05-10 14:25:36',NULL,NULL,NULL,NULL,0,1),(17,'testqa@gmail.com','testqqa','f64a36ca45679ec6692a29a3348d589d807fb78c','5af4096e7f4ce5.47001649',2,'2018-05-10 14:27:18',NULL,NULL,NULL,NULL,0,1),(18,'testqwer@gmail.com','testqwer','1cbfd76537fa999a44acd0c8fbbb5b1099aeb92a','5af40984523ad9.88640529',2,'2018-05-10 14:27:40',NULL,NULL,NULL,NULL,0,1),(19,'testrt@gmail.com','testtr','ba94418da068eb489aa4d5061fc27668a913e3c4','5af4099f4af5f1.62865047',2,'2018-05-10 14:28:07',NULL,NULL,NULL,NULL,0,1),(20,'ssssssssssssl@rsystems.com','dsfdss','7f10647abf3e59d2da0abe908c634fd182e52559','5af409bb71ec71.31005660',2,'2018-05-10 14:28:35',NULL,NULL,NULL,NULL,0,1),(21,'testsssss@gmail.com','testdf','e254ac423dae9ed67f62ed5fef6f7496d32e2e29','5af409ce77d477.66435739',2,'2018-05-10 14:28:54',NULL,NULL,NULL,NULL,0,1),(22,'adityadddd.baghel@rsystems.com','testdddd','20c80406dd313498d991167f13de5b6f560576bb','5af409e4d9bc89.17086193',2,'2018-05-10 14:29:16',NULL,NULL,NULL,NULL,0,1),(24,'dtesdddt@gmail.com','tersdf','119d1ed54072edb9074856196778f3ec41f8cf08','5af40a3685f992.89321952',2,'2018-05-10 14:30:38',NULL,NULL,NULL,NULL,0,1),(25,'dfdsssl@rsystems.com','testrssss','2198d0fb27c30cbea7cd927a971921645d6e3064','5af40a497f8b85.56689991',2,'2018-05-10 14:30:57',NULL,NULL,NULL,NULL,0,1),(26,'tedfsdfst@gmail.com','tessss','eee3fd855684889ba26832ac2fefca8d4076bdc8','5af40a5b526374.42888865',2,'2018-05-10 14:31:15',NULL,NULL,NULL,NULL,0,1),(28,'adityddda.baghel@rsystems.com','testsdfsdf','9b12f80251cdbd7d152f589d1d02788ff19aa9de','5af40ae6c8c2a6.52531931',2,'2018-05-10 14:33:34',NULL,NULL,NULL,NULL,0,1),(30,'nitesh.singh@rsystems.com','Nitesh Singh','688ccf7ecfae784f08f7eeaf2e907c72bce04c17','5b029be9dabfe0.93509312',2,'2018-05-22 19:52:44','10.191.95.53',NULL,NULL,NULL,1,1),(32,'sumit.verma@gmail.com','Sumit Verma','78010e263e8cca63629987106cb87e237e3ce799','5b03cc0be98476.68501306',2,'2018-05-22 12:37:24',NULL,NULL,NULL,NULL,0,1),(33,'aditya.baghel@rsystems.com','Aditya','1e940eeaf692aff8c4a269198b8d4f682d9278df','5b03ce86c83ae2.11118058',2,'2018-05-22 13:28:35',NULL,NULL,NULL,NULL,0,1),(36,'admin2@admin.com','qwe','1218936e2877c756e71f200aa6855856d4525115','5b050682af6039.38588502',2,'2018-05-23 11:43:22',NULL,NULL,NULL,NULL,0,1),(37,'krajssr@gmail.com','Treat','dbdbc2d5a30385488ad34c7cb55a708234568f38','5b0566f1200241.97344955',2,'2018-05-23 18:34:49',NULL,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `system_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_map`
--

DROP TABLE IF EXISTS `user_access_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access_map` (
  `user_role_id` int(10) NOT NULL,
  `controller` varchar(255) COLLATE utf8_bin NOT NULL,
  `permission` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_role_id`,`controller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_map`
--

LOCK TABLES `user_access_map` WRITE;
/*!40000 ALTER TABLE `user_access_map` DISABLE KEYS */;
INSERT INTO `user_access_map` VALUES (1,'admin/welcome',1),(1,'customers',31),(1,'licenses',31),(1,'users',31),(2,'customers',15),(2,'licenses',27),(2,'users',0);
/*!40000 ALTER TABLE `user_access_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_autologin`
--

DROP TABLE IF EXISTS `user_autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_autologin`
--

LOCK TABLES `user_autologin` WRITE;
/*!40000 ALTER TABLE `user_autologin` DISABLE KEYS */;
INSERT INTO `user_autologin` VALUES ('035fe5429d0614cde079f7936d2f56b5',1,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','10.191.95.112','2018-05-23 12:59:07'),('8abdee398fc5b584b291e7abb54fd33e',1,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/65.0.3325.181 Chrome/65.0.3325.181 Safari/537.36','10.191.95.53','2018-05-23 09:43:57'),('9603017621542eac69c5c8135c18de4a',1,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/66.0.3359.181 Chrome/66.0.3359.181 Safari/537.36','10.191.95.53','2018-06-05 09:25:18'),('ce323e053dbc0b75572c5249043dafb4',1,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','::1','2018-05-07 08:51:30');
/*!40000 ALTER TABLE `user_autologin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_meta` (
  `user_id` bigint(20) unsigned NOT NULL,
  `first_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `default_access` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Super Admin','11111'),(2,'Admin','11111');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-05 20:04:28
