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
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `cellphone` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (1,'מיכל','אביעזר','054-6422332','michal3av@yahoo.com','female'),(2,'יהונתן','אביעזר','052-3827226','av.yonatan@gmail.com','male'),(3,'עינת','אבן חיים','052-2714112','even.chaim@gmail.com','female'),(4,'אלידע נסים','אבן חיים','052-4446840','','male'),(5,'עליזה אנבל','אופק','050-5100053','ofeklizu@gmail.com','female'),(6,'נעם דוד','אופק','050-9931044','noamofek@gmail.com','male'),(7,'אביגיל','אדלר','058-7521316','adlerabigail@gmail.com','female'),(8,'חיים','אדלר','058-7521317','','male'),(9,'כרמית','איגליצקי','054-7549911','carmit_mela1@hotmail.com','female'),(10,'שי','איגליצקי','050-4077094','shaieglitsky@gmail.com','male'),(11,'אורנה','אל גד','050-4012046','orna.elgad@gmail.com','female'),(12,'עמית משה','אל גד','050-4012066','amit@gush-etzion.co.il','male'),(13,'שירז','בן דור','058-4002819','keshet2003@gmail.com','female'),(14,'שלמה','בן דור','058-4002820','bendorshlomo@gmail.com','male'),(15,'בת שבע','גרינברג','050-7803791','batsh.pam@gmail.com','female'),(16,'איתמר','גרינברג','055-6692412','','male'),(17,'אפרת','דאום','054-6216591','efrat.daum@gmail.com','female'),(18,'משה חנוך','דאום','050-5820540','daum30@gmail.com','male'),(19,'רחל','הרשושנים','054-7890868','racheltg@gmail.com','female'),(20,'אמציה','הרשושנים','054-8040567','amatsia.nm@gmail.com','male'),(21,'תמר שרה','וולף','050-6847593','wolffmt@gmail.com','female'),(22,'מיכאל דוד','וולף','052-5652277','','male'),(23,'שרה','וינשטוק','054-5592619','wsara@toveihair.co.il','female'),(24,'חיים מישאל','וינשטוק','052-5992725','mishaelm@walla.co.il','male'),(25,'מיכל','ויסמן','054-5411721','wmichal502@gmail.com','female'),(26,'אריאל אליעזר','ויסמן','052-4367171','arik502@gmail.com','male'),(27,'ציונה אהובה','טבול','054-6700624','tzionatan@gmail.com','female'),(28,'יונתן יהודה','טבול','050-2404756','','male'),(29,'יפעת','טל','052-3339874','Yifat3322@gmail.com','female'),(30,'בן','טל','052-6656326','Gavna8@gmail.com','male'),(31,'לביאה','כהן','050-7670189','mlcohen.art@gmail.com','female'),(32,'מרדכי אפרים','כהן','050-5994488','','male'),(33,'מירב','כהן','052-6717250','meravch@gmail.com','female'),(34,'משה','כהן','052-9270264','mooshonc@gmail.com','male'),(35,'אורית','נוי','054-2678701','oritnoy80@gmail.com','female'),(36,'יוחאי','נוי','052-5456759','noyshtat@gmail.com','male'),(37,'רות','נחמני','054-7730224','Rmordechai@gmail.com','female'),(38,'מתן','נחמני','052-5839108','Matanach@gmail.com','male'),(39,'רננה','סוננבליק','052-5664363','renanaso@gmail.com','female'),(40,'אליעזר','סוננבליק','052-3771530','eli@s-m-e.co.il','male'),(41,'יפעה','עמר','052-5802989','ifaaamar@gmail.com','female'),(42,'אלחנן','עמר','050-2200834','elchananamar@gmail.com','male'),(43,'גאולית רחל','ענבי','050-5065633','geulit1@walla.com','female'),(44,'שלמה','ענבי','050-2233559','anavi057@gmail.com','male'),(45,'לימור','פרל','054-4914970','pearlimor@walla.co.il','female'),(46,'אורי','פרל','050-6291902','oripearl@gmail.com','male'),(47,'רינת','פרקל','050-7412084','rinatsap33@gmail.com','female'),(48,'אחיקם','פרקל','050-7958482','','male'),(49,'ברכה כרמית','צחור','054-4961072','carmittzachor@gmail.com','female'),(50,'נדב','צחור','052-6071898','','male'),(51,'טובה','רבינוביץ','052-7710664','shaitovi@gmail.com','female'),(52,'שי','רבינוביץ','052-7710663','','male'),(53,'שרון','רוזנבלוט','052-3614895','sharonr87@gmail.com','female'),(54,'אילון שלום','רוזנבלוט','052-4316263','','male'),(55,'טל','רותם','052-8455254','mrs.rotem@gmail.com','female'),(56,'חיים יעקב','רותם','050-7891112','mikorotem@gmail.com','male'),(57,'רננה','שבות','058-6528658','barakshvut@gmail.com','female'),(58,'ברק','שבות','058-7657363','','male'),(59,'זהר','אבייב','052-3346046','','female'),(60,'נתן','אבייב','052-8990179','ysussya@gmail.com','male'),(61,'מיכל','אביעזר','054-6422332','michal3av@yahoo.com','female'),(62,'יהונתן','אביעזר','052-3827226','','male'),(63,'עדי','אוחיון','054-2472552','adidorose@gmail.com','female'),(64,'אלדד','אוחיון','054-5698770','','male'),(65,'מיכל','אילי','050-5780322','','female'),(66,'אלחנן','אילי','050-5996392','elchayali@gmail.com','male'),(67,'רעות','ביים','050-8549977','reutyc@gmail.com','female'),(68,'אהרן','ביים','050-8912359','Aharonbaime@gmail.com','male'),(69,'רעות','בינג','050-6782389','reutiro@gmail.com','female'),(70,'עלי','בינג','052-4559707','elibing1@gmail.com','male'),(71,'יונה','ברוך','054-5447868','yonyon80@gmail.com','female'),(72,'משה','ברוך','054-5447868','','male'),(73,'נורית','גאלדור','054-6415664','nu.yogealdor@gmail.com','female'),(74,'יוחאי','גאלדור','055-6670761','','male'),(75,'יערה','היימן','052-4846495','yaarahay@gmail.com','female'),(76,'מאיר','היימן','052-5665860','meir.nachshon@gmail.com','male'),(77,'אילנית','הרמן','050-3909988','ilanit_a6@walla.com','female'),(78,'עמנואל','הרמן','050-4544411','hermanmano@gmail.com','male'),(79,'יעל','הרשקוביץ','052-6399761','yeela911@walla.co.il','female'),(80,'לוטן','הרשקוביץ','052-8764965','lotanher@gmail.com','male'),(81,'ליסה','זלוטניק','','lisazlotnick15@gmail.com','female'),(82,'דוד','זלוטניק','052-3003130','lisazlotnick15@gmail.com','male'),(83,'מרגלית','זלמנוביץ','052-2956020','margalit052@gmail.com','female'),(84,'יאיר','זלמנוביץ','054-6333200','yairz100@gmail.com','male'),(85,'רחל','טבול','052-4239778','rtabull@walla.com','female'),(86,'ראובן','טבול','052-6071773','','male'),(87,'שולי','כהן','054-5665389','shuliandjames@yahoo.com','female'),(88,'שולי','כהן','054-7987689','','male'),(89,'שרה','לוריא','054-6830652','smlourie1@gmail.com','female'),(90,'מיכאל','לוריא','054-4730652','smlourie1@gmail.com','male'),(91,'ולורי','לבמור','054-5571415','laurilevmore@gmail.com','female'),(92,'מאיר','לבמור','050-7207010','laurilevmore@gmail.com','male'),(93,'רחל','מאיר','054-4400978','rachm4@gmail.com','female'),(94,'אורי','מאיר','054-4553221','ori_meir@yahoo.com','male'),(95,'חגית','מבורך','052-3472554','chagitnu@gmail.com','female'),(96,'רפאל','מבורך','054-2233569','r_mevorach@hotmail.com','male'),(97,'דבורה ברכה','מקסימוף','050-4151320','','female'),(98,'אורן','מקסימוף','050-4151220','','male'),(99,'רעות','נאומבורג','054-6255955','namburg@gmail.com','female'),(100,'יהודה','נאומבורג','054-5676727','tutita@walla.co.il','male'),(101,'רות','נחמני','054-7730224','Rmordechai@gmail.com','female'),(102,'מתן','נחמני','052-5839108','Matanach@gmail.com','male'),(103,'ענבל','פוגל','052-3263870','fogel06@gmail.com','female'),(104,'חנן','פוגל','050-6232459','','male'),(105,'לארה','קולברון','052-6030813','lara.kwalbrun@gmail.com','female'),(106,'לארה','קולברון','052-7500829','','male'),(107,'סיגל','קרימולובסקי','054-5902411','sigalkrimo@gmail.com','female'),(108,'אשר','קרימולובסקי','054-5902413','asherkrimo@gmail.com','male'),(109,'יעל','קרמר','054-4411701','gyaeli@gmail.com','female'),(110,'גיל','קרמר','054-4411702','gilkremer78@gmail.com','male'),(111,'אביב','רוזנראוך','054-6587488','avivsarah@gmail.com','female'),(112,'שרה','רוזנראוך','052-4320099','','male'),(113,'בת ציון','רבי','058-6486024','batzirabi@gmail.com','female'),(114,'בת ציון','רבי','050-6859950','baruch1233@gmail.com','male'),(115,'הדס','שוימר','054-8003158','oshvimme@cisco.com','female'),(116,'אוהד','שוימר','054-5664249','hadasshvimmer@gmail.com','male'),(117,'עידית','שינברג','052-5663489','benisin1@gmail.com','female'),(118,'בנימין','שינברג','052-5380704','iditshin@gmail.com','male');
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-30 20:23:10
