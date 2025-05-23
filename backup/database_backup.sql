-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add registration profile',2,'add_registrationprofile'),(6,'Can change registration profile',2,'change_registrationprofile'),(7,'Can delete registration profile',2,'delete_registrationprofile'),(8,'Can view registration profile',2,'view_registrationprofile'),(9,'Can add supervised registration profile',3,'add_supervisedregistrationprofile'),(10,'Can change supervised registration profile',3,'change_supervisedregistrationprofile'),(11,'Can delete supervised registration profile',3,'delete_supervisedregistrationprofile'),(12,'Can view supervised registration profile',3,'view_supervisedregistrationprofile'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add content type',7,'add_contenttype'),(26,'Can change content type',7,'change_contenttype'),(27,'Can delete content type',7,'delete_contenttype'),(28,'Can view content type',7,'view_contenttype'),(29,'Can add session',8,'add_session'),(30,'Can change session',8,'change_session'),(31,'Can delete session',8,'delete_session'),(32,'Can view session',8,'view_session'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add city',10,'add_city'),(38,'Can change city',10,'change_city'),(39,'Can delete city',10,'delete_city'),(40,'Can view city',10,'view_city'),(41,'Can add country',11,'add_country'),(42,'Can change country',11,'change_country'),(43,'Can delete country',11,'delete_country'),(44,'Can view country',11,'view_country'),(45,'Can add scrums',12,'add_scrums'),(46,'Can change scrums',12,'change_scrums'),(47,'Can delete scrums',12,'delete_scrums'),(48,'Can view scrums',12,'view_scrums'),(49,'Can add scrum titles',13,'add_scrumtitles'),(50,'Can change scrum titles',13,'change_scrumtitles'),(51,'Can delete scrum titles',13,'delete_scrumtitles'),(52,'Can view scrum titles',13,'view_scrumtitles'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add stock history',15,'add_stockhistory'),(58,'Can change stock history',15,'change_stockhistory'),(59,'Can delete stock history',15,'delete_stockhistory'),(60,'Can view stock history',15,'view_stockhistory'),(61,'Can add stock',16,'add_stock'),(62,'Can change stock',16,'change_stock'),(63,'Can delete stock',16,'delete_stock'),(64,'Can view stock',16,'view_stock'),(65,'Can add state',17,'add_state'),(66,'Can change state',17,'change_state'),(67,'Can delete state',17,'delete_state'),(68,'Can view state',17,'view_state'),(69,'Can add person',18,'add_person'),(70,'Can change person',18,'change_person'),(71,'Can delete person',18,'delete_person'),(72,'Can view person',18,'view_person'),(73,'Can add contacts',19,'add_contacts'),(74,'Can change contacts',19,'change_contacts'),(75,'Can delete contacts',19,'delete_contacts'),(76,'Can view contacts',19,'view_contacts'),(77,'Can add repair request',20,'add_repairrequest'),(78,'Can change repair request',20,'change_repairrequest'),(79,'Can delete repair request',20,'delete_repairrequest'),(80,'Can view repair request',20,'view_repairrequest');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$PCSQfB0zvmkomjwpdZ3LK6$g4AYJDPb1wiGkXk1Xut8linn2V4XXcmDwOyh3x2EdSw=','2025-05-05 16:32:30.264785',1,'dell','','','kittitat.t2000@gmail.com',1,1,'2025-05-05 16:29:45.095122'),(2,'pbkdf2_sha256$260000$0pKt1nB1cGpXTvCn0iRN7Z$AyMWR92FSR+LLUp61AzFt7WxnCzhRPB8WpHLHvq1kGs=','2025-05-07 15:50:40.899306',1,'admin','','','kittitat.t2000@gmail.com',1,1,'2025-05-06 16:37:10.501293');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-05-05 16:54:25.923037','1','Megger',1,'[{\"added\": {}}]',9,1),(2,'2025-05-07 17:54:16.416349','2','ss - dced',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',20,2),(3,'2025-05-07 17:54:16.424392','1','test - bbb vvv',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',20,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(6,'auth','user'),(7,'contenttypes','contenttype'),(2,'registration','registrationprofile'),(3,'registration','supervisedregistrationprofile'),(8,'sessions','session'),(9,'stock','category'),(10,'stock','city'),(19,'stock','contacts'),(11,'stock','country'),(18,'stock','person'),(20,'stock','repairrequest'),(12,'stock','scrums'),(13,'stock','scrumtitles'),(17,'stock','state'),(16,'stock','stock'),(15,'stock','stockhistory'),(14,'stock','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-05 16:28:57.899914'),(2,'auth','0001_initial','2025-05-05 16:28:58.522801'),(3,'admin','0001_initial','2025-05-05 16:28:58.635905'),(4,'admin','0002_logentry_remove_auto_add','2025-05-05 16:28:58.646479'),(5,'admin','0003_logentry_add_action_flag_choices','2025-05-05 16:28:58.660744'),(6,'contenttypes','0002_remove_content_type_name','2025-05-05 16:28:58.735848'),(7,'auth','0002_alter_permission_name_max_length','2025-05-05 16:28:58.772964'),(8,'auth','0003_alter_user_email_max_length','2025-05-05 16:28:58.809475'),(9,'auth','0004_alter_user_username_opts','2025-05-05 16:28:58.826943'),(10,'auth','0005_alter_user_last_login_null','2025-05-05 16:28:58.876384'),(11,'auth','0006_require_contenttypes_0002','2025-05-05 16:28:58.881386'),(12,'auth','0007_alter_validators_add_error_messages','2025-05-05 16:28:58.893385'),(13,'auth','0008_alter_user_username_max_length','2025-05-05 16:28:58.922993'),(14,'auth','0009_alter_user_last_name_max_length','2025-05-05 16:28:58.957980'),(15,'auth','0010_alter_group_name_max_length','2025-05-05 16:28:58.990860'),(16,'auth','0011_update_proxy_permissions','2025-05-05 16:28:59.000860'),(17,'auth','0012_alter_user_first_name_max_length','2025-05-05 16:28:59.035053'),(18,'registration','0001_initial','2025-05-05 16:28:59.096058'),(19,'registration','0002_registrationprofile_activated','2025-05-05 16:28:59.148164'),(20,'registration','0003_migrate_activatedstatus','2025-05-05 16:28:59.167623'),(21,'registration','0004_supervisedregistrationprofile','2025-05-05 16:28:59.232452'),(22,'registration','0005_activation_key_sha256','2025-05-05 16:28:59.280986'),(23,'sessions','0001_initial','2025-05-05 16:28:59.335299'),(24,'stock','0001_initial','2025-05-05 16:28:59.848347'),(25,'stock','0002_contacts','2025-05-05 16:28:59.885975'),(26,'stock','0003_contacts_image','2025-05-05 16:28:59.916501'),(27,'stock','0004_alter_contacts_image','2025-05-05 16:28:59.925682'),(28,'stock','0005_alter_contacts_image','2025-05-05 16:28:59.938578'),(29,'stock','0006_repairrequest','2025-05-05 17:43:16.812322'),(30,'stock','0007_auto_20250508_0050','2025-05-07 17:50:33.813117'),(31,'stock','0008_auto_20250508_0117','2025-05-07 18:17:10.660452');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0d2ak2ia1ewf6jzbc0b1m3phtjtb50y2','.eJxVjMsOwiAQRf-FtSEtDwGX7vsNZIYZpGogKe3K-O_apAvd3nPOfYkI21ri1nmJM4mLGMXpd0NID647oDvUW5Op1XWZUe6KPGiXUyN-Xg_376BAL9_akNaWKINWqNBlnwM51JbNefAApLKzHjIHy3YIioM2YwbrU_CowQfx_gD8lThQ:1uByk2:Um6UN0RGl-7RyaePv2L-xSzo3_fahs8GNNfUotX40_8','2025-05-19 16:32:30.268744'),('dyxzo0fxv20mx9edjw4ma0t0a1ufnvea','.eJxVjMsOwiAQAP-FsyFky9Ojd7-BLOxWqgaS0p6M_64kPeh1ZjIvEXHfStw7r3EhcRYgTr8sYX5wHYLuWG9N5la3dUlyJPKwXV4b8fNytH-Dgr2MLSEnwMxZs_XsnJpQM9CUwcEXZrBz0LNhHUArMgY8OJOsV8FrABDvDwAXN3Y:1uCh2e:tOujisBoiAsA7FmHKAnwSr33dnJPzDwQ1Znmft-d1RM','2025-05-21 15:50:40.905421');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_registr_user_id_5fcbf725_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_supervisedregistrationprofile`
--

DROP TABLE IF EXISTS `registration_supervisedregistrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_supervisedregistrationprofile` (
  `registrationprofile_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`registrationprofile_ptr_id`),
  CONSTRAINT `registration_supervi_registrationprofile__0a59f3b2_fk_registrat` FOREIGN KEY (`registrationprofile_ptr_id`) REFERENCES `registration_registrationprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_supervisedregistrationprofile`
--

LOCK TABLES `registration_supervisedregistrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_supervisedregistrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_supervisedregistrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_category`
--

DROP TABLE IF EXISTS `stock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_category`
--

LOCK TABLES `stock_category` WRITE;
/*!40000 ALTER TABLE `stock_category` DISABLE KEYS */;
INSERT INTO `stock_category` VALUES (1,'Megger');
/*!40000 ALTER TABLE `stock_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_city`
--

DROP TABLE IF EXISTS `stock_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_city_state_id_a736784e_fk_stock_state_id` (`state_id`),
  CONSTRAINT `stock_city_state_id_a736784e_fk_stock_state_id` FOREIGN KEY (`state_id`) REFERENCES `stock_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_city`
--

LOCK TABLES `stock_city` WRITE;
/*!40000 ALTER TABLE `stock_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_contacts`
--

DROP TABLE IF EXISTS `stock_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `occupation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_contacts`
--

LOCK TABLES `stock_contacts` WRITE;
/*!40000 ALTER TABLE `stock_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_country`
--

DROP TABLE IF EXISTS `stock_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_country`
--

LOCK TABLES `stock_country` WRITE;
/*!40000 ALTER TABLE `stock_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_person`
--

DROP TABLE IF EXISTS `stock_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_person_city_id_1b39c0db_fk_stock_city_id` (`city_id`),
  KEY `stock_person_country_id_683d2119_fk_stock_country_id` (`country_id`),
  KEY `stock_person_state_id_afc59ef1_fk_stock_state_id` (`state_id`),
  CONSTRAINT `stock_person_city_id_1b39c0db_fk_stock_city_id` FOREIGN KEY (`city_id`) REFERENCES `stock_city` (`id`),
  CONSTRAINT `stock_person_country_id_683d2119_fk_stock_country_id` FOREIGN KEY (`country_id`) REFERENCES `stock_country` (`id`),
  CONSTRAINT `stock_person_state_id_afc59ef1_fk_stock_state_id` FOREIGN KEY (`state_id`) REFERENCES `stock_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_person`
--

LOCK TABLES `stock_person` WRITE;
/*!40000 ALTER TABLE `stock_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_repairrequest`
--

DROP TABLE IF EXISTS `stock_repairrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_repairrequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `problem` longtext DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_repairrequest`
--

LOCK TABLES `stock_repairrequest` WRITE;
/*!40000 ALTER TABLE `stock_repairrequest` DISABLE KEYS */;
INSERT INTO `stock_repairrequest` VALUES (1,'test','bbb vvv','sderfe','dcedfv','wefwerferr','returned','2025-05-07 16:46:04.783774'),(2,'ss','dced','edcedc','2323','2323','returned','2025-05-07 17:44:56.782845'),(3,'เนเธเนเธ','เนเธซเธเนเธซเนเธซเธ','เนเธเนเธ','เนเธเนเธเธซ','เนเธซเธเนเธ','returned','2025-05-07 17:50:50.328642');
/*!40000 ALTER TABLE `stock_repairrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_scrums`
--

DROP TABLE IF EXISTS `stock_scrums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_scrums` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_scrums`
--

LOCK TABLES `stock_scrums` WRITE;
/*!40000 ALTER TABLE `stock_scrums` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_scrums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_scrumtitles`
--

DROP TABLE IF EXISTS `stock_scrumtitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_scrumtitles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lists` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_scrumtitles`
--

LOCK TABLES `stock_scrumtitles` WRITE;
/*!40000 ALTER TABLE `stock_scrumtitles` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_scrumtitles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_state`
--

DROP TABLE IF EXISTS `stock_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_state_country_id_0ab895b4_fk_stock_country_id` (`country_id`),
  CONSTRAINT `stock_state_country_id_0ab895b4_fk_stock_country_id` FOREIGN KEY (`country_id`) REFERENCES `stock_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_state`
--

LOCK TABLES `stock_state` WRITE;
/*!40000 ALTER TABLE `stock_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_stock`
--

DROP TABLE IF EXISTS `stock_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `receive_quantity` int(11) DEFAULT NULL,
  `received_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_quantity` int(11) DEFAULT NULL,
  `issued_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issued_to` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_order` int(11) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `export_to_csv` tinyint(1) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_stock_category_id_fab773e8_fk_stock_category_id` (`category_id`),
  CONSTRAINT `stock_stock_category_id_fab773e8_fk_stock_category_id` FOREIGN KEY (`category_id`) REFERENCES `stock_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_stock`
--

LOCK TABLES `stock_stock` WRITE;
/*!40000 ALTER TABLE `stock_stock` DISABLE KEYS */;
INSERT INTO `stock_stock` VALUES (1,'test',1,0,NULL,0,NULL,NULL,NULL,NULL,2,'2025-05-07 18:20:17.439512','2025-05-07 18:06:08.797183','2025-05-08 00:00:00.000000',0,'stock/static/images/fd844769-2bb2-419b-a337-3894bd805703.jpg',1),(2,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',1,0,NULL,0,NULL,NULL,NULL,NULL,0,'2025-05-07 18:07:21.022532','2025-05-07 18:07:21.022532','2025-05-08 00:00:00.000000',0,'',1),(3,'เธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธเธ',7,0,NULL,0,NULL,NULL,NULL,NULL,0,'2025-05-07 18:19:43.431861','2025-05-07 18:19:43.431861','2025-05-08 00:00:00.000000',0,'',1);
/*!40000 ALTER TABLE `stock_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_stockhistory`
--

DROP TABLE IF EXISTS `stock_stockhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_stockhistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `receive_quantity` int(11) DEFAULT NULL,
  `received_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_quantity` int(11) DEFAULT NULL,
  `issued_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issued_to` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `re_order` int(11) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_stockhistory_category_id_af1dd706_fk_stock_category_id` (`category_id`),
  CONSTRAINT `stock_stockhistory_category_id_af1dd706_fk_stock_category_id` FOREIGN KEY (`category_id`) REFERENCES `stock_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_stockhistory`
--

LOCK TABLES `stock_stockhistory` WRITE;
/*!40000 ALTER TABLE `stock_stockhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_stockhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_user`
--

DROP TABLE IF EXISTS `stock_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_user`
--

LOCK TABLES `stock_user` WRITE;
/*!40000 ALTER TABLE `stock_user` DISABLE KEYS */;
INSERT INTO `stock_user` VALUES (1,'127.0.0.1');
/*!40000 ALTER TABLE `stock_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-08  8:26:49
