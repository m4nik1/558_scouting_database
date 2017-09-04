-- MySQL dump 10.13  Distrib 5.7.19, for osx10.12 (x86_64)
--
-- Host: localhost    Database: 558_scouting_testing
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `tbl_data`
--

DROP TABLE IF EXISTS `tbl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_data` (
  `match_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) DEFAULT NULL,
  `TypeGearIntake` varchar(100) DEFAULT NULL,
  `TypeGearPlace` varchar(100) DEFAULT NULL,
  `GearsPlaced` varchar(100) DEFAULT NULL,
  `kpa` varchar(100) DEFAULT NULL,
  `TypeDrivetrain` varchar(100) DEFAULT NULL,
  `Climb` varchar(100) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  UNIQUE KEY `match_id` (`match_id`,`team_name`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_data`
--

LOCK TABLES `tbl_data` WRITE;
/*!40000 ALTER TABLE `tbl_data` DISABLE KEYS */;
INSERT INTO `tbl_data` VALUES (1,'558','hybrid','active','5','0','Tank','yes','good team'),(1,'195','hybrid','active','5','0','Tank','yes','jsdgjdklgj'),(1,'225','hybrid','active','5','0','Tank','yes','jsdgjdklgj'),(5,'195','hybrid','active','5','0','Tank','yes','pick them?'),(10,'225','hybrid','active','2','50','Tank','yes',''),(5,'2067','hybrid','active','5','10','Mecanum','no','ok team'),(200,'1','hybrid','active','3','5','Mecanum','yes','none'),(20,'995','hybrid','active','5','2','Tank','yes','good');
/*!40000 ALTER TABLE `tbl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_username` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'maniksoomro','maniksoomro@gmail.com','123'),(2,'sdjgjkj','jljgkljdkgjk','skldjglkgj'),(3,'sdkgkjk','jdlksgjkj','dsjglkjg'),(4,'sijgksjdgkl','jkdsjklgjkgj','lkjskldjgkj'),(5,'skldgkljk','kjskldjgkj','lskjdgkljkg'),(6,'jsdjhsjg','klskdgkjk','skldjgkjgkjkldg'),(7,'jsdjhsjg','sdjgkjgkjkdls','skldjgkjgkjkldg'),(8,'asdgjkjgj','lkskdgjkjgk','ljsdkjkgjdksjg'),(9,'askjkjdkgjlk','jkldjsklgjlkjl','jlksdjklgjk'),(10,'askljjklgjl','jlkjslkdjgkljklg','ljslkdjklgjkldgjkl'),(11,'sdkgjgjdlk','jlkjsdlkjgkljk','jlkjsdklgjkljg'),(12,'sdkgjgjdlk','xfhghfgjgfj','jlkjsdklgjkljg'),(13,'sdkgjgjdlk','jkdjgjkdjglkjkdfjg','jlkjsdklgjkljg'),(14,'jdkgjdksgjk','lkjsdkgjkj','lkjskdjgkjd');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-04 18:26:05
