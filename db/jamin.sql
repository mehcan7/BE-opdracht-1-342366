-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: localhost    Database: jamin
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `allergeen`
--

DROP TABLE IF EXISTS `allergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Omschrijving` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergeen`
--

LOCK TABLES `allergeen` WRITE;
/*!40000 ALTER TABLE `allergeen` DISABLE KEYS */;
INSERT INTO `allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-09-11 11:44:50.122823','2026-09-11 11:44:50.122824'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-09-11 11:44:50.122851','2026-09-11 11:44:50.122852'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-09-11 11:44:50.122860','2026-09-11 11:44:50.122861'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-09-11 11:44:50.122863','2026-09-11 11:44:50.122863'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-09-11 11:44:50.122865','2026-09-11 11:44:50.122866');
/*!40000 ALTER TABLE `allergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactPersoon` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeverancierNummer` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mobiel` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Leverancier_LeverancierNummer` (`LeverancierNummer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverancier`
--

LOCK TABLES `leverancier` WRITE;
/*!40000 ALTER TABLE `leverancier` DISABLE KEYS */;
INSERT INTO `leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',_binary '',NULL,'2026-09-11 11:44:50.134852','2026-09-11 11:44:50.134853'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',_binary '',NULL,'2026-09-11 11:44:50.134880','2026-09-11 11:44:50.134880'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',_binary '',NULL,'2026-09-11 11:44:50.134890','2026-09-11 11:44:50.134890'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',_binary '',NULL,'2026-09-11 11:44:50.134894','2026-09-11 11:44:50.134895'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',_binary '',NULL,'2026-09-11 11:44:50.134898','2026-09-11 11:44:50.134898');
/*!40000 ALTER TABLE `leverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazijn` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `VerpakkingsEenheidInKilogram` decimal(6,3) NOT NULL,
  `AantalAanwezig` int unsigned DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazijn`
--

LOCK TABLES `magazijn` WRITE;
/*!40000 ALTER TABLE `magazijn` DISABLE KEYS */;
INSERT INTO `magazijn` VALUES (1,1,5.000,453,_binary '',NULL,'2026-09-11 11:44:50.147280','2026-09-11 11:44:50.147282'),(2,2,2.500,400,_binary '',NULL,'2026-09-11 11:44:50.147314','2026-09-11 11:44:50.147314'),(3,3,5.000,1,_binary '',NULL,'2026-09-11 11:44:50.147323','2026-09-11 11:44:50.147323'),(4,4,1.000,800,_binary '',NULL,'2026-09-11 11:44:50.147328','2026-09-11 11:44:50.147328'),(5,5,3.000,234,_binary '',NULL,'2026-09-11 11:44:50.147332','2026-09-11 11:44:50.147332'),(6,6,2.000,345,_binary '',NULL,'2026-09-11 11:44:50.147335','2026-09-11 11:44:50.147335'),(7,7,1.000,795,_binary '',NULL,'2026-09-11 11:44:50.147338','2026-09-11 11:44:50.147339'),(8,8,10.000,233,_binary '',NULL,'2026-09-11 11:44:50.147342','2026-09-11 11:44:50.147342'),(9,9,2.500,123,_binary '',NULL,'2026-09-11 11:44:50.147346','2026-09-11 11:44:50.147346'),(10,10,3.000,NULL,_binary '',NULL,'2026-09-11 11:44:50.147349','2026-09-11 11:44:50.147349'),(11,11,2.000,367,_binary '',NULL,'2026-09-11 11:44:50.147352','2026-09-11 11:44:50.147352'),(12,12,1.000,467,_binary '',NULL,'2026-09-11 11:44:50.147356','2026-09-11 11:44:50.147356'),(13,13,5.000,20,_binary '',NULL,'2026-09-11 11:44:50.147359','2026-09-11 11:44:50.147359');
/*!40000 ALTER TABLE `magazijn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Barcode` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Product_Barcode` (`Barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-09-11 11:44:50.111653','2026-09-11 11:44:50.111656'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-09-11 11:44:50.111727','2026-09-11 11:44:50.111727'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-09-11 11:44:50.111742','2026-09-11 11:44:50.111742'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-09-11 11:44:50.111748','2026-09-11 11:44:50.111748'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-09-11 11:44:50.111752','2026-09-11 11:44:50.111752'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-09-11 11:44:50.111757','2026-09-11 11:44:50.111757'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-09-11 11:44:50.111762','2026-09-11 11:44:50.111762'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-09-11 11:44:50.111766','2026-09-11 11:44:50.111767'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-09-11 11:44:50.111776','2026-09-11 11:44:50.111776'),(10,'Winegums','8719587327527',_binary '',NULL,'2026-09-11 11:44:50.111780','2026-09-11 11:44:50.111780'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-09-11 11:44:50.111784','2026-09-11 11:44:50.111784'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-09-11 11:44:50.111788','2026-09-11 11:44:50.111788'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-09-11 11:44:50.111792','2026-09-11 11:44:50.111792');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productperallergeen`
--

DROP TABLE IF EXISTS `productperallergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperallergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `AllergeenId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_ProductPerAllergeen_ProductId_AllergeenId` (`ProductId`,`AllergeenId`),
  KEY `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` (`AllergeenId`),
  CONSTRAINT `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` FOREIGN KEY (`AllergeenId`) REFERENCES `allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productperallergeen`
--

LOCK TABLES `productperallergeen` WRITE;
/*!40000 ALTER TABLE `productperallergeen` DISABLE KEYS */;
INSERT INTO `productperallergeen` VALUES (1,1,2,_binary '',NULL,'2026-09-11 11:44:50.160499','2026-09-11 11:44:50.160501'),(2,1,1,_binary '',NULL,'2026-09-11 11:44:50.160548','2026-09-11 11:44:50.160548'),(3,1,3,_binary '',NULL,'2026-09-11 11:44:50.160559','2026-09-11 11:44:50.160560'),(4,3,4,_binary '',NULL,'2026-09-11 11:44:50.160565','2026-09-11 11:44:50.160565'),(5,6,5,_binary '',NULL,'2026-09-11 11:44:50.160571','2026-09-11 11:44:50.160571'),(6,9,2,_binary '',NULL,'2026-09-11 11:44:50.160576','2026-09-11 11:44:50.160577'),(7,9,5,_binary '',NULL,'2026-09-11 11:44:50.160582','2026-09-11 11:44:50.160582'),(8,10,2,_binary '',NULL,'2026-09-11 11:44:50.160587','2026-09-11 11:44:50.160588'),(9,12,4,_binary '',NULL,'2026-09-11 11:44:50.160593','2026-09-11 11:44:50.160593'),(10,13,1,_binary '',NULL,'2026-09-11 11:44:50.160598','2026-09-11 11:44:50.160598'),(11,13,4,_binary '',NULL,'2026-09-11 11:44:50.160603','2026-09-11 11:44:50.160604'),(12,13,5,_binary '',NULL,'2026-09-11 11:44:50.160609','2026-09-11 11:44:50.160609');
/*!40000 ALTER TABLE `productperallergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productperleverancier`
--

DROP TABLE IF EXISTS `productperleverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperleverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `LeverancierId` int unsigned NOT NULL,
  `ProductId` int unsigned NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int unsigned NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productperleverancier`
--

LOCK TABLES `productperleverancier` WRITE;
/*!40000 ALTER TABLE `productperleverancier` DISABLE KEYS */;
INSERT INTO `productperleverancier` VALUES (1,1,1,'2024-10-09',23,'2024-10-16',_binary '',NULL,'2026-09-11 11:44:50.178480','2026-09-11 11:44:50.178482'),(2,1,1,'2024-10-18',21,'2024-10-25',_binary '',NULL,'2026-09-11 11:44:50.178528','2026-09-11 11:44:50.178529'),(3,1,2,'2024-10-09',12,'2024-10-16',_binary '',NULL,'2026-09-11 11:44:50.178544','2026-09-11 11:44:50.178544'),(4,1,3,'2024-10-10',11,'2024-10-17',_binary '',NULL,'2026-09-11 11:44:50.178551','2026-09-11 11:44:50.178551'),(5,2,4,'2024-10-14',16,'2024-10-21',_binary '',NULL,'2026-09-11 11:44:50.178556','2026-09-11 11:44:50.178557'),(6,2,4,'2024-10-21',23,'2024-10-28',_binary '',NULL,'2026-09-11 11:44:50.178562','2026-09-11 11:44:50.178562'),(7,2,5,'2024-10-14',45,'2024-10-21',_binary '',NULL,'2026-09-11 11:44:50.178567','2026-09-11 11:44:50.178568'),(8,2,6,'2024-10-14',30,'2024-10-21',_binary '',NULL,'2026-09-11 11:44:50.178573','2026-09-11 11:44:50.178573'),(9,3,7,'2024-10-12',12,'2024-10-19',_binary '',NULL,'2026-09-11 11:44:50.178579','2026-09-11 11:44:50.178579'),(10,3,7,'2024-10-19',23,'2024-10-26',_binary '',NULL,'2026-09-11 11:44:50.178584','2026-09-11 11:44:50.178584'),(11,3,8,'2024-10-10',12,'2024-10-17',_binary '',NULL,'2026-09-11 11:44:50.178590','2026-09-11 11:44:50.178590'),(12,3,9,'2024-10-11',1,'2024-10-18',_binary '',NULL,'2026-09-11 11:44:50.178595','2026-09-11 11:44:50.178596'),(13,4,10,'2024-10-16',24,'2024-10-30',_binary '',NULL,'2026-09-11 11:44:50.178601','2026-09-11 11:44:50.178601'),(14,5,11,'2024-10-10',47,'2024-10-17',_binary '',NULL,'2026-09-11 11:44:50.178606','2026-09-11 11:44:50.178606'),(15,5,11,'2024-10-19',60,'2024-10-26',_binary '',NULL,'2026-09-11 11:44:50.178612','2026-09-11 11:44:50.178612'),(16,5,12,'2024-10-11',45,NULL,_binary '',NULL,'2026-09-11 11:44:50.178618','2026-09-11 11:44:50.178618'),(17,5,13,'2024-10-12',23,NULL,_binary '',NULL,'2026-09-11 11:44:50.178623','2026-09-11 11:44:50.178623');
/*!40000 ALTER TABLE `productperleverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('5CYMpfYuSymaidBHFjs9fDDI4tJ2wJoaIuVSTHEa',2,'127.0.0.1','curl/8.19.0','eyJfdG9rZW4iOiJzWUdPY3JIbkEzTktPMW9PeVlXakhIUHpodzA4WnZnQkVPaW5WaDlUIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwXC9tYWdhemlqblwvMTBcL2xldmVyaW5nIiwicm91dGUiOiJtYWdhemlqbi5sZXZlcmluZyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyfQ==',1789120469),('s3OFwXgTDnnaHEZUqMHM5haRStg5bhWLkaUBsc25',1,'127.0.0.1','curl/8.19.0','eyJfdG9rZW4iOiJuTjF2OVF0UHZabjRaVm9PcEc3bEF4ZUV5bGZkcnY5RHcydTlHeVRTIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwXC9tYWdhemlqblwvMVwvbGV2ZXJpbmciLCJyb3V0ZSI6Im1hZ2F6aWpuLmxldmVyaW5nIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInVybCI6eyJpbnRlbmRlZCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwXC9tYWdhemlqblwvMVwvbGV2ZXJpbmcifX0=',1789120455);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'TestGebruiker','test2@jamin.nl',NULL,'$2y$12$7dW/vq1rI2SsjdXIc837/eq5/lO3zEwITlZabb6Wk29mNjLi.o8.u',NULL,'2026-09-11 07:54:28','2026-09-11 07:54:28');
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

-- Dump completed on 2026-09-11 11:56:06
