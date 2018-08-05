CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add materiales',1,'add_materiales'),(2,'Can change materiales',1,'change_materiales'),(3,'Can delete materiales',1,'delete_materiales'),(4,'Can add material solicitado',2,'add_materialsolicitado'),(5,'Can change material solicitado',2,'change_materialsolicitado'),(6,'Can delete material solicitado',2,'delete_materialsolicitado'),(7,'Can add obra',3,'add_obra'),(8,'Can change obra',3,'change_obra'),(9,'Can delete obra',3,'delete_obra'),(10,'Can add orden compra',4,'add_ordencompra'),(11,'Can change orden compra',4,'change_ordencompra'),(12,'Can delete orden compra',4,'delete_ordencompra'),(13,'Can add solicitud material',5,'add_solicitudmaterial'),(14,'Can change solicitud material',5,'change_solicitudmaterial'),(15,'Can delete solicitud material',5,'delete_solicitudmaterial'),(16,'Can add user',6,'add_myuser'),(17,'Can change user',6,'change_myuser'),(18,'Can delete user',6,'delete_myuser'),(19,'Can add bodeguero',7,'add_bodeguero'),(20,'Can change bodeguero',7,'change_bodeguero'),(21,'Can delete bodeguero',7,'delete_bodeguero'),(22,'Can add encargado compras',8,'add_encargadocompras'),(23,'Can change encargado compras',8,'change_encargadocompras'),(24,'Can delete encargado compras',8,'delete_encargadocompras'),(25,'Can add trabajador obra',9,'add_trabajadorobra'),(26,'Can change trabajador obra',9,'change_trabajadorobra'),(27,'Can delete trabajador obra',9,'delete_trabajadorobra'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry'),(31,'Can add permission',11,'add_permission'),(32,'Can change permission',11,'change_permission'),(33,'Can delete permission',11,'delete_permission'),(34,'Can add group',12,'add_group'),(35,'Can change group',12,'change_group'),(36,'Can delete group',12,'delete_group'),(37,'Can add content type',13,'add_contenttype'),(38,'Can change content type',13,'change_contenttype'),(39,'Can delete content type',13,'delete_contenttype'),(40,'Can add session',14,'add_session'),(41,'Can change session',14,'change_session'),(42,'Can delete session',14,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_GPI_myuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-06-20 23:35:43.459046','2','bodega1@gpi.cl',1,'[{\"added\": {}}]',6,1),(2,'2018-06-20 23:36:14.402486','3','trabajador1@gpi.cl',1,'[{\"added\": {}}]',6,1),(3,'2018-06-20 23:36:21.338439','3','TrabajadorObra object (3)',1,'[{\"added\": {}}]',9,1),(4,'2018-06-20 23:36:48.826596','2','Bodeguero object (2)',1,'[{\"added\": {}}]',7,1),(5,'2018-06-20 23:36:59.656376','1','Obra 1',1,'[{\"added\": {}}]',3,1),(6,'2018-06-20 23:37:52.443191','1','hola@gpi.cl',2,'[{\"changed\": {\"fields\": [\"is_bodeguero\", \"is_encargado_compras\", \"is_trabajador_obra\"]}}]',6,1),(7,'2018-06-20 23:38:11.054722','1','TrabajadorObra object (1)',1,'[{\"added\": {}}]',9,1),(8,'2018-06-28 04:06:12.382470','2','bodega1@gpi.cl',2,'[{\"changed\": {\"fields\": [\"is_bodeguero\"]}}]',6,1),(9,'2018-06-28 04:06:28.361823','2','bodega1@gpi.cl',2,'[]',6,1),(10,'2018-06-28 06:23:22.019935','1','SolicitudMaterial object (1)',2,'[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]',5,1),(11,'2018-06-28 06:52:57.043293','1','SolicitudMaterial object (1)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(12,'2018-06-28 06:56:56.843563','1','SolicitudMaterial object (1)',2,'[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]',5,1),(13,'2018-06-28 06:57:56.493746','1','SolicitudMaterial object (1)',2,'[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]',5,1),(14,'2018-06-28 07:01:25.451154','2','Obra 2',1,'[{\"added\": {}}]',3,1),(15,'2018-06-28 07:01:58.893677','2','SolicitudMaterial object (2)',1,'[{\"added\": {}}]',5,1),(16,'2018-06-28 23:03:45.868880','1','SolicitudMaterial object (1)',2,'[{\"changed\": {\"fields\": [\"fecha_solicitud\", \"fecha_requerida\"]}}]',5,1),(17,'2018-06-28 23:04:00.601508','2','SolicitudMaterial object (2)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(18,'2018-06-28 23:04:17.696263','3','SolicitudMaterial object (3)',1,'[{\"added\": {}}]',5,1),(19,'2018-06-28 23:11:10.003317','1','SolicitudMaterial object (1)',2,'[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]',5,1),(20,'2018-06-28 23:11:26.891936','2','SolicitudMaterial object (2)',2,'[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]',5,1),(21,'2018-06-28 23:11:36.619346','3','SolicitudMaterial object (3)',2,'[{\"changed\": {\"fields\": [\"fecha_solicitud\"]}}]',5,1),(22,'2018-07-12 16:41:58.787758','1','SolicitudMaterial object (1)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(23,'2018-07-12 16:42:13.778866','2','SolicitudMaterial object (2)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(24,'2018-07-12 16:42:19.453916','3','SolicitudMaterial object (3)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(25,'2018-07-12 16:43:22.630660','1','SolicitudMaterial object (1)',2,'[]',5,1),(26,'2018-07-12 16:43:43.479804','2','SolicitudMaterial object (2)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(27,'2018-07-12 16:43:51.114748','1','SolicitudMaterial object (1)',2,'[]',5,1),(28,'2018-07-12 16:43:57.555691','2','SolicitudMaterial object (2)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(29,'2018-07-12 16:44:07.607182','3','SolicitudMaterial object (3)',2,'[]',5,1),(30,'2018-07-12 16:45:54.624839','3','trabajador1@gpi.cl',2,'[]',9,1),(31,'2018-07-12 16:46:11.360390','3','trabajador1@gpi.cl',2,'[{\"changed\": {\"fields\": [\"is_trabajador_obra\"]}}]',6,1),(32,'2018-07-21 07:54:28.625145','6','SolicitudMaterial object (6)',3,'',5,1),(33,'2018-07-21 07:54:31.885620','5','SolicitudMaterial object (5)',3,'',5,1),(34,'2018-07-21 07:54:35.238678','4','SolicitudMaterial object (4)',3,'',5,1),(35,'2018-07-21 07:54:38.080493','3','SolicitudMaterial object (3)',3,'',5,1),(36,'2018-07-21 07:54:41.234727','2','SolicitudMaterial object (2)',3,'',5,1),(37,'2018-07-21 07:54:45.770300','1','SolicitudMaterial object (1)',3,'',5,1),(38,'2018-07-21 07:58:15.382158','7','SolicitudMaterial object (7)',3,'',5,1),(39,'2018-07-21 07:58:18.292282','8','SolicitudMaterial object (8)',3,'',5,1),(40,'2018-08-01 23:51:46.227189','4','trabajador2@gpi.cl',1,'[{\"added\": {}}]',6,1),(41,'2018-08-01 23:51:48.820806','4','trabajador2@gpi.cl',1,'[{\"added\": {}}]',9,1),(42,'2018-08-01 23:52:01.431902','4','trabajador2@gpi.cl',2,'[{\"changed\": {\"fields\": [\"is_trabajador_obra\"]}}]',6,1),(43,'2018-08-01 23:52:38.463040','2','Obra 2',2,'[{\"changed\": {\"fields\": [\"trabajadorobra\"]}}]',3,1),(44,'2018-08-02 00:07:54.483468','13','SolicitudMaterial object (13)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(45,'2018-08-02 00:07:58.731804','12','SolicitudMaterial object (12)',2,'[{\"changed\": {\"fields\": [\"fecha_requerida\"]}}]',5,1),(46,'2018-08-02 22:20:13.613559','3','Obra 150',1,'[{\"added\": {}}]',3,1),(47,'2018-08-02 22:33:13.866842','1','Martillo',1,'[{\"added\": {}}]',1,1),(48,'2018-08-02 22:33:21.970078','2','Tuercas',1,'[{\"added\": {}}]',1,1),(49,'2018-08-02 22:33:31.395255','3','Ampolletas',1,'[{\"added\": {}}]',1,1),(50,'2018-08-02 22:33:52.411684','4','Palos',1,'[{\"added\": {}}]',1,1),(51,'2018-08-05 05:30:17.463063','15','SolicitudMaterial object (15)',3,'',5,1),(52,'2018-08-05 05:30:21.273618','14','SolicitudMaterial object (14)',3,'',5,1),(53,'2018-08-05 05:30:24.076796','13','SolicitudMaterial object (13)',3,'',5,1),(54,'2018-08-05 05:30:28.496502','12','SolicitudMaterial object (12)',3,'',5,1),(55,'2018-08-05 05:30:31.705625','11','SolicitudMaterial object (11)',3,'',5,1),(56,'2018-08-05 05:30:34.289972','10','SolicitudMaterial object (10)',3,'',5,1),(57,'2018-08-05 05:30:37.092602','9','SolicitudMaterial object (9)',3,'',5,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'admin','logentry'),(12,'auth','group'),(11,'auth','permission'),(13,'contenttypes','contenttype'),(7,'GPI','bodeguero'),(8,'GPI','encargadocompras'),(1,'GPI','materiales'),(2,'GPI','materialsolicitado'),(6,'GPI','myuser'),(3,'GPI','obra'),(4,'GPI','ordencompra'),(5,'GPI','solicitudmaterial'),(9,'GPI','trabajadorobra'),(14,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-20 22:44:08.266633'),(2,'contenttypes','0002_remove_content_type_name','2018-06-20 22:44:09.356205'),(3,'auth','0001_initial','2018-06-20 22:44:15.493889'),(4,'auth','0002_alter_permission_name_max_length','2018-06-20 22:44:16.369202'),(5,'auth','0003_alter_user_email_max_length','2018-06-20 22:44:16.440723'),(6,'auth','0004_alter_user_username_opts','2018-06-20 22:44:16.474225'),(7,'auth','0005_alter_user_last_login_null','2018-06-20 22:44:16.540943'),(8,'auth','0006_require_contenttypes_0002','2018-06-20 22:44:16.568786'),(9,'auth','0007_alter_validators_add_error_messages','2018-06-20 22:44:16.608312'),(10,'auth','0008_alter_user_username_max_length','2018-06-20 22:44:16.651454'),(11,'auth','0009_alter_user_last_name_max_length','2018-06-20 22:44:16.687361'),(12,'GPI','0001_initial','2018-06-20 22:44:46.182069'),(13,'admin','0001_initial','2018-06-20 22:49:13.051272'),(14,'admin','0002_logentry_remove_auto_add','2018-06-20 22:49:13.133789'),(15,'sessions','0001_initial','2018-06-20 22:49:13.941064');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_bodeguero`
--

DROP TABLE IF EXISTS `gpi_bodeguero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_bodeguero` (
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `GPI_bodeguero_user_id_d65ec1f0_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_bodeguero`
--

LOCK TABLES `gpi_bodeguero` WRITE;
/*!40000 ALTER TABLE `gpi_bodeguero` DISABLE KEYS */;
INSERT INTO `gpi_bodeguero` VALUES (2);
/*!40000 ALTER TABLE `gpi_bodeguero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_encargadocompras`
--

DROP TABLE IF EXISTS `gpi_encargadocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_encargadocompras` (
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `GPI_encargadocompras_user_id_8c6a0c88_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_encargadocompras`
--

LOCK TABLES `gpi_encargadocompras` WRITE;
/*!40000 ALTER TABLE `gpi_encargadocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpi_encargadocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_materiales`
--

DROP TABLE IF EXISTS `gpi_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_materiales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_materiales`
--

LOCK TABLES `gpi_materiales` WRITE;
/*!40000 ALTER TABLE `gpi_materiales` DISABLE KEYS */;
INSERT INTO `gpi_materiales` VALUES (1,'Martillo',10),(2,'Tuercas',1),(3,'Ampolletas',5),(4,'Palos',1000);
/*!40000 ALTER TABLE `gpi_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_materiales_obra`
--

DROP TABLE IF EXISTS `gpi_materiales_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_materiales_obra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materiales_id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GPI_materiales_obra_materiales_id_obra_id_6e6bcaf5_uniq` (`materiales_id`,`obra_id`),
  KEY `GPI_materiales_obra_obra_id_8681c127_fk_GPI_obra_id` (`obra_id`),
  CONSTRAINT `GPI_materiales_obra_materiales_id_6eb74fc9_fk_GPI_materiales_id` FOREIGN KEY (`materiales_id`) REFERENCES `gpi_materiales` (`id`),
  CONSTRAINT `GPI_materiales_obra_obra_id_8681c127_fk_GPI_obra_id` FOREIGN KEY (`obra_id`) REFERENCES `gpi_obra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_materiales_obra`
--

LOCK TABLES `gpi_materiales_obra` WRITE;
/*!40000 ALTER TABLE `gpi_materiales_obra` DISABLE KEYS */;
INSERT INTO `gpi_materiales_obra` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,1);
/*!40000 ALTER TABLE `gpi_materiales_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_materialsolicitado`
--

DROP TABLE IF EXISTS `gpi_materialsolicitado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_materialsolicitado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `urgencia` varchar(10) NOT NULL,
  `unidades` varchar(20) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GPI_materialsolicita_solicitud_id_bb7d687b_fk_GPI_solic` (`solicitud_id`),
  CONSTRAINT `GPI_materialsolicita_solicitud_id_bb7d687b_fk_GPI_solic` FOREIGN KEY (`solicitud_id`) REFERENCES `gpi_solicitudmaterial` (`numero_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_materialsolicitado`
--

LOCK TABLES `gpi_materialsolicitado` WRITE;
/*!40000 ALTER TABLE `gpi_materialsolicitado` DISABLE KEYS */;
INSERT INTO `gpi_materialsolicitado` VALUES (6,'Martillo',2,'urgente','Unidades',16),(7,'Martillo',3,'normal','Unidades',17),(8,'Tuerca',3,'normal','Unidades',18);
/*!40000 ALTER TABLE `gpi_materialsolicitado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_myuser`
--

DROP TABLE IF EXISTS `gpi_myuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(254) NOT NULL,
  `second_name` varchar(254) NOT NULL,
  `apellido_paterno` varchar(254) NOT NULL,
  `apellido_materno` varchar(254) NOT NULL,
  `rut` varchar(9) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_bodeguero` tinyint(1) NOT NULL,
  `is_trabajador_obra` tinyint(1) NOT NULL,
  `is_encargado_compras` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_myuser`
--

LOCK TABLES `gpi_myuser` WRITE;
/*!40000 ALTER TABLE `gpi_myuser` DISABLE KEYS */;
INSERT INTO `gpi_myuser` VALUES (1,'pbkdf2_sha256$100000$PltbKg6vsV7j$+lY6VQVI6zv9/nCdV1WPjIXVzBS8VYIvKABHkaLCmMw=','2018-08-05 05:29:59.816180','hola@gpi.cl','super1','hola','holo','doom','123456-1',1,1,1,1,1,1),(2,'pbkdf2_sha256$100000$yxz5akGJNbD6$fuXYjHqa+u2xLJmFju3gfmYmC2fs1GXlpRAEBV/bZC4=','2018-08-05 05:34:02.883231','bodega1@gpi.cl','Bodeguero1','','ufmen','','123321-1',1,0,0,1,0,0),(3,'pbkdf2_sha256$100000$t8FQkcSfu6ZQ$LjyJi+uIw7GYsW4oaMX0qhsPfUtdk4gwY/sb/I5GZ4w=','2018-08-05 05:33:21.883382','trabajador1@gpi.cl','Trabajador1','','ufmen2','','123545',1,0,0,0,1,0),(4,'pbkdf2_sha256$100000$4B7lvAKjRUiP$oCfs42jF7SuUwGjIRwV118L4B8eqBcfGOkCM42PBn7I=','2018-08-01 23:55:37.493877','trabajador2@gpi.cl','Trabajador2','','ufuf','','123321-4',1,0,0,0,1,0);
/*!40000 ALTER TABLE `gpi_myuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_myuser_groups`
--

DROP TABLE IF EXISTS `gpi_myuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_myuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GPI_myuser_groups_myuser_id_group_id_da172dcf_uniq` (`myuser_id`,`group_id`),
  KEY `GPI_myuser_groups_group_id_af4c4422_fk_auth_group_id` (`group_id`),
  CONSTRAINT `GPI_myuser_groups_group_id_af4c4422_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `GPI_myuser_groups_myuser_id_3e167e51_fk_GPI_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `gpi_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_myuser_groups`
--

LOCK TABLES `gpi_myuser_groups` WRITE;
/*!40000 ALTER TABLE `gpi_myuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpi_myuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_myuser_user_permissions`
--

DROP TABLE IF EXISTS `gpi_myuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_myuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GPI_myuser_user_permissi_myuser_id_permission_id_65aa0738_uniq` (`myuser_id`,`permission_id`),
  KEY `GPI_myuser_user_perm_permission_id_146bf5d1_fk_auth_perm` (`permission_id`),
  CONSTRAINT `GPI_myuser_user_perm_permission_id_146bf5d1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `GPI_myuser_user_permissions_myuser_id_49e2609e_fk_GPI_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `gpi_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_myuser_user_permissions`
--

LOCK TABLES `gpi_myuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `gpi_myuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpi_myuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_obra`
--

DROP TABLE IF EXISTS `gpi_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_obra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `trabajadorobra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GPI_obra_trabajadorobra_id_36ab3fa0_fk_GPI_traba` (`trabajadorobra_id`),
  CONSTRAINT `GPI_obra_trabajadorobra_id_36ab3fa0_fk_GPI_traba` FOREIGN KEY (`trabajadorobra_id`) REFERENCES `gpi_trabajadorobra` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_obra`
--

LOCK TABLES `gpi_obra` WRITE;
/*!40000 ALTER TABLE `gpi_obra` DISABLE KEYS */;
INSERT INTO `gpi_obra` VALUES (1,'Los menes 123','Obra 1',3),(2,'Los menes 6969','Obra 2',4),(3,'calle uf men','Obra 150',3);
/*!40000 ALTER TABLE `gpi_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_obra_bodeguero`
--

DROP TABLE IF EXISTS `gpi_obra_bodeguero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_obra_bodeguero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obra_id` int(11) NOT NULL,
  `bodeguero_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GPI_obra_bodeguero_obra_id_bodeguero_id_93d06985_uniq` (`obra_id`,`bodeguero_id`),
  KEY `GPI_obra_bodeguero_bodeguero_id_3265373e_fk_GPI_bodeg` (`bodeguero_id`),
  CONSTRAINT `GPI_obra_bodeguero_bodeguero_id_3265373e_fk_GPI_bodeg` FOREIGN KEY (`bodeguero_id`) REFERENCES `gpi_bodeguero` (`user_id`),
  CONSTRAINT `GPI_obra_bodeguero_obra_id_f5666335_fk_GPI_obra_id` FOREIGN KEY (`obra_id`) REFERENCES `gpi_obra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_obra_bodeguero`
--

LOCK TABLES `gpi_obra_bodeguero` WRITE;
/*!40000 ALTER TABLE `gpi_obra_bodeguero` DISABLE KEYS */;
INSERT INTO `gpi_obra_bodeguero` VALUES (1,1,2),(2,2,2),(3,3,2);
/*!40000 ALTER TABLE `gpi_obra_bodeguero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_ordencompra`
--

DROP TABLE IF EXISTS `gpi_ordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_ordencompra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `material` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_ordencompra`
--

LOCK TABLES `gpi_ordencompra` WRITE;
/*!40000 ALTER TABLE `gpi_ordencompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpi_ordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_ordencompra_encargadocompras`
--

DROP TABLE IF EXISTS `gpi_ordencompra_encargadocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_ordencompra_encargadocompras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordencompra_id` int(11) NOT NULL,
  `encargadocompras_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GPI_ordencompra_encargad_ordencompra_id_encargado_aa76e3eb_uniq` (`ordencompra_id`,`encargadocompras_id`),
  KEY `GPI_ordencompra_enca_encargadocompras_id_a83dba18_fk_GPI_encar` (`encargadocompras_id`),
  CONSTRAINT `GPI_ordencompra_enca_encargadocompras_id_a83dba18_fk_GPI_encar` FOREIGN KEY (`encargadocompras_id`) REFERENCES `gpi_encargadocompras` (`user_id`),
  CONSTRAINT `GPI_ordencompra_enca_ordencompra_id_13f2d206_fk_GPI_orden` FOREIGN KEY (`ordencompra_id`) REFERENCES `gpi_ordencompra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_ordencompra_encargadocompras`
--

LOCK TABLES `gpi_ordencompra_encargadocompras` WRITE;
/*!40000 ALTER TABLE `gpi_ordencompra_encargadocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpi_ordencompra_encargadocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_ordencompra_solicitudmaterial`
--

DROP TABLE IF EXISTS `gpi_ordencompra_solicitudmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_ordencompra_solicitudmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordencompra_id` int(11) NOT NULL,
  `solicitudmaterial_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GPI_ordencompra_solicitu_ordencompra_id_solicitud_15d33f60_uniq` (`ordencompra_id`,`solicitudmaterial_id`),
  KEY `GPI_ordencompra_soli_solicitudmaterial_id_4cc48c58_fk_GPI_solic` (`solicitudmaterial_id`),
  CONSTRAINT `GPI_ordencompra_soli_ordencompra_id_1ca83837_fk_GPI_orden` FOREIGN KEY (`ordencompra_id`) REFERENCES `gpi_ordencompra` (`id`),
  CONSTRAINT `GPI_ordencompra_soli_solicitudmaterial_id_4cc48c58_fk_GPI_solic` FOREIGN KEY (`solicitudmaterial_id`) REFERENCES `gpi_solicitudmaterial` (`numero_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_ordencompra_solicitudmaterial`
--

LOCK TABLES `gpi_ordencompra_solicitudmaterial` WRITE;
/*!40000 ALTER TABLE `gpi_ordencompra_solicitudmaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpi_ordencompra_solicitudmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_solicitudmaterial`
--

DROP TABLE IF EXISTS `gpi_solicitudmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_solicitudmaterial` (
  `numero_orden` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` date NOT NULL,
  `fecha_requerida` date NOT NULL,
  `fecha_estimada` date DEFAULT NULL,
  `obra_id` int(11) NOT NULL,
  `trabajadorobra_id` int(11) NOT NULL,
  PRIMARY KEY (`numero_orden`),
  KEY `GPI_solicitudmaterial_obra_id_679e9934_fk_GPI_obra_id` (`obra_id`),
  KEY `GPI_solicitudmateria_trabajadorobra_id_6977b575_fk_GPI_traba` (`trabajadorobra_id`),
  CONSTRAINT `GPI_solicitudmateria_trabajadorobra_id_6977b575_fk_GPI_traba` FOREIGN KEY (`trabajadorobra_id`) REFERENCES `gpi_trabajadorobra` (`user_id`),
  CONSTRAINT `GPI_solicitudmaterial_obra_id_679e9934_fk_GPI_obra_id` FOREIGN KEY (`obra_id`) REFERENCES `gpi_obra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_solicitudmaterial`
--

LOCK TABLES `gpi_solicitudmaterial` WRITE;
/*!40000 ALTER TABLE `gpi_solicitudmaterial` DISABLE KEYS */;
INSERT INTO `gpi_solicitudmaterial` VALUES (16,'2018-08-05','2018-11-01',NULL,1,3),(17,'2018-08-05','2018-12-01',NULL,2,3),(18,'2018-08-05','2018-09-08',NULL,3,3);
/*!40000 ALTER TABLE `gpi_solicitudmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpi_trabajadorobra`
--

DROP TABLE IF EXISTS `gpi_trabajadorobra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpi_trabajadorobra` (
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `GPI_trabajadorobra_user_id_b1e1123f_fk_GPI_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `gpi_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpi_trabajadorobra`
--

LOCK TABLES `gpi_trabajadorobra` WRITE;
/*!40000 ALTER TABLE `gpi_trabajadorobra` DISABLE KEYS */;
INSERT INTO `gpi_trabajadorobra` VALUES (1),(3),(4);
/*!40000 ALTER TABLE `gpi_trabajadorobra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test'
--

--
-- Dumping routines for database 'test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-05 14:50:47
