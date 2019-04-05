CREATE DATABASE  IF NOT EXISTS `resheet` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_bin */;
USE `resheet`;
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
  `settlement` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (61,'פליאה אורה','אביעזר',119,120,1,1,'','29938422','כפר עציון'),(62,'טליה','אבן חיים',121,122,1,1,'','29936478','מגדל עוז'),(63,'ישי אריה','אופק',123,124,1,1,'','29931044','אלעזר'),(64,'תאיר','אדלר',125,126,1,1,'','9974055','אפרת'),(65,'אוריה','איגליצקי',127,128,1,1,'','5371141','כפר עציון'),(66,'נטיב רז','אל גד',129,130,1,1,'','-','שדה בועז'),(67,'נחוניה','בן דור',131,132,1,1,'','5797740','כרמי צור'),(68,'נעמי אור','גרינברג',133,134,1,1,'','-','כפר עציון'),(69,'יונתן','דאום',135,136,1,1,'','9309469','אלעזר'),(70,'תמה','הרשושנים',137,138,1,1,'','5804910','פני קדם'),(71,'נועם בתיה','וולף',139,140,1,1,'','073-7411790','כפר עציון'),(72,'נעה שולמית','וינשטוק',141,142,1,1,'','9938044','פני קדם'),(73,'עברי','ויסמן',143,144,1,1,'','9914272','ראש צורים'),(74,'קוה יעקב','טבול',145,146,1,1,'','9309101','ראש צורים'),(75,'כרם אהבה','טל',147,148,1,1,'','9911883','בת עין'),(76,'טל חיים','כהן',149,150,1,1,'','9309372','ראש צורים'),(77,'צור ישראל','כהן',151,152,1,1,'','9309176','פני קדם'),(78,'דביר משה ','נוי',153,154,1,1,'','9932312','אלעזר'),(79,'אוריה','נחמני',155,156,1,1,'','9938763','איבי הנחל'),(80,'עברי','סוננבליק',157,158,1,1,'','9934652','אלעזר'),(81,'קמה','עמר',159,160,1,1,'','5606375','כפר עציון'),(82,'ירדן','ענבי',161,162,1,1,'','-','אלעזר'),(83,'רוני','פרל',163,164,1,1,'','5713411','שדה בועז'),(84,'שקד','פרקל',165,166,1,1,'','5337248','אלעזר'),(85,'ניר חיים','צחור',167,168,1,1,'','-','מגדל עוז'),(86,'כרמי','רבינוביץ',169,170,1,1,'','9309869','ראש צורים'),(87,'צופיה רחל','רוזנבלוט',171,172,1,1,'','-','ראש צורים'),(88,'איתי אליהו','רותם',173,174,1,1,'','9934240','אלעזר'),(89,'שיר','שבות',175,176,1,1,'','9934261','ראש צורים'),(90,'יאיר','אבייב ',177,178,2,1,'','9962743','עתניאל'),(91,'כלילא ','אביעזר',179,180,2,1,'','9938422','כפר עציון'),(92,'אביתר','אוחיון',181,182,2,1,'','9933179','הר גילה'),(93,'יונתן','אילי',183,184,2,1,'','072-2820239','נווה דניאל'),(94,'נוה','ביים',185,186,2,1,'','-','איבי הנחל'),(95,'יותם ','בינג',187,188,2,1,'','-','כפר עציון'),(96,'מעיין','ברוך',189,190,2,1,'','-','אלון שבות'),(97,'נריה ','גאלדור',191,192,2,1,'','5799897','איבי הנחל'),(98,'אלונה ','היימן',193,194,2,1,'','6510640','אלעזר'),(99,'שקד','הרמן',195,196,2,1,'','-','אלעזר'),(100,'איתם צבי','הרשקוביץ',197,198,2,1,'','-','גבעות'),(101,'עמיאל ','זלוטניק',199,200,2,1,'','9934950','נווה דניאל'),(102,'שיר אודי','זלמנוביץ',201,202,2,1,'','6644308','אלעזר'),(103,'עינה אסתר','טבול',203,204,2,1,'','9938233','ראש צורים'),(104,'אלישבע','כהן ',205,206,2,1,'','5611104','נווה דניאל'),(105,'יצהר ','לוריא',207,208,2,1,'','9309076','פני קדם'),(106,'ברקת','לבמור',209,210,2,1,'','6508865','אלעזר'),(107,'תהל','מאיר',211,212,2,1,'','077-4553221','אלון שבות'),(108,'אסף ','מבורך',213,214,2,1,'','-','אלון שבות'),(109,'יוסף חיים','מקסימוף',215,216,2,1,'','02-6639019','ביתר'),(110,'נעם','נאומבורג',217,218,2,1,'','-','גבעות'),(111,'אבינעם','נחמני',219,220,2,1,'','9938763','איבי הנחל'),(112,'הדר','פוגל',221,222,2,1,'','9309803','אלעזר'),(113,'יצחק','קולברון ',223,224,2,1,'','9932575','נווה דניאל'),(114,'הודיה','קרימולובסקי',225,226,2,1,'','9938130','אלון שבות'),(115,'יערה','קרמר',227,228,2,1,'','9933573','ראש צורים'),(116,'אוראל','רוזנראוך',229,230,2,1,'','','אלעזר'),(117,'נווה','רבי ',231,232,2,1,'','-','כפר עציון'),(118,'מיה','שוימר',233,234,2,1,'','9934622','ראש צורים');
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

-- Dump completed on 2019-03-24  8:18:08
