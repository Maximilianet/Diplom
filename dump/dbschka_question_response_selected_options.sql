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
-- Table structure for table `question_response_selected_options`
--

DROP TABLE IF EXISTS `question_response_selected_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_response_selected_options` (
  `question_response_id` bigint(20) NOT NULL,
  `selected_option_id` bigint(20) NOT NULL,
  PRIMARY KEY (`question_response_id`,`selected_option_id`),
  KEY `FK_tg95py6nqff1cvjc9hck0tfjc` (`selected_option_id`),
  CONSTRAINT `FK_nwapgdlskepd0afvpvwxhnot2` FOREIGN KEY (`question_response_id`) REFERENCES `question_response` (`id`),
  CONSTRAINT `FK_tg95py6nqff1cvjc9hck0tfjc` FOREIGN KEY (`selected_option_id`) REFERENCES `option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_response_selected_options`
--

LOCK TABLES `question_response_selected_options` WRITE;
/*!40000 ALTER TABLE `question_response_selected_options` DISABLE KEYS */;
INSERT INTO `question_response_selected_options` VALUES (36,5),(81,5),(91,5),(58,6),(69,7),(41,9),(87,9),(120,9),(143,9),(76,12),(23,17),(43,17),(84,17),(90,17),(49,18),(123,18),(137,18),(77,20),(35,21),(46,21),(122,21),(70,22),(145,23),(42,25),(83,25),(126,25),(71,26),(147,26),(22,29),(34,29),(57,29),(144,30),(78,32),(24,33),(33,33),(86,33),(121,34),(47,35),(40,37),(85,37),(125,37),(21,38),(51,38),(125,38),(135,38),(141,38),(75,40),(37,41),(45,42),(119,42),(74,43),(80,49),(89,49),(140,49),(20,52),(50,53),(150,54),(138,58),(142,59),(124,61),(134,61),(56,62),(146,62),(32,65),(48,65),(82,65),(72,66),(148,66),(136,70),(39,73),(52,74),(68,76),(92,77),(88,81),(149,82),(102,86),(67,88),(38,89),(53,89),(133,93),(100,94),(31,101),(59,101),(65,101),(93,101),(129,101),(118,103),(44,105),(79,105),(139,105),(73,111),(55,114),(98,117),(127,117),(97,121),(128,121),(54,133),(99,142),(101,146),(63,149),(130,149),(66,153),(60,157),(94,157),(132,165),(95,173),(62,181),(96,185),(64,189),(61,197),(131,197),(4,201),(4,202),(27,202),(5,205),(12,205),(5,208),(107,208),(10,209),(16,213),(3,217),(17,217),(3,218),(106,220),(15,221),(105,223),(29,226),(11,229),(28,230),(6,233),(18,233),(6,234),(9,235),(108,236),(30,238),(8,250),(8,251),(104,252),(14,253),(26,262),(2,273),(2,274),(103,288),(7,306),(7,307),(13,313),(1,317),(1,318),(25,318),(116,604),(114,612),(113,616),(115,620),(117,624),(112,651),(109,681),(111,714);
/*!40000 ALTER TABLE `question_response_selected_options` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 23:07:21
