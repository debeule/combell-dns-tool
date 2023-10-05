
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2010_11_30_142837_create_jobs_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2018_02_05_000000_create_queue_monitor_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2022_09_22_143624_create_sessions_table',1),(7,'2022_11_22_115048_create_records_table',1),(8,'2022_12_19_101412_create_permission_tables',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',42),(1,'App\\Models\\User',72),(1,'App\\Models\\User',91);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `queue_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_monitor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `started_at_exact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `finished_at_exact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_elapsed` double(12,6) DEFAULT NULL,
  `failed` tinyint(1) NOT NULL DEFAULT 0,
  `attempt` int(11) NOT NULL DEFAULT 0,
  `progress` int(11) DEFAULT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exception_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exception_class` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `queue_monitor_job_id_index` (`job_id`),
  KEY `queue_monitor_started_at_index` (`started_at`),
  KEY `queue_monitor_time_elapsed_index` (`time_elapsed`),
  KEY `queue_monitor_failed_index` (`failed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `queue_monitor` WRITE;
/*!40000 ALTER TABLE `queue_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_monitor` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `record_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pending` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `records_user_id_foreign` (`user_id`),
  CONSTRAINT `records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,NULL,NULL,'1-4786694518','A','',NULL,'0',1),(2,NULL,NULL,'1-4787581225','A','abc',NULL,'0',42),(3,NULL,NULL,'1-4787581547','A','abcdddddddddddd',NULL,'0',42),(4,NULL,NULL,'1-4787591670','A','abcdefgddd',NULL,'0',42),(5,NULL,NULL,'1-4786071917','A','',NULL,'0',3),(6,NULL,NULL,'1-4785995281','A','',NULL,'0',4),(7,NULL,NULL,'1-4784651110','A','',NULL,'0',5),(8,NULL,NULL,'1-4784651132','A','',NULL,'0',6),(9,NULL,NULL,'1-4786688151','A','',NULL,'0',7),(10,NULL,NULL,'1-4784740705','A','artwork',NULL,'0',84),(11,NULL,NULL,'1-4786688177','A','',NULL,'0',8),(12,NULL,NULL,'1-4786719324','A','atwork',NULL,'0',1),(13,NULL,NULL,'1-4784770238','A','atwork',NULL,'0',6),(14,NULL,NULL,'1-4786745642','A','atwork',NULL,'0',8),(15,NULL,NULL,'1-4786699196','A','atwork',NULL,'0',9),(16,NULL,NULL,'1-4784671079','A','atwork',NULL,'0',11),(17,NULL,NULL,'1-4786695978','A','atwork',NULL,'0',12),(18,NULL,NULL,'1-4786755853','A','atwork',NULL,'0',13),(19,NULL,NULL,'1-4784684153','A','atwork',NULL,'0',16),(20,NULL,NULL,'1-4786752998','A','atwork',NULL,'0',19),(21,NULL,NULL,'1-4786713060','A','atwork',NULL,'0',21),(22,NULL,NULL,'1-4786700131','A','atwork',NULL,'0',22),(23,NULL,NULL,'1-4784743207','A','atwork',NULL,'0',25),(24,NULL,NULL,'1-4786739794','A','atwork',NULL,'0',26),(25,NULL,NULL,'1-4784694000','A','atwork',NULL,'0',27),(26,NULL,NULL,'1-4786704884','A','atwork',NULL,'0',28),(27,NULL,NULL,'1-4786705109','A','atwork',NULL,'0',30),(28,NULL,NULL,'1-4786720937','A','atwork',NULL,'0',34),(29,NULL,NULL,'1-4786721208','A','atwork',NULL,'0',35),(30,NULL,NULL,'1-4786740530','A','atwork',NULL,'0',37),(31,NULL,NULL,'1-4786752816','A','atwork',NULL,'0',39),(32,NULL,NULL,'1-4786713054','A','atwork',NULL,'0',44),(33,NULL,NULL,'1-4784685587','A','atwork',NULL,'0',45),(34,NULL,NULL,'1-4786723552','A','atwork',NULL,'0',49),(35,NULL,NULL,'1-4786752812','A','atwork',NULL,'0',51),(36,NULL,NULL,'1-4786698457','A','atwork',NULL,'0',52),(37,NULL,NULL,'1-4784684159','A','atwork',NULL,'0',59),(38,NULL,NULL,'1-4786700051','A','atwork',NULL,'0',67),(39,NULL,NULL,'1-4784755049','A','atwork',NULL,'0',69),(40,NULL,NULL,'1-4786714052','A','atwork',NULL,'0',74),(41,NULL,NULL,'1-4784684163','A','atwork',NULL,'0',77),(42,NULL,NULL,'1-4784684156','A','atwork',NULL,'0',78),(43,NULL,NULL,'1-4786745284','A','atwork',NULL,'0',80),(44,NULL,NULL,'1-4784684165','A','atwork',NULL,'0',85),(45,NULL,NULL,'1-4784665663','A','atwork',NULL,'0',89),(46,NULL,NULL,'1-4786753531','A','atwork',NULL,'0',92),(47,NULL,NULL,'1-4787313574','A','backend',NULL,'0',12),(48,NULL,NULL,'1-4786688215','A','',NULL,'0',9),(49,NULL,NULL,'1-4784651183','A','',NULL,'0',10),(50,NULL,NULL,'1-4784651201','A','',NULL,'0',11),(51,NULL,NULL,'1-4787165721','A','betapt',NULL,'0',34),(52,NULL,NULL,'1-4786958473','A','bl3ndr',NULL,'0',78),(53,NULL,NULL,'1-4785327291','A','blog',NULL,'0',78),(54,NULL,NULL,'1-4786688241','A','',NULL,'0',12),(55,NULL,NULL,'1-4786688263','A','',NULL,'0',13),(56,NULL,NULL,'1-4786869618','A','cms',NULL,'0',92),(57,NULL,NULL,'1-4787615093','A','combell',NULL,'0',42),(58,NULL,NULL,'1-4786824432','A','commerce',NULL,'0',12),(59,NULL,NULL,'1-4786827798','A','commerce',NULL,'0',13),(60,NULL,NULL,'1-4786826089','A','commerce',NULL,'0',26),(61,NULL,NULL,'1-4786825413','A','commerce',NULL,'0',51),(62,NULL,NULL,'1-4786825484','A','commerce',NULL,'0',52),(63,NULL,NULL,'1-4785607897','A','curiocube',NULL,'0',43),(64,NULL,NULL,'1-4787206055','A','cv',NULL,'0',12),(65,NULL,NULL,'1-4786086945','A','',NULL,'0',15),(66,NULL,NULL,'1-4784651238','A','',NULL,'0',16),(67,NULL,NULL,'1-4787231602','A','datetimelocal',NULL,'0',11),(68,NULL,NULL,'1-4784651255','A','',NULL,'0',17),(69,NULL,NULL,'1-4786688287','A','',NULL,'0',18),(70,NULL,NULL,'1-4786953825','A','deploy',NULL,'0',21),(71,NULL,NULL,'1-4786866508','A','deploy',NULL,'0',28),(72,NULL,NULL,'1-4786955829','A','deploy',NULL,'0',35),(73,NULL,NULL,'1-4786918882','A','deploy',NULL,'0',54),(74,NULL,NULL,'1-4786932156','A','deploy',NULL,'0',67),(75,NULL,NULL,'1-4784738009','A','drupal',NULL,'0',11),(76,NULL,NULL,'1-4787056137','A','e-commerce',NULL,'0',22),(77,NULL,NULL,'1-4786078079','A','easein',NULL,'0',4),(78,NULL,NULL,'1-4787070462','A','ecommerce',NULL,'0',9),(79,NULL,NULL,'1-4786825296','A','ecommerce',NULL,'0',21),(80,NULL,NULL,'1-4786840138','A','ecommerce',NULL,'0',28),(81,NULL,NULL,'1-4787070368','A','ecommerce',NULL,'0',35),(82,NULL,NULL,'1-4786825301','A','ecommerce',NULL,'0',37),(83,NULL,NULL,'1-4786825284','A','ecommerce',NULL,'0',67),(84,NULL,NULL,'1-4785995325','A','',NULL,'0',19),(85,NULL,NULL,'1-4787062450','A','exam',NULL,'0',13),(86,NULL,NULL,'1-4786078097','A','finalexamreview',NULL,'0',3),(87,NULL,NULL,'1-4785622761','A','forgitail',NULL,'0',11),(88,NULL,NULL,'1-4786082635','A','frontend',NULL,'0',11),(89,NULL,NULL,'1-4786694521','A','ftp',NULL,'0',1),(90,NULL,NULL,'1-4786071920','A','ftp',NULL,'0',3),(91,NULL,NULL,'1-4785995287','A','ftp',NULL,'0',4),(92,NULL,NULL,'1-4784651113','A','ftp',NULL,'0',5),(93,NULL,NULL,'1-4784651135','A','ftp',NULL,'0',6),(94,NULL,NULL,'1-4786688154','A','ftp',NULL,'0',7),(95,NULL,NULL,'1-4786688180','A','ftp',NULL,'0',8),(96,NULL,NULL,'1-4786688218','A','ftp',NULL,'0',9),(97,NULL,NULL,'1-4784651186','A','ftp',NULL,'0',10),(98,NULL,NULL,'1-4784651204','A','ftp',NULL,'0',11),(99,NULL,NULL,'1-4786688244','A','ftp',NULL,'0',12),(100,NULL,NULL,'1-4786688266','A','ftp',NULL,'0',13),(101,NULL,NULL,'1-4786086948','A','ftp',NULL,'0',15),(102,NULL,NULL,'1-4784651241','A','ftp',NULL,'0',16),(103,NULL,NULL,'1-4784651258','A','ftp',NULL,'0',17),(104,NULL,NULL,'1-4786688290','A','ftp',NULL,'0',18),(105,NULL,NULL,'1-4785995328','A','ftp',NULL,'0',19),(106,NULL,NULL,'1-4786688361','A','ftp',NULL,'0',21),(107,NULL,NULL,'1-4786688385','A','ftp',NULL,'0',22),(108,NULL,NULL,'1-4786688445','A','ftp',NULL,'0',23),(109,NULL,NULL,'1-4784651501','A','ftp',NULL,'0',24),(110,NULL,NULL,'1-4784684264','A','ftp',NULL,'0',25),(111,NULL,NULL,'1-4786688471','A','ftp',NULL,'0',26),(112,NULL,NULL,'1-4784651518','A','ftp',NULL,'0',27),(113,NULL,NULL,'1-4786688493','A','ftp',NULL,'0',28),(114,NULL,NULL,'1-4786688515','A','ftp',NULL,'0',29),(115,NULL,NULL,'1-4786688546','A','ftp',NULL,'0',30),(116,NULL,NULL,'1-4785995459','A','ftp',NULL,'0',31),(117,NULL,NULL,'1-4785995126','A','ftp',NULL,'0',32),(118,NULL,NULL,'1-4786688553','A','ftp',NULL,'0',34),(119,NULL,NULL,'1-4786688588','A','ftp',NULL,'0',35),(120,NULL,NULL,'1-4786688610','A','ftp',NULL,'0',36),(121,NULL,NULL,'1-4786714527','A','ftp',NULL,'0',37),(122,NULL,NULL,'1-4786688632','A','ftp',NULL,'0',38),(123,NULL,NULL,'1-4786688669','A','ftp',NULL,'0',39),(124,NULL,NULL,'1-4786958174','A','ftp',NULL,'0',41),(125,NULL,NULL,'1-4784651708','A','ftp',NULL,'0',43),(126,NULL,NULL,'1-4786688697','A','ftp',NULL,'0',44),(127,NULL,NULL,'1-4784651725','A','ftp',NULL,'0',45),(128,NULL,NULL,'1-4784651742','A','ftp',NULL,'0',48),(129,NULL,NULL,'1-4786689082','A','ftp',NULL,'0',49),(130,NULL,NULL,'1-4786688809','A','ftp',NULL,'0',51),(131,NULL,NULL,'1-4786688857','A','ftp',NULL,'0',52),(132,NULL,NULL,'1-4786688858','A','ftp',NULL,'0',54),(133,NULL,NULL,'1-4784651813','A','ftp',NULL,'0',55),(134,NULL,NULL,'1-4785995202','A','ftp',NULL,'0',56),(135,NULL,NULL,'1-4786688903','A','ftp',NULL,'0',57),(136,NULL,NULL,'1-4784651832','A','ftp',NULL,'0',59),(137,NULL,NULL,'1-4784651857','A','ftp',NULL,'0',62),(138,NULL,NULL,'1-4784651898','A','ftp',NULL,'0',64),(139,NULL,NULL,'1-4786688937','A','ftp',NULL,'0',67),(140,NULL,NULL,'1-4786688961','A','ftp',NULL,'0',68),(141,NULL,NULL,'1-4784651934','A','ftp',NULL,'0',69),(142,NULL,NULL,'1-4784651978','A','ftp',NULL,'0',70),(143,NULL,NULL,'1-4784652036','A','ftp',NULL,'0',71),(144,NULL,NULL,'1-4786688984','A','ftp',NULL,'0',73),(145,NULL,NULL,'1-4786689006','A','ftp',NULL,'0',74),(146,NULL,NULL,'1-4784652001','A','ftp',NULL,'0',75),(147,NULL,NULL,'1-4784652085','A','ftp',NULL,'0',76),(148,NULL,NULL,'1-4784652139','A','ftp',NULL,'0',77),(149,NULL,NULL,'1-4784652208','A','ftp',NULL,'0',78),(150,NULL,NULL,'1-4786689029','A','ftp',NULL,'0',80),(151,NULL,NULL,'1-4785995412','A','ftp',NULL,'0',81),(152,NULL,NULL,'1-4784652245','A','ftp',NULL,'0',84),(153,NULL,NULL,'1-4784652276','A','ftp',NULL,'0',85),(154,NULL,NULL,'1-4786689051','A','ftp',NULL,'0',86),(155,NULL,NULL,'1-4785995181','A','ftp',NULL,'0',88),(156,NULL,NULL,'1-4784652344','A','ftp',NULL,'0',89),(157,NULL,NULL,'1-4786442680','A','ftp',NULL,'0',90),(158,NULL,NULL,'1-4784652361','A','ftp',NULL,'0',92),(159,NULL,NULL,'1-4787615380','A','gbfvdcx',NULL,'0',42),(160,NULL,NULL,'1-4786964236','A','git',NULL,'0',51),(161,NULL,NULL,'1-4785042436','A','gitdeploy',NULL,'0',11),(162,NULL,NULL,'1-4786851912','A','github',NULL,'0',12),(163,NULL,NULL,'1-4784770237','A','grav',NULL,'0',85),(164,NULL,NULL,'1-4784716724','A','gravsite',NULL,'0',89),(165,NULL,NULL,'1-4787602246','A','hallo',NULL,'0',91),(166,NULL,NULL,'1-4787615006','A','hallorenzo',NULL,'0',64),(167,NULL,NULL,'1-4786688358','A','',NULL,'0',21),(168,NULL,NULL,'1-4787596642','A','hhhnn',NULL,'0',91),(169,NULL,NULL,'1-4787615600','A','ikbenyassin',NULL,'0',91),(170,NULL,NULL,'1-4786688382','A','',NULL,'0',22),(171,NULL,NULL,'1-4787076648','A','iotstore',NULL,'0',74),(172,NULL,NULL,'1-4786688442','A','',NULL,'0',23),(173,NULL,NULL,'1-4784651498','A','',NULL,'0',24),(174,NULL,NULL,'1-4784684261','A','',NULL,'0',25),(175,NULL,NULL,'1-4786688468','A','',NULL,'0',26),(176,NULL,NULL,'1-4784651515','A','',NULL,'0',27),(177,NULL,NULL,'1-4787398420','A','jkjfksdjfls',NULL,'0',91),(178,NULL,NULL,'1-4786688490','A','',NULL,'0',28),(179,NULL,NULL,'1-4786688512','A','',NULL,'0',29),(180,NULL,NULL,'1-4786688543','A','',NULL,'0',30),(181,NULL,NULL,'1-4785995456','A','',NULL,'0',31),(182,NULL,NULL,'1-4785995123','A','',NULL,'0',32),(183,NULL,NULL,'1-4786688549','A','',NULL,'0',34),(184,NULL,NULL,'1-4786688583','A','',NULL,'0',35),(185,NULL,NULL,'1-4787390620','A','kikkkk',NULL,'0',91),(186,NULL,NULL,'1-4786688607','A','',NULL,'0',36),(187,NULL,NULL,'1-4786714521','A','',NULL,'0',37),(188,NULL,NULL,'1-4785665183','A','laravelblog',NULL,'0',11),(189,NULL,NULL,'1-4785696037','A','laravelblog',NULL,'0',45),(190,NULL,NULL,'1-4785694856','A','laravelblog',NULL,'0',64),(191,NULL,NULL,'1-4785694101','A','laravelblog',NULL,'0',85),(192,NULL,NULL,'1-4785662408','A','laravelblog',NULL,'0',89),(193,NULL,NULL,'1-4785701664','A','laravelblog',NULL,'0',91),(194,NULL,NULL,'1-4785683103','A','laravelblog',NULL,'0',92),(195,NULL,NULL,'1-4786688629','A','',NULL,'0',38),(196,NULL,NULL,'1-4786688666','A','',NULL,'0',39),(197,NULL,NULL,'1-4786958170','A','',NULL,'0',41),(198,NULL,NULL,'1-4784651705','A','',NULL,'0',43),(199,NULL,NULL,'1-4786688694','A','',NULL,'0',44),(200,NULL,NULL,'1-4784651722','A','',NULL,'0',45),(201,NULL,NULL,'1-4784651739','A','',NULL,'0',48),(202,NULL,NULL,'1-4786689079','A','',NULL,'0',49),(203,NULL,NULL,'1-4786688806','A','',NULL,'0',51),(204,NULL,NULL,'1-4784755589','A','mycurriculumvitae',NULL,'0',16),(205,NULL,NULL,'1-4787052291','A','myportfolio',NULL,'0',13),(206,NULL,NULL,'1-4784781289','A','myportfolio',NULL,'0',24),(207,NULL,NULL,'1-4786688851','A','',NULL,'0',52),(208,NULL,NULL,'1-4787061567','A','myshop',NULL,'0',49),(209,NULL,NULL,'1-4787064493','A','myshop',NULL,'0',92),(210,NULL,NULL,'1-4786745335','A','mythica',NULL,'0',11),(211,NULL,NULL,'1-4784819978','A','myuglypage',NULL,'0',55),(212,NULL,NULL,'1-4786688852','A','',NULL,'0',54),(213,NULL,NULL,'1-4784651808','A','',NULL,'0',55),(214,NULL,NULL,'1-4787362294','A','nietverwijderenyassinty',NULL,'0',91),(215,NULL,NULL,'1-4787581272','A','nieuwccc',NULL,'0',42),(216,NULL,NULL,'1-4787390691','A','nieuwerecord',NULL,'0',91),(217,NULL,NULL,'1-4787614982','A','nieuwesubsite',NULL,'0',42),(218,NULL,NULL,'1-4785995199','A','',NULL,'0',56),(219,NULL,NULL,'1-4787344461','A','nnnnn',NULL,'0',91),(220,NULL,NULL,'1-4787344462','A','nnnnnn',NULL,'0',91),(221,NULL,NULL,'1-4786688900','A','',NULL,'0',57),(222,NULL,NULL,'1-4787126529','A','oefenen',NULL,'0',26),(223,NULL,NULL,'1-4784651829','A','',NULL,'0',59),(224,NULL,NULL,'1-4787213914','A','poleposition',NULL,'0',33),(225,NULL,NULL,'1-4787064383','A','portfolio',NULL,'0',11),(226,NULL,NULL,'1-4784806855','A','portfolio',NULL,'0',25),(227,NULL,NULL,'1-4786927320','A','portfolio',NULL,'0',51),(228,NULL,NULL,'1-4786988502','A','portfolio',NULL,'0',55),(229,NULL,NULL,'1-4784783540','A','portfolio',NULL,'0',89),(230,NULL,NULL,'1-4787238665','A','preview',NULL,'0',78),(231,NULL,NULL,'1-4785522150','A','project',NULL,'0',11),(232,NULL,NULL,'1-4785991338','A','project',NULL,'0',45),(233,NULL,NULL,'1-4784916090','A','promo',NULL,'0',11),(234,NULL,NULL,'1-4787081422','A','promo',NULL,'0',30),(235,NULL,NULL,'1-4787081421','A','promo',NULL,'0',35),(236,NULL,NULL,'1-4787072544','A','promo',NULL,'0',39),(237,NULL,NULL,'1-4787061576','A','promo',NULL,'0',49),(238,NULL,NULL,'1-4787076645','A','promo',NULL,'0',74),(239,NULL,NULL,'1-4787064498','A','promo',NULL,'0',92),(240,NULL,NULL,'1-4787031761','A','promoshop',NULL,'0',67),(241,NULL,NULL,'1-4787013231','A','promosite',NULL,'0',28),(242,NULL,NULL,'1-4787076650','A','promotie',NULL,'0',26),(243,NULL,NULL,'1-4787076322','A','promotie',NULL,'0',44),(244,NULL,NULL,'1-4787079730','A','promotie',NULL,'0',80),(245,NULL,NULL,'1-4787058522','A','prototype',NULL,'0',45),(246,NULL,NULL,'1-4786723783','A','prototyping',NULL,'0',12),(247,NULL,NULL,'1-4784651854','A','',NULL,'0',62),(248,NULL,NULL,'1-4784651895','A','',NULL,'0',64),(249,NULL,NULL,'1-4786688934','A','',NULL,'0',67),(250,NULL,NULL,'1-4786688958','A','',NULL,'0',68),(251,NULL,NULL,'1-4784651931','A','',NULL,'0',69),(252,NULL,NULL,'1-4784651975','A','',NULL,'0',70),(253,NULL,NULL,'1-4784652030','A','',NULL,'0',71),(254,NULL,NULL,'1-4786688981','A','',NULL,'0',73),(255,NULL,NULL,'1-4787391892','A','sasasadfd',NULL,'0',91),(256,NULL,NULL,'1-4787151947','A','selfiewebapp',NULL,'0',11),(257,NULL,NULL,'1-4786689003','A','',NULL,'0',74),(258,NULL,NULL,'1-4784651998','A','',NULL,'0',75),(259,NULL,NULL,'1-4787019011','A','shop',NULL,'0',21),(260,NULL,NULL,'1-4787019395','A','shop',NULL,'0',28),(261,NULL,NULL,'1-4787071984','A','shop',NULL,'0',30),(262,NULL,NULL,'1-4786867524','A','shop',NULL,'0',49),(263,NULL,NULL,'1-4787024439','A','shop',NULL,'0',51),(264,NULL,NULL,'1-4786845830','A','shop',NULL,'0',74),(265,NULL,NULL,'1-4787031771','A','shop',NULL,'0',80),(266,NULL,NULL,'1-4786869619','A','shop',NULL,'0',92),(267,NULL,NULL,'1-4784652082','A','',NULL,'0',76),(268,NULL,NULL,'1-4784652135','A','',NULL,'0',77),(269,NULL,NULL,'1-4786087368','A','solcel',NULL,'0',31),(270,NULL,NULL,'1-4784652204','A','',NULL,'0',78),(271,NULL,NULL,'1-4784691911','A','subweb',NULL,'0',55),(272,NULL,NULL,'1-4786689026','A','',NULL,'0',80),(273,NULL,NULL,'1-4785995409','A','',NULL,'0',81),(274,NULL,NULL,'1-4787344464','A','tesstttt',NULL,'0',91),(275,NULL,NULL,'1-4784684168','A','test',NULL,'0',17),(276,NULL,NULL,'1-4784673971','A','test',NULL,'0',43),(277,NULL,NULL,'1-4787598107','A','test',NULL,'0',91),(278,NULL,NULL,'1-4787390689','A','test0',NULL,'0',91),(279,NULL,NULL,'1-4787532128','A','test0701',NULL,'0',91),(280,NULL,NULL,'1-4784694411','A','test1',NULL,'0',24),(281,NULL,NULL,'1-4787532127','A','test2',NULL,'0',91),(282,NULL,NULL,'1-4787246204','A','the',NULL,'0',78),(283,NULL,NULL,'1-4784652242','A','',NULL,'0',84),(284,NULL,NULL,'1-4784652269','A','',NULL,'0',85),(285,NULL,NULL,'1-4786082645','A','tjt',NULL,'0',88),(286,NULL,NULL,'1-4787347492','A','todo',NULL,'0',27),(287,NULL,NULL,'1-4787338934','A','todo',NULL,'0',52),(288,NULL,NULL,'1-4787328396','A','todo',NULL,'0',74),(289,NULL,NULL,'1-4786689048','A','',NULL,'0',86),(290,NULL,NULL,'1-4784813266','A','ugpress',NULL,'0',85),(291,NULL,NULL,'1-4787602289','A','uihmmmm',NULL,'0',91),(292,NULL,NULL,'1-4787390619','A','uuuu',NULL,'0',91),(293,NULL,NULL,'1-4785355026','A','vanillablog',NULL,'0',11),(294,NULL,NULL,'1-4785343379','A','vanillablog',NULL,'0',89),(295,NULL,NULL,'1-4787344463','A','vcvv',NULL,'0',91),(296,NULL,NULL,'1-4786875399','A','voucherland',NULL,'0',33),(297,NULL,NULL,'1-4786918760','A','webdev',NULL,'0',25),(298,NULL,NULL,'1-4784830778','A','webshop',NULL,'0',11),(299,NULL,NULL,'1-4787052315','A','webshop',NULL,'0',13),(300,NULL,NULL,'1-4784852750','A','webshop',NULL,'0',16),(301,NULL,NULL,'1-4784929806','A','webshop',NULL,'0',17),(302,NULL,NULL,'1-4784926404','A','webshop',NULL,'0',24),(303,NULL,NULL,'1-4787076649','A','webshop',NULL,'0',26),(304,NULL,NULL,'1-4784865545','A','webshop',NULL,'0',27),(305,NULL,NULL,'1-4787076320','A','webshop',NULL,'0',44),(306,NULL,NULL,'1-4784922932','A','webshop',NULL,'0',45),(307,NULL,NULL,'1-4787079856','A','webshop',NULL,'0',54),(308,NULL,NULL,'1-4784929091','A','webshop',NULL,'0',55),(309,NULL,NULL,'1-4784866655','A','webshop',NULL,'0',64),(310,NULL,NULL,'1-4784861991','A','webshop',NULL,'0',69),(311,NULL,NULL,'1-4784911184','A','webshop',NULL,'0',78),(312,NULL,NULL,'1-4787079729','A','webshop',NULL,'0',80),(313,NULL,NULL,'1-4784923143','A','webshop',NULL,'0',85),(314,NULL,NULL,'1-4784908949','A','webshop',NULL,'0',89),(315,NULL,NULL,'1-4786898800','A','woocommerce',NULL,'0',1),(316,NULL,NULL,'1-4786886507','A','woocommerce',NULL,'0',22),(317,NULL,NULL,'1-4786894263','A','woocommerce',NULL,'0',30),(318,NULL,NULL,'1-4786904129','A','woocommerce',NULL,'0',34),(319,NULL,NULL,'1-4786871662','A','woocommerce',NULL,'0',35),(320,NULL,NULL,'1-4786880199','A','woocommerce',NULL,'0',39),(321,NULL,NULL,'1-4786879919','A','woocommerce',NULL,'0',44),(322,NULL,NULL,'1-4786826090','A','woocommerce',NULL,'0',54),(323,NULL,NULL,'1-4786884707','A','woocommerce',NULL,'0',67),(324,NULL,NULL,'1-4784745181','A','wordpress-subweb',NULL,'0',55),(325,NULL,NULL,'1-4784807186','A','wordpress',NULL,'0',6),(326,NULL,NULL,'1-4786796961','A','wordpress',NULL,'0',8),(327,NULL,NULL,'1-4786796512','A','wordpress',NULL,'0',9),(328,NULL,NULL,'1-4784735214','A','wordpress',NULL,'0',11),(329,NULL,NULL,'1-4786796972','A','wordpress',NULL,'0',13),(330,NULL,NULL,'1-4784815238','A','wordpress',NULL,'0',17),(331,NULL,NULL,'1-4786796962','A','wordpress',NULL,'0',19),(332,NULL,NULL,'1-4786796634','A','wordpress',NULL,'0',21),(333,NULL,NULL,'1-4786796632','A','wordpress',NULL,'0',26),(334,NULL,NULL,'1-4784821753','A','wordpress',NULL,'0',27),(335,NULL,NULL,'1-4786796963','A','wordpress',NULL,'0',30),(336,NULL,NULL,'1-4786854898','A','wordpress',NULL,'0',35),(337,NULL,NULL,'1-4786796666','A','wordpress',NULL,'0',37),(338,NULL,NULL,'1-4786796633','A','wordpress',NULL,'0',39),(339,NULL,NULL,'1-4784735739','A','wordpress',NULL,'0',43),(340,NULL,NULL,'1-4786840136','A','wordpress',NULL,'0',44),(341,NULL,NULL,'1-4784775446','A','wordpress',NULL,'0',45),(342,NULL,NULL,'1-4786918127','A','wordpress',NULL,'0',51),(343,NULL,NULL,'1-4786796514','A','wordpress',NULL,'0',52),(344,NULL,NULL,'1-4786796518','A','wordpress',NULL,'0',54),(345,NULL,NULL,'1-4784790409','A','wordpress',NULL,'0',59),(346,NULL,NULL,'1-4784795182','A','wordpress',NULL,'0',64),(347,NULL,NULL,'1-4786796975','A','wordpress',NULL,'0',67),(348,NULL,NULL,'1-4784755057','A','wordpress',NULL,'0',69),(349,NULL,NULL,'1-4784812088','A','wordpress',NULL,'0',77),(350,NULL,NULL,'1-4784811799','A','wordpress',NULL,'0',78),(351,NULL,NULL,'1-4784813265','A','wordpress',NULL,'0',85),(352,NULL,NULL,'1-4784780256','A','wordpress',NULL,'0',89),(353,NULL,NULL,'1-4786694519','A','www',NULL,'0',1),(354,NULL,NULL,'1-4786071918','A','www',NULL,'0',3),(355,NULL,NULL,'1-4785995283','A','www',NULL,'0',4),(356,NULL,NULL,'1-4784651111','A','www',NULL,'0',5),(357,NULL,NULL,'1-4784651133','A','www',NULL,'0',6),(358,NULL,NULL,'1-4786688152','A','www',NULL,'0',7),(359,NULL,NULL,'1-4786688178','A','www',NULL,'0',8),(360,NULL,NULL,'1-4784671080','A','wwwatwork',NULL,'0',11),(361,NULL,NULL,'1-4784684154','A','wwwatwork',NULL,'0',16),(362,NULL,NULL,'1-4784694001','A','wwwatwork',NULL,'0',27),(363,NULL,NULL,'1-4784685589','A','wwwatwork',NULL,'0',45),(364,NULL,NULL,'1-4784684160','A','wwwatwork',NULL,'0',59),(365,NULL,NULL,'1-4784684164','A','wwwatwork',NULL,'0',77),(366,NULL,NULL,'1-4784684157','A','wwwatwork',NULL,'0',78),(367,NULL,NULL,'1-4784684167','A','wwwatwork',NULL,'0',85),(368,NULL,NULL,'1-4786688216','A','www',NULL,'0',9),(369,NULL,NULL,'1-4784651184','A','www',NULL,'0',10),(370,NULL,NULL,'1-4784651202','A','www',NULL,'0',11),(371,NULL,NULL,'1-4786688242','A','www',NULL,'0',12),(372,NULL,NULL,'1-4786688264','A','www',NULL,'0',13),(373,NULL,NULL,'1-4786086946','A','www',NULL,'0',15),(374,NULL,NULL,'1-4784651239','A','www',NULL,'0',16),(375,NULL,NULL,'1-4787231604','A','wwwdatetimelocal',NULL,'0',11),(376,NULL,NULL,'1-4784651256','A','www',NULL,'0',17),(377,NULL,NULL,'1-4786688288','A','www',NULL,'0',18),(378,NULL,NULL,'1-4786932161','A','wwwdeploy',NULL,'0',67),(379,NULL,NULL,'1-4785995326','A','www',NULL,'0',19),(380,NULL,NULL,'1-4786082637','A','wwwfrontend',NULL,'0',11),(381,NULL,NULL,'1-4787615008','A','wwwhallorenzo',NULL,'0',64),(382,NULL,NULL,'1-4786688359','A','www',NULL,'0',21),(383,NULL,NULL,'1-4786688383','A','www',NULL,'0',22),(384,NULL,NULL,'1-4786688443','A','www',NULL,'0',23),(385,NULL,NULL,'1-4784651499','A','www',NULL,'0',24),(386,NULL,NULL,'1-4784684262','A','www',NULL,'0',25),(387,NULL,NULL,'1-4786688469','A','www',NULL,'0',26),(388,NULL,NULL,'1-4784651516','A','www',NULL,'0',27),(389,NULL,NULL,'1-4786688491','A','www',NULL,'0',28),(390,NULL,NULL,'1-4786688513','A','www',NULL,'0',29),(391,NULL,NULL,'1-4786688544','A','www',NULL,'0',30),(392,NULL,NULL,'1-4785995457','A','www',NULL,'0',31),(393,NULL,NULL,'1-4785995124','A','www',NULL,'0',32),(394,NULL,NULL,'1-4786688550','A','www',NULL,'0',34),(395,NULL,NULL,'1-4786688586','A','www',NULL,'0',35),(396,NULL,NULL,'1-4786688608','A','www',NULL,'0',36),(397,NULL,NULL,'1-4786714523','A','www',NULL,'0',37),(398,NULL,NULL,'1-4786688630','A','www',NULL,'0',38),(399,NULL,NULL,'1-4786688667','A','www',NULL,'0',39),(400,NULL,NULL,'1-4786958172','A','www',NULL,'0',41),(401,NULL,NULL,'1-4784651706','A','www',NULL,'0',43),(402,NULL,NULL,'1-4786688695','A','www',NULL,'0',44),(403,NULL,NULL,'1-4784651723','A','www',NULL,'0',45),(404,NULL,NULL,'1-4784651740','A','www',NULL,'0',48),(405,NULL,NULL,'1-4786689080','A','www',NULL,'0',49),(406,NULL,NULL,'1-4786688807','A','www',NULL,'0',51),(407,NULL,NULL,'1-4786688853','A','www',NULL,'0',52),(408,NULL,NULL,'1-4786745337','A','wwwmythica',NULL,'0',11),(409,NULL,NULL,'1-4786688854','A','www',NULL,'0',54),(410,NULL,NULL,'1-4784651810','A','www',NULL,'0',55),(411,NULL,NULL,'1-4787614984','A','wwwnieuwesubsite',NULL,'0',42),(412,NULL,NULL,'1-4785995200','A','www',NULL,'0',56),(413,NULL,NULL,'1-4786688901','A','www',NULL,'0',57),(414,NULL,NULL,'1-4784651830','A','www',NULL,'0',59),(415,NULL,NULL,'1-4787064385','A','wwwportfolio',NULL,'0',11),(416,NULL,NULL,'1-4787031763','A','wwwpromoshop',NULL,'0',67),(417,NULL,NULL,'1-4784651855','A','www',NULL,'0',62),(418,NULL,NULL,'1-4784651896','A','www',NULL,'0',64),(419,NULL,NULL,'1-4786688935','A','www',NULL,'0',67),(420,NULL,NULL,'1-4786688959','A','www',NULL,'0',68),(421,NULL,NULL,'1-4784651932','A','www',NULL,'0',69),(422,NULL,NULL,'1-4784651976','A','www',NULL,'0',70),(423,NULL,NULL,'1-4784652032','A','www',NULL,'0',71),(424,NULL,NULL,'1-4786688982','A','www',NULL,'0',73),(425,NULL,NULL,'1-4787151949','A','wwwselfiewebapp',NULL,'0',11),(426,NULL,NULL,'1-4786689004','A','www',NULL,'0',74),(427,NULL,NULL,'1-4784651999','A','www',NULL,'0',75),(428,NULL,NULL,'1-4784652083','A','www',NULL,'0',76),(429,NULL,NULL,'1-4784652136','A','www',NULL,'0',77),(430,NULL,NULL,'1-4784652205','A','www',NULL,'0',78),(431,NULL,NULL,'1-4784691912','A','wwwsubweb',NULL,'0',55),(432,NULL,NULL,'1-4786689027','A','www',NULL,'0',80),(433,NULL,NULL,'1-4785995410','A','www',NULL,'0',81),(434,NULL,NULL,'1-4784684170','A','wwwtest',NULL,'0',17),(435,NULL,NULL,'1-4784673972','A','wwwtest',NULL,'0',43),(436,NULL,NULL,'1-4786830986','A','wwwtest',NULL,'0',67),(437,NULL,NULL,'1-4784694412','A','wwwtest1',NULL,'0',24),(438,NULL,NULL,'1-4784652243','A','www',NULL,'0',84),(439,NULL,NULL,'1-4784652273','A','www',NULL,'0',85),(440,NULL,NULL,'1-4786689049','A','www',NULL,'0',86),(441,NULL,NULL,'1-4786884714','A','wwwwoocommerce',NULL,'0',67),(442,NULL,NULL,'1-4784735344','A','wwwwordpress',NULL,'0',11),(443,NULL,NULL,'1-4785995179','A','www',NULL,'0',88),(444,NULL,NULL,'1-4784652342','A','www',NULL,'0',89),(445,NULL,NULL,'1-4786442678','A','www',NULL,'0',90),(446,NULL,NULL,'1-4784652359','A','www',NULL,'0',92),(447,NULL,NULL,'1-4787560035','A','wwwcombellbbb',NULL,'0',42),(448,NULL,NULL,'1-4785995178','A','',NULL,'0',88),(449,NULL,NULL,'1-4784652341','A','',NULL,'0',89),(450,NULL,NULL,'1-4786442677','A','',NULL,'0',90),(451,NULL,NULL,'1-4784652358','A','',NULL,'0',92),(452,NULL,NULL,'1-4785684210','A','zeeslag',NULL,'0',11),(453,NULL,NULL,'1-4787027481','NS','','ns3.european-server.com','0',33),(454,NULL,NULL,'1-4787027482','NS','','ns4.european-server.com','0',33),(455,NULL,NULL,'1-4787027575','NS','','ns3.european-server.com','0',40),(456,NULL,NULL,'1-4787027576','NS','','ns4.european-server.com','0',40),(457,NULL,NULL,'1-4787027463','NS','','ns3.european-server.com','0',50),(458,NULL,NULL,'1-4787027464','NS','','ns4.european-server.com','0',50),(459,NULL,NULL,'1-4787027539','NS','','ns3.european-server.com','0',58),(460,NULL,NULL,'1-4787027540','NS','','ns4.european-server.com','0',58),(461,NULL,NULL,'1-4787027567','NS','','ns3.european-server.com','0',60),(462,NULL,NULL,'1-4787027568','NS','','ns4.european-server.com','0',60),(463,NULL,NULL,'1-4787027555','NS','','ns3.european-server.com','0',61),(464,NULL,NULL,'1-4787027556','NS','','ns4.european-server.com','0',61),(465,NULL,NULL,'1-4787027559','NS','','ns3.european-server.com','0',63),(466,NULL,NULL,'1-4787027560','NS','','ns4.european-server.com','0',63),(467,NULL,NULL,'1-4787027601','NS','','ns3.european-server.com','0',65),(468,NULL,NULL,'1-4787027602','NS','','ns4.european-server.com','0',65),(469,NULL,NULL,'1-4787027503','NS','','ns3.european-server.com','0',66),(470,NULL,NULL,'1-4787027504','NS','','ns4.european-server.com','0',66),(471,NULL,NULL,'1-4787027477','NS','','ns3.european-server.com','0',79),(472,NULL,NULL,'1-4787027478','NS','','ns4.european-server.com','0',79),(473,NULL,NULL,'1-4787027505','NS','','ns3.european-server.com','0',87),(474,NULL,NULL,'1-4787027506','NS','','ns4.european-server.com','0',87),(475,NULL,NULL,'1-4787027499','NS','','ns3.european-server.com','0',91),(476,NULL,NULL,'1-4787027500','NS','','ns4.european-server.com','0',91),(477,NULL,NULL,'1-4787558699','TXT','abababa','aaaaaaaa','0',42),(478,NULL,NULL,'1-4785903732','TXT','','v=spf1 include:spf.mandrillapp.com include:spf.mandrillapp.com ?all','0',11),(479,NULL,NULL,'1-4787581152','TXT','c','aaaaaaaa','0',42),(480,NULL,NULL,'1-4787581172','TXT','c','aaaaaaaa','0',42),(481,NULL,NULL,'1-4787369352','TXT','ja','176.62.165.58','0',91),(482,NULL,NULL,'1-4785903997','TXT','mandrill_domainkey','v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;','0',11),(483,NULL,NULL,'1-4785900705','TXT','','v=spf1 include:spf.mandrillapp.com ?all','0',89),(484,NULL,NULL,'1-4787560036','TXT','z','b','0',42);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2023-01-12 12:29:48','2023-01-12 12:29:48');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_domain` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_combell_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oauth_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'aaron','meys','aaron.meys','185.86.18.194','aaron.meys@student.kdg.be',NULL),(2,'2023-01-12 13:29:48',NULL,NULL,'aayushsaini32','nxtmediatech','aayushsaini32.nxtmediatech',NULL,'aayushsaini32.nxtmediatech@student.kdg.be',NULL),(3,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'agnieszka','urbanek','agnieszka.urbanek','176.62.173.237','agnieszka.urbanek@student.kdg.be',NULL),(4,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'anna','gonzo14','anna.gonzo14','185.162.30.225','anna.gonzo14@student.kdg.be',NULL),(5,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'argylle','alfaisie','argylle.alfaisie','185.86.18.55','argylle.alfaisie@student.kdg.be',NULL),(6,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'armen','martirosyan','armen.martirosyan','185.86.18.51','armen.martirosyan@student.kdg.be',NULL),(7,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'aron','meys','aron.meys','185.86.18.199','aron.meys@student.kdg.be',NULL),(8,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'ashley','meulemans','ashley.meulemans','185.86.18.192','ashley.meulemans@student.kdg.be',NULL),(9,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'bas','debock','bas.debock','185.86.18.196','bas.debock@student.kdg.be',NULL),(10,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'ben','cyran','ben.cyran','185.86.18.55','ben.cyran@student.kdg.be',NULL),(11,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'bente','geerts','bente.geerts','185.86.18.56','bente.geerts@student.kdg.be',NULL),(12,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'bo','claes','bo.claes','185.86.18.193','bo.claes@student.kdg.be',NULL),(13,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'chelsey','caryn','chelsey.caryn','185.86.18.197','chelsey.caryn@student.kdg.be',NULL),(14,'2023-01-12 13:29:48',NULL,NULL,'cocaalexandru','nxtmediatech','cocaalexandru.nxtmediatech',NULL,'cocaalexandru.nxtmediatech@student.kdg.be',NULL),(15,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'danilo','eidtsills','danilo.eidtsills','176.62.173.146','danilo.eidtsills@student.kdg.be',NULL),(16,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'dario','boermans','dario.boermans','185.86.18.50','dario.boermans@student.kdg.be',NULL),(17,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'dawid','manko','dawid.manko','185.86.18.51','dawid.manko@student.kdg.be',NULL),(18,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'dean','vleminckx','dean.vleminckx','185.86.18.194','dean.vleminckx@student.kdg.be',NULL),(19,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'emilie','meirsman','emilie.meirsman','185.162.30.200','emilie.meirsman@student.kdg.be',NULL),(20,'2023-01-12 13:29:48',NULL,NULL,'firstname','lastname','firstname.lastname',NULL,'firstname.lastname@student.kdg.be',NULL),(21,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'hannah-marie','hermans','hannah-marie.hermans','185.86.18.191','hannah-marie.hermans@student.kdg.be',NULL),(22,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'ilian','opdebeeck','ilian.opdebeeck','185.86.18.198','ilian.opdebeeck@student.kdg.be',NULL),(23,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jacob','salazuaku','jacob.salazuaku','185.86.19.52','jacob.salazuaku@student.kdg.be',NULL),(24,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jahlyn','hugens','jahlyn.hugens','5.134.7.54','jahlyn.hugens@student.kdg.be',NULL),(25,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jari','thys','jari.thys','5.134.7.148','jari.thys@student.kdg.be',NULL),(26,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jef','smet','jef.smet','185.86.18.199','jef.smet@student.kdg.be',NULL),(27,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jelmer','krux','jelmer.krux','185.86.18.50','jelmer.krux@student.kdg.be',NULL),(28,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jonah','declerck','jonah.declerck','185.86.18.192','jonah.declerck@student.kdg.be',NULL),(29,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jonathan','seghers','jonathan.seghers','185.86.19.52','jonathan.seghers@student.kdg.be',NULL),(30,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'joran','peeters','joran.peeters','185.86.18.193','joran.peeters@student.kdg.be',NULL),(31,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jorn','pandelaers','jorn.pandelaers','176.62.168.139','jorn.pandelaers@student.kdg.be',NULL),(32,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'jovana','bakic','jovana.bakic','176.62.173.244','jovana.bakic@student.kdg.be',NULL),(33,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'karel','decoene','karel.decoene','77.241.85.70','karel.decoene@student.kdg.be',NULL),(34,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'karel','scheers','karel.scheers','185.86.18.197','karel.scheers@student.kdg.be',NULL),(35,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'karen','celis','karen.celis','185.86.18.194','karen.celis@student.kdg.be',NULL),(36,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'kyrenea','deloenen','kyrenea.deloenen','185.86.19.52','kyrenea.deloenen@student.kdg.be',NULL),(37,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'kyrenia','deloenen','kyrenia.deloenen','185.86.18.196','kyrenia.deloenen@student.kdg.be',NULL),(38,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'lasse','cool','lasse.cool','185.86.19.52','lasse.cool@student.kdg.be',NULL),(39,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'len','vanbel','len.vanbel','185.86.18.195','len.vanbel@student.kdg.be',NULL),(40,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'loan','wellens','loan.wellens','ns3.european-server.com','loan.wellens@student.kdg.be',NULL),(41,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'marko','wolfs','marko.wolfs','185.86.19.74','marko.wolfs@student.kdg.be',NULL),(42,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'matthias','debeule','matthias.debeule','185.86.18.53','matthias.debeule@student.kdg.be',NULL),(43,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'matthias','kestens','matthias.kestens','185.86.18.50','matthias.kestens@student.kdg.be',NULL),(44,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'maxim','calluy','maxim.calluy','185.86.18.199','maxim.calluy@student.kdg.be',NULL),(45,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'maxim','spruyt','maxim.spruyt','185.86.18.51','maxim.spruyt@student.kdg.be',NULL),(46,'2023-01-12 13:29:48',NULL,NULL,'mdouniazade','nxtmediatech','mdouniazade.nxtmediatech',NULL,'mdouniazade.nxtmediatech@student.kdg.be',NULL),(47,'2023-01-12 13:29:48',NULL,NULL,'mechahrazad','nxtmediatech','mechahrazad.nxtmediatech',NULL,'mechahrazad.nxtmediatech@student.kdg.be',NULL),(48,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'mei','jiang','mei.jiang','5.134.7.54','mei.jiang@student.kdg.be',NULL),(49,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'michiel','vanhuele','michiel.vanhuele','185.86.18.194','michiel.vanhuele@student.kdg.be',NULL),(50,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'milolo','mutanga','milolo.mutanga','ns3.european-server.com','milolo.mutanga@student.kdg.be',NULL),(51,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'miro','polfliet','miro.polfliet','185.86.18.196','miro.polfliet@student.kdg.be',NULL),(52,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'myrthe','diepeveen','myrthe.diepeveen','185.86.18.197','myrthe.diepeveen@student.kdg.be',NULL),(53,'2023-01-12 13:29:48',NULL,NULL,'naam','voornaam','naam.voornaam',NULL,'naam.voornaam@student.kdg.be',NULL),(54,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'nie','verbeek','nie.verbeek','185.86.18.194','nie.verbeek@student.kdg.be',NULL),(55,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'niels','vancaenegem','niels.vancaenegem','5.134.7.54','niels.vancaenegem@student.kdg.be',NULL),(56,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'nikita','lyakhevich','nikita.lyakhevich','185.162.30.81','nikita.lyakhevich@student.kdg.be',NULL),(57,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'noah','vanpuymbroeck','noah.vanpuymbroeck','185.86.19.52','noah.vanpuymbroeck@student.kdg.be',NULL),(58,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'norzinx','tenzin','norzinx.tenzin','ns3.european-server.com','norzinx.tenzin@student.kdg.be',NULL),(59,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'olivier','dekoeyer','olivier.dekoeyer','185.86.18.50','olivier.dekoeyer@student.kdg.be',NULL),(60,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'owin','pellegroms','owin.pellegroms','ns3.european-server.com','owin.pellegroms@student.kdg.be',NULL),(61,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'paul','arthur','paul.arthur','ns3.european-server.com','paul.arthur@student.kdg.be',NULL),(62,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'quinten','rotthier','quinten.rotthier','5.134.7.52','quinten.rotthier@student.kdg.be',NULL),(63,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'ramon','craeghs','ramon.craeghs','ns3.european-server.com','ramon.craeghs@student.kdg.be',NULL),(64,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'renzo','daelman','renzo.daelman','5.134.6.255','renzo.daelman@student.kdg.be',NULL),(65,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'rickert','goyvaerts','rickert.goyvaerts','ns3.european-server.com','rickert.goyvaerts@student.kdg.be',NULL),(66,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'rinor','zeciri','rinor.zeciri','ns3.european-server.com','rinor.zeciri@student.kdg.be',NULL),(67,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'rinus','vanlinden','rinus.vanlinden','185.86.18.195','rinus.vanlinden@student.kdg.be',NULL),(68,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'robbe','rillaerts','robbe.rillaerts','185.86.19.52','robbe.rillaerts@student.kdg.be',NULL),(69,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'robin','daems','robin.daems','185.86.18.56','robin.daems@student.kdg.be',NULL),(70,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'ruben','deschepper','ruben.deschepper','5.134.6.255','ruben.deschepper@student.kdg.be',NULL),(71,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'ruben','struijs','ruben.struijs','5.134.7.54','ruben.struijs@student.kdg.be',NULL),(72,'2023-01-12 13:29:48',NULL,NULL,'sam','serrien','sam.serrien',NULL,'sam.serrien@kdg.be',NULL),(73,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'sarah','wijsman','sarah.wijsman','185.86.19.52','sarah.wijsman@student.kdg.be',NULL),(74,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'senne','dewinter','senne.dewinter','185.86.18.196','senne.dewinter@student.kdg.be',NULL),(75,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'seppe','daems','seppe.daems','5.134.7.52','seppe.daems@student.kdg.be',NULL),(76,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'sieger','vanhoof','sieger.vanhoof','5.134.6.255','sieger.vanhoof@student.kdg.be',NULL),(77,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'simme','festen','simme.festen','185.86.18.56','simme.festen@student.kdg.be',NULL),(78,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'stef','geybels','stef.geybels','185.86.18.50','stef.geybels@student.kdg.be',NULL),(79,'2023-01-12 13:29:48','2023-01-12 12:29:51',NULL,'stef','vandeneynde','stef.vandeneynde','ns3.european-server.com','stef.vandeneynde@student.kdg.be',NULL),(80,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'sym','weustenraad','sym.weustenraad','185.86.18.193','sym.weustenraad@student.kdg.be',NULL),(81,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'teo','todoran12','teo.todoran12','185.162.30.167','teo.todoran12@student.kdg.be',NULL),(82,'2023-01-12 13:29:48',NULL,NULL,'testtest','nxtmediatech','testtest.nxtmediatech',NULL,'testtest.nxtmediatech@student.kdg.be',NULL),(83,'2023-01-12 13:29:48',NULL,NULL,'theofanialatsou','nxtmediatech','theofanialatsou.nxtmediatech',NULL,'theofanialatsou.nxtmediatech@student.kdg.be',NULL),(84,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'tijani','nahnai','tijani.nahnai','185.86.18.58','tijani.nahnai@student.kdg.be',NULL),(85,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'tijn','morlion','tijn.morlion','185.86.18.55','tijn.morlion@student.kdg.be',NULL),(86,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'tom','desmaels','tom.desmaels','185.86.19.52','tom.desmaels@student.kdg.be',NULL),(87,'2023-01-12 13:29:48','2023-01-12 12:29:51',NULL,'vincent','vanpuymbroeck','vincent.vanpuymbroeck','ns3.european-server.com','vincent.vanpuymbroeck@student.kdg.be',NULL),(88,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'xime','rib','xime.rib','185.162.30.73','xime.rib@student.kdg.be',NULL),(89,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'yahno','dewit','yahno.dewit','5.134.6.16','yahno.dewit@student.kdg.be',NULL),(90,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'yasser','abdelwahed','yasser.abdelwahed','185.86.19.13','yasser.abdelwahed@student.kdg.be',NULL),(91,'2023-01-12 13:29:48','2023-01-12 12:29:50',NULL,'yassin','samadi','yassin.samadi','176.62.165.58','yassin.samadi@student.kdg.be',NULL),(92,'2023-01-12 13:29:48','2023-01-12 12:29:49',NULL,'zainab','elyacoubi','zainab.elyacoubi','185.86.18.51','zainab.elyacoubi@student.kdg.be',NULL);
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
