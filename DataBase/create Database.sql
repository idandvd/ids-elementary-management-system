drop TABLE IF EXISTS tables_information;
drop TABLE IF EXISTS sent_sms;
drop TABLE IF EXISTS received_sms;
drop TABLE IF EXISTS lessons_evaluations;
drop TABLE IF EXISTS students_schedules;
drop TABLE IF EXISTS classes_schedules;
drop TABLE IF EXISTS lessons_grades;
drop TABLE IF EXISTS lessons;
drop TABLE IF EXISTS lesson_types;
drop TABLE IF EXISTS students ;
drop TABLE IF EXISTS parents ;
drop TABLE IF EXISTS teacher_class_access;
drop TABLE IF EXISTS classes ;
drop TABLE IF EXISTS teachers ;
drop TABLE IF EXISTS teacher_types;
drop TABLE IF EXISTS users ;
drop TABLE IF EXISTS user_types ;
drop TABLE IF EXISTS hours_in_day ;
drop TABLE IF EXISTS days;
drop TABLE IF EXISTS grades ;
drop TABLE IF EXISTS years ;
drop table IF EXISTS preferences;


CREATE TABLE years (
    id INT(11) NOT NULL AUTO_INCREMENT,
	name YEAR(4) NOT NULL,
	hebrew_year NVARCHAR(50),
	PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
	UNIQUE name_UNIQUE(name),
    UNIQUE hebrew_year_UNIQUE(hebrew_year)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE grades (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    number INT(11),
    PRIMARY KEY(id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE name_UNIQUE(name)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;  

CREATE TABLE days (
    id INT(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(20),
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE name_UNIQUE(name)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE hours_in_day (
    id INT(11) NOT NULL AUTO_INCREMENT,
    hour_of_school_day int(11) NOT NULL,
	start_time TIME(0),
	finish_time TIME(0),
    is_break bit(1) DEFAULT b'0',
	year_id INT(11) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
    CONSTRAINT hours_in_day_year_id FOREIGN KEY (year_id)
        REFERENCES years(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE user_types (
    id INT(11) NOT NULL AUTO_INCREMENT,
	name NVARCHAR(50) DEFAULT NULL,
	auth_level INT(11),
    PRIMARY KEY(id),
    UNIQUE KEY id_UNIQUE (id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;


CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT,
	username NVARCHAR(50) DEFAULT NULL,
	password NVARCHAR(50) DEFAULT NULL,
    user_type_id INT(11) NOT NULL,
	PRIMARY KEY(id),
    UNIQUE KEY id_UNIQUE (id),  
    UNIQUE username_UNIQUE(username),
	CONSTRAINT users_user_type_id FOREIGN KEY (user_type_id)
        REFERENCES user_types(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
  
CREATE TABLE teacher_types (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) DEFAULT NULL,
    UNIQUE name_UNIQUE(name),
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE teachers (
    id INT(11) NOT NULL AUTO_INCREMENT,
	first_name NVARCHAR(50) DEFAULT NULL,
	last_name NVARCHAR(50) DEFAULT NULL,
    cellphone NVARCHAR(50) DEFAULT NULL,
    teacher_type_id INT(11) NOT NULL,
	user_id INT(11) NOT NULL,
    year_id INT(11) NOT NULL,
	PRIMARY KEY(id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE KEY user_UNIQUE (user_id,year_id),
	CONSTRAINT teachers_teacher_type_id FOREIGN KEY (teacher_type_id)
        REFERENCES teacher_types(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT teachers_user_id FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT teachers_year_id FOREIGN KEY (year_id)
        REFERENCES years(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
  
CREATE TABLE classes (
    id INT(11) NOT NULL AUTO_INCREMENT,
    grade_id INT(11) NOT NULL,
    number INT(11) NOT NULL,
    year_id INT(11) NOT NULL,
	PRIMARY KEY(id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE KEY class_UNIQUE (grade_id,number,year_id),
	CONSTRAINT classes_grade_id FOREIGN KEY (grade_id)
        REFERENCES grades(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT classes_year_id FOREIGN KEY (year_id)
        REFERENCES years(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE teacher_class_access (
    id INT(11) NOT NULL AUTO_INCREMENT,
    teacher_id INT(11) NOT NULL,
    class_id INT(11) NOT NULL,
	PRIMARY KEY(id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE KEY teacher_class_access_UNIQUE (teacher_id,class_id),
    CONSTRAINT teacher_class_access_teacher_id FOREIGN KEY (teacher_id)
        REFERENCES teachers(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT teacher_class_access_class_id FOREIGN KEY (class_id)
        REFERENCES classes(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
	
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE parents(
    id INT(11) NOT NULL AUTO_INCREMENT,
    first_name NVARCHAR(20) NOT NULL,
	last_name NVARCHAR(20) NOT NULL,
    cellphone NVARCHAR(50) NOT NULL,
	email NVARCHAR(50) DEFAULT NULL,
    gender NVARCHAR(50) DEFAULT '',
	PRIMARY KEY(id),
	UNIQUE KEY id_UNIQUE (id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



CREATE TABLE students (
    id INT(11) NOT NULL AUTO_INCREMENT,
    first_name NVARCHAR(20) NOT NULL,
	last_name NVARCHAR(20) NOT NULL,
    mother_id INT(11) NULL,
    father_id INT(11) NULL,
    class_id INT(11) NOT NULL,
    year_id INT(11) NOT NULL,
	picture_path nvarchar(1000) DEFAULT NULL,
    home_phone NVARCHAR(50) NULL DEFAULT '',
    settlement NVARCHAR(50) NULL DEFAULT '',
	PRIMARY KEY(id),
	UNIQUE KEY id_UNIQUE (id),
    CONSTRAINT students_mother_id FOREIGN KEY (mother_id)
        REFERENCES parents(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT students_father_id FOREIGN KEY (father_id)
        REFERENCES parents(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT students_class_id FOREIGN KEY (class_id)
        REFERENCES classes(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT students_cyear_id FOREIGN KEY (year_id)
        REFERENCES years(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
    
CREATE TABLE lesson_types (
    id INT(11) NOT NULL AUTO_INCREMENT,
	name NVARCHAR(50) DEFAULT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE name_UNIQUE(name)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE lessons (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    teacher_id INT(11) NOT NULL,
    lesson_type_id INT(11) NOT NULL,
    priority INT(11) NOT NULL,
    has_evaluation  bit(1) DEFAULT b'0',
    has_grade  bit(1) DEFAULT b'0',
    description VARCHAR(1000) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
	CONSTRAINT lessons_teacher_id FOREIGN KEY (teacher_id)
        REFERENCES teachers(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT lessons_lesson_type_id FOREIGN KEY (lesson_type_id)
        REFERENCES lesson_types(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

      
CREATE TABLE lessons_grades (
    id INT(11) NOT NULL AUTO_INCREMENT,
    grade INT(11) NOT NULL,
	lesson_id INT(11) NOT NULL,
	student_id INT(11) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
	CONSTRAINT lessons_grades_lesson_id FOREIGN KEY (lesson_id)
        REFERENCES lessons(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT lessons_grades_student_id FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
    
    
CREATE TABLE classes_schedules (
    id INT(11) NOT NULL AUTO_INCREMENT,
    day_id INT(11) NOT NULL,
	hour_id INT(11) NOT NULL,
	lesson_id INT(11) NOT NULL,
	class_id INT(11) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
    CONSTRAINT classes_schedule_day_id FOREIGN KEY (day_id)
        REFERENCES days(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT classes_schedule_hour_id FOREIGN KEY (hour_id)
        REFERENCES hours_in_day(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT classes_schedule_lesson_id FOREIGN KEY (lesson_id)
        REFERENCES lessons(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT classes_schedule_class_id FOREIGN KEY (class_id)
        REFERENCES classes(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE students_schedules (
    id INT(11) NOT NULL AUTO_INCREMENT,
    day_id INT(11) NOT NULL,
	hour_id INT(11) NOT NULL,
	lesson_id INT(11) NOT NULL,
	student_id INT(11) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
    UNIQUE KEY students_schedules_UNIQUE (day_id,hour_id,student_id),
    CONSTRAINT students_schedule_day_id FOREIGN KEY (day_id)
        REFERENCES days(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT students_schedule_hour_id FOREIGN KEY (hour_id)
        REFERENCES hours_in_day(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT students_schedule_lesson_id FOREIGN KEY (lesson_id)
        REFERENCES lessons(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT students_schedule_student_id FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE sent_sms (
    id INT(11) NOT NULL AUTO_INCREMENT,
    sent_text NVARCHAR(200) NOT NULL,
	confirmation_number INT(11) NOT NULL,
    students_schedule_id INT(11) NOT NULL,
    parent_id INT(11) NOT NULL,
	PRIMARY KEY(id),
	UNIQUE KEY id_UNIQUE (id),
    CONSTRAINT sent_sms_students_schedule_id FOREIGN KEY (students_schedule_id)
        REFERENCES students_schedules(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT sent_sms_parent_id FOREIGN KEY (parent_id)
        REFERENCES parents(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
    
CREATE TABLE received_sms (
    id INT(11) NOT NULL AUTO_INCREMENT,
    received_text NVARCHAR(200) NOT NULL,
    students_schedule_id INT(11)NOT  NULL,
    parent_id INT(11)NOT  NULL,
	PRIMARY KEY(id),
	UNIQUE KEY id_UNIQUE (id),
    CONSTRAINT received_sms_students_schedule_id FOREIGN KEY (students_schedule_id)
        REFERENCES students_schedules(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT received_sms_parent_id FOREIGN KEY (parent_id)
        REFERENCES parents(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
    

CREATE TABLE lessons_evaluations (
	id INT(11) NOT NULL AUTO_INCREMENT,
	evaluation LONGTEXT,
	lesson_id INT(11) NOT NULL,
	student_id INT(11) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id),
	CONSTRAINT lessons_evaluations_lesson_id FOREIGN KEY (lesson_id)
        REFERENCES lessons(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT lessons_evaluations_student_id FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



-- CREATE TABLE tables_information (
-- 	id INT(11) NOT NULL AUTO_INCREMENT,
-- 	table_name VARCHAR(100),
-- 	display_column_query VARCHAR(1000),
--     hebrew_name nvarchar(200),
--     PRIMARY KEY (id),
--     UNIQUE KEY id_UNIQUE (id)
-- )ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE preferences (
	id INT(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(500),
	value VARCHAR(500),
    PRIMARY KEY (id),
    UNIQUE KEY id_UNIQUE (id)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'admin',1),(2,'user',2);
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'idanda','idanda',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,'current_year_id','1'),(2,'current_new_user_number','1');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` VALUES (1,2014,'תשע\"ד'),(2,2015,'תשע\"ה'),(3,2016,'תשע\"ו'),(4,2017,'תשע\"ז'),(5,2018,'תשע\"ח'),(6,2019,'תשע\"ט'),(7,2020,'תש\"פ');
/*!40000 ALTER TABLE `years` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,'א',1),(2,'ב',2),(3,'ג',3),(4,'ד',4),(5,'ה',5),(6,'ו',6),(7,'ז',7),(8,'ח',8);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1,'יום א'),(2,'יום ב'),(3,'יום ג'),(4,'יום ד'),(5,'יום ה'),(6,'יום ו');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `hours_in_day` WRITE;
/*!40000 ALTER TABLE `hours_in_day` DISABLE KEYS */;
INSERT INTO `hours_in_day` VALUES (1,1,'08:10:00','08:50:00','\0',1),(2,2,'08:50:00','09:30:00','\0',1),(3,3,'09:30:00','09:45:00',b'1',1),(4,4,'09:45:00','10:25:00','\0',1),(5,5,'10:25:00','10:45:00',b'1',1),(6,6,'10:45:00','11:30:00','\0',1);
/*!40000 ALTER TABLE `hours_in_day` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `lesson_types` WRITE;
/*!40000 ALTER TABLE `lesson_types` DISABLE KEYS */;
INSERT INTO `lesson_types` VALUES (2,'קבוצה'),(1,'שיעור');
/*!40000 ALTER TABLE `lesson_types` ENABLE KEYS */;
UNLOCK TABLES;

#insert into classes(grade_id,number,year_id) values(1,2,1);
#insert into students(first_name,last_name,class_id,year_id) values('עידן','דוד',1,1);

