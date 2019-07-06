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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_schedules`
--

LOCK TABLES `classes_schedules` WRITE;
/*!40000 ALTER TABLE `classes_schedules` DISABLE KEYS */;
INSERT INTO `classes_schedules` VALUES (7,1,1,210,3),(8,2,1,210,3),(9,3,1,210,3),(10,4,1,210,3),(11,5,1,210,3),(12,6,1,210,3),(13,1,3,189,3),(14,1,4,189,3),(15,1,6,108,3),(16,1,7,108,3),(17,1,9,122,3),(18,2,3,1,3),(19,2,4,116,3),(20,2,6,298,3),(21,2,7,4,3),(22,2,9,97,3),(23,2,11,122,3),(24,2,12,122,3),(25,3,3,108,3),(26,3,4,108,3),(27,3,6,1,3),(28,3,7,189,3),(29,3,9,189,3),(30,4,3,231,3),(31,4,4,298,3),(32,4,6,122,3),(33,4,9,252,3),(34,4,11,231,3),(35,5,3,122,3),(36,5,4,122,3),(37,5,6,4,3),(38,5,7,60,3),(39,5,9,60,3),(40,6,3,189,3),(41,6,4,189,3),(42,6,6,1,3),(43,6,7,189,3),(55,1,1,225,19),(56,1,3,313,19),(57,1,4,204,19),(58,1,6,44,19),(59,1,7,44,19),(60,1,9,204,19),(61,2,1,225,19),(62,3,1,225,19),(63,4,1,225,19),(64,5,1,225,19),(65,6,1,225,19),(66,1,11,91,19),(67,2,3,204,19),(68,2,4,204,19),(69,2,6,204,19),(70,2,7,44,19),(71,2,9,44,19),(72,2,11,1,19),(73,2,12,1,19),(74,3,3,122,19),(75,3,4,122,19),(76,3,6,44,19),(77,3,7,60,19),(78,3,9,60,19),(79,4,3,44,19),(80,4,4,44,19),(81,4,6,123,19),(82,4,7,123,19),(83,4,9,204,19),(84,4,11,204,19),(85,5,3,123,19),(86,5,4,123,19),(87,5,6,204,19),(88,5,7,204,19),(89,5,9,64,19),(90,5,11,204,19),(91,6,3,44,19),(92,6,4,44,19),(93,6,6,44,19);
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

-- Dump completed on 2019-06-30 20:23:08
