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
-- Table structure for table `teacher_class_access`
--

DROP TABLE IF EXISTS `teacher_class_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_class_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `teacher_class_access_UNIQUE` (`teacher_id`,`class_id`),
  KEY `teacher_class_access_class_id` (`class_id`),
  CONSTRAINT `teacher_class_access_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teacher_class_access_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_class_access`
--

LOCK TABLES `teacher_class_access` WRITE;
/*!40000 ALTER TABLE `teacher_class_access` DISABLE KEYS */;
INSERT INTO `teacher_class_access` VALUES (76,1,3),(75,1,19),(1,16,1),(2,17,2),(3,18,3),(4,19,4),(5,20,5),(6,21,6),(7,22,3),(8,23,7),(9,24,8),(10,25,9),(11,26,10),(12,27,10),(13,28,11),(14,29,12),(15,30,13),(16,31,11),(17,32,14),(18,33,13),(19,34,15),(20,35,16),(21,36,17),(22,51,12),(23,52,14),(78,53,1),(25,54,15),(77,55,3),(27,56,18),(28,57,11),(29,58,5),(30,59,6),(31,60,7),(32,61,9),(33,62,10),(34,63,13),(35,64,16),(36,65,8),(37,66,17),(38,67,15),(39,68,2),(40,69,11),(41,70,19),(42,71,20),(48,72,1),(45,72,2),(47,72,3),(58,72,4),(50,72,5),(54,72,6),(55,72,7),(62,72,8),(60,72,9),(53,72,10),(51,72,11),(61,72,12),(43,72,13),(59,72,14),(57,72,15),(46,72,16),(49,72,17),(52,72,18),(44,72,19),(56,72,20),(63,86,13),(64,86,19),(66,87,5),(67,87,11),(65,87,17),(68,87,18),(70,88,1),(69,88,3),(72,89,6),(73,89,7),(71,89,10),(74,89,20);
/*!40000 ALTER TABLE `teacher_class_access` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-30 20:23:11
