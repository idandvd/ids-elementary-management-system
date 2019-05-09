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
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `lesson_type_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `has_evaluation` bit(1) DEFAULT b'0',
  `has_grade` bit(1) DEFAULT b'0',
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `lessons_teacher_id` (`teacher_id`),
  KEY `lessons_lesson_type_id` (`lesson_type_id`),
  CONSTRAINT `lessons_lesson_type_id` FOREIGN KEY (`lesson_type_id`) REFERENCES `lesson_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lessons_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (2,'תורה',1,1,1,_binary '',_binary '\0','שיעור תורה'),(3,'שיעוריק',1,2,0,_binary '',_binary '',''),(4,'שיעור חדש',1,1,0,_binary '',_binary '\0',''),(5,'שיעור 1',1,2,0,_binary '',_binary '\0',''),(6,'שיעור 2',1,1,0,_binary '',_binary '',''),(7,'שיעור 9',1,1,0,_binary '\0',_binary '',''),(8,'שיעור 3',1,1,0,_binary '\0',_binary '',''),(9,'שיעור 4',1,1,0,_binary '\0',_binary '',''),(10,'שיעור 5',1,1,0,_binary '\0',_binary '',''),(11,'שיעור 6',1,1,0,_binary '\0',_binary '',''),(12,'שיעור 7',1,1,0,_binary '\0',_binary '',''),(13,'שיעור 8',1,1,0,_binary '\0',_binary '','');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-09 22:17:22
