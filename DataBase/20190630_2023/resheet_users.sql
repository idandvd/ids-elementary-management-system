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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `users_user_type_id` (`user_type_id`),
  CONSTRAINT `users_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'idanda','idanda',1),(2,'user1','user1',2),(3,'user2','user2',2),(4,'user3','user3',2),(5,'user4','user4',2),(6,'user5','user5',2),(7,'user6','user6',2),(8,'user7','user7',2),(9,'user8','user8',2),(10,'user9','user9',2),(11,'user10','user10',2),(12,'user11','user11',2),(13,'user12','user12',2),(14,'user13','user13',2),(15,'user14','user14',2),(16,'user15','user15',2),(17,'user16','user16',2),(18,'user17','user17',2),(19,'user18','user18',2),(20,'user19','user19',2),(21,'user20','user20',2),(22,'user21','user21',2),(23,'user22','user22',2),(24,'user23','user23',2),(25,'user24','user24',2),(26,'user25','user25',2),(27,'user26','user26',2),(28,'user27','user27',2),(29,'user28','user28',2),(30,'user29','user29',2),(31,'user30','user30',2),(32,'user31','user31',2),(33,'user32','user32',2),(34,'user33','user33',2),(35,'user34','user34',2),(36,'user35','user35',2),(37,'user36','user36',2),(38,'user37','user37',2),(39,'user38','user38',2),(40,'user39','user39',2),(41,'user40','user40',2),(42,'user41','user41',2),(43,'user42','user42',2),(44,'user43','user43',2),(45,'user44','user44',2),(46,'user45','user45',2),(47,'user46','user46',2),(48,'user47','user47',2),(49,'user48','user48',2),(50,'user49','user49',2),(51,'user50','user50',2),(52,'user51','user51',2),(53,'user52','user52',2),(54,'user53','user53',2),(55,'user54','user54',2),(56,'user55','user55',2),(57,'user56','user56',2),(58,'user57','user57',2),(59,'user58','user58',2),(60,'user59','user59',2),(61,'user60','user60',2),(62,'user61','user61',2),(63,'user62','user62',2),(64,'user63','user63',2),(65,'user64','user64',2),(66,'user65','user65',2),(67,'user66','user66',2),(68,'user67','user67',2),(69,'user68','user68',2),(70,'tehila','tehila',2),(71,'user70','user70',2),(72,'user71','user71',2),(73,'user72','user72',2),(74,'user73','user73',2),(75,'user74','user74',2),(76,'user75','user75',2),(77,'user76','user76',2),(78,'user77','user77',2),(79,'user78','user78',2),(80,'user79','user79',2),(81,'user80','user80',2),(82,'user81','user81',2),(83,'user82','user82',2),(84,'user83','user83',2),(85,'user84','user84',2),(86,'user85','user85',2),(87,'user86','user86',2),(88,'user87','user87',2),(89,'user88','user88',2),(90,'user89','user89',2),(91,'user90','user90',2),(92,'user91','user91',2),(93,'user92','user92',2),(94,'user93','user93',2),(95,'user94','user94',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
