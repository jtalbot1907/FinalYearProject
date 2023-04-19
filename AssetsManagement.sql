CREATE DATABASE  IF NOT EXISTS `assetmanagement_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `assetmanagement_db`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: assetmanagement_db
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `assetcategory`
--

DROP TABLE IF EXISTS `assetcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assetcategory` (
  `assetCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `assetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`assetCategoryId`),
  KEY `assetId` (`assetId`),
  CONSTRAINT `assetCategory_ibfk_1` FOREIGN KEY (`assetId`) REFERENCES `assets` (`assetId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetcategory`
--

LOCK TABLES `assetcategory` WRITE;
/*!40000 ALTER TABLE `assetcategory` DISABLE KEYS */;
INSERT INTO `assetcategory` VALUES (1,'Video Equipment',1),(2,'Audio Equipment',2),(3,'Lighting Equipment',3),(4,'Streaming Equipment',4),(5,'Others',5);
/*!40000 ALTER TABLE `assetcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assets` (
  `assetId` int(11) NOT NULL AUTO_INCREMENT,
  `assetName` varchar(50) NOT NULL,
  `assetDescription` varchar(1000) NOT NULL,
  `assetSerialNumber` varchar(100) NOT NULL,
  `assetRFIDTagNumber` varchar(1000) NOT NULL,
  `assetDefaultValue` varchar(45) NOT NULL,
  `assetDate` varchar(45) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `assetStatus` varchar(45) DEFAULT 'Never Moved',
  PRIMARY KEY (`assetId`),
  KEY `userId` (`userId`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'SONY CAMERA','sony camera with tele-lense zonn','789045','247 , 64 , 91 , 51','800000','3/28/2023 12:45:57 PM',1,'Checked Out'),(2,'SHURE MICROPHONE','sm-58','08453240-9485','51 , 213 , 246 , 1','25000','3/28/2023 12:48:22 PM',1,'Checked Out'),(3,'LIGHT-PANEL','day light led panel 500w in filght-case','803745','167 , 96 , 90 , 51','6500','3/28/2023 12:51:26 PM',1,'Checked Out'),(4,'TVU UNIT','tvu steraming unit with 6 4g-sim card unit transmiter.','0843576h3498','81 , 236 , 95 , 3','180000','3/28/2023 12:56:13 PM',1,'Never Moved'),(5,'CABLE TESTER','sdi cable tester','4259870b','122 , 65 , 117 , 89','700','3/30/2023 11:29:45 PM',3,'Never Moved');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('Audio Equipment'),('Battery and Charger Equipment'),('Cable and Connectors'),('Drones and Equipment'),('Lighting Equipment'),('Mixer and Editing Equipment'),('Others'),('Stand and Equipment'),('Streaming Equipment'),('Video Equipment');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL,
  `customerSurname` varchar(50) NOT NULL,
  `customerNationalID` varchar(50) NOT NULL,
  `customerPhoneNumber` varchar(50) NOT NULL,
  `customerDetails` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`),
  KEY `FK_userId_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','SMITH','S25101990123678','53048756','MBC Staff working as cameraman, living at Port Louis. Staff since 2005.',1),(2,'Quincy','WADLOW','0000','0000','####',1),(3,'John','PRESTON','0000','0000','####',1),(4,'Robert','PARKER','0000','0000','####',1),(5,'Brian','ADAMS','A872345-234087','597631095','jdwdhdhhjjhfjhcfjbhcfejjkdkkhsjjwhgoiuowwuyeirutwowoiwyrtyrt',3);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs` (
  `dateTime` varchar(50) NOT NULL,
  `assetName` varchar(50) NOT NULL,
  `RFID` varchar(50) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `assetStatus` varchar(50) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  PRIMARY KEY (`dateTime`),
  KEY `assetId_idx` (`assetName`),
  KEY `userId_idx` (`RFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('4/1/2023 10:59:19 PM','SHURE MICROPHONE','51 , 213 , 246 , 1\r','John SMITH','jtalbot','Check Out','qerjphqa'),('4/1/2023 10:59:20 PM','LIGHT-PANEL','167 , 96 , 90 , 51\r','John SMITH','jtalbot','Check Out',''),('4/1/2023 11:00:42 PM','TVU UNIT','81 , 236 , 95 , 3\r','Robert PARKER','jtalbot','Check Out',''),('4/1/2023 11:00:44 PM','LIGHT-PANEL','167 , 96 , 90 , 51\r','Robert PARKER','jtalbot','Check Out',''),('4/1/2023 11:00:45 PM','SONY CAMERA','247 , 64 , 91 , 51\r','Robert PARKER','jtalbot','Check Out',''),('4/1/2023 11:00:46 PM','SHURE MICROPHONE','51 , 213 , 246 , 1\r','Robert PARKER','jtalbot','Check Out',''),('4/1/2023 11:00:59 PM','SHURE MICROPHONE','51 , 213 , 246 , 1\r','Robert PARKER','jtalbot','Check Out','TEST remaks'),('4/1/2023 11:01:17 PM','LIGHT-PANEL','167 , 96 , 90 , 51\r','John SMITH','jtalbot','Check Out',''),('4/1/2023 11:01:18 PM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Check Out',';kpriuhepoi'),('4/1/2023 11:01:19 PM','TVU UNIT','81 , 236 , 95 , 3\r','John SMITH','jtalbot','Check Out',''),('4/1/2023 11:01:21 PM','SHURE MICROPHONE','51 , 213 , 246 , 1\r','John SMITH','jtalbot','Check Out','wlkerhgfoqe'),('4/1/2023 11:01:22 PM','LIGHT-PANEL','167 , 96 , 90 , 51\r','John SMITH','jtalbot','Check Out',''),('4/1/2023 11:18:26 PM','LIGHT-PANEL','167 , 96 , 90 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/1/2023 11:18:29 PM','SHURE MICROPHONE','51 , 213 , 246 , 1\r','Quincy WADLOW','jtalbot','Check Out',''),('4/1/2023 11:18:31 PM','TVU UNIT','81 , 236 , 95 , 3\r','Quincy WADLOW','jtalbot','Check Out',''),('4/1/2023 11:18:33 PM','SONY CAMERA','247 , 64 , 91 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/2/2023 1:01:12 AM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Check In',''),('4/2/2023 1:02:12 AM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Check Out',''),('4/2/2023 1:11:45 AM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Checked In',''),('4/2/2023 1:13:47 AM','SONY CAMERA','247 , 64 , 91 , 51\r','Brian ADAMS','jtalbot','Checked Out',''),('4/2/2023 12:18:33 AM','LIGHT-PANEL','167 , 96 , 90 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/2/2023 12:18:36 AM','SONY CAMERA','247 , 64 , 91 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/2/2023 12:30:14 AM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Check In','This is a CheckIn test'),('4/2/2023 12:30:15 AM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Check In',''),('4/2/2023 12:30:16 AM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Check In',''),('4/2/2023 12:44:36 AM','SONY CAMERA','247 , 64 , 91 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/2/2023 12:44:38 AM','SONY CAMERA','247 , 64 , 91 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/2/2023 12:44:39 AM','SONY CAMERA','247 , 64 , 91 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/2/2023 12:57:46 AM','SONY CAMERA','247 , 64 , 91 , 51\r','Quincy WADLOW','jtalbot','Check Out',''),('4/2/2023 12:58:40 AM','SONY CAMERA','247 , 64 , 91 , 51\r','John SMITH','jtalbot','Check Out',''),('4/2/2023 4:33:09 PM','SONY CAMERA','247 , 64 , 91 , 51\r','Quincy WADLOW','jtalbot','Checked Out',''),('4/2/2023 4:33:12 PM','LIGHT-PANEL','167 , 96 , 90 , 51\r','Quincy WADLOW','jtalbot','Checked Out',''),('4/2/2023 4:33:14 PM','SHURE MICROPHONE','51 , 213 , 246 , 1\r','Quincy WADLOW','jtalbot','Checked Out','');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `message_Id` int(11) NOT NULL AUTO_INCREMENT,
  `message_Time` timestamp NULL DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `receiverId` int(11) DEFAULT NULL,
  `assetId` int(11) DEFAULT NULL,
  `messagestatus` varchar(10) DEFAULT 'unread',
  PRIMARY KEY (`message_Id`),
  KEY `FK_receiverId_idx` (`receiverId`),
  KEY `FK_bookId_idx` (`assetId`),
  CONSTRAINT `FK_bookId` FOREIGN KEY (`assetId`) REFERENCES `books` (`assetId`),
  CONSTRAINT `FK_receiverId` FOREIGN KEY (`receiverId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jtalbot','jonathan','talbot','A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ='),(2,'jsmith','john','smith','+GOLl5svT3k92229GX4O4lp6bqMrCuIvXjxdEZ2DnnU='),(3,'janes','jane','smith','OAg8fukSHhdAGINWahSKpcLi1V3FO8SpSgJlF9v/PGs=');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'assetmanagement_db'
--

--
-- Dumping routines for database 'assetmanagement_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05  0:28:02
