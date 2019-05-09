-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: resheet
-- ------------------------------------------------------
-- Server version	5.7.24-log

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
-- Table structure for table `teacher_types`
--

DROP TABLE IF EXISTS `teacher_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_types`
--

LOCK TABLES `teacher_types` WRITE;
/*!40000 ALTER TABLE `teacher_types` DISABLE KEYS */;
INSERT INTO `teacher_types` VALUES (46,''),(33,'123'),(8,'1בדיקה'),(34,'234'),(12,'2בדיקה'),(6,'?????'),(27,'asd'),(35,'asdff'),(42,'asdxx'),(41,'asdxxx'),(24,'asdz'),(32,'rrrr'),(20,'sdf'),(16,'undefined'),(26,'zxc'),(25,'zxca'),(29,'zxcasd'),(31,'zxcfg'),(37,'zxcss'),(44,'[object Object]'),(43,'אחלה בדיקה'),(17,'בדיקה 3'),(18,'בדיקה 4'),(56,'חנ\"מ'),(48,'חנמ'),(49,'יועצת'),(4,'מורה מקצועי'),(1,'מורה משלב'),(2,'מחנך'),(51,'מחנכת'),(5,'מנהל'),(52,'מנהלת'),(47,'מקצועי'),(53,'סגנית'),(54,'פרא רפואי'),(3,'רכז'),(55,'רכזת'),(45,'שדגזסב');
/*!40000 ALTER TABLE `teacher_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-09 22:17:21
