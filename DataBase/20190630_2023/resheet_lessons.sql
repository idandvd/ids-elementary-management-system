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
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'אומנות',2,1,0,_binary '\0',_binary '\0','שיעור אומנות'),(2,'אומנות',3,1,0,_binary '\0',_binary '\0','שיעור אומנות'),(3,'אומנות',4,1,0,_binary '\0',_binary '\0','שיעור אומנות'),(4,'אנגלית',5,1,0,_binary '\0',_binary '\0','שיעור אנגלית'),(5,'אנגלית',6,1,0,_binary '\0',_binary '\0','שיעור אנגלית'),(6,'אנגלית',7,1,0,_binary '\0',_binary '\0','שיעור אנגלית'),(7,'אנגלית',8,1,0,_binary '\0',_binary '\0','שיעור אנגלית'),(8,'אנגלית',9,1,0,_binary '\0',_binary '\0','שיעור אנגלית'),(9,'אנגלית',10,1,0,_binary '\0',_binary '\0','שיעור אנגלית'),(10,'אנגלית',11,1,0,_binary '\0',_binary '\0','שיעור אנגלית'),(11,'אנגלית',5,2,0,_binary '\0',_binary '\0','שיעור אנגלית'),(12,'אנגלית',6,2,0,_binary '\0',_binary '\0','שיעור אנגלית'),(13,'אנגלית',7,2,0,_binary '\0',_binary '\0','שיעור אנגלית'),(14,'אנגלית',8,2,0,_binary '\0',_binary '\0','שיעור אנגלית'),(15,'אנגלית',9,2,0,_binary '\0',_binary '\0','שיעור אנגלית'),(16,'אנגלית',10,2,0,_binary '\0',_binary '\0','שיעור אנגלית'),(17,'דרמה',11,2,0,_binary '\0',_binary '\0','שיעור דרמה'),(18,'עברית',13,2,0,_binary '\0',_binary '\0','שיעור עברית'),(19,'עברית',14,2,0,_binary '\0',_binary '\0','שיעור עברית'),(20,'בית מדרש',15,2,0,_binary '\0',_binary '\0','שיעור בית מדרש'),(21,'מרכז עבודה',15,2,0,_binary '\0',_binary '\0','שיעור מרכז עבודה'),(22,'נגרות',15,2,0,_binary '\0',_binary '\0','שיעור נגרות'),(23,'גמרא',15,2,0,_binary '\0',_binary '\0','שיעור גמרא'),(24,'עברית',16,1,0,_binary '\0',_binary '\0','שיעור עברית'),(25,'עברית',17,1,0,_binary '\0',_binary '\0','שיעור עברית'),(26,'עברית',18,1,0,_binary '\0',_binary '\0','שיעור עברית'),(27,'עברית',19,1,0,_binary '\0',_binary '\0','שיעור עברית'),(28,'עברית',20,1,0,_binary '\0',_binary '\0','שיעור עברית'),(29,'עברית',21,1,0,_binary '\0',_binary '\0','שיעור עברית'),(30,'עברית',22,1,0,_binary '\0',_binary '\0','שיעור עברית'),(31,'עברית',23,1,0,_binary '\0',_binary '\0','שיעור עברית'),(32,'עברית',24,1,0,_binary '\0',_binary '\0','שיעור עברית'),(33,'עברית',25,1,0,_binary '\0',_binary '\0','שיעור עברית'),(34,'עברית',26,1,0,_binary '\0',_binary '\0','שיעור עברית'),(35,'עברית',27,1,0,_binary '\0',_binary '\0','שיעור עברית'),(36,'עברית',28,1,0,_binary '\0',_binary '\0','שיעור עברית'),(37,'עברית',29,1,0,_binary '\0',_binary '\0','שיעור עברית'),(38,'עברית',30,1,0,_binary '\0',_binary '\0','שיעור עברית'),(39,'עברית',31,1,0,_binary '\0',_binary '\0','שיעור עברית'),(40,'עברית',32,1,0,_binary '\0',_binary '\0','שיעור עברית'),(41,'עברית',33,1,0,_binary '\0',_binary '\0','שיעור עברית'),(42,'עברית',34,1,0,_binary '\0',_binary '\0','שיעור עברית'),(43,'עברית',35,1,0,_binary '\0',_binary '\0','שיעור עברית'),(44,'עברית',36,1,0,_binary '\0',_binary '\0','שיעור עברית'),(45,'חשבון',37,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(46,'חשבון',38,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(47,'חשבון',39,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(48,'חשבון',40,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(49,'חשבון',41,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(50,'חשבון',42,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(51,'חשבון',43,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(52,'חשבון',37,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(53,'חשבון',38,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(54,'חשבון',39,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(55,'חשבון',40,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(56,'חשבון',41,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(57,'חשבון',42,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(58,'חשבון',43,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(59,'כישורי חיים',44,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(60,'מדעים',45,1,0,_binary '\0',_binary '\0','שיעור מדעים'),(61,'מדעים',46,1,0,_binary '\0',_binary '\0','שיעור מדעים'),(62,'מדעים',47,1,0,_binary '\0',_binary '\0','שיעור מדעים'),(63,'מדעים',48,1,0,_binary '\0',_binary '\0','שיעור מדעים'),(64,'מוזיקה',49,1,0,_binary '\0',_binary '\0','שיעור מוזיקה'),(65,'מוזיקה',50,1,0,_binary '\0',_binary '\0','שיעור מוזיקה'),(66,'מדעים',45,2,0,_binary '\0',_binary '\0','שיעור מדעים'),(67,'מדעים',46,2,0,_binary '\0',_binary '\0','שיעור מדעים'),(68,'מדעים',47,2,0,_binary '\0',_binary '\0','שיעור מדעים'),(69,'מדעים',48,2,0,_binary '\0',_binary '\0','שיעור מדעים'),(70,'מוזיקה',49,2,0,_binary '\0',_binary '\0','שיעור מוזיקה'),(71,'מוזיקה',50,2,0,_binary '\0',_binary '\0','שיעור מוזיקה'),(72,'תפילה',51,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(73,'תפילה',52,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(74,'תפילה',53,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(75,'תפילה',54,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(76,'תפילה',55,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(77,'תפילה',56,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(78,'תפילה',57,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(79,'תפילה',58,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(80,'תפילה',59,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(81,'תפילה',60,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(82,'תפילה',61,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(83,'תפילה',62,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(84,'תפילה',63,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(85,'תפילה',64,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(86,'תפילה',65,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(87,'תפילה',66,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(88,'תפילה',67,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(89,'תפילה',68,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(90,'תפילה',69,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(91,'תפילה',70,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(92,'תפילה',71,1,0,_binary '\0',_binary '\0','שיעור תפילה'),(93,'מנהלת',72,1,0,_binary '\0',_binary '\0','שיעור מנהלת'),(94,'ספרות',73,1,0,_binary '\0',_binary '\0','שיעור ספרות'),(95,'ספרות',74,1,0,_binary '\0',_binary '\0','שיעור ספרות'),(96,'סיתות',75,2,0,_binary '\0',_binary '\0','שיעור סיתות'),(97,'ספורט',76,1,0,_binary '\0',_binary '\0','שיעור ספורט'),(98,'ספריה',77,1,0,_binary '\0',_binary '\0','שיעור ספריה'),(99,'קלינאית תקשורת',78,1,0,_binary '\0',_binary '\0','שיעור קלינאית תקשורת'),(100,'קלינאית תקשורת',79,1,0,_binary '\0',_binary '\0','שיעור קלינאית תקשורת'),(101,'טיפול במוסיקה',80,1,0,_binary '\0',_binary '\0','שיעור טיפול במוסיקה'),(102,'בית השוקולד',81,1,0,_binary '\0',_binary '\0','שיעור בית השוקולד'),(103,'בית השוקולד',82,1,0,_binary '\0',_binary '\0','שיעור בית השוקולד'),(104,'בעלי חיים',83,1,0,_binary '\0',_binary '\0','שיעור בעלי חיים'),(105,'ריפוי בעיסוק',84,1,0,_binary '\0',_binary '\0','שיעור ריפוי בעיסוק'),(106,'טיפול באומנות',85,1,0,_binary '\0',_binary '\0','שיעור טיפול באומנות'),(107,'עברית',86,2,0,_binary '\0',_binary '\0','שיעור עברית'),(108,'עברית',86,1,0,_binary '\0',_binary '\0','שיעור עברית'),(109,'עברית',87,1,0,_binary '\0',_binary '\0','שיעור עברית'),(110,'חשבון',88,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(111,'עברית',88,1,0,_binary '\0',_binary '\0','שיעור עברית'),(112,'עברית',89,1,0,_binary '\0',_binary '\0','שיעור עברית'),(113,'דרמה',90,1,0,_binary '\0',_binary '\0','שיעור דרמה'),(114,'משנה',91,1,0,_binary '\0',_binary '\0','שיעור משנה'),(115,'חשבון',91,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(116,'מרכז עבודה',92,1,0,_binary '\0',_binary '\0','שיעור מרכז עבודה'),(117,'משנה',93,2,0,_binary '\0',_binary '\0','שיעור משנה'),(118,'מדעים',94,1,0,_binary '\0',_binary '\0','שיעור מדעים'),(119,'ארץ ישראל',94,2,0,_binary '\0',_binary '\0','שיעור ארץ ישראל'),(120,'עברית',95,1,0,_binary '\0',_binary '\0','שיעור עברית'),(121,'חשבון',95,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(122,'חשבון',16,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(123,'חשבון',17,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(124,'חשבון',18,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(125,'חשבון',19,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(126,'חשבון',20,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(127,'חשבון',21,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(128,'חשבון',22,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(129,'חשבון',23,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(130,'חשבון',24,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(131,'חשבון',25,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(132,'חשבון',26,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(133,'חשבון',27,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(134,'חשבון',28,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(135,'חשבון',29,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(136,'חשבון',30,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(137,'חשבון',31,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(138,'חשבון',32,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(139,'חשבון',33,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(140,'חשבון',34,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(141,'חשבון',35,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(142,'חשבון',36,1,0,_binary '\0',_binary '\0','שיעור חשבון'),(143,'עברית',16,2,0,_binary '\0',_binary '\0','שיעור עברית'),(144,'עברית',17,2,0,_binary '\0',_binary '\0','שיעור עברית'),(145,'עברית',18,2,0,_binary '\0',_binary '\0','שיעור עברית'),(146,'עברית',19,2,0,_binary '\0',_binary '\0','שיעור עברית'),(147,'עברית',20,2,0,_binary '\0',_binary '\0','שיעור עברית'),(148,'עברית',21,2,0,_binary '\0',_binary '\0','שיעור עברית'),(149,'עברית',22,2,0,_binary '\0',_binary '\0','שיעור עברית'),(150,'עברית',23,2,0,_binary '\0',_binary '\0','שיעור עברית'),(151,'עברית',24,2,0,_binary '\0',_binary '\0','שיעור עברית'),(152,'עברית',25,2,0,_binary '\0',_binary '\0','שיעור עברית'),(153,'עברית',26,2,0,_binary '\0',_binary '\0','שיעור עברית'),(154,'עברית',27,2,0,_binary '\0',_binary '\0','שיעור עברית'),(155,'עברית',28,2,0,_binary '\0',_binary '\0','שיעור עברית'),(156,'עברית',29,2,0,_binary '\0',_binary '\0','שיעור עברית'),(157,'עברית',30,2,0,_binary '\0',_binary '\0','שיעור עברית'),(158,'עברית',31,2,0,_binary '\0',_binary '\0','שיעור עברית'),(159,'עברית',32,2,0,_binary '\0',_binary '\0','שיעור עברית'),(160,'עברית',33,2,0,_binary '\0',_binary '\0','שיעור עברית'),(161,'עברית',34,2,0,_binary '\0',_binary '\0','שיעור עברית'),(162,'עברית',35,2,0,_binary '\0',_binary '\0','שיעור עברית'),(163,'עברית',36,2,0,_binary '\0',_binary '\0','שיעור עברית'),(164,'חשבון',16,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(165,'חשבון',17,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(166,'חשבון',18,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(167,'חשבון',19,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(168,'חשבון',20,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(169,'חשבון',21,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(170,'חשבון',22,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(171,'חשבון',23,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(172,'חשבון',24,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(173,'חשבון',25,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(174,'חשבון',26,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(175,'חשבון',27,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(176,'חשבון',28,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(177,'חשבון',29,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(178,'חשבון',30,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(179,'חשבון',31,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(180,'חשבון',32,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(181,'חשבון',33,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(182,'חשבון',34,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(183,'חשבון',35,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(184,'חשבון',36,2,0,_binary '\0',_binary '\0','שיעור חשבון'),(185,'תורה',51,1,0,_binary '\0',_binary '\0','שיעור תורה'),(186,'תורה',52,1,0,_binary '\0',_binary '\0','שיעור תורה'),(187,'תורה',53,1,0,_binary '\0',_binary '\0','שיעור תורה'),(188,'תורה',54,1,0,_binary '\0',_binary '\0','שיעור תורה'),(189,'תורה',55,1,0,_binary '\0',_binary '\0','שיעור תורה'),(190,'תורה',56,1,0,_binary '\0',_binary '\0','שיעור תורה'),(191,'תורה',57,1,0,_binary '\0',_binary '\0','שיעור תורה'),(192,'תורה',58,1,0,_binary '\0',_binary '\0','שיעור תורה'),(193,'תורה',59,1,0,_binary '\0',_binary '\0','שיעור תורה'),(194,'תורה',60,1,0,_binary '\0',_binary '\0','שיעור תורה'),(195,'תורה',61,1,0,_binary '\0',_binary '\0','שיעור תורה'),(196,'תורה',62,1,0,_binary '\0',_binary '\0','שיעור תורה'),(197,'תורה',63,1,0,_binary '\0',_binary '\0','שיעור תורה'),(198,'תורה',64,1,0,_binary '\0',_binary '\0','שיעור תורה'),(199,'תורה',65,1,0,_binary '\0',_binary '\0','שיעור תורה'),(200,'תורה',66,1,0,_binary '\0',_binary '\0','שיעור תורה'),(201,'תורה',67,1,0,_binary '\0',_binary '\0','שיעור תורה'),(202,'תורה',68,1,0,_binary '\0',_binary '\0','שיעור תורה'),(203,'תורה',69,1,0,_binary '\0',_binary '\0','שיעור תורה'),(204,'תורה',70,1,0,_binary '\0',_binary '\0','שיעור תורה'),(205,'תורה',71,1,0,_binary '\0',_binary '\0','שיעור תורה'),(206,'הלכה',51,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(207,'הלכה',52,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(208,'הלכה',53,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(209,'הלכה',54,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(210,'הלכה',55,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(211,'הלכה',56,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(212,'הלכה',57,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(213,'הלכה',58,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(214,'הלכה',59,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(215,'הלכה',60,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(216,'הלכה',61,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(217,'הלכה',62,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(218,'הלכה',63,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(219,'הלכה',64,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(220,'הלכה',65,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(221,'הלכה',66,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(222,'הלכה',67,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(223,'הלכה',68,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(224,'הלכה',69,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(225,'הלכה',70,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(226,'הלכה',71,1,0,_binary '\0',_binary '\0','שיעור הלכה'),(227,'נביא',51,1,0,_binary '\0',_binary '\0','שיעור נביא'),(228,'נביא',52,1,0,_binary '\0',_binary '\0','שיעור נביא'),(229,'נביא',53,1,0,_binary '\0',_binary '\0','שיעור נביא'),(230,'נביא',54,1,0,_binary '\0',_binary '\0','שיעור נביא'),(231,'נביא',55,1,0,_binary '\0',_binary '\0','שיעור נביא'),(232,'נביא',56,1,0,_binary '\0',_binary '\0','שיעור נביא'),(233,'נביא',57,1,0,_binary '\0',_binary '\0','שיעור נביא'),(234,'נביא',58,1,0,_binary '\0',_binary '\0','שיעור נביא'),(235,'נביא',59,1,0,_binary '\0',_binary '\0','שיעור נביא'),(236,'נביא',60,1,0,_binary '\0',_binary '\0','שיעור נביא'),(237,'נביא',61,1,0,_binary '\0',_binary '\0','שיעור נביא'),(238,'נביא',62,1,0,_binary '\0',_binary '\0','שיעור נביא'),(239,'נביא',63,1,0,_binary '\0',_binary '\0','שיעור נביא'),(240,'נביא',64,1,0,_binary '\0',_binary '\0','שיעור נביא'),(241,'נביא',65,1,0,_binary '\0',_binary '\0','שיעור נביא'),(242,'נביא',66,1,0,_binary '\0',_binary '\0','שיעור נביא'),(243,'נביא',67,1,0,_binary '\0',_binary '\0','שיעור נביא'),(244,'נביא',68,1,0,_binary '\0',_binary '\0','שיעור נביא'),(245,'נביא',69,1,0,_binary '\0',_binary '\0','שיעור נביא'),(246,'נביא',70,1,0,_binary '\0',_binary '\0','שיעור נביא'),(247,'נביא',71,1,0,_binary '\0',_binary '\0','שיעור נביא'),(248,'כישורי חיים',51,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(249,'כישורי חיים',52,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(250,'כישורי חיים',53,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(251,'כישורי חיים',54,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(252,'כישורי חיים',55,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(253,'כישורי חיים',56,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(254,'כישורי חיים',57,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(255,'כישורי חיים',58,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(256,'כישורי חיים',59,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(257,'כישורי חיים',60,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(258,'כישורי חיים',61,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(259,'כישורי חיים',62,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(260,'כישורי חיים',63,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(261,'כישורי חיים',64,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(262,'כישורי חיים',65,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(263,'כישורי חיים',66,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(264,'כישורי חיים',67,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(265,'כישורי חיים',68,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(266,'כישורי חיים',69,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(267,'כישורי חיים',70,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(268,'כישורי חיים',71,1,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(269,'תורה',51,2,0,_binary '\0',_binary '\0','שיעור תורה'),(270,'תורה',52,2,0,_binary '\0',_binary '\0','שיעור תורה'),(271,'תורה',53,2,0,_binary '\0',_binary '\0','שיעור תורה'),(272,'תורה',54,2,0,_binary '\0',_binary '\0','שיעור תורה'),(273,'תורה',55,2,0,_binary '\0',_binary '\0','שיעור תורה'),(274,'תורה',56,2,0,_binary '\0',_binary '\0','שיעור תורה'),(275,'תורה',57,2,0,_binary '\0',_binary '\0','שיעור תורה'),(276,'תורה',58,2,0,_binary '\0',_binary '\0','שיעור תורה'),(277,'תורה',59,2,0,_binary '\0',_binary '\0','שיעור תורה'),(278,'תורה',60,2,0,_binary '\0',_binary '\0','שיעור תורה'),(279,'תורה',61,2,0,_binary '\0',_binary '\0','שיעור תורה'),(280,'תורה',62,2,0,_binary '\0',_binary '\0','שיעור תורה'),(281,'תורה',63,2,0,_binary '\0',_binary '\0','שיעור תורה'),(282,'תורה',64,2,0,_binary '\0',_binary '\0','שיעור תורה'),(283,'תורה',65,2,0,_binary '\0',_binary '\0','שיעור תורה'),(284,'תורה',66,2,0,_binary '\0',_binary '\0','שיעור תורה'),(285,'תורה',67,2,0,_binary '\0',_binary '\0','שיעור תורה'),(286,'תורה',68,2,0,_binary '\0',_binary '\0','שיעור תורה'),(287,'תורה',69,2,0,_binary '\0',_binary '\0','שיעור תורה'),(288,'תורה',70,2,0,_binary '\0',_binary '\0','שיעור תורה'),(289,'תורה',71,2,0,_binary '\0',_binary '\0','שיעור תורה'),(290,'משנה',51,1,0,_binary '\0',_binary '\0','שיעור משנה'),(291,'גמרא',51,2,0,_binary '\0',_binary '\0','שיעור גמרא'),(292,'גמרא',51,1,0,_binary '\0',_binary '\0','שיעור גמרא'),(293,'משנה',52,1,0,_binary '\0',_binary '\0','שיעור משנה'),(294,'גמרא',52,1,0,_binary '\0',_binary '\0','שיעור גמרא'),(295,'משנה',53,1,0,_binary '\0',_binary '\0','שיעור משנה'),(296,'גמרא',54,1,0,_binary '\0',_binary '\0','שיעור גמרא'),(297,'משנה',54,1,0,_binary '\0',_binary '\0','שיעור משנה'),(298,'משנה',55,1,0,_binary '\0',_binary '\0','שיעור משנה'),(299,'משנה',56,1,0,_binary '\0',_binary '\0','שיעור משנה'),(300,'משנה',57,1,0,_binary '\0',_binary '\0','שיעור משנה'),(301,'משנה',58,1,0,_binary '\0',_binary '\0','שיעור משנה'),(302,'משנה',59,1,0,_binary '\0',_binary '\0','שיעור משנה'),(303,'משנה',60,1,0,_binary '\0',_binary '\0','שיעור משנה'),(304,'משנה',61,1,0,_binary '\0',_binary '\0','שיעור משנה'),(305,'משנה',62,1,0,_binary '\0',_binary '\0','שיעור משנה'),(306,'משנה',63,1,0,_binary '\0',_binary '\0','שיעור משנה'),(307,'משנה',64,1,0,_binary '\0',_binary '\0','שיעור משנה'),(308,'משנה',65,1,0,_binary '\0',_binary '\0','שיעור משנה'),(309,'משנה',66,1,0,_binary '\0',_binary '\0','שיעור משנה'),(310,'משנה',67,1,0,_binary '\0',_binary '\0','שיעור משנה'),(311,'משנה',68,1,0,_binary '\0',_binary '\0','שיעור משנה'),(312,'משנה',69,1,0,_binary '\0',_binary '\0','שיעור משנה'),(313,'משנה',70,1,0,_binary '\0',_binary '\0','שיעור משנה'),(314,'משנה',71,1,0,_binary '\0',_binary '\0','שיעור משנה'),(315,'נביא',51,2,0,_binary '\0',_binary '\0','שיעור נביא'),(316,'נביא',52,2,0,_binary '\0',_binary '\0','שיעור נביא'),(317,'נביא',53,2,0,_binary '\0',_binary '\0','שיעור נביא'),(318,'נביא',54,2,0,_binary '\0',_binary '\0','שיעור נביא'),(319,'נביא',55,2,0,_binary '\0',_binary '\0','שיעור נביא'),(320,'נביא',56,2,0,_binary '\0',_binary '\0','שיעור נביא'),(321,'נביא',57,2,0,_binary '\0',_binary '\0','שיעור נביא'),(322,'נביא',58,2,0,_binary '\0',_binary '\0','שיעור נביא'),(323,'נביא',59,2,0,_binary '\0',_binary '\0','שיעור נביא'),(324,'נביא',60,2,0,_binary '\0',_binary '\0','שיעור נביא'),(325,'נביא',61,2,0,_binary '\0',_binary '\0','שיעור נביא'),(326,'נביא',62,2,0,_binary '\0',_binary '\0','שיעור נביא'),(327,'נביא',63,2,0,_binary '\0',_binary '\0','שיעור נביא'),(328,'נביא',64,2,0,_binary '\0',_binary '\0','שיעור נביא'),(329,'נביא',65,2,0,_binary '\0',_binary '\0','שיעור נביא'),(330,'נביא',66,2,0,_binary '\0',_binary '\0','שיעור נביא'),(331,'נביא',67,2,0,_binary '\0',_binary '\0','שיעור נביא'),(332,'נביא',68,2,0,_binary '\0',_binary '\0','שיעור נביא'),(333,'נביא',69,2,0,_binary '\0',_binary '\0','שיעור נביא'),(334,'נביא',70,2,0,_binary '\0',_binary '\0','שיעור נביא'),(335,'נביא',71,2,0,_binary '\0',_binary '\0','שיעור נביא'),(336,'כישורי חיים',51,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(337,'כישורי חיים',52,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(338,'כישורי חיים',53,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(339,'כישורי חיים',54,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(340,'כישורי חיים',55,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(341,'כישורי חיים',56,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(342,'כישורי חיים',57,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(343,'כישורי חיים',58,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(344,'כישורי חיים',59,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(345,'כישורי חיים',60,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(346,'כישורי חיים',61,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(347,'כישורי חיים',62,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(348,'כישורי חיים',63,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(349,'כישורי חיים',64,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(350,'כישורי חיים',65,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(351,'כישורי חיים',66,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(352,'כישורי חיים',67,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(353,'כישורי חיים',68,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(354,'כישורי חיים',69,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(355,'כישורי חיים',70,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים'),(356,'כישורי חיים',71,2,0,_binary '\0',_binary '\0','שיעור כישורי חיים');
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

-- Dump completed on 2019-06-30 20:23:09
