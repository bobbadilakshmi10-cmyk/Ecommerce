-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom2728db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `admindata`
--

DROP TABLE IF EXISTS `admindata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admindata` (
  `adminid` binary(16) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_useremail` varchar(50) NOT NULL,
  `admin_password` varbinary(255) NOT NULL,
  `admin_address` tinytext NOT NULL,
  `admin_phoneno` varchar(10) NOT NULL,
  `admin_agree` enum('on','off') DEFAULT NULL,
  `admin_filename` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `admin_useremail` (`admin_useremail`),
  UNIQUE KEY `admin_filename` (`admin_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admindata`
--

LOCK TABLES `admindata` WRITE;
/*!40000 ALTER TABLE `admindata` DISABLE KEYS */;
INSERT INTO `admindata` VALUES (_binary 'ñzµ]Ö\Òåê\0ˇ…•\Í0','lakshmi','bobbadilakshmi10@gmail.com',_binary '$2b$12$Rsruh4x8OOxIRc7MkGk7/O9vG/IpEJ8rj5Pl2my4qjgQQ9/KBfirK','gollapudi vijayawada','8367206328',NULL,'M1sY5s.jpg');
/*!40000 ALTER TABLE `admindata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartid` binary(16) NOT NULL,
  `itemid` binary(16) DEFAULT NULL,
  `userid` binary(16) DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  PRIMARY KEY (`cartid`),
  KEY `itemid` (`itemid`),
  KEY `userid` (`userid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userdata` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemid` binary(16) NOT NULL,
  `item_name` longtext,
  `item_description` longtext,
  `item_about` longtext,
  `price` decimal(20,4) NOT NULL,
  `quantity` bigint DEFAULT NULL,
  `category` enum('home_appliences','Grocery','Fashion','Electronics','Sports','toys') DEFAULT NULL,
  `item_filename` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` binary(16) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `item_filename` (`item_filename`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admindata` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (_binary 'OàPêib\ÒÜ\‘\0ˇ…•\Í0','teddy','A teddy (or teddy bear) is a soft, stuffed children\'s toy shaped like a bear.','A \"teddy\" most commonly refers to a stuffed toy bear or a specific style of women\'s one-piece lingerie.',1000.0000,1,'toys','X5bO3j.jpg','2026-06-16 14:33:58',_binary 'ñzµ]Ö\Òåê\0ˇ…•\Í0'),(_binary 'k˙ôÇk\ÒÜ\‘\0ˇ…•\Í0','car','A car (or automobile) is a wheeled, self-powered motor vehicle used primarily for passenger transportation on roads.','Understanding Your Car: Familiarize yourself with basic components like the engine, transmission, and brakes.',45000.0000,0,'toys','B1fC8r.jpg','2026-06-18 16:19:46',_binary 'ñzµ]Ö\Òåê\0ˇ…•\Í0'),(_binary 'rX]\œkØ\ÒÜ\‘\0ˇ…•\Í0','watch','A watch is a portable timepiece designed to be worn on the wrist or carried in a pocket, consisting of a protective case, a dial, straps, and an internal engine.','A watch is a portable timepiece designed to keep running consistently despite the wearer\'s movement.',1000.0000,1,'toys','V1iG0i','2026-06-19 12:51:10',_binary 'ñzµ]Ö\Òåê\0ˇ…•\Í0');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_detailsid` int unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int unsigned DEFAULT NULL,
  `itemid` binary(16) DEFAULT NULL,
  `item_name` longtext,
  `item_price` decimal(10,2) DEFAULT NULL,
  `item_quantity` int unsigned DEFAULT NULL,
  `subtotal` decimal(20,4) DEFAULT NULL,
  `item_category` enum('home_appliences','Grocery','Fashion','Electronics','sports','toys') DEFAULT NULL,
  `item_filename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_detailsid`),
  KEY `itemid` (`itemid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (6,5,_binary 'OàPêib\ÒÜ\‘\0ˇ…•\Í0','teddy',1000.00,1,1000.0000,'toys','X5bO3j.jpg'),(8,7,_binary 'k˙ôÇk\ÒÜ\‘\0ˇ…•\Í0','car',45000.00,1,45000.0000,'toys','B1fC8r.jpg');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int unsigned NOT NULL AUTO_INCREMENT,
  `razorpay_ordid` varchar(100) DEFAULT NULL,
  `razorpay_payment` varchar(100) DEFAULT NULL,
  `userid` binary(16) DEFAULT NULL,
  `total_amount` decimal(20,4) DEFAULT NULL,
  `delivery` int unsigned DEFAULT '40',
  `tax` decimal(10,2) DEFAULT NULL,
  `grand_total` decimal(20,4) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'paid',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userdata` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'order_T16bH0c3HugYgF','pay_T16ic9gUNthIQo',_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0',117980.0000,40,5899.00,123919.0000,'paid','2026-06-13 17:28:58'),(2,'order_T16sQuxlWO9HaM','pay_T16srmQo4jCs5E',_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0',58990.0000,40,2949.50,61979.5000,'paid','2026-06-13 17:38:42'),(3,'order_T1n8hS9wYnD6vI','pay_T1n9aip19VFL0q',_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0',176970.0000,40,8848.50,185858.5000,'paid','2026-06-15 10:59:32'),(4,'order_T2EFtPmzjztKe1','pay_T2EH7akxL2kLpy',_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0',58990.0000,40,2949.50,61979.5000,'paid','2026-06-16 13:31:25'),(5,'order_T30vJlQuYQdcK9','pay_T30w6wBibp0qsw',_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0',1000.0000,40,50.00,1090.0000,'paid','2026-06-18 13:07:29'),(6,'order_T311uNMpAqCITA','pay_T312GGIplr9Bmt',_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0',58990.0000,40,2949.50,61979.5000,'paid','2026-06-18 13:13:21'),(7,'order_T34GpzDlX7ipFw','pay_T34HlTfhrDqv3l',_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0',45000.0000,40,2250.00,47290.0000,'paid','2026-06-18 16:24:09');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `r_id` binary(16) NOT NULL,
  `r_text` longtext,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `itemid` binary(16) DEFAULT NULL,
  `userid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `itemid` (`itemid`),
  KEY `userid` (`userid`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userdata` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdata` (
  `userid` binary(16) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `useremail` varchar(50) NOT NULL,
  `userpassword` varbinary(255) DEFAULT NULL,
  `useraddress` text,
  `usergender` enum('male','female','others') DEFAULT NULL,
  `userphone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `useremail` (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES (_binary '\n\“\Òûa¢\Òåê\0ˇ…•\Í0','lakshmi bobbadi','lakshmihavila10@gmail.com',_binary '$2b$12$tXCU1NGIL7bhgy3/gLzux.nir3OAHPG86DYMAYo3/sXhlvuN6/iK6','Gollapudi vijayawada','female',''),(_binary 'UmLéaü\Òåê\0ˇ…•\Í0','lakshmi bobbadi','bobbadilakshmi10@gmail.com',_binary '$2b$12$KwmVPGkLdG/Ifd8rXMOcieM9/1xn12KyIRES6Hif95xmWztrYCTam','Gollapudi vijayawada','female','');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-20 11:48:22
