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
-- Table structure for table `classes_schedules`
--

DROP TABLE IF EXISTS `classes_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_id` int(11) NOT NULL,
  `hour_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `classes_schedule_day_id` (`day_id`),
  KEY `classes_schedule_hour_id` (`hour_id`),
  KEY `classes_schedule_lesson_id` (`lesson_id`),
  KEY `classes_schedule_class_id` (`class_id`),
  CONSTRAINT `classes_schedule_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `classes_schedule_day_id` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `classes_schedule_hour_id` FOREIGN KEY (`hour_id`) REFERENCES `hours_in_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `classes_schedule_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_schedules`
--

LOCK TABLES `classes_schedules` WRITE;
/*!40000 ALTER TABLE `classes_schedules` DISABLE KEYS */;
INSERT INTO `classes_schedules` VALUES (77,2,1,3,1),(78,3,1,3,1),(79,4,1,3,1),(80,5,1,2,1),(81,3,5,3,1),(82,1,3,10,1),(83,1,4,8,1),(84,2,3,4,1),(85,2,5,9,1),(86,4,3,5,1),(87,4,4,5,1),(88,4,6,12,1),(89,5,5,12,1),(90,1,1,2,1);
/*!40000 ALTER TABLE `classes_schedules` ENABLE KEYS */;
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
