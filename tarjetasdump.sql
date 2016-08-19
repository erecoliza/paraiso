USE `erecoliza$paraiso`;

--
-- Table structure for table `peluqueria_tarjeta`
--

DROP TABLE IF EXISTS `peluqueria_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peluqueria_tarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_operacion` date NOT NULL,
  `importe` decimal(12,2) NOT NULL,
  `lote` int(11) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `tipo_tarjeta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `peluqueria_tarjeta_b42b246c` (`tipo_tarjeta_id`),
  CONSTRAINT `peluqueria_tipo_tarjeta_id_b76f1250_fk_peluqueria_tipotarjeta_id` FOREIGN KEY (`tipo_tarjeta_id`) REFERENCES `peluqueria_tipotarjeta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peluqueria_tarjeta`
--

LOCK TABLES `peluqueria_tarjeta` WRITE;
/*!40000 ALTER TABLE `peluqueria_tarjeta` DISABLE KEYS */;
INSERT INTO `peluqueria_tarjeta` VALUES (1,'2016-05-05',10.00,999,'2016-05-10',1),(2,'2016-05-07',360.00,1,'2016-05-11',1),(3,'2016-05-10',460.00,2,'2016-05-13',1),(4,'2016-05-21',180.00,3,'2016-05-26',1),(5,'2016-06-03',300.00,4,'2016-06-08',1),(6,'2016-06-04',180.00,5,'2016-06-08',1),(7,'2016-06-14',480.00,6,'2016-06-21',1),(8,'2016-06-15',430.00,7,'2016-06-22',1),(9,'2016-06-16',430.00,8,'2016-07-18',2),(10,'2016-06-29',430.00,9,'2016-07-04',1),(11,'2016-06-29',180.00,9,'2016-07-04',1),(12,'2016-07-02',120.00,10,'2016-07-06',1),(13,'2016-07-02',560.00,10,'2016-07-06',1),(14,'2016-07-09',240.00,11,'2016-07-13',1),(15,'2016-07-21',430.00,12,'2016-07-26',1),(16,'2016-07-22',430.00,13,'2016-07-27',1),(17,'2016-07-23',430.00,14,'2016-07-27',1),(18,'2016-07-23',275.00,14,NULL,2),(19,'2016-08-09',480.00,15,'2016-08-12',1),(20,'2016-08-17',180.00,16,NULL,1);
/*!40000 ALTER TABLE `peluqueria_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peluqueria_tipotarjeta`
--

DROP TABLE IF EXISTS `peluqueria_tipotarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peluqueria_tipotarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_tarjeta` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peluqueria_tipotarjeta`
--

LOCK TABLES `peluqueria_tipotarjeta` WRITE;
/*!40000 ALTER TABLE `peluqueria_tipotarjeta` DISABLE KEYS */;
INSERT INTO `peluqueria_tipotarjeta` VALUES (1,'VISA ELECTRÓN (Débito)'),(2,'VISA (Crédito)'),(3,'MAESTRO (Débito)'),(4,'MASTERCARD (Crédito)'),(5,'AMERICAN EXPRESS (Crédito)');
/*!40000 ALTER TABLE `peluqueria_tipotarjeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-18  1:06:28
