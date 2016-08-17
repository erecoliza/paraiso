-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: paraiso
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Current Database: `paraiso`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `recoliza_paraiso` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `recoliza_paraiso`;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add cliente',7,'add_cliente'),(20,'Can change cliente',7,'change_cliente'),(21,'Can delete cliente',7,'delete_cliente');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$4cmv8pGtVTit$NzLsmRSf6Tm7MTr6qiMehEqx40ecCarYJjdkyAatX3w=','2016-08-12 03:14:39.754814',1,'erecoliza','Eduardo Alfredo','Recoliza','eduardo.recoliza@gmail.com',1,1,'2016-07-14 02:13:35.000000'),(2,'pbkdf2_sha256$24000$rbAfgieD01tV$tgj0jIzYC1TBheK3fQ+V/OavEkTFcZxzYXkl3D23n3U=','2016-08-06 04:21:30.000000',0,'gfranco','Gustavo Alberto','Franco','franc2001@hotmail.com',0,1,'2016-08-06 04:05:36.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-07-14 02:15:01.210754','1','Recoliza Eduardo Alfredo',1,'Añadido.',7,1),(2,'2016-07-14 03:39:15.088845','1','Recoliza Eduardo Alfredo',2,'No ha cambiado ningún campo.',7,1),(3,'2016-07-25 03:09:31.146915','2','Cigorraga Malena',1,'Añadido.',7,1),(4,'2016-07-25 03:40:35.350619','2','Cigorraga Malena',2,'Modificado/a Cumpleaños.',7,1),(5,'2016-07-25 03:44:43.593569','2','Cigorraga Malena',2,'Modificado/a Cumpleaños.',7,1),(6,'2016-07-25 04:05:09.706399','3','Guardiola Vanina',1,'Añadido.',7,1),(7,'2016-07-25 04:07:23.382466','4','Tatunczak Alejandra',1,'Añadido.',7,1),(8,'2016-07-25 04:07:47.541655','3','Guardiola Vanina',2,'Modificado/a Cumpleaños.',7,1),(9,'2016-07-25 04:25:09.785935','4','Tatunczak Alejandra',2,'Modificado/a Teléfono.',7,1),(10,'2016-07-25 21:55:00.201148','4','Tatunczak Alejandra',2,'No ha cambiado ningún campo.',7,1),(11,'2016-07-29 02:42:46.387439','5','Franco G',3,'',7,1),(12,'2016-07-29 04:23:41.325089','8','Recoliza martinez Eduardo Alfredo',3,'',7,1),(13,'2016-07-29 04:23:41.403587','7','Recoliza martinez Eduardo Alfredo',3,'',7,1),(14,'2016-08-01 06:27:36.553606','7','Recoliza martinez Eduardo Alfredo',3,'',7,1),(15,'2016-08-01 06:28:42.786246','8','PRUEBA PRUEBA',3,'',7,1),(16,'2016-08-06 04:04:57.553619','1','erecoliza',2,'Modificado/a first_name y last_name.',4,1),(17,'2016-08-06 04:05:36.936062','2','gfranco',1,'Añadido.',4,1),(18,'2016-08-06 04:06:16.910863','2','gfranco',2,'Modificado/a first_name, last_name y email.',4,1),(19,'2016-08-06 04:12:40.913175','1','erecoliza',2,'Modificado/a first_name.',4,1),(20,'2016-08-06 04:20:39.431667','2','gfranco',2,'Modificado/a is_active.',4,1),(21,'2016-08-06 04:21:12.161345','2','gfranco',2,'Modificado/a is_active.',4,1),(22,'2016-08-06 04:23:58.139480','2','gfranco',2,'No ha cambiado ningún campo.',4,1),(23,'2016-08-11 06:22:14.713755','136','De la Cruz Liliana',3,'',7,1),(24,'2016-08-11 06:22:14.785488','135','Bollañes Marta',3,'',7,1),(25,'2016-08-11 06:22:14.830025','134','Rossi Marisa',3,'',7,1),(26,'2016-08-11 06:22:14.874587','133','Gorla Laura',3,'',7,1),(27,'2016-08-11 06:22:15.009334','132','Alvarez Julieta',3,'',7,1),(28,'2016-08-11 06:22:15.128753','131','Carcacci Maria Andrea',3,'',7,1),(29,'2016-08-11 06:22:15.175578','130','Gomez Susana',3,'',7,1),(30,'2016-08-11 06:22:15.220069','129','Dominguez Hernan',3,'',7,1),(31,'2016-08-11 06:22:15.265907','128','Cabrera Veronica',3,'',7,1),(32,'2016-08-11 06:22:15.309512','127','Paternostro Betina',3,'',7,1),(33,'2016-08-11 06:22:15.353858','126','Davidis Daniela',3,'',7,1),(34,'2016-08-11 06:22:15.398459','125','PEREZ PATRICIA',3,'',7,1),(35,'2016-08-11 06:22:15.443257','124','Fernandez Analía',3,'',7,1),(36,'2016-08-11 06:22:15.487629','123','Pierce Julieta',3,'',7,1),(37,'2016-08-11 06:22:15.532219','122','Hereñu Lola',3,'',7,1),(38,'2016-08-11 06:22:15.577167','121','Giliberti Gabriela',3,'',7,1),(39,'2016-08-11 06:22:15.621624','120','Acosta Cristina',3,'',7,1),(40,'2016-08-11 06:22:15.666525','119','Mariño Josefa',3,'',7,1),(41,'2016-08-11 06:22:15.710637','118','Bandera Jimena',3,'',7,1),(42,'2016-08-11 06:22:15.755169','117','Aranda Duarte Hernan',3,'',7,1),(43,'2016-08-11 06:22:15.799979','116','Herves Nora',3,'',7,1),(44,'2016-08-11 06:22:15.833530','115','Oreglia Ana',3,'',7,1),(45,'2016-08-11 06:22:15.866967','114','Silvio Stephanie',3,'',7,1),(46,'2016-08-11 06:22:15.900509','113','Camacho Silvia',3,'',7,1),(47,'2016-08-11 06:22:15.933991','112','Irastorza Marcela',3,'',7,1),(48,'2016-08-11 06:22:15.967487','111','Cannata Carina',3,'',7,1),(49,'2016-08-11 06:22:16.001025','110','Morano Sandra',3,'',7,1),(50,'2016-08-11 06:22:16.034420','109','Valenzuela Silvia',3,'',7,1),(51,'2016-08-11 06:22:16.068016','108','Belgrano Florencia',3,'',7,1),(52,'2016-08-11 06:22:16.101543','107','Santana Mor',3,'',7,1),(53,'2016-08-11 06:22:16.134974','106','Ledesma Julieta',3,'',7,1),(54,'2016-08-11 06:22:16.168481','105','Andriola Juan',3,'',7,1),(55,'2016-08-11 06:22:16.201945','104','Vazquez Gabriel',3,'',7,1),(56,'2016-08-11 06:22:16.235575','103','Gallardo Cintia',3,'',7,1),(57,'2016-08-11 06:22:16.269100','102','Oviedo Perla',3,'',7,1),(58,'2016-08-11 06:22:16.302475','101','Netel Rocio',3,'',7,1),(59,'2016-08-11 06:22:16.335959','100','Beatriz Casas (mama de Fernanda)',3,'',7,1),(60,'2016-08-11 06:22:16.369500','99','Principi Mauricio',3,'',7,1),(61,'2016-08-11 06:22:16.403006','98','Quiroga Lucila',3,'',7,1),(62,'2016-08-11 06:22:16.436470','97','Netel Lucila',3,'',7,1),(63,'2016-08-11 06:22:16.470005','96','Principi Andrea',3,'',7,1),(64,'2016-08-11 06:22:16.503467','95','Paternostro Rosana',3,'',7,1),(65,'2016-08-11 06:22:16.537003','94','Lopez Alejandra',3,'',7,1),(66,'2016-08-11 06:22:16.570481','93','Zoloaga Cristina',3,'',7,1),(67,'2016-08-11 06:22:16.603980','92','Orsi Micaela',3,'',7,1),(68,'2016-08-11 06:22:16.637540','91','Salinas Francisca',3,'',7,1),(69,'2016-08-11 06:22:16.670656','90','Quiroga Esther',3,'',7,1),(70,'2016-08-11 06:22:16.704158','89','Parkinson Anatilde',3,'',7,1),(71,'2016-08-11 06:22:16.737965','88','Gusman Lucia',3,'',7,1),(72,'2016-08-11 06:22:16.771463','87','Luzzi Maria Herminia',3,'',7,1),(73,'2016-08-11 06:22:16.805047','86','Curbelo Fernanda',3,'',7,1),(74,'2016-08-11 06:22:16.838463','85','Flores Marta Ofelia',3,'',7,1),(75,'2016-08-11 06:22:16.871939','84','Dascanio Adriana',3,'',7,1),(76,'2016-08-11 06:22:16.905515','83','Pavan Vilma',3,'',7,1),(77,'2016-08-11 06:22:16.938948','82','Andreozzi Paula',3,'',7,1),(78,'2016-08-11 06:22:16.972411','81','Carbone Florencia',3,'',7,1),(79,'2016-08-11 06:22:17.006117','80','Pascuariello Carmen',3,'',7,1),(80,'2016-08-11 06:22:17.050304','79','Abastos Jesica',3,'',7,1),(81,'2016-08-11 06:22:17.084014','78','Buggiano Martin',3,'',7,1),(82,'2016-08-11 06:22:17.117612','77','Tatunczak Alejandra',3,'',7,1),(83,'2016-08-11 06:22:17.152759','76','Carrillo Mary',3,'',7,1),(84,'2016-08-11 06:22:17.197589','75','Guardiola Vanina',3,'',7,1),(85,'2016-08-11 06:22:17.242365','74','Cigorraga Malena',3,'',7,1),(86,'2016-08-11 06:22:17.286811','73','Recoliza Eduardo',3,'',7,1),(87,'2016-08-11 06:22:17.332561','72','Pavan Vilma',3,'',7,1),(88,'2016-08-11 06:22:17.375917','71','Andreozzi Paula',3,'',7,1),(89,'2016-08-11 06:22:17.420311','70','Carbone Florencia',3,'',7,1),(90,'2016-08-11 06:22:17.465314','69','Pascuariello Carmen',3,'',7,1),(91,'2016-08-11 06:22:17.509994','68','Abastos Jesica',3,'',7,1),(92,'2016-08-11 06:22:17.554625','67','Buggiano Martin',3,'',7,1),(93,'2016-08-11 06:22:17.599138','66','Tatunczak Alejandra',3,'',7,1),(94,'2016-08-11 06:22:17.643500','65','Carrillo Mary',3,'',7,1),(95,'2016-08-11 06:22:17.687997','64','Guardiola Vanina',3,'',7,1),(96,'2016-08-11 06:22:17.733474','63','Cigorraga Malena',3,'',7,1),(97,'2016-08-11 06:22:17.778078','62','Recoliza Eduardo',3,'',7,1),(98,'2016-08-11 06:22:17.822188','61','Pavan Vilma',3,'',7,1),(99,'2016-08-11 06:22:17.866537','60','Andreozzi Paula',3,'',7,1),(100,'2016-08-11 06:22:17.911373','59','Carbone Florencia',3,'',7,1),(101,'2016-08-11 06:22:17.955932','58','Pascuariello Carmen',3,'',7,1),(102,'2016-08-11 06:22:17.989514','57','Abastos Jesica',3,'',7,1),(103,'2016-08-11 06:22:18.022910','56','Buggiano Martin',3,'',7,1),(104,'2016-08-11 06:22:18.056330','55','Tatunczak Alejandra',3,'',7,1),(105,'2016-08-11 06:22:18.089840','54','Carrillo Mary',3,'',7,1),(106,'2016-08-11 06:22:18.123352','53','Guardiola Vanina',3,'',7,1),(107,'2016-08-11 06:22:18.157016','52','Cigorraga Malena',3,'',7,1),(108,'2016-08-11 06:22:18.190410','51','Recoliza Eduardo',3,'',7,1),(109,'2016-08-11 06:22:18.223885','50','Pavan Vilma',3,'',7,1),(110,'2016-08-11 06:22:18.257410','49','Andreozzi Paula',3,'',7,1),(111,'2016-08-11 06:22:18.290948','48','Carbone Florencia',3,'',7,1),(112,'2016-08-11 06:22:18.324410','47','Pascuariello Carmen',3,'',7,1),(113,'2016-08-11 06:22:18.357848','46','Abastos Jesica',3,'',7,1),(114,'2016-08-11 06:22:18.391383','45','Buggiano Martin',3,'',7,1),(115,'2016-08-11 06:22:18.424953','44','Tatunczak Alejandra',3,'',7,1),(116,'2016-08-11 06:22:18.458335','43','Carrillo Mary',3,'',7,1),(117,'2016-08-11 06:22:18.492062','42','Guardiola Vanina',3,'',7,1),(118,'2016-08-11 06:22:18.525635','41','Cigorraga Malena',3,'',7,1),(119,'2016-08-11 06:22:18.559095','40','Recoliza Eduardo',3,'',7,1),(120,'2016-08-11 06:22:18.592244','39','Pavan Vilma',3,'',7,1),(121,'2016-08-11 06:22:18.626124','38','Andreozzi Paula',3,'',7,1),(122,'2016-08-11 06:22:18.659516','37','Carbone Florencia',3,'',7,1),(123,'2016-08-11 06:22:29.481314','36','Pascuariello Carmen',3,'',7,1),(124,'2016-08-11 06:22:29.528257','35','Abastos Jesica',3,'',7,1),(125,'2016-08-11 06:22:29.561886','34','Buggiano Martin',3,'',7,1),(126,'2016-08-11 06:22:29.595129','33','Tatunczak Alejandra',3,'',7,1),(127,'2016-08-11 06:22:29.629737','32','Carrillo Mary',3,'',7,1),(128,'2016-08-11 06:22:29.662521','31','Guardiola Vanina',3,'',7,1),(129,'2016-08-11 06:22:29.695474','30','Cigorraga Malena',3,'',7,1),(130,'2016-08-11 06:22:29.729108','29','Recoliza Eduardo',3,'',7,1),(131,'2016-08-11 06:22:29.762909','28','Pavan Vilma',3,'',7,1),(132,'2016-08-11 06:22:29.795972','27','Andreozzi Paula',3,'',7,1),(133,'2016-08-11 06:22:29.829910','26','Carbone Florencia',3,'',7,1),(134,'2016-08-11 06:22:29.863340','25','Pascuariello Carmen',3,'',7,1),(135,'2016-08-11 06:22:29.896423','24','Abastos Jesica',3,'',7,1),(136,'2016-08-11 06:22:29.930210','23','Buggiano Martin',3,'',7,1),(137,'2016-08-11 06:22:29.974844','22','Tatunczak Alejandra',3,'',7,1),(138,'2016-08-11 06:22:30.009759','21','Carrillo Mary',3,'',7,1),(139,'2016-08-11 06:22:30.052708','20','Guardiola Vanina',3,'',7,1),(140,'2016-08-11 06:22:30.086466','19','Cigorraga Malena',3,'',7,1),(141,'2016-08-11 06:22:30.133064','18','Recoliza Eduardo',3,'',7,1),(142,'2016-08-11 06:22:30.199853','17','Recoliza Eduardo',3,'',7,1),(143,'2016-08-11 06:22:30.244423','16','Andreozzi Paula',3,'',7,1),(144,'2016-08-11 06:22:30.289110','15','Carbone Florencia',3,'',7,1),(145,'2016-08-11 06:22:30.333690','14','Pascuaariello Carmen',3,'',7,1),(146,'2016-08-11 06:22:30.378235','13','Abastos Jesica',3,'',7,1),(147,'2016-08-11 06:22:30.423074','12','Buggiano Martin',3,'',7,1),(148,'2016-08-11 06:22:30.467502','11','Carrillo Maria',3,'',7,1),(149,'2016-08-11 06:22:30.501077','6','Franco Gustavo Alberto',3,'',7,1),(150,'2016-08-11 06:22:30.534113','4','Tatunczak Alejandra',3,'',7,1),(151,'2016-08-11 06:22:30.567977','3','Guardiola Vanina',3,'',7,1),(152,'2016-08-11 06:22:30.601452','2','Cigorraga Malena',3,'',7,1),(153,'2016-08-11 06:22:30.634645','1','Recoliza Eduardo Alfredo',3,'',7,1);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'peluqueria','cliente'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-14 02:07:22.681372'),(2,'auth','0001_initial','2016-07-14 02:07:31.789649'),(3,'admin','0001_initial','2016-07-14 02:07:33.782200'),(4,'admin','0002_logentry_remove_auto_add','2016-07-14 02:07:33.939692'),(5,'contenttypes','0002_remove_content_type_name','2016-07-14 02:07:35.101930'),(6,'auth','0002_alter_permission_name_max_length','2016-07-14 02:07:35.239152'),(7,'auth','0003_alter_user_email_max_length','2016-07-14 02:07:35.374398'),(8,'auth','0004_alter_user_username_opts','2016-07-14 02:07:35.459617'),(9,'auth','0005_alter_user_last_login_null','2016-07-14 02:07:36.096117'),(10,'auth','0006_require_contenttypes_0002','2016-07-14 02:07:36.155803'),(11,'auth','0007_alter_validators_add_error_messages','2016-07-14 02:07:36.220831'),(12,'peluqueria','0001_initial','2016-07-14 02:07:36.528394'),(13,'peluqueria','0002_auto_20160709_0049','2016-07-14 02:07:36.705676'),(14,'peluqueria','0003_auto_20160709_0107','2016-07-14 02:07:36.829636'),(15,'peluqueria','0004_auto_20160709_0237','2016-07-14 02:07:36.964506'),(16,'peluqueria','0005_auto_20160709_0257','2016-07-14 02:07:37.211015'),(17,'peluqueria','0006_auto_20160709_0320','2016-07-14 02:07:37.253441'),(18,'peluqueria','0007_auto_20160709_0325','2016-07-14 02:07:37.302391'),(19,'peluqueria','0008_auto_20160709_0326','2016-07-14 02:07:37.435177'),(20,'peluqueria','0009_auto_20160711_0035','2016-07-14 02:07:37.547572'),(21,'sessions','0001_initial','2016-07-14 02:07:38.086258');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peluqueria_cliente`
--

DROP TABLE IF EXISTS `peluqueria_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peluqueria_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Apellido` varchar(200) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Cumpleaños` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `Teléfono` varchar(200) NOT NULL,
  `Tratamiento` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peluqueria_cliente`
--

LOCK TABLES `peluqueria_cliente` WRITE;
/*!40000 ALTER TABLE `peluqueria_cliente` DISABLE KEYS */;
INSERT INTO `peluqueria_cliente` VALUES (137,'Recoliza','Eduardo','2015-01-05','eduardo.recoliza@gmail.com','461999','5.3','2015-09-10'),(138,'Cigorraga','Malena','2015-06-06','','462824','Permanente','2015-10-16'),(139,'Guardiola','Vanina','2015-11-27','vannb28@hotmail.com','464298','8.42','2015-09-10'),(140,'Carrillo','Mary','2015-07-04','','462005','8','2016-06-29'),(141,'Tatunczak','Alejandra','2015-02-28','tatunc@yahoo.com.ar','11-6369-7678','9.1','2016-02-13'),(142,'Buggiano','Martin','2015-12-22','martin.buggiano@gmail.com','02257-15411328','Corte Maquina 2 - Tijera','2015-09-11'),(143,'Abastos','Jesica','2015-01-10','','02257-15645500','californianas 10','2015-09-12'),(144,'Pascuariello','Carmen','2015-03-22','cristina.pascuariello@yahoo.com','461784','9','2015-09-12'),(145,'Carbone','Florencia','2015-05-20','carboneflor@hotmail.com','011-1531492486','reflejos','2015-09-12'),(146,'Andreozzi','Paula','2015-09-22','paulaandreozzi@hotmail.com','011156-1172944','lavado y brushing','2015-09-12'),(147,'Pavan','Vilma','2015-08-16','','0111544001608/ 02257-462225','Tintura 66,45','2015-12-22'),(148,'Dascanio','Adriana','2016-09-26','adriandascanio@hotmail.com','462824','8-9,3-reflejos con peine','2016-08-05'),(149,'Flores','Marta Ofelia','2015-05-10','','462356','8','2015-09-15'),(150,'Curbelo','Fernanda','2015-05-23','','02257-15526680','6','2016-07-19'),(151,'Luzzi','Maria Herminia','2015-10-07','','468721','9 mechas y corte','2016-08-09'),(152,'Gusman','Lucia','2015-05-12','lucia gusman12@gmail.com','2257521371','shock de keratina','2015-09-17'),(153,'Parkinson','Anatilde','2015-03-22','','02257-464479','lavado y secado','2015-09-17'),(154,'Quiroga','Esther','2015-05-10','','468375','Corte','2015-09-19'),(155,'Salinas','Francisca','2015-04-25','marifransalinas@gmail.com','460789','Corte','2015-09-19'),(156,'Orsi','Micaela','2015-11-07','orsi.micaela@gmail.com','464413','shock de keratina','2015-09-19'),(157,'Zoloaga','Cristina','2015-10-01','','2257404024','8,1/7,1','2016-01-30'),(158,'Lopez','Alejandra','2015-09-02','fiambrerialalucila@hotmail.com','460049','6,3 y corte','2016-02-20'),(159,'Paternostro','Rosana','2015-11-25','rosanita73@hotmail.com','225715524031','6','2016-02-20'),(160,'Principi','Andrea','2015-01-30','','4610872','6.66','2015-10-01'),(161,'Netel','Lucila','2015-03-01','','2257520197','9','2015-12-22'),(162,'Quiroga','Lucila','2015-05-28','quirogalucila@outlook.com','465947','1','2015-10-03'),(163,'Principi','Mauricio','2015-09-17','','467167','corte','2015-10-03'),(164,'Beatriz','Casas (mama de Fernanda)','2015-04-24','brcasas@hotmail.com','464125','7.3','2015-10-03'),(165,'Netel','Rocio','2015-06-16','','2257531574','8.43','2015-10-03'),(166,'Oviedo','Perla','2015-01-11','perlaoviedo83@gmail.com','604519','9','2015-10-07'),(167,'Gallardo','Cintia','2015-08-29','cintia1gallardo@outlook.es','15630733','1','2015-10-07'),(168,'Vazquez','Gabriel','2015-03-08','gabodelavida@hotmail.com','464413','corte','2015-10-07'),(169,'Andriola','Juan','2015-01-01','juanga_1993@hotmail.com','2257-521299','corte 1 abajo y 4 arriba','2015-10-08'),(170,'Ledesma','Julieta','2015-02-23','julieta230279@gmail.com','011-15-37317031','Botox','2015-10-13'),(171,'Santana','Mor','2015-12-29','morvivabahia@hotmail.com','468101','baño de crema','2015-10-13'),(172,'Belgrano','Florencia','2015-10-14','','464286','corte y planchita','2015-10-13'),(173,'Valenzuela','Silvia','2015-03-11','','2257580881','11.11','2015-10-13'),(174,'Morano','Sandra','2015-08-01','','3858450374','Corte','2015-10-14'),(175,'Cannata','Carina','2015-02-11','ccannata11@hotmail.com','490419','Corte-','2015-11-28'),(176,'Irastorza','Marcela','2015-09-20','','2257666997','9','2016-06-17'),(177,'Camacho','Silvia','2016-05-20','','','6.45','2016-06-17'),(178,'Silvio','Stephanie','2015-10-22','solty_105@hotmail.com','2257520624','Shok de keratina','2015-10-17'),(179,'Oreglia','Ana','2015-10-14','anaoreglia@yahoo.com.ar','02257-15669501','7,3','2016-06-28'),(180,'Herves','Nora','2015-04-09','','2257500102','Corte','2015-10-17'),(181,'Aranda Duarte','Hernan','2015-03-30','','2257617102','Corte','2015-10-17'),(182,'Bandera','Jimena','2015-02-14','jimena.bandera@gmail.com','2257616600','Corte','2015-10-17'),(183,'Mariño','Josefa','2015-01-03','','1156176502','Botox','2015-10-21'),(184,'Acosta','Cristina','2015-07-15','','2257502419','7,mechas,corte','2015-10-21'),(185,'Giliberti','Gabriela','2015-02-06','gabrielagiliberti@gmail.com','B','Corte','2015-10-21'),(186,'Hereñu','Lola','2015-01-10','','2257631856','8,1  raices','2016-08-06'),(187,'Pierce','Julieta','2015-05-26','','1166786003','mechas altura 8','2015-10-27'),(188,'Fernandez','Analía','2015-06-01','fer_an1@hotmail.com','3181-5749','Corte','2015-10-30'),(189,'PEREZ','PATRICIA','2015-03-01','','011-1536135878','08/09','2015-11-03'),(190,'Davidis','Daniela','2015-05-17','daniela.davidis@gmail.com','462604','Color 6,4 y corte','2015-11-03'),(191,'Paternostro','Betina','2015-02-07','bettynas@hotmail.com','02257-15527839','7 y mechas','2015-11-05'),(192,'Cabrera','Veronica','2015-08-10','cabreraeva1973@gmail.com','466552','9','2015-11-06'),(193,'Dominguez','Hernan','2015-09-23','hernandominguezz@hotmail.com','11-15-6542-6353','corte de pelo','2015-10-29'),(194,'Gomez','Susana','2015-02-16','sgomez999.sg@gmail.com','11-15-36263707','6.14','2015-11-10'),(195,'Carcacci','Maria Andrea','2015-04-24','mac.carcacci@gmail.com','2255458593','5,15 de cajita loreal.Shok keratina invertido','2015-11-12'),(196,'Alvarez','Julieta','2015-03-08','2257-557315','02257-15-55-7315','Corte de puntas y Baño de crema','2015-11-18'),(197,'Gorla','Laura','2015-02-11','mlgorla@hotmail.com','2257669553','3','2016-06-29'),(198,'Rossi','Marisa','2015-09-05','','02227-15-464499','6,3 /7,3','2015-12-19'),(199,'Bollañes','Marta','2015-08-24','martanb24@gmail.com','1165078704','5,14/iluminacion 6,14','2015-11-26'),(200,'De la Cruz','Liliana','2015-10-14','lilicruz58@hotmail.com','2234060800','Corte','2015-11-26'),(201,'Pina','','2015-06-01','josefamariaantoniamazzitelli@yhaoo.com.ar','1161870242','9,3-mechas y corte','2016-02-13'),(202,'Bianchin','Lucia','2015-12-13','','465503','5 e iluminacion','2016-07-19'),(203,'Vañek','Lidia','2015-08-20','','467104','9 con agua de 30 y mechas','2015-12-09'),(204,'Maria Luisa','Goldefajn','2015-05-22','mlgoldenfajn07@hotmail.com','2246420390','Peinado','2015-12-19'),(205,'Scarpati','Ayelen','2015-12-26','ayelen.scarpati@hotmail.com','11-65118614','8-8,1','2015-12-22'),(206,'Sanchez Porto','Maria','2015-06-06','chiquitinbambu66@yahoo.com.ar','463533','Corte','2015-12-23'),(207,'Tenconi','Alicia','2015-12-06','atenconi@hotmail.com.ar','467166','9','2015-12-23'),(208,'Fernandez','Graciela','2015-12-17','fergraciela@yaaolo.com.ar','2214378076','5 con iluminacion','2015-12-26'),(209,'Garrote ','Perla','2015-10-04','perlagarrote@hotmail.com','11-15-4146-2909','5.3','2016-07-23'),(210,'Tena','Maria','2015-03-20','','468655','4.6','2016-02-09'),(211,'Martin','Emilse','2015-06-15','emartin@buenosaires.gob.ar','1144375329','reflejos corte','2016-02-09'),(212,'Duarte','Ivana','2016-07-23','iva_23_7@hotmail.com','1161951029','iluminacion altura 7','2016-01-04'),(213,'Mourelle','Marcela','2016-11-12','marce_mou@hotmail.com','1142384989','4 e iluminacion','2015-01-05'),(214,'Huls','Irma','2016-02-13','irmahuls@gmail.com','0111560157494','8','2015-01-07'),(215,'Rossi','Adriana','2016-03-03','adriancristinarossi@gmail.com','462180','*\'8','2016-01-12'),(216,'RIVEIRO','ESTER','2016-02-25','riveiroester@hotmail.com','1165643820','7','2016-03-02'),(217,'Giorno','Elvira','2016-01-03','','1132428675','9,33 pizca 8,33','2016-01-19'),(218,'Sangres','Carina','2016-01-14','KARENA.CA@HOTMAIL.COM','1159037085','5.3','2016-01-19'),(219,'Fontana','Ana Maria','2016-06-18','colonialho@hotmail.com','1161745557','7    7,3','2016-01-20'),(220,'Seijas','Jessica','2016-03-17','jessica.seijas@yahoo.com.ar','1139731825','6','2016-01-25'),(221,'Nogueriras','Silvia','2016-11-28','silvianogueira18@hotmail.com','1160122340','8  25%7','2016-01-27'),(222,'Tassa','Rosa','2016-09-17','','467471','8','2016-02-02'),(223,'Valenti','Gladys','2016-09-17','','11-15-5992-2175','8 y un poco de 7','2016-02-03'),(224,'Tassa','Nora','2016-11-14','institutoragazza@hotmail.com','02257-15617534','7.1 y un poco de 6.1 (con fijador de color)','2016-08-06'),(225,'Buitron','Nora','2016-03-21','norairene@fibertel.com.ar','1131966372','9.3','2016-02-11'),(226,'WIMAN','Gloria','2016-04-19','','02257-15-664022','7 y mechas','2016-02-17'),(227,'Pavone','Monica','2016-11-02','monicapavone@live.com.ar','1131785723','7','2016-02-19'),(228,'Fuensalida','Victoria','2016-09-29','lolaauroratom@gmail.com','1160487285','9','2016-02-23'),(229,'JAUNSARAS','VANESA','2016-10-20','casa_tri@hotmail.com.ar','02257-462606','5.14','2016-07-01'),(230,'Rodriguez','Ana','2016-09-10','','1136465949','7.14','2016-03-02'),(231,'Pereyra','yenny','2016-10-05','yennypereyra1973@gmail.com','1159701914','10 n','2016-02-03'),(232,'Bompino','Susana','2016-03-11','susyalvarez@hotmail.com.ar','02257-462524','10 y 9,3','2016-03-03'),(233,'Diaz','Graciela','2016-07-30','gracydiaz@hotmail.com','011-15-3692-5688','5,3','2016-03-08'),(234,'Sanchez','Rafaela','2016-05-26','','462379','\"4.6','2016-08-02'),(235,'Fort','Marcela','2016-02-12','mf.marcelafort@gmail.com','(2257)554917','4','2016-05-25'),(236,'Rodriguez','Carmen','2016-05-28','','','8','2016-03-30'),(237,'Oviedo','Sandra','2016-05-06','sandrapoviedo@gmail.com','','3/4 7.3 y 1/4 8','2016-07-22'),(238,'Sturba','Susana','2016-07-15','susanasturba@yahoo.com.ar','4209-0481','8 y 8.1','2016-03-17'),(239,'Coronel','Juana María','2016-05-09','','461567','9 y 5 gr de 10','2016-03-17'),(240,'Tornello ','Ana','2016-06-04','arnaldoyana@hotmail.com','(2257)15409215','6.1','2016-07-21'),(241,'Bianchin','Lucia','2016-06-04','','','7.1 e iluminación','2016-04-05'),(242,'Nexhip','Elena','2016-04-03','','02257-464493','8 y corte','2016-06-29'),(243,'Giachero ','Adriana','2016-04-03','','','9,1 - Mechas 10,01 y Corte','2016-07-02'),(244,'Ramirez ','Magaly','2016-11-22','','011-15-6295-5424','6,1','2016-07-15'),(245,'Forcelledo','Maria Elena','2016-02-04','','011-15-6295-5424','5','2016-06-01'),(246,'Venturini','Margarita','2016-05-31','','491202','8,32 y corte','2016-07-20'),(247,'Baiardi Alvarez','Marta','2016-09-09','martabaiardi@hotmail.com','011-1557990890','3/4 de 8 y 1/4 de 8,33','2016-07-23'),(248,'Sanchez','Gabriela','2016-05-11','costadinardo@gmail.com','2257524662','Precoloracion 6','2016-07-27'),(249,'Luparello','Claudia','2016-11-03','claudia_luparello@hotmail.com','460750','6','2016-07-28'),(250,'Anastasi','Vanina','2016-09-07','','460902-15532081','mechas manteca','2016-08-02'),(251,'Salinas','Francisca','2016-04-25','','460789','1','2016-08-09');
/*!40000 ALTER TABLE `peluqueria_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-13  3:12:38
