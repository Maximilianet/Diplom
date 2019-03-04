-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dbschka
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `question_response`
--

DROP TABLE IF EXISTS `question_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) NOT NULL,
  `quiz_result_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_93loomdpsx4cgiauav438hefv` (`question_id`),
  KEY `FK_k1higv78hdwqmpa78bq5qmkts` (`quiz_result_id`),
  CONSTRAINT `FK_93loomdpsx4cgiauav438hefv` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `FK_k1higv78hdwqmpa78bq5qmkts` FOREIGN KEY (`quiz_result_id`) REFERENCES `quiz_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_response`
--

LOCK TABLES `question_response` WRITE;
/*!40000 ALTER TABLE `question_response` DISABLE KEYS */;
INSERT INTO `question_response` VALUES (1,80,1),(2,69,1),(3,55,1),(4,51,1),(5,52,1),(6,59,1),(7,77,2),(8,63,2),(9,59,2),(10,53,2),(11,58,2),(12,52,2),(13,79,3),(14,64,3),(15,56,3),(16,54,3),(17,55,3),(18,59,3),(19,21,4),(20,13,4),(21,10,4),(22,8,4),(23,5,4),(24,9,4),(25,80,7),(26,66,7),(27,51,7),(28,58,7),(29,57,7),(30,60,7),(31,26,8),(32,17,8),(33,9,8),(34,8,8),(35,6,8),(36,2,8),(37,11,8),(38,23,8),(39,19,8),(40,10,8),(41,3,8),(42,7,8),(43,5,8),(44,27,9),(45,11,9),(46,6,9),(47,9,9),(48,17,9),(49,5,9),(50,14,9),(51,10,9),(52,19,9),(53,23,9),(54,34,9),(55,29,9),(56,16,9),(57,8,9),(58,2,9),(59,26,10),(60,40,10),(61,50,10),(62,46,10),(63,38,10),(64,48,10),(65,26,11),(66,39,11),(67,22,11),(68,19,11),(69,2,11),(70,6,11),(71,7,11),(72,17,11),(73,28,11),(74,11,11),(75,10,11),(76,3,11),(77,5,11),(78,8,11),(79,27,12),(80,13,12),(81,2,12),(82,17,12),(83,7,12),(84,5,12),(85,10,12),(86,9,12),(87,3,12),(88,21,13),(89,13,13),(90,5,13),(91,2,13),(92,20,13),(93,26,13),(94,40,13),(95,44,13),(96,47,13),(97,31,13),(98,30,13),(99,36,13),(100,24,13),(101,37,13),(102,22,13),(103,72,14),(104,63,14),(105,56,14),(106,55,14),(107,52,14),(108,59,14),(109,171,15),(110,201,15),(111,179,15),(112,163,15),(113,154,15),(114,153,15),(115,155,15),(116,151,15),(117,156,15),(118,26,16),(119,11,16),(120,3,16),(121,9,16),(122,6,16),(123,5,16),(124,16,16),(125,10,16),(126,7,16),(127,30,17),(128,31,17),(129,26,17),(130,38,17),(131,50,17),(132,42,17),(133,24,18),(134,16,18),(135,10,18),(136,18,18),(137,5,18),(138,15,18),(139,27,19),(140,13,19),(141,10,19),(142,15,19),(143,3,19),(144,8,19),(145,6,19),(146,16,19),(147,7,19),(148,17,19),(149,21,19),(150,14,19);
/*!40000 ALTER TABLE `question_response` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 23:07:20
