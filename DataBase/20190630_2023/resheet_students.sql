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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `picture_path` varchar(1000) DEFAULT NULL,
  `home_phone` varchar(50) DEFAULT '',
  `settlement` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `students_mother_id` (`mother_id`),
  KEY `students_father_id` (`father_id`),
  KEY `students_class_id` (`class_id`),
  KEY `students_cyear_id` (`year_id`),
  CONSTRAINT `students_class_id` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `students_cyear_id` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `students_father_id` FOREIGN KEY (`father_id`) REFERENCES `parents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `students_mother_id` FOREIGN KEY (`mother_id`) REFERENCES `parents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'פליאה אורה','אביעזר',1,2,19,1,'assets/pictures/2.jpg','29938422','כפר עציון'),(2,'טליה','אבן חיים',3,4,19,1,'assets/pictures/3.jpg','29936478','מגדל עוז'),(3,'ישי אריה','אופק',5,6,19,1,'assets/pictures/4.jpg','29931044','אלעזר'),(4,'תאיר','אדלר',7,8,19,1,'assets/pictures/5.jpg','9974055','אפרת'),(5,'אוריה','איגליצקי',9,10,19,1,'assets/pictures/6.jpg','5371141','כפר עציון'),(6,'נטיב רז','אל גד',11,12,19,1,'assets/pictures/7.jpg','-','שדה בועז'),(7,'נחוניה','בן דור',13,14,19,1,'assets/pictures/8.jpg','5797740','כרמי צור'),(8,'נעמי אור','גרינברג',15,16,19,1,'assets/pictures/9.jpg','-','כפר עציון'),(9,'יונתן','דאום',17,18,19,1,'assets/pictures/10.jpg','9309469','אלעזר'),(10,'תמה','הרשושנים',19,20,19,1,'assets/pictures/11.jpg','5804910','פני קדם'),(11,'נועם בתיה','וולף',21,22,19,1,'assets/pictures/12.jpg','073-7411790','כפר עציון'),(12,'נעה שולמית','וינשטוק',23,24,19,1,'assets/pictures/13.jpg','9938044','פני קדם'),(13,'עברי','ויסמן',25,26,19,1,'assets/pictures/14.jpg','9914272','ראש צורים'),(14,'קוה יעקב','טבול',27,28,19,1,'assets/pictures/15.jpg','9309101','ראש צורים'),(15,'כרם אהבה','טל',29,30,19,1,'assets/pictures/16.jpg','9911883','בת עין'),(16,'טל חיים','כהן',31,32,19,1,'assets/pictures/17.jpg','9309372','ראש צורים'),(17,'צור ישראל','כהן',33,34,19,1,'assets/pictures/18.jpg','9309176','פני קדם'),(18,'דביר משה','נוי',35,36,19,1,'assets/pictures/19.jpg','9932312','אלעזר'),(19,'אוריה','נחמני',37,38,19,1,'assets/pictures/20.jpg','9938763','איבי הנחל'),(20,'עברי','סוננבליק',39,40,19,1,'assets/pictures/21.jpg','9934652','אלעזר'),(21,'קמה','עמר',41,42,19,1,'assets/pictures/22.jpg','5606375','כפר עציון'),(22,'ירדן','ענבי',43,44,19,1,'assets/pictures/23.jpg','-','אלעזר'),(23,'רוני','פרל',45,46,19,1,'assets/pictures/24.jpg','5713411','שדה בועז'),(24,'שקד','פרקל',47,48,19,1,'assets/pictures/1.jpg','5337248','אלעזר'),(25,'ניר חיים','צחור',49,50,19,1,'assets/pictures/2.jpg','-','מגדל עוז'),(26,'כרמי','רבינוביץ',51,52,19,1,'assets/pictures/3.jpg','9309869','ראש צורים'),(27,'צופיה רחל','רוזנבלוט',53,54,19,1,'assets/pictures/4.jpg','-','ראש צורים'),(28,'איתי אליהו','רותם',55,56,19,1,'assets/pictures/5.jpg','9934240','אלעזר'),(29,'שיר','שבות',57,58,19,1,'assets/pictures/6.jpg','9934261','ראש צורים'),(30,'יאיר','אבייב',59,60,3,1,'assets/pictures/7.jpg','9962743','עתניאל'),(31,'כלילא','אביעזר',61,62,3,1,'assets/pictures/8.jpg','9938422','כפר עציון'),(32,'אביתר','אוחיון',63,64,3,1,'assets/pictures/9.jpg','9933179','הר גילה'),(33,'יונתן','אילי',65,66,3,1,'assets/pictures/10.jpg','072-2820239','נווה דניאל'),(34,'נוה','ביים',67,68,3,1,'assets/pictures/11.jpg','-','איבי הנחל'),(35,'יותם','בינג',69,70,3,1,'assets/pictures/12.jpg','-','כפר עציון'),(36,'מעיין','ברוך',71,72,3,1,'assets/pictures/13.jpg','-','אלון שבות'),(37,'נריה','גאלדור',73,74,3,1,'assets/pictures/14.jpg','5799897','איבי הנחל'),(38,'אלונה','היימן',75,76,3,1,'assets/pictures/15.jpg','6510640','אלעזר'),(39,'שקד','הרמן',77,78,3,1,'assets/pictures/16.jpg','-','אלעזר'),(40,'איתם צבי','הרשקוביץ',79,80,3,1,'assets/pictures/17.jpg','-','גבעות'),(41,'עמיאל','זלוטניק',81,82,3,1,'assets/pictures/18.jpg','9934950','נווה דניאל'),(42,'שיר אודי','זלמנוביץ',83,84,3,1,'assets/pictures/19.jpg','6644308','אלעזר'),(43,'עינה אסתר','טבול',85,86,3,1,'assets/pictures/20.jpg','9938233','ראש צורים'),(44,'אלישבע','כהן',87,88,3,1,'assets/pictures/21.jpg','5611104','נווה דניאל'),(45,'יצהר','לוריא',89,90,3,1,'assets/pictures/22.jpg','9309076','פני קדם'),(46,'ברקת','לבמור',91,92,3,1,'assets/pictures/23.jpg','6508865','אלעזר'),(47,'תהל','מאיר',93,94,3,1,'assets/pictures/24.jpg','077-4553221','אלון שבות'),(48,'אסף','מבורך',95,96,3,1,'assets/pictures/1.jpg','-','אלון שבות'),(49,'יוסף חיים','מקסימוף',97,98,3,1,'assets/pictures/2.jpg','02-6639019','ביתר'),(50,'נעם','נאומבורג',99,100,3,1,'assets/pictures/3.jpg','-','גבעות'),(51,'אבינעם','נחמני',101,102,3,1,'assets/pictures/4.jpg','9938763','איבי הנחל'),(52,'הדר','פוגל',103,104,3,1,'assets/pictures/5.jpg','9309803','אלעזר'),(53,'יצחק','קולברון',105,106,3,1,'assets/pictures/6.jpg','9932575','נווה דניאל'),(54,'הודיה','קרימולובסקי',107,108,3,1,'assets/pictures/7.jpg','9938130','אלון שבות'),(55,'יערה','קרמר',109,110,3,1,'assets/pictures/8.jpg','9933573','ראש צורים'),(56,'אוראל','רוזנראוך',111,112,3,1,'assets/pictures/9.jpg','','אלעזר'),(57,'נווה','רבי',113,114,3,1,'assets/pictures/10.jpg','-','כפר עציון'),(58,'מיה','שוימר',115,116,3,1,'assets/pictures/11.jpg','9934622','ראש צורים'),(59,'מעיין','שינברג',117,118,3,1,'assets/pictures/12.jpg','6487160','כפר עציון');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
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
