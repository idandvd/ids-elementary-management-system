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
  `gender` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (1211,' מיכל ','אביעזר','054-6422332','  \nmichal3av@yahoo.com ','female'),(1212,'יהונתן','אביעזר','052-3827226','av.yonatan@gmail.com \n ','male'),(1213,' עינת ','אבן חיים','052-2714112','even.chaim@gmail.com \n','female'),(1214,'אלידע נסים  ','אבן חיים','052-4446840','','male'),(1215,'עליזה אנבל ','אופק','050-5100053','\nofeklizu@gmail.com ','female'),(1216,'נעם דוד  ','אופק','050-9931044','noamofek@gmail.com \n','male'),(1217,'אביגיל','אדלר','058-7521316','adlerabigail@gmail.com','female'),(1218,'חיים ','אדלר','058-7521317','','male'),(1219,'כרמית ','איגליצקי','054-7549911','carmit_mela1@hotmail.com ','female'),(1220,'שי ','איגליצקי','050-4077094','shaieglitsky@gmail.com ','male'),(1221,' אורנה ','אל גד','050-4012046','\norna.elgad@gmail.com ','female'),(1222,'עמית משה','אל גד','050-4012066','amit@gush-etzion.co.il \n','male'),(1223,' שירז ','בן דור','058-4002819','\nkeshet2003@gmail.com ','female'),(1224,'שלמה','בן דור','058-4002820','bendorshlomo@gmail.com \n','male'),(1225,' בת שבע ','גרינברג','050-7803791','\nbatsh.pam@gmail.com ','female'),(1226,'איתמר','גרינברג','055-6692412','','male'),(1227,'אפרת ','דאום','054-6216591',' \nefrat.daum@gmail.com ','female'),(1228,'משה חנוך ','דאום','050-5820540','daum30@gmail.com \n','male'),(1229,'רחל  ','הרשושנים','054-7890868','\nracheltg@gmail.com ','female'),(1230,'אמציה','הרשושנים','054-8040567','amatsia.nm@gmail.com ','male'),(1231,'תמר שרה ','וולף','050-6847593','\nwolffmt@gmail.com ','female'),(1232,'מיכאל דוד ','וולף','052-5652277','','male'),(1233,'שרה ','וינשטוק','054-5592619','\nwsara@toveihair.co.il ','female'),(1234,'חיים מישאל ','וינשטוק','052-5992725','mishaelm@walla.co.il ','male'),(1235,'מיכל ','ויסמן','054-5411721','\nwmichal502@gmail.com ','female'),(1236,'אריאל אליעזר','ויסמן','052-4367171','arik502@gmail.com \n','male'),(1237,' ציונה אהובה ','טבול','054-6700624','tzionatan@gmail.com ','female'),(1238,'יונתן יהודה','טבול','050-2404756','','male'),(1239,'יפעת ','טל','052-3339874','\nYifat3322@gmail.com ','female'),(1240,'בן','טל','052-6656326','Gavna8@gmail.com \n','male'),(1241,'לביאה ','כהן','050-7670189','mlcohen.art@gmail.com \n','female'),(1242,'מרדכי אפרים','כהן','050-5994488','','male'),(1243,'מירב ','כהן','052-6717250','\nmeravch@gmail.com ','female'),(1244,'משה ','כהן','052-9270264','mooshonc@gmail.com ','male'),(1245,'אורית ','נוי','054-2678701','\noritnoy80@gmail.com ','female'),(1246,'יוחאי','נוי','052-5456759','noyshtat@gmail.com \n','male'),(1247,'רות','נחמני','054-7730224','Rmordechai@gmail.com \n','female'),(1248,'מתן','נחמני','052-5839108','\nMatanach@gmail.com ','male'),(1249,'רננה ','סוננבליק','052-5664363','renanaso@gmail.com','female'),(1250,'אליעזר','סוננבליק','052-3771530','eli@s-m-e.co.il\n','male'),(1251,'יפעה ','עמר','052-5802989','\nifaaamar@gmail.com ','female'),(1252,'אלחנן','עמר','050-2200834','elchananamar@gmail.com \n','male'),(1253,' גאולית רחל ','ענבי','050-5065633','\ngeulit1@walla.com ','female'),(1254,'שלמה ','ענבי','050-2233559','anavi057@gmail.com ','male'),(1255,'לימור ','פרל','054-4914970','\npearlimor@walla.co.il ','female'),(1256,'אורי  ','פרל','050-6291902','oripearl@gmail.com \n','male'),(1257,'רינת ','פרקל','050-7412084','rinatsap33@gmail.com \n','female'),(1258,'אחיקם','פרקל','050-7958482','','male'),(1259,'ברכה כרמית ','צחור','054-4961072','carmittzachor@gmail.com \n ','female'),(1260,'נדב','צחור','052-6071898','','male'),(1261,'טובה ','רבינוביץ','052-7710664','shaitovi@gmail.com \n','female'),(1262,'שי','רבינוביץ','052-7710663','','male'),(1263,'שרון ','רוזנבלוט','052-3614895','sharonr87@gmail.com \n','female'),(1264,'אילון שלום ','רוזנבלוט','052-4316263',' ','male'),(1265,'טל ','רותם','052-8455254','\nmrs.rotem@gmail.com ','female'),(1266,'חיים יעקב ','רותם','050-7891112','mikorotem@gmail.com \n','male'),(1267,'רננה ','שבות','058-6528658','barakshvut@gmail.com \n','female'),(1268,'ברק ','שבות','058-7657363','','male'),(1269,'זהר','אבייב ','052-3346046','','female'),(1270,'נתן','אבייב ','052-8990179','ysussya@gmail.com','male'),(1271,'מיכל','אביעזר','054-6422332','michal3av@yahoo.com','female'),(1272,'יהונתן','אביעזר','052-3827226','','male'),(1273,'עדי','אוחיון','054-2472552','adidorose@gmail.com','female'),(1274,'אלדד','אוחיון','054-5698770','','male'),(1275,'מיכל','אילי','050-5780322','','female'),(1276,'אלחנן','אילי','050-5996392','elchayali@gmail.com','male'),(1277,'רעות','ביים','050-8549977','reutyc@gmail.com\n','female'),(1278,'אהרן','ביים','050-8912359','\nAharonbaime@gmail.com','male'),(1279,'רעות','בינג','050-6782389','reutiro@gmail.com\n','female'),(1280,'עלי','בינג','052-4559707','\nelibing1@gmail.com','male'),(1281,'יונה','ברוך','054-5447868','yonyon80@gmail.com','female'),(1282,'משה','ברוך','054-5447868','','male'),(1283,'נורית','גאלדור','054-6415664','nu.yogealdor@gmail.com','female'),(1284,'יוחאי ','גאלדור','055-6670761','','male'),(1285,'יערה','היימן','052-4846495','yaarahay@gmail.com\n','female'),(1286,'מאיר','היימן','052-5665860','\nmeir.nachshon@gmail.com','male'),(1287,'אילנית','הרמן','050-3909988','ilanit_a6@walla.com\n','female'),(1288,'עמנואל','הרמן','050-4544411','\nhermanmano@gmail.com','male'),(1289,'יעל','הרשקוביץ','052-6399761','yeela911@walla.co.il\n','female'),(1290,'לוטן ','הרשקוביץ','052-8764965','\nlotanher@gmail.com','male'),(1291,'ליסה','זלוטניק','','lisazlotnick15@gmail.com\n','female'),(1292,'דוד ','זלוטניק','052-3003130','lisazlotnick15@gmail.com\n','male'),(1293,'מרגלית','זלמנוביץ','052-2956020','margalit052@gmail.com\n','female'),(1294,'יאיר','זלמנוביץ','054-6333200','\nyairz100@gmail.com','male'),(1295,'רחל','טבול','052-4239778','rtabull@walla.com','female'),(1296,'ראובן','טבול','052-6071773','','male'),(1297,'שולי ','כהן ','054-5665389','shuliandjames@yahoo.com','female'),(1298,'שולי','כהן ','054-7987689','','male'),(1299,'שרה','לוריא','054-6830652','smlourie1@gmail.com','female'),(1300,'מיכאל','לוריא','054-4730652','smlourie1@gmail.com','male'),(1301,' ולורי','לבמור','054-5571415','laurilevmore@gmail.com','female'),(1302,'מאיר','לבמור','050-7207010',' laurilevmore@gmail.com','male'),(1303,'רחל','מאיר','054-4400978','rachm4@gmail.com\n','female'),(1304,'אורי','מאיר','054-4553221','\nori_meir@yahoo.com','male'),(1305,'חגית','מבורך','052-3472554','chagitnu@gmail.com\n','female'),(1306,'רפאל ','מבורך','054-2233569','\nr_mevorach@hotmail.com','male'),(1307,'דבורה ברכה','מקסימוף','050-4151320','','female'),(1308,'אורן ','מקסימוף','050-4151220','','male'),(1309,'רעות','נאומבורג','054-6255955','\nnamburg@gmail.com','female'),(1310,'יהודה','נאומבורג','054-5676727','tutita@walla.co.il\n','male'),(1311,'רות','נחמני','054-7730224','Rmordechai@gmail.com ','female'),(1312,'מתן','נחמני','052-5839108','\nMatanach@gmail.com ','male'),(1313,'ענבל','פוגל','052-3263870','fogel06@gmail.com','female'),(1314,'חנן','פוגל','050-6232459','','male'),(1315,'לארה','קולברון ','052-6030813','lara.kwalbrun@gmail.com','female'),(1316,'לארה','קולברון ','052-7500829','','male'),(1317,'סיגל','קרימולובסקי','054-5902411','sigalkrimo@gmail.com\n','female'),(1318,'אשר','קרימולובסקי','054-5902413','\nasherkrimo@gmail.com','male'),(1319,'יעל','קרמר','054-4411701','gyaeli@gmail.com\n','female'),(1320,'גיל','קרמר','054-4411702','\ngilkremer78@gmail.com','male'),(1321,'אביב','רוזנראוך','054-6587488','avivsarah@gmail.com ','female'),(1322,'שרה','רוזנראוך','052-4320099','','male'),(1323,'בת ציון ','רבי ','058-6486024','batzirabi@gmail.com\n','female'),(1324,'בת ציון','רבי ','050-6859950','\nbaruch1233@gmail.com','male'),(1325,'הדס','שוימר','054-8003158','\noshvimme@cisco.com','female'),(1326,'אוהד','שוימר','054-5664249','hadasshvimmer@gmail.com\n','male'),(1327,'עידית','שינברג','052-5663489','\nbenisin1@gmail.com','female'),(1328,'בנימין','שינברג','052-5380704','iditshin@gmail.com','male');
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

-- Dump completed on 2019-05-09 22:17:23
