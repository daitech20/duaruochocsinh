-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: duaruoc
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_admin`
--

DROP TABLE IF EXISTS `account_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `full_name` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `address_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `account_admin_address_id_806274c5_fk_address_ward_id` (`address_id`),
  CONSTRAINT `account_admin_address_id_806274c5_fk_address_ward_id` FOREIGN KEY (`address_id`) REFERENCES `address_ward` (`id`),
  CONSTRAINT `account_admin_user_id_2caa834c_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_admin`
--

LOCK TABLES `account_admin` WRITE;
/*!40000 ALTER TABLE `account_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_citizenidentification`
--

DROP TABLE IF EXISTS `account_citizenidentification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_citizenidentification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `code` varchar(12) NOT NULL,
  `front` varchar(100) NOT NULL,
  `back` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_citizenidentification`
--

LOCK TABLES `account_citizenidentification` WRITE;
/*!40000 ALTER TABLE `account_citizenidentification` DISABLE KEYS */;
INSERT INTO `account_citizenidentification` VALUES (1,'2024-05-21 10:07:35.387577','2024-05-23 23:33:09.705569','123123123123','cccd/6278f4b2-f7fe-4d7e-b1b3-0cba36950db2.jpg','cccd/oppo-a77s-xanh-1.jpg'),(2,'2024-05-22 02:49:54.325798','2024-05-22 02:49:54.325818','021931231231','cccd/016adac2-a6ee-4d4f-b72c-5768da044d2d.jpg','cccd/f1fbdcc7-0d51-49c3-ab5c-7fe88fa978cc_1.jpg'),(3,'2024-05-22 02:50:28.318287','2024-05-22 02:50:28.318305','213123213123','cccd/016adac2-a6ee-4d4f-b72c-5768da044d2d_1.jpg','cccd/c6df6df0-1c85-471f-b05d-8c01b09fadd5.jpg'),(4,'2024-05-22 02:52:10.613946','2024-05-22 02:52:10.613963','213123123123','cccd/016adac2-a6ee-4d4f-b72c-5768da044d2d_dVl0gwu.jpg','cccd/c6df6df0-1c85-471f-b05d-8c01b09fadd5_JUVzfl0.jpg'),(5,'2024-05-23 17:57:32.528567','2024-05-23 17:57:32.528593','1721','cccd/81ad31d9-0b66-48ee-b448-9444fb7a2c04.jfif','cccd/f3b10326-18b0-4a7d-afae-7794ad99e9f8.jfif'),(6,'2024-05-27 23:24:59.645972','2024-05-28 00:53:44.459795','216638907','cccd/0e08700b-aaf4-4a45-a5c2-c9c63da216db.jpg','cccd/b7c6858f-247f-40ea-9a31-f105ce1d2cac.jpg'),(7,'2024-05-28 02:54:57.875816','2024-05-28 02:54:57.875843','999999999999','cccd/0e08700b-aaf4-4a45-a5c2-c9c63da216db_l0nF3aE.jpg','cccd/b7c6858f-247f-40ea-9a31-f105ce1d2cac_yP10snS.jpg');
/*!40000 ALTER TABLE `account_citizenidentification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_customer`
--

DROP TABLE IF EXISTS `account_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `full_name` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `representative_unit_check` tinyint(1) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address_id` bigint DEFAULT NULL,
  `citizen_identification_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `representative_unit_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `account_customer_address_id_6760c245_fk_address_ward_id` (`address_id`),
  KEY `account_customer_citizen_identificati_781d4cf1_fk_account_c` (`citizen_identification_id`),
  KEY `account_customer_representative_unit__d53b6bc1_fk_account_r` (`representative_unit_id`),
  CONSTRAINT `account_customer_address_id_6760c245_fk_address_ward_id` FOREIGN KEY (`address_id`) REFERENCES `address_ward` (`id`),
  CONSTRAINT `account_customer_citizen_identificati_781d4cf1_fk_account_c` FOREIGN KEY (`citizen_identification_id`) REFERENCES `account_citizenidentification` (`id`),
  CONSTRAINT `account_customer_representative_unit__d53b6bc1_fk_account_r` FOREIGN KEY (`representative_unit_id`) REFERENCES `account_representativeunit` (`id`),
  CONSTRAINT `account_customer_user_id_261eab87_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_customer`
--

LOCK TABLES `account_customer` WRITE;
/*!40000 ALTER TABLE `account_customer` DISABLE KEYS */;
INSERT INTO `account_customer` VALUES (8,'2024-05-27 23:22:18.354408','2024-05-28 00:53:44.500715',NULL,'Khách hàng abc','123 Hoàng Diệu',0,'2001-11-28',6859,6,14,6),(9,'2024-05-28 02:53:46.751011','2024-05-28 02:54:57.885058',NULL,'khách hàng 2','123',0,'2006-05-11',3346,7,17,7);
/*!40000 ALTER TABLE `account_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_driver`
--

DROP TABLE IF EXISTS `account_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_driver` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `full_name` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `salary` double NOT NULL,
  `address_id` bigint DEFAULT NULL,
  `citizen_identification_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `account_driver_address_id_d170e6d2_fk_address_ward_id` (`address_id`),
  KEY `account_driver_citizen_identificati_76777886_fk_account_c` (`citizen_identification_id`),
  CONSTRAINT `account_driver_address_id_d170e6d2_fk_address_ward_id` FOREIGN KEY (`address_id`) REFERENCES `address_ward` (`id`),
  CONSTRAINT `account_driver_citizen_identificati_76777886_fk_account_c` FOREIGN KEY (`citizen_identification_id`) REFERENCES `account_citizenidentification` (`id`),
  CONSTRAINT `account_driver_user_id_94329ab0_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_driver`
--

LOCK TABLES `account_driver` WRITE;
/*!40000 ALTER TABLE `account_driver` DISABLE KEYS */;
INSERT INTO `account_driver` VALUES (3,'2024-05-27 23:32:24.248517','2024-05-27 23:32:24.248541','male','Tài xế abc','Hiệp Bình Chánh, TP. Thủ Đức','2024-05-27',200,18,4,16);
/*!40000 ALTER TABLE `account_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_employee`
--

DROP TABLE IF EXISTS `account_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `full_name` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `salary` double NOT NULL,
  `address_id` bigint DEFAULT NULL,
  `citizen_identification_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `account_employee_address_id_710ce6a6_fk_address_ward_id` (`address_id`),
  KEY `account_employee_citizen_identificati_54825ce9_fk_account_c` (`citizen_identification_id`),
  CONSTRAINT `account_employee_address_id_710ce6a6_fk_address_ward_id` FOREIGN KEY (`address_id`) REFERENCES `address_ward` (`id`),
  CONSTRAINT `account_employee_citizen_identificati_54825ce9_fk_account_c` FOREIGN KEY (`citizen_identification_id`) REFERENCES `account_citizenidentification` (`id`),
  CONSTRAINT `account_employee_user_id_28449b14_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_employee`
--

LOCK TABLES `account_employee` WRITE;
/*!40000 ALTER TABLE `account_employee` DISABLE KEYS */;
INSERT INTO `account_employee` VALUES (5,'2024-05-27 23:31:10.777414','2024-05-27 23:31:10.777446','female','Nhân viên abc','Hiệp Bình Chánh, TP. Thủ Đức','2024-04-25',100,8295,2,15);
/*!40000 ALTER TABLE `account_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_representativeunit`
--

DROP TABLE IF EXISTS `account_representativeunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_representativeunit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_representati_address_id_a4ffd12d_fk_address_w` (`address_id`),
  CONSTRAINT `account_representati_address_id_a4ffd12d_fk_address_w` FOREIGN KEY (`address_id`) REFERENCES `address_ward` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_representativeunit`
--

LOCK TABLES `account_representativeunit` WRITE;
/*!40000 ALTER TABLE `account_representativeunit` DISABLE KEYS */;
INSERT INTO `account_representativeunit` VALUES (1,'2024-05-21 10:07:26.640415','2024-05-23 23:33:09.708806','BCVT','0382200000',5962),(2,'2024-05-22 02:49:54.329864','2024-05-22 02:49:54.329889','Nguyen Duc Phuc Dai','0382000122',727),(3,'2024-05-22 02:50:28.323857','2024-05-22 02:50:28.323885','Nguyen Duc Phuc Dai','0382000122',629),(4,'2024-05-22 02:52:10.623702','2024-05-22 02:52:10.623755','Nguyen Duc Phuc Dai','0382000122',728),(5,'2024-05-23 17:57:32.533913','2024-05-23 17:57:32.533941','Nguyen Duc Phuc Dai','0382000122',728),(6,'2024-05-27 23:24:59.651032','2024-05-28 00:53:44.492730','Học viện CN BCVT','0389999999',8684),(7,'2024-05-28 02:54:57.882077','2024-05-28 02:54:57.882104','abc','0382000122',5982);
/*!40000 ALTER TABLE `account_representativeunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_status`
--

DROP TABLE IF EXISTS `account_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_status`
--

LOCK TABLES `account_status` WRITE;
/*!40000 ALTER TABLE `account_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_student`
--

DROP TABLE IF EXISTS `account_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `full_name` varchar(50) NOT NULL,
  `classroom` varchar(10) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_student_customer_id_fc6cce22_fk_account_customer_id` (`customer_id`),
  CONSTRAINT `account_student_customer_id_fc6cce22_fk_account_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `account_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_student`
--

LOCK TABLES `account_student` WRITE;
/*!40000 ALTER TABLE `account_student` DISABLE KEYS */;
INSERT INTO `account_student` VALUES (10,'2024-05-27 23:34:38.087764','2024-05-27 23:34:38.087790','male','Học sinh 1','1a','2011-06-08','student/16d7cd2a-f63f-4757-8329-1d8a5e840293.jpg',8),(13,'2024-05-28 02:55:26.146557','2024-05-28 02:55:26.146590','male','hs 2','2b','2024-05-08','student/16d7cd2a-f63f-4757-8329-1d8a5e840293_GDsW1ih.jpg',9);
/*!40000 ALTER TABLE `account_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `account_use_full_na_3048bf_idx` (`full_name`),
  KEY `account_use_phone_664a69_idx` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES (1,'pbkdf2_sha256$720000$UtOjP8LCqyFb0ktrWOVzLl$zxdggZCicEpn0F6xXK4nkw/JfymteM4N2pldvAL0RE4=','2024-05-28 02:58:36.923508','0382200122','daindp.tech@gmail.com','Phúc Đại',1,1,1),(14,'pbkdf2_sha256$720000$akfwTJvcKeeNJmkTmFrNbM$G3UddbuEGASQX7GbvqEB8x4/f0P/nlCkdlA4CyTvtsE=','2024-05-28 01:27:48.853690','0382200123','khachhang@gmail.com','Khách hàng abc',0,0,1),(15,'pbkdf2_sha256$720000$akfwTJvcKeeNJmkTmFrNbM$G3UddbuEGASQX7GbvqEB8x4/f0P/nlCkdlA4CyTvtsE=','2024-05-28 03:00:47.765111','0382200124','nhanvien@gmail.com','Nhân viên abc',1,0,1),(16,'pbkdf2_sha256$720000$akfwTJvcKeeNJmkTmFrNbM$G3UddbuEGASQX7GbvqEB8x4/f0P/nlCkdlA4CyTvtsE=',NULL,'0382200125','taixe@gmail.com','Tài xế abc',1,0,1),(17,'pbkdf2_sha256$720000$9rRyJsdFX1wxvjvix41qQS$4jCHBBSLFQu3H64m2fM7XKQpt9eb+hIQb2WTTvnZH8I=','2024-05-28 02:54:02.621501','0382200129','daindp.tech00@gmail.com','khách hàng 2',0,0,0);
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_groups`
--

DROP TABLE IF EXISTS `account_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_groups`
--

LOCK TABLES `account_user_groups` WRITE;
/*!40000 ALTER TABLE `account_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_user_permissions`
--

DROP TABLE IF EXISTS `account_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_user_permissions`
--

LOCK TABLES `account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_administrativeregion`
--

DROP TABLE IF EXISTS `address_administrativeregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_administrativeregion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `code_name_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_administrativeregion`
--

LOCK TABLES `address_administrativeregion` WRITE;
/*!40000 ALTER TABLE `address_administrativeregion` DISABLE KEYS */;
INSERT INTO `address_administrativeregion` VALUES (1,'Đông Bắc Bộ','Northeast','dong_bac_bo','northest'),(2,'Tây Bắc Bộ','Northwest','tay_bac_bo','northwest'),(3,'Đồng bằng sông Hồng','Red River Delta','dong_bang_song_hong','red_river_delta'),(4,'Bắc Trung Bộ','North Central Coast','bac_trung_bo','north_central_coast'),(5,'Duyên hải Nam Trung Bộ','South Central Coast','duyen_hai_nam_trung_bo','south_central_coast'),(6,'Tây Nguyên','Central Highlands','tay_nguyen','central_highlands'),(7,'Đông Nam Bộ','Southeast','dong_nam_bo','southeast'),(8,'Đồng bằng sông Cửu Long','Mekong River Delta','dong_bang_song_cuu_long','southwest');
/*!40000 ALTER TABLE `address_administrativeregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_administrativeunit`
--

DROP TABLE IF EXISTS `address_administrativeunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_administrativeunit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `full_name_en` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `short_name_en` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `code_name_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_administrativeunit`
--

LOCK TABLES `address_administrativeunit` WRITE;
/*!40000 ALTER TABLE `address_administrativeunit` DISABLE KEYS */;
INSERT INTO `address_administrativeunit` VALUES (1,'Thành phố trực thuộc trung ương','Municipality','Thành phố','City','thanh_pho_truc_thuoc_trung_uong','municipality'),(2,'Tỉnh','Province','Tỉnh','Province','tinh','province'),(3,'Thành phố thuộc thành phố trực thuộc trung ương','Municipal city','Thành phố','City','thanh_pho_thuoc_thanh_pho_truc_thuoc_trung_uong','municipal_city'),(4,'Thành phố thuộc tỉnh','Provincial city','Thành phố','City','thanh_pho_thuoc_tinh','provincial_city'),(5,'Quận','Urban district','Quận','District','quan','urban_district'),(6,'Thị xã','District-level town','Thị xã','Town','thi_xa','district_level_town'),(7,'Huyện','District','Huyện','District','huyen','district'),(8,'Phường','Ward','Phường','Ward','phuong','ward'),(9,'Thị trấn','Commune-level town','Thị trấn','Township','thi_tran','commune_level_town'),(10,'Xã','Commune','Xã','Commune','xa','commune');
/*!40000 ALTER TABLE `address_administrativeunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_district`
--

DROP TABLE IF EXISTS `address_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_district` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `full_name_en` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `administrative_unit_id` bigint NOT NULL,
  `province_code_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `address_district_administrative_unit__3843ed55_fk_address_a` (`administrative_unit_id`),
  KEY `address_district_province_code_id_c6ecb8e1_fk_address_p` (`province_code_id`),
  CONSTRAINT `address_district_administrative_unit__3843ed55_fk_address_a` FOREIGN KEY (`administrative_unit_id`) REFERENCES `address_administrativeunit` (`id`),
  CONSTRAINT `address_district_province_code_id_c6ecb8e1_fk_address_p` FOREIGN KEY (`province_code_id`) REFERENCES `address_province` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_district`
--

LOCK TABLES `address_district` WRITE;
/*!40000 ALTER TABLE `address_district` DISABLE KEYS */;
INSERT INTO `address_district` VALUES (1,'001','Ba Đình','Ba Dinh','Quận Ba Đình','Ba Dinh District','ba_dinh',5,'01'),(2,'002','Hoàn Kiếm','Hoan Kiem','Quận Hoàn Kiếm','Hoan Kiem District','hoan_kiem',5,'01'),(3,'003','Tây Hồ','Tay Ho','Quận Tây Hồ','Tay Ho District','tay_ho',5,'01'),(4,'004','Long Biên','Long Bien','Quận Long Biên','Long Bien District','long_bien',5,'01'),(5,'005','Cầu Giấy','Cau Giay','Quận Cầu Giấy','Cau Giay District','cau_giay',5,'01'),(6,'006','Đống Đa','Dong Da','Quận Đống Đa','Dong Da District','dong_da',5,'01'),(7,'007','Hai Bà Trưng','Hai Ba Trung','Quận Hai Bà Trưng','Hai Ba Trung District','hai_ba_trung',5,'01'),(8,'008','Hoàng Mai','Hoang Mai','Quận Hoàng Mai','Hoang Mai District','hoang_mai',5,'01'),(9,'009','Thanh Xuân','Thanh Xuan','Quận Thanh Xuân','Thanh Xuan District','thanh_xuan',5,'01'),(10,'016','Sóc Sơn','Soc Son','Huyện Sóc Sơn','Soc Son District','soc_son',7,'01'),(11,'017','Đông Anh','Dong Anh','Huyện Đông Anh','Dong Anh District','dong_anh',7,'01'),(12,'018','Gia Lâm','Gia Lam','Huyện Gia Lâm','Gia Lam District','gia_lam',7,'01'),(13,'019','Nam Từ Liêm','Nam Tu Liem','Quận Nam Từ Liêm','Nam Tu Liem District','nam_tu_liem',5,'01'),(14,'020','Thanh Trì','Thanh Tri','Huyện Thanh Trì','Thanh Tri District','thanh_tri',7,'01'),(15,'021','Bắc Từ Liêm','Bac Tu Liem','Quận Bắc Từ Liêm','Bac Tu Liem District','bac_tu_liem',5,'01'),(16,'024','Hà Giang','Ha Giang','Thành phố Hà Giang','Ha Giang City','ha_giang',4,'02'),(17,'026','Đồng Văn','Dong Van','Huyện Đồng Văn','Dong Van District','dong_van',7,'02'),(18,'027','Mèo Vạc','Meo Vac','Huyện Mèo Vạc','Meo Vac District','meo_vac',7,'02'),(19,'028','Yên Minh','Yen Minh','Huyện Yên Minh','Yen Minh District','yen_minh',7,'02'),(20,'029','Quản Bạ','Quan Ba','Huyện Quản Bạ','Quan Ba District','quan_ba',7,'02'),(21,'030','Vị Xuyên','Vi Xuyen','Huyện Vị Xuyên','Vi Xuyen District','vi_xuyen',7,'02'),(22,'031','Bắc Mê','Bac Me','Huyện Bắc Mê','Bac Me District','bac_me',7,'02'),(23,'032','Hoàng Su Phì','Hoang Su Phi','Huyện Hoàng Su Phì','Hoang Su Phi District','hoang_su_phi',7,'02'),(24,'033','Xín Mần','Xin Man','Huyện Xín Mần','Xin Man District','xin_man',7,'02'),(25,'034','Bắc Quang','Bac Quang','Huyện Bắc Quang','Bac Quang District','bac_quang',7,'02'),(26,'035','Quang Bình','Quang Binh','Huyện Quang Bình','Quang Binh District','quang_binh',7,'02'),(27,'040','Cao Bằng','Cao Bang','Thành phố Cao Bằng','Cao Bang City','cao_bang',4,'04'),(28,'042','Bảo Lâm','Bao Lam','Huyện Bảo Lâm','Bao Lam District','bao_lam',7,'04'),(29,'043','Bảo Lạc','Bao Lac','Huyện Bảo Lạc','Bao Lac District','bao_lac',7,'04'),(30,'045','Hà Quảng','Ha Quang','Huyện Hà Quảng','Ha Quang District','ha_quang',7,'04'),(31,'047','Trùng Khánh','Trung Khanh','Huyện Trùng Khánh','Trung Khanh District','trung_khanh',7,'04'),(32,'048','Hạ Lang','Ha Lang','Huyện Hạ Lang','Ha Lang District','ha_lang',7,'04'),(33,'049','Quảng Hòa','Quang Hoa','Huyện Quảng Hòa','Quang Hoa District','quang_hoa',7,'04'),(34,'051','Hoà An','Hoa An','Huyện Hoà An','Hoa An District','hoa_an',7,'04'),(35,'052','Nguyên Bình','Nguyen Binh','Huyện Nguyên Bình','Nguyen Binh District','nguyen_binh',7,'04'),(36,'053','Thạch An','Thach An','Huyện Thạch An','Thach An District','thach_an',7,'04'),(37,'058','Bắc Kạn','Bac Kan','Thành phố Bắc Kạn','Bac Kan City','bac_kan',4,'06'),(38,'060','Pác Nặm','Pac Nam','Huyện Pác Nặm','Pac Nam District','pac_nam',7,'06'),(39,'061','Ba Bể','Ba Be','Huyện Ba Bể','Ba Be District','ba_be',7,'06'),(40,'062','Ngân Sơn','Ngan Son','Huyện Ngân Sơn','Ngan Son District','ngan_son',7,'06'),(41,'063','Bạch Thông','Bach Thong','Huyện Bạch Thông','Bach Thong District','bach_thong',7,'06'),(42,'064','Chợ Đồn','Cho Don','Huyện Chợ Đồn','Cho Don District','cho_don',7,'06'),(43,'065','Chợ Mới','Cho Moi','Huyện Chợ Mới','Cho Moi District','cho_moi',7,'06'),(44,'066','Na Rì','Na Ri','Huyện Na Rì','Na Ri District','na_ri',7,'06'),(45,'070','Tuyên Quang','Tuyen Quang','Thành phố Tuyên Quang','Tuyen Quang City','tuyen_quang',4,'08'),(46,'071','Lâm Bình','Lam Binh','Huyện Lâm Bình','Lam Binh District','lam_binh',7,'08'),(47,'072','Na Hang','Na Hang','Huyện Na Hang','Na Hang District','na_hang',7,'08'),(48,'073','Chiêm Hóa','Chiem Hoa','Huyện Chiêm Hóa','Chiem Hoa District','chiem_hoa',7,'08'),(49,'074','Hàm Yên','Ham Yen','Huyện Hàm Yên','Ham Yen District','ham_yen',7,'08'),(50,'075','Yên Sơn','Yen Son','Huyện Yên Sơn','Yen Son District','yen_son',7,'08'),(51,'076','Sơn Dương','Son Duong','Huyện Sơn Dương','Son Duong District','son_duong',7,'08'),(52,'080','Lào Cai','Lao Cai','Thành phố Lào Cai','Lao Cai City','lao_cai',4,'10'),(53,'082','Bát Xát','Bat Xat','Huyện Bát Xát','Bat Xat District','bat_xat',7,'10'),(54,'083','Mường Khương','Muong Khuong','Huyện Mường Khương','Muong Khuong District','muong_khuong',7,'10'),(55,'084','Si Ma Cai','Si Ma Cai','Huyện Si Ma Cai','Si Ma Cai District','si_ma_cai',7,'10'),(56,'085','Bắc Hà','Bac Ha','Huyện Bắc Hà','Bac Ha District','bac_ha',7,'10'),(57,'086','Bảo Thắng','Bao Thang','Huyện Bảo Thắng','Bao Thang District','bao_thang',7,'10'),(58,'087','Bảo Yên','Bao Yen','Huyện Bảo Yên','Bao Yen District','bao_yen',7,'10'),(59,'088','Sa Pa','Sa Pa','Thị xã Sa Pa','Sa Pa Town','sa_pa',6,'10'),(60,'089','Văn Bàn','Van Ban','Huyện Văn Bàn','Van Ban District','van_ban',7,'10'),(61,'094','Điện Biên Phủ','Dien Bien Phu','Thành phố Điện Biên Phủ','Dien Bien Phu City','dien_bien_phu',4,'11'),(62,'095','Mường Lay','Muong Lay','Thị xã Mường Lay','Muong Lay Town','muong_lay',6,'11'),(63,'096','Mường Nhé','Muong Nhe','Huyện Mường Nhé','Muong Nhe District','muong_nhe',7,'11'),(64,'097','Mường Chà','Muong Cha','Huyện Mường Chà','Muong Cha District','muong_cha',7,'11'),(65,'098','Tủa Chùa','Tua Chua','Huyện Tủa Chùa','Tua Chua District','tua_chua',7,'11'),(66,'099','Tuần Giáo','Tuan Giao','Huyện Tuần Giáo','Tuan Giao District','tuan_giao',7,'11'),(67,'100','Điện Biên','Dien Bien','Huyện Điện Biên','Dien Bien District','dien_bien',7,'11'),(68,'101','Điện Biên Đông','Dien Bien Dong','Huyện Điện Biên Đông','Dien Bien Dong District','dien_bien_dong',7,'11'),(69,'102','Mường Ảng','Muong Ang','Huyện Mường Ảng','Muong Ang District','muong_ang',7,'11'),(70,'103','Nậm Pồ','Nam Po','Huyện Nậm Pồ','Nam Po District','nam_po',7,'11'),(71,'105','Lai Châu','Lai Chau','Thành phố Lai Châu','Lai Chau City','lai_chau',4,'12'),(72,'106','Tam Đường','Tam Duong','Huyện Tam Đường','Tam Duong District','tam_duong',7,'12'),(73,'107','Mường Tè','Muong Te','Huyện Mường Tè','Muong Te District','muong_te',7,'12'),(74,'108','Sìn Hồ','Sin Ho','Huyện Sìn Hồ','Sin Ho District','sin_ho',7,'12'),(75,'109','Phong Thổ','Phong Tho','Huyện Phong Thổ','Phong Tho District','phong_tho',7,'12'),(76,'110','Than Uyên','Than Uyen','Huyện Than Uyên','Than Uyen District','than_uyen',7,'12'),(77,'111','Tân Uyên','Tan Uyen','Huyện Tân Uyên','Tan Uyen District','tan_uyen',7,'12'),(78,'112','Nậm Nhùn','Nam Nhun','Huyện Nậm Nhùn','Nam Nhun District','nam_nhun',7,'12'),(79,'116','Sơn La','Son La','Thành phố Sơn La','Son La City','son_la',4,'14'),(80,'118','Quỳnh Nhai','Quynh Nhai','Huyện Quỳnh Nhai','Quynh Nhai District','quynh_nhai',7,'14'),(81,'119','Thuận Châu','Thuan Chau','Huyện Thuận Châu','Thuan Chau District','thuan_chau',7,'14'),(82,'120','Mường La','Muong La','Huyện Mường La','Muong La District','muong_la',7,'14'),(83,'121','Bắc Yên','Bac Yen','Huyện Bắc Yên','Bac Yen District','bac_yen',7,'14'),(84,'122','Phù Yên','Phu Yen','Huyện Phù Yên','Phu Yen District','phu_yen',7,'14'),(85,'123','Mộc Châu','Moc Chau','Huyện Mộc Châu','Moc Chau District','moc_chau',7,'14'),(86,'124','Yên Châu','Yen Chau','Huyện Yên Châu','Yen Chau District','yen_chau',7,'14'),(87,'125','Mai Sơn','Mai Son','Huyện Mai Sơn','Mai Son District','mai_son',7,'14'),(88,'126','Sông Mã','Song Ma','Huyện Sông Mã','Song Ma District','song_ma',7,'14'),(89,'127','Sốp Cộp','Sop Cop','Huyện Sốp Cộp','Sop Cop District','sop_cop',7,'14'),(90,'128','Vân Hồ','Van Ho','Huyện Vân Hồ','Van Ho District','van_ho',7,'14'),(91,'132','Yên Bái','Yen Bai','Thành phố Yên Bái','Yen Bai City','yen_bai',4,'15'),(92,'133','Nghĩa Lộ','Nghia Lo','Thị xã Nghĩa Lộ','Nghia Lo Town','nghia_lo',6,'15'),(93,'135','Lục Yên','Luc Yen','Huyện Lục Yên','Luc Yen District','luc_yen',7,'15'),(94,'136','Văn Yên','Van Yen','Huyện Văn Yên','Van Yen District','van_yen',7,'15'),(95,'137','Mù Căng Chải','Mu Cang Chai','Huyện Mù Căng Chải','Mu Cang Chai District','mu_cang_chai',7,'15'),(96,'138','Trấn Yên','Tran Yen','Huyện Trấn Yên','Tran Yen District','tran_yen',7,'15'),(97,'139','Trạm Tấu','Tram Tau','Huyện Trạm Tấu','Tram Tau District','tram_tau',7,'15'),(98,'140','Văn Chấn','Van Chan','Huyện Văn Chấn','Van Chan District','van_chan',7,'15'),(99,'141','Yên Bình','Yen Binh','Huyện Yên Bình','Yen Binh District','yen_binh',7,'15'),(100,'148','Hòa Bình','Hoa Binh','Thành phố Hòa Bình','Hoa Binh City','hoa_binh',4,'17'),(101,'150','Đà Bắc','Da Bac','Huyện Đà Bắc','Da Bac District','da_bac',7,'17'),(102,'152','Lương Sơn','Luong Son','Huyện Lương Sơn','Luong Son District','luong_son',7,'17'),(103,'153','Kim Bôi','Kim Boi','Huyện Kim Bôi','Kim Boi District','kim_boi',7,'17'),(104,'154','Cao Phong','Cao Phong','Huyện Cao Phong','Cao Phong District','cao_phong',7,'17'),(105,'155','Tân Lạc','Tan Lac','Huyện Tân Lạc','Tan Lac District','tan_lac',7,'17'),(106,'156','Mai Châu','Mai Chau','Huyện Mai Châu','Mai Chau District','mai_chau',7,'17'),(107,'157','Lạc Sơn','Lac Son','Huyện Lạc Sơn','Lac Son District','lac_son',7,'17'),(108,'158','Yên Thủy','Yen Thuy','Huyện Yên Thủy','Yen Thuy District','yen_thuy',7,'17'),(109,'159','Lạc Thủy','Lac Thuy','Huyện Lạc Thủy','Lac Thuy District','lac_thuy',7,'17'),(110,'164','Thái Nguyên','Thai Nguyen','Thành phố Thái Nguyên','Thai Nguyen City','thai_nguyen',4,'19'),(111,'165','Sông Công','Song Cong','Thành phố Sông Công','Song Cong City','song_cong',4,'19'),(112,'167','Định Hóa','Dinh Hoa','Huyện Định Hóa','Dinh Hoa District','dinh_hoa',7,'19'),(113,'168','Phú Lương','Phu Luong','Huyện Phú Lương','Phu Luong District','phu_luong',7,'19'),(114,'169','Đồng Hỷ','Dong Hy','Huyện Đồng Hỷ','Dong Hy District','dong_hy',7,'19'),(115,'170','Võ Nhai','Vo Nhai','Huyện Võ Nhai','Vo Nhai District','vo_nhai',7,'19'),(116,'171','Đại Từ','Dai Tu','Huyện Đại Từ','Dai Tu District','dai_tu',7,'19'),(117,'172','Phổ Yên','Pho Yen','Thành phố Phổ Yên','Pho Yen City','pho_yen',4,'19'),(118,'173','Phú Bình','Phu Binh','Huyện Phú Bình','Phu Binh District','phu_binh',7,'19'),(119,'178','Lạng Sơn','Lang Son','Thành phố Lạng Sơn','Lang Son City','lang_son',4,'20'),(120,'180','Tràng Định','Trang Dinh','Huyện Tràng Định','Trang Dinh District','trang_dinh',7,'20'),(121,'181','Bình Gia','Binh Gia','Huyện Bình Gia','Binh Gia District','binh_gia',7,'20'),(122,'182','Văn Lãng','Van Lang','Huyện Văn Lãng','Van Lang District','van_lang',7,'20'),(123,'183','Cao Lộc','Cao Loc','Huyện Cao Lộc','Cao Loc District','cao_loc',7,'20'),(124,'184','Văn Quan','Van Quan','Huyện Văn Quan','Van Quan District','van_quan',7,'20'),(125,'185','Bắc Sơn','Bac Son','Huyện Bắc Sơn','Bac Son District','bac_son',7,'20'),(126,'186','Hữu Lũng','Huu Lung','Huyện Hữu Lũng','Huu Lung District','huu_lung',7,'20'),(127,'187','Chi Lăng','Chi Lang','Huyện Chi Lăng','Chi Lang District','chi_lang',7,'20'),(128,'188','Lộc Bình','Loc Binh','Huyện Lộc Bình','Loc Binh District','loc_binh',7,'20'),(129,'189','Đình Lập','Dinh Lap','Huyện Đình Lập','Dinh Lap District','dinh_lap',7,'20'),(130,'193','Hạ Long','Ha Long','Thành phố Hạ Long','Ha Long City','ha_long',4,'22'),(131,'194','Móng Cái','Mong Cai','Thành phố Móng Cái','Mong Cai City','mong_cai',4,'22'),(132,'195','Cẩm Phả','Cam Pha','Thành phố Cẩm Phả','Cam Pha City','cam_pha',4,'22'),(133,'196','Uông Bí','Uong Bi','Thành phố Uông Bí','Uong Bi City','uong_bi',4,'22'),(134,'198','Bình Liêu','Binh Lieu','Huyện Bình Liêu','Binh Lieu District','binh_lieu',7,'22'),(135,'199','Tiên Yên','Tien Yen','Huyện Tiên Yên','Tien Yen District','tien_yen',7,'22'),(136,'200','Đầm Hà','Dam Ha','Huyện Đầm Hà','Dam Ha District','dam_ha',7,'22'),(137,'201','Hải Hà','Hai Ha','Huyện Hải Hà','Hai Ha District','hai_ha',7,'22'),(138,'202','Ba Chẽ','Ba Che','Huyện Ba Chẽ','Ba Che District','ba_che',7,'22'),(139,'203','Vân Đồn','Van Don','Huyện Vân Đồn','Van Don District','van_don',7,'22'),(140,'205','Đông Triều','Dong Trieu','Thị xã Đông Triều','Dong Trieu Town','dong_trieu',6,'22'),(141,'206','Quảng Yên','Quang Yen','Thị xã Quảng Yên','Quang Yen Town','quang_yen',6,'22'),(142,'207','Cô Tô','Co To','Huyện Cô Tô','Co To District','co_to',7,'22'),(143,'213','Bắc Giang','Bac Giang','Thành phố Bắc Giang','Bac Giang City','bac_giang',4,'24'),(144,'215','Yên Thế','Yen The','Huyện Yên Thế','Yen The District','yen_the',7,'24'),(145,'216','Tân Yên','Tan Yen','Huyện Tân Yên','Tan Yen District','tan_yen',7,'24'),(146,'217','Lạng Giang','Lang Giang','Huyện Lạng Giang','Lang Giang District','lang_giang',7,'24'),(147,'218','Lục Nam','Luc Nam','Huyện Lục Nam','Luc Nam District','luc_nam',7,'24'),(148,'219','Lục Ngạn','Luc Ngan','Huyện Lục Ngạn','Luc Ngan District','luc_ngan',7,'24'),(149,'220','Sơn Động','Son Dong','Huyện Sơn Động','Son Dong District','son_dong',7,'24'),(150,'221','Yên Dũng','Yen Dung','Huyện Yên Dũng','Yen Dung District','yen_dung',7,'24'),(151,'222','Việt Yên','Viet Yen','Thị xã Việt Yên','Viet Yen Town','viet_yen',6,'24'),(152,'223','Hiệp Hòa','Hiep Hoa','Huyện Hiệp Hòa','Hiep Hoa District','hiep_hoa',7,'24'),(153,'227','Việt Trì','Viet Tri','Thành phố Việt Trì','Viet Tri City','viet_tri',4,'25'),(154,'228','Phú Thọ','Phu Tho','Thị xã Phú Thọ','Phu Tho Town','phu_tho',6,'25'),(155,'230','Đoan Hùng','Doan Hung','Huyện Đoan Hùng','Doan Hung District','doan_hung',7,'25'),(156,'231','Hạ Hoà','Ha Hoa','Huyện Hạ Hoà','Ha Hoa District','ha_hoa',7,'25'),(157,'232','Thanh Ba','Thanh Ba','Huyện Thanh Ba','Thanh Ba District','thanh_ba',7,'25'),(158,'233','Phù Ninh','Phu Ninh','Huyện Phù Ninh','Phu Ninh District','phu_ninh',7,'25'),(159,'234','Yên Lập','Yen Lap','Huyện Yên Lập','Yen Lap District','yen_lap',7,'25'),(160,'235','Cẩm Khê','Cam Khe','Huyện Cẩm Khê','Cam Khe District','cam_khe',7,'25'),(161,'236','Tam Nông','Tam Nong','Huyện Tam Nông','Tam Nong District','tam_nong',7,'25'),(162,'237','Lâm Thao','Lam Thao','Huyện Lâm Thao','Lam Thao District','lam_thao',7,'25'),(163,'238','Thanh Sơn','Thanh Son','Huyện Thanh Sơn','Thanh Son District','thanh_son',7,'25'),(164,'239','Thanh Thuỷ','Thanh Thuy','Huyện Thanh Thuỷ','Thanh Thuy District','thanh_thuy',7,'25'),(165,'240','Tân Sơn','Tan Son','Huyện Tân Sơn','Tan Son District','tan_son',7,'25'),(166,'243','Vĩnh Yên','Vinh Yen','Thành phố Vĩnh Yên','Vinh Yen City','vinh_yen',4,'26'),(167,'244','Phúc Yên','Phuc Yen','Thành phố Phúc Yên','Phuc Yen City','phuc_yen',4,'26'),(168,'246','Lập Thạch','Lap Thach','Huyện Lập Thạch','Lap Thach District','lap_thach',7,'26'),(169,'247','Tam Dương','Tam Duong','Huyện Tam Dương','Tam Duong District','tam_duong',7,'26'),(170,'248','Tam Đảo','Tam Dao','Huyện Tam Đảo','Tam Dao District','tam_dao',7,'26'),(171,'249','Bình Xuyên','Binh Xuyen','Huyện Bình Xuyên','Binh Xuyen District','binh_xuyen',7,'26'),(172,'250','Mê Linh','Me Linh','Huyện Mê Linh','Me Linh District','me_linh',7,'01'),(173,'251','Yên Lạc','Yen Lac','Huyện Yên Lạc','Yen Lac District','yen_lac',7,'26'),(174,'252','Vĩnh Tường','Vinh Tuong','Huyện Vĩnh Tường','Vinh Tuong District','vinh_tuong',7,'26'),(175,'253','Sông Lô','Song Lo','Huyện Sông Lô','Song Lo District','song_lo',7,'26'),(176,'256','Bắc Ninh','Bac Ninh','Thành phố Bắc Ninh','Bac Ninh City','bac_ninh',4,'27'),(177,'258','Yên Phong','Yen Phong','Huyện Yên Phong','Yen Phong District','yen_phong',7,'27'),(178,'259','Quế Võ','Que Vo','Thị xã Quế Võ','Que Vo Town','que_vo',6,'27'),(179,'260','Tiên Du','Tien Du','Huyện Tiên Du','Tien Du District','tien_du',7,'27'),(180,'261','Từ Sơn','Tu Son','Thành phố Từ Sơn','Tu Son City','tu_son',4,'27'),(181,'262','Thuận Thành','Thuan Thanh','Thị xã Thuận Thành','Thuan Thanh Town','thuan_thanh',6,'27'),(182,'263','Gia Bình','Gia Binh','Huyện Gia Bình','Gia Binh District','gia_binh',7,'27'),(183,'264','Lương Tài','Luong Tai','Huyện Lương Tài','Luong Tai District','luong_tai',7,'27'),(184,'268','Hà Đông','Ha Dong','Quận Hà Đông','Ha Dong District','ha_dong',5,'01'),(185,'269','Sơn Tây','Son Tay','Thị xã Sơn Tây','Son Tay Town','son_tay',6,'01'),(186,'271','Ba Vì','Ba Vi','Huyện Ba Vì','Ba Vi District','ba_vi',7,'01'),(187,'272','Phúc Thọ','Phuc Tho','Huyện Phúc Thọ','Phuc Tho District','phuc_tho',7,'01'),(188,'273','Đan Phượng','Dan Phuong','Huyện Đan Phượng','Dan Phuong District','dan_phuong',7,'01'),(189,'274','Hoài Đức','Hoai Duc','Huyện Hoài Đức','Hoai Duc District','hoai_duc',7,'01'),(190,'275','Quốc Oai','Quoc Oai','Huyện Quốc Oai','Quoc Oai District','quoc_oai',7,'01'),(191,'276','Thạch Thất','Thach That','Huyện Thạch Thất','Thach That District','thach_that',7,'01'),(192,'277','Chương Mỹ','Chuong My','Huyện Chương Mỹ','Chuong My District','chuong_my',7,'01'),(193,'278','Thanh Oai','Thanh Oai','Huyện Thanh Oai','Thanh Oai District','thanh_oai',7,'01'),(194,'279','Thường Tín','Thuong Tin','Huyện Thường Tín','Thuong Tin District','thuong_tin',7,'01'),(195,'280','Phú Xuyên','Phu Xuyen','Huyện Phú Xuyên','Phu Xuyen District','phu_xuyen',7,'01'),(196,'281','Ứng Hòa','Ung Hoa','Huyện Ứng Hòa','Ung Hoa District','ung_hoa',7,'01'),(197,'282','Mỹ Đức','My Duc','Huyện Mỹ Đức','My Duc District','my_duc',7,'01'),(198,'288','Hải Dương','Hai Duong','Thành phố Hải Dương','Hai Duong City','hai_duong',4,'30'),(199,'290','Chí Linh','Chi Linh','Thành phố Chí Linh','Chi Linh City','chi_linh',4,'30'),(200,'291','Nam Sách','Nam Sach','Huyện Nam Sách','Nam Sach District','nam_sach',7,'30'),(201,'292','Kinh Môn','Kinh Mon','Thị xã Kinh Môn','Kinh Mon Town','kinh_mon',6,'30'),(202,'293','Kim Thành','Kim Thanh','Huyện Kim Thành','Kim Thanh District','kim_thanh',7,'30'),(203,'294','Thanh Hà','Thanh Ha','Huyện Thanh Hà','Thanh Ha District','thanh_ha',7,'30'),(204,'295','Cẩm Giàng','Cam Giang','Huyện Cẩm Giàng','Cam Giang District','cam_giang',7,'30'),(205,'296','Bình Giang','Binh Giang','Huyện Bình Giang','Binh Giang District','binh_giang',7,'30'),(206,'297','Gia Lộc','Gia Loc','Huyện Gia Lộc','Gia Loc District','gia_loc',7,'30'),(207,'298','Tứ Kỳ','Tu Ky','Huyện Tứ Kỳ','Tu Ky District','tu_ky',7,'30'),(208,'299','Ninh Giang','Ninh Giang','Huyện Ninh Giang','Ninh Giang District','ninh_giang',7,'30'),(209,'300','Thanh Miện','Thanh Mien','Huyện Thanh Miện','Thanh Mien District','thanh_mien',7,'30'),(210,'303','Hồng Bàng','Hong Bang','Quận Hồng Bàng','Hong Bang District','hong_bang',5,'31'),(211,'304','Ngô Quyền','Ngo Quyen','Quận Ngô Quyền','Ngo Quyen District','ngo_quyen',5,'31'),(212,'305','Lê Chân','Le Chan','Quận Lê Chân','Le Chan District','le_chan',5,'31'),(213,'306','Hải An','Hai An','Quận Hải An','Hai An District','hai_an',5,'31'),(214,'307','Kiến An','Kien An','Quận Kiến An','Kien An District','kien_an',5,'31'),(215,'308','Đồ Sơn','Do Son','Quận Đồ Sơn','Do Son District','do_son',5,'31'),(216,'309','Dương Kinh','Duong Kinh','Quận Dương Kinh','Duong Kinh District','duong_kinh',5,'31'),(217,'311','Thuỷ Nguyên','Thuy Nguyen','Huyện Thuỷ Nguyên','Thuy Nguyen District','thuy_nguyen',7,'31'),(218,'312','An Dương','An Duong','Huyện An Dương','An Duong District','an_duong',7,'31'),(219,'313','An Lão','An Lao','Huyện An Lão','An Lao District','an_lao',7,'31'),(220,'314','Kiến Thuỵ','Kien Thuy','Huyện Kiến Thuỵ','Kien Thuy District','kien_thuy',7,'31'),(221,'315','Tiên Lãng','Tien Lang','Huyện Tiên Lãng','Tien Lang District','tien_lang',7,'31'),(222,'316','Vĩnh Bảo','Vinh Bao','Huyện Vĩnh Bảo','Vinh Bao District','vinh_bao',7,'31'),(223,'317','Cát Hải','Cat Hai','Huyện Cát Hải','Cat Hai District','cat_hai',7,'31'),(224,'323','Hưng Yên','Hung Yen','Thành phố Hưng Yên','Hung Yen City','hung_yen',4,'33'),(225,'325','Văn Lâm','Van Lam','Huyện Văn Lâm','Van Lam District','van_lam',7,'33'),(226,'326','Văn Giang','Van Giang','Huyện Văn Giang','Van Giang District','van_giang',7,'33'),(227,'327','Yên Mỹ','Yen My','Huyện Yên Mỹ','Yen My District','yen_my',7,'33'),(228,'328','Mỹ Hào','My Hao','Thị xã Mỹ Hào','My Hao Town','my_hao',6,'33'),(229,'329','Ân Thi','An Thi','Huyện Ân Thi','An Thi District','an_thi',7,'33'),(230,'330','Khoái Châu','Khoai Chau','Huyện Khoái Châu','Khoai Chau District','khoai_chau',7,'33'),(231,'331','Kim Động','Kim Dong','Huyện Kim Động','Kim Dong District','kim_dong',7,'33'),(232,'332','Tiên Lữ','Tien Lu','Huyện Tiên Lữ','Tien Lu District','tien_lu',7,'33'),(233,'333','Phù Cừ','Phu Cu','Huyện Phù Cừ','Phu Cu District','phu_cu',7,'33'),(234,'336','Thái Bình','Thai Binh','Thành phố Thái Bình','Thai Binh City','thai_binh',4,'34'),(235,'338','Quỳnh Phụ','Quynh Phu','Huyện Quỳnh Phụ','Quynh Phu District','quynh_phu',7,'34'),(236,'339','Hưng Hà','Hung Ha','Huyện Hưng Hà','Hung Ha District','hung_ha',7,'34'),(237,'340','Đông Hưng','Dong Hung','Huyện Đông Hưng','Dong Hung District','dong_hung',7,'34'),(238,'341','Thái Thụy','Thai Thuy','Huyện Thái Thụy','Thai Thuy District','thai_thuy',7,'34'),(239,'342','Tiền Hải','Tien Hai','Huyện Tiền Hải','Tien Hai District','tien_hai',7,'34'),(240,'343','Kiến Xương','Kien Xuong','Huyện Kiến Xương','Kien Xuong District','kien_xuong',7,'34'),(241,'344','Vũ Thư','Vu Thu','Huyện Vũ Thư','Vu Thu District','vu_thu',7,'34'),(242,'347','Phủ Lý','Phu Ly','Thành phố Phủ Lý','Phu Ly City','phu_ly',4,'35'),(243,'349','Duy Tiên','Duy Tien','Thị xã Duy Tiên','Duy Tien Town','duy_tien',6,'35'),(244,'350','Kim Bảng','Kim Bang','Huyện Kim Bảng','Kim Bang District','kim_bang',7,'35'),(245,'351','Thanh Liêm','Thanh Liem','Huyện Thanh Liêm','Thanh Liem District','thanh_liem',7,'35'),(246,'352','Bình Lục','Binh Luc','Huyện Bình Lục','Binh Luc District','binh_luc',7,'35'),(247,'353','Lý Nhân','Ly Nhan','Huyện Lý Nhân','Ly Nhan District','ly_nhan',7,'35'),(248,'356','Nam Định','Nam Dinh','Thành phố Nam Định','Nam Dinh City','nam_dinh',4,'36'),(249,'358','Mỹ Lộc','My Loc','Huyện Mỹ Lộc','My Loc District','my_loc',7,'36'),(250,'359','Vụ Bản','Vu Ban','Huyện Vụ Bản','Vu Ban District','vu_ban',7,'36'),(251,'360','Ý Yên','Y Yen','Huyện Ý Yên','Y Yen District','y_yen',7,'36'),(252,'361','Nghĩa Hưng','Nghia Hung','Huyện Nghĩa Hưng','Nghia Hung District','nghia_hung',7,'36'),(253,'362','Nam Trực','Nam Truc','Huyện Nam Trực','Nam Truc District','nam_truc',7,'36'),(254,'363','Trực Ninh','Truc Ninh','Huyện Trực Ninh','Truc Ninh District','truc_ninh',7,'36'),(255,'364','Xuân Trường','Xuan Truong','Huyện Xuân Trường','Xuan Truong District','xuan_truong',7,'36'),(256,'365','Giao Thủy','Giao Thuy','Huyện Giao Thủy','Giao Thuy District','giao_thuy',7,'36'),(257,'366','Hải Hậu','Hai Hau','Huyện Hải Hậu','Hai Hau District','hai_hau',7,'36'),(258,'369','Ninh Bình','Ninh Binh','Thành phố Ninh Bình','Ninh Binh City','ninh_binh',4,'37'),(259,'370','Tam Điệp','Tam Diep','Thành phố Tam Điệp','Tam Diep City','tam_diep',4,'37'),(260,'372','Nho Quan','Nho Quan','Huyện Nho Quan','Nho Quan District','nho_quan',7,'37'),(261,'373','Gia Viễn','Gia Vien','Huyện Gia Viễn','Gia Vien District','gia_vien',7,'37'),(262,'374','Hoa Lư','Hoa Lu','Huyện Hoa Lư','Hoa Lu District','hoa_lu',7,'37'),(263,'375','Yên Khánh','Yen Khanh','Huyện Yên Khánh','Yen Khanh District','yen_khanh',7,'37'),(264,'376','Kim Sơn','Kim Son','Huyện Kim Sơn','Kim Son District','kim_son',7,'37'),(265,'377','Yên Mô','Yen Mo','Huyện Yên Mô','Yen Mo District','yen_mo',7,'37'),(266,'380','Thanh Hóa','Thanh Hoa','Thành phố Thanh Hóa','Thanh Hoa City','thanh_hoa',4,'38'),(267,'381','Bỉm Sơn','Bim Son','Thị xã Bỉm Sơn','Bim Son Town','bim_son',6,'38'),(268,'382','Sầm Sơn','Sam Son','Thành phố Sầm Sơn','Sam Son City','sam_son',4,'38'),(269,'384','Mường Lát','Muong Lat','Huyện Mường Lát','Muong Lat District','muong_lat',7,'38'),(270,'385','Quan Hóa','Quan Hoa','Huyện Quan Hóa','Quan Hoa District','quan_hoa',7,'38'),(271,'386','Bá Thước','Ba Thuoc','Huyện Bá Thước','Ba Thuoc District','ba_thuoc',7,'38'),(272,'387','Quan Sơn','Quan Son','Huyện Quan Sơn','Quan Son District','quan_son',7,'38'),(273,'388','Lang Chánh','Lang Chanh','Huyện Lang Chánh','Lang Chanh District','lang_chanh',7,'38'),(274,'389','Ngọc Lặc','Ngoc Lac','Huyện Ngọc Lặc','Ngoc Lac District','ngoc_lac',7,'38'),(275,'390','Cẩm Thủy','Cam Thuy','Huyện Cẩm Thủy','Cam Thuy District','cam_thuy',7,'38'),(276,'391','Thạch Thành','Thach Thanh','Huyện Thạch Thành','Thach Thanh District','thach_thanh',7,'38'),(277,'392','Hà Trung','Ha Trung','Huyện Hà Trung','Ha Trung District','ha_trung',7,'38'),(278,'393','Vĩnh Lộc','Vinh Loc','Huyện Vĩnh Lộc','Vinh Loc District','vinh_loc',7,'38'),(279,'394','Yên Định','Yen Dinh','Huyện Yên Định','Yen Dinh District','yen_dinh',7,'38'),(280,'395','Thọ Xuân','Tho Xuan','Huyện Thọ Xuân','Tho Xuan District','tho_xuan',7,'38'),(281,'396','Thường Xuân','Thuong Xuan','Huyện Thường Xuân','Thuong Xuan District','thuong_xuan',7,'38'),(282,'397','Triệu Sơn','Trieu Son','Huyện Triệu Sơn','Trieu Son District','trieu_son',7,'38'),(283,'398','Thiệu Hóa','Thieu Hoa','Huyện Thiệu Hóa','Thieu Hoa District','thieu_hoa',7,'38'),(284,'399','Hoằng Hóa','Hoang Hoa','Huyện Hoằng Hóa','Hoang Hoa District','hoang_hoa',7,'38'),(285,'400','Hậu Lộc','Hau Loc','Huyện Hậu Lộc','Hau Loc District','hau_loc',7,'38'),(286,'401','Nga Sơn','Nga Son','Huyện Nga Sơn','Nga Son District','nga_son',7,'38'),(287,'402','Như Xuân','Nhu Xuan','Huyện Như Xuân','Nhu Xuan District','nhu_xuan',7,'38'),(288,'403','Như Thanh','Nhu Thanh','Huyện Như Thanh','Nhu Thanh District','nhu_thanh',7,'38'),(289,'404','Nông Cống','Nong Cong','Huyện Nông Cống','Nong Cong District','nong_cong',7,'38'),(290,'405','Đông Sơn','Dong Son','Huyện Đông Sơn','Dong Son District','dong_son',7,'38'),(291,'406','Quảng Xương','Quang Xuong','Huyện Quảng Xương','Quang Xuong District','quang_xuong',7,'38'),(292,'407','Nghi Sơn','Nghi Son','Thị xã Nghi Sơn','Nghi Son Town','nghi_son',6,'38'),(293,'412','Vinh','Vinh','Thành phố Vinh','Vinh City','vinh',4,'40'),(294,'413','Cửa Lò','Cua Lo','Thị xã Cửa Lò','Cua Lo Town','cua_lo',6,'40'),(295,'414','Thái Hoà','Thai Hoa','Thị xã Thái Hoà','Thai Hoa Town','thai_hoa',6,'40'),(296,'415','Quế Phong','Que Phong','Huyện Quế Phong','Que Phong District','que_phong',7,'40'),(297,'416','Quỳ Châu','Quy Chau','Huyện Quỳ Châu','Quy Chau District','quy_chau',7,'40'),(298,'417','Kỳ Sơn','Ky Son','Huyện Kỳ Sơn','Ky Son District','ky_son',7,'40'),(299,'418','Tương Dương','Tuong Duong','Huyện Tương Dương','Tuong Duong District','tuong_duong',7,'40'),(300,'419','Nghĩa Đàn','Nghia Dan','Huyện Nghĩa Đàn','Nghia Dan District','nghia_dan',7,'40'),(301,'420','Quỳ Hợp','Quy Hop','Huyện Quỳ Hợp','Quy Hop District','quy_hop',7,'40'),(302,'421','Quỳnh Lưu','Quynh Luu','Huyện Quỳnh Lưu','Quynh Luu District','quynh_luu',7,'40'),(303,'422','Con Cuông','Con Cuong','Huyện Con Cuông','Con Cuong District','con_cuong',7,'40'),(304,'423','Tân Kỳ','Tan Ky','Huyện Tân Kỳ','Tan Ky District','tan_ky',7,'40'),(305,'424','Anh Sơn','Anh Son','Huyện Anh Sơn','Anh Son District','anh_son',7,'40'),(306,'425','Diễn Châu','Dien Chau','Huyện Diễn Châu','Dien Chau District','dien_chau',7,'40'),(307,'426','Yên Thành','Yen Thanh','Huyện Yên Thành','Yen Thanh District','yen_thanh',7,'40'),(308,'427','Đô Lương','Do Luong','Huyện Đô Lương','Do Luong District','do_luong',7,'40'),(309,'428','Thanh Chương','Thanh Chuong','Huyện Thanh Chương','Thanh Chuong District','thanh_chuong',7,'40'),(310,'429','Nghi Lộc','Nghi Loc','Huyện Nghi Lộc','Nghi Loc District','nghi_loc',7,'40'),(311,'430','Nam Đàn','Nam Dan','Huyện Nam Đàn','Nam Dan District','nam_dan',7,'40'),(312,'431','Hưng Nguyên','Hung Nguyen','Huyện Hưng Nguyên','Hung Nguyen District','hung_nguyen',7,'40'),(313,'432','Hoàng Mai','Hoang Mai','Thị xã Hoàng Mai','Hoang Mai Town','hoang_mai',6,'40'),(314,'436','Hà Tĩnh','Ha Tinh','Thành phố Hà Tĩnh','Ha Tinh City','ha_tinh',4,'42'),(315,'437','Hồng Lĩnh','Hong Linh','Thị xã Hồng Lĩnh','Hong Linh Town','hong_linh',6,'42'),(316,'439','Hương Sơn','Huong Son','Huyện Hương Sơn','Huong Son District','huong_son',7,'42'),(317,'440','Đức Thọ','Duc Tho','Huyện Đức Thọ','Duc Tho District','duc_tho',7,'42'),(318,'441','Vũ Quang','Vu Quang','Huyện Vũ Quang','Vu Quang District','vu_quang',7,'42'),(319,'442','Nghi Xuân','Nghi Xuan','Huyện Nghi Xuân','Nghi Xuan District','nghi_xuan',7,'42'),(320,'443','Can Lộc','Can Loc','Huyện Can Lộc','Can Loc District','can_loc',7,'42'),(321,'444','Hương Khê','Huong Khe','Huyện Hương Khê','Huong Khe District','huong_khe',7,'42'),(322,'445','Thạch Hà','Thach Ha','Huyện Thạch Hà','Thach Ha District','thach_ha',7,'42'),(323,'446','Cẩm Xuyên','Cam Xuyen','Huyện Cẩm Xuyên','Cam Xuyen District','cam_xuyen',7,'42'),(324,'447','Kỳ Anh','Ky Anh','Huyện Kỳ Anh','Ky Anh District','ky_anh',7,'42'),(325,'448','Lộc Hà','Loc Ha','Huyện Lộc Hà','Loc Ha District','loc_ha',7,'42'),(326,'449','Kỳ Anh','Ky Anh','Thị xã Kỳ Anh','Ky Anh Town','ky_anh',6,'42'),(327,'450','Đồng Hới','Dong Hoi','Thành phố Đồng Hới','Dong Hoi City','dong_hoi',4,'44'),(328,'452','Minh Hóa','Minh Hoa','Huyện Minh Hóa','Minh Hoa District','minh_hoa',7,'44'),(329,'453','Tuyên Hóa','Tuyen Hoa','Huyện Tuyên Hóa','Tuyen Hoa District','tuyen_hoa',7,'44'),(330,'454','Quảng Trạch','Quang Trach','Huyện Quảng Trạch','Quang Trach District','quang_trach',7,'44'),(331,'455','Bố Trạch','Bo Trach','Huyện Bố Trạch','Bo Trach District','bo_trach',7,'44'),(332,'456','Quảng Ninh','Quang Ninh','Huyện Quảng Ninh','Quang Ninh District','quang_ninh',7,'44'),(333,'457','Lệ Thủy','Le Thuy','Huyện Lệ Thủy','Le Thuy District','le_thuy',7,'44'),(334,'458','Ba Đồn','Ba Don','Thị xã Ba Đồn','Ba Don Town','ba_don',6,'44'),(335,'461','Đông Hà','Dong Ha','Thành phố Đông Hà','Dong Ha City','dong_ha',4,'45'),(336,'462','Quảng Trị','Quang Tri','Thị xã Quảng Trị','Quang Tri Town','quang_tri',6,'45'),(337,'464','Vĩnh Linh','Vinh Linh','Huyện Vĩnh Linh','Vinh Linh District','vinh_linh',7,'45'),(338,'465','Hướng Hóa','Huong Hoa','Huyện Hướng Hóa','Huong Hoa District','huong_hoa',7,'45'),(339,'466','Gio Linh','Gio Linh','Huyện Gio Linh','Gio Linh District','gio_linh',7,'45'),(340,'467','Đa Krông','Da Krong','Huyện Đa Krông','Da Krong District','da_krong',7,'45'),(341,'468','Cam Lộ','Cam Lo','Huyện Cam Lộ','Cam Lo District','cam_lo',7,'45'),(342,'469','Triệu Phong','Trieu Phong','Huyện Triệu Phong','Trieu Phong District','trieu_phong',7,'45'),(343,'470','Hải Lăng','Hai Lang','Huyện Hải Lăng','Hai Lang District','hai_lang',7,'45'),(344,'474','Huế','Hue','Thành phố Huế','Hue City','hue',4,'46'),(345,'476','Phong Điền','Phong Dien','Huyện Phong Điền','Phong Dien District','phong_dien',7,'46'),(346,'477','Quảng Điền','Quang Dien','Huyện Quảng Điền','Quang Dien District','quang_dien',7,'46'),(347,'478','Phú Vang','Phu Vang','Huyện Phú Vang','Phu Vang District','phu_vang',7,'46'),(348,'479','Hương Thủy','Huong Thuy','Thị xã Hương Thủy','Huong Thuy Town','huong_thuy',6,'46'),(349,'480','Hương Trà','Huong Tra','Thị xã Hương Trà','Huong Tra Town','huong_tra',6,'46'),(350,'481','A Lưới','A Luoi','Huyện A Lưới','A Luoi District','a_luoi',7,'46'),(351,'482','Phú Lộc','Phu Loc','Huyện Phú Lộc','Phu Loc District','phu_loc',7,'46'),(352,'483','Nam Đông','Nam Dong','Huyện Nam Đông','Nam Dong District','nam_dong',7,'46'),(353,'490','Liên Chiểu','Lien Chieu','Quận Liên Chiểu','Lien Chieu District','lien_chieu',5,'48'),(354,'491','Thanh Khê','Thanh Khe','Quận Thanh Khê','Thanh Khe District','thanh_khe',5,'48'),(355,'492','Hải Châu','Hai Chau','Quận Hải Châu','Hai Chau District','hai_chau',5,'48'),(356,'493','Sơn Trà','Son Tra','Quận Sơn Trà','Son Tra District','son_tra',5,'48'),(357,'494','Ngũ Hành Sơn','Ngu Hanh Son','Quận Ngũ Hành Sơn','Ngu Hanh Son District','ngu_hanh_son',5,'48'),(358,'495','Cẩm Lệ','Cam Le','Quận Cẩm Lệ','Cam Le District','cam_le',5,'48'),(359,'497','Hòa Vang','Hoa Vang','Huyện Hòa Vang','Hoa Vang District','hoa_vang',7,'48'),(360,'502','Tam Kỳ','Tam Ky','Thành phố Tam Kỳ','Tam Ky City','tam_ky',4,'49'),(361,'503','Hội An','Hoi An','Thành phố Hội An','Hoi An City','hoi_an',4,'49'),(362,'504','Tây Giang','Tay Giang','Huyện Tây Giang','Tay Giang District','tay_giang',7,'49'),(363,'505','Đông Giang','Dong Giang','Huyện Đông Giang','Dong Giang District','dong_giang',7,'49'),(364,'506','Đại Lộc','Dai Loc','Huyện Đại Lộc','Dai Loc District','dai_loc',7,'49'),(365,'507','Điện Bàn','Dien Ban','Thị xã Điện Bàn','Dien Ban Town','dien_ban',6,'49'),(366,'508','Duy Xuyên','Duy Xuyen','Huyện Duy Xuyên','Duy Xuyen District','duy_xuyen',7,'49'),(367,'509','Quế Sơn','Que Son','Huyện Quế Sơn','Que Son District','que_son',7,'49'),(368,'510','Nam Giang','Nam Giang','Huyện Nam Giang','Nam Giang District','nam_giang',7,'49'),(369,'511','Phước Sơn','Phuoc Son','Huyện Phước Sơn','Phuoc Son District','phuoc_son',7,'49'),(370,'512','Hiệp Đức','Hiep Duc','Huyện Hiệp Đức','Hiep Duc District','hiep_duc',7,'49'),(371,'513','Thăng Bình','Thang Binh','Huyện Thăng Bình','Thang Binh District','thang_binh',7,'49'),(372,'514','Tiên Phước','Tien Phuoc','Huyện Tiên Phước','Tien Phuoc District','tien_phuoc',7,'49'),(373,'515','Bắc Trà My','Bac Tra My','Huyện Bắc Trà My','Bac Tra My District','bac_tra_my',7,'49'),(374,'516','Nam Trà My','Nam Tra My','Huyện Nam Trà My','Nam Tra My District','nam_tra_my',7,'49'),(375,'517','Núi Thành','Nui Thanh','Huyện Núi Thành','Nui Thanh District','nui_thanh',7,'49'),(376,'518','Phú Ninh','Phu Ninh','Huyện Phú Ninh','Phu Ninh District','phu_ninh',7,'49'),(377,'519','Nông Sơn','Nong Son','Huyện Nông Sơn','Nong Son District','nong_son',7,'49'),(378,'522','Quảng Ngãi','Quang Ngai','Thành phố Quảng Ngãi','Quang Ngai City','quang_ngai',4,'51'),(379,'524','Bình Sơn','Binh Son','Huyện Bình Sơn','Binh Son District','binh_son',7,'51'),(380,'525','Trà Bồng','Tra Bong','Huyện Trà Bồng','Tra Bong District','tra_bong',7,'51'),(381,'527','Sơn Tịnh','Son Tinh','Huyện Sơn Tịnh','Son Tinh District','son_tinh',7,'51'),(382,'528','Tư Nghĩa','Tu Nghia','Huyện Tư Nghĩa','Tu Nghia District','tu_nghia',7,'51'),(383,'529','Sơn Hà','Son Ha','Huyện Sơn Hà','Son Ha District','son_ha',7,'51'),(384,'530','Sơn Tây','Son Tay','Huyện Sơn Tây','Son Tay District','son_tay',7,'51'),(385,'531','Minh Long','Minh Long','Huyện Minh Long','Minh Long District','minh_long',7,'51'),(386,'532','Nghĩa Hành','Nghia Hanh','Huyện Nghĩa Hành','Nghia Hanh District','nghia_hanh',7,'51'),(387,'533','Mộ Đức','Mo Duc','Huyện Mộ Đức','Mo Duc District','mo_duc',7,'51'),(388,'534','Đức Phổ','Duc Pho','Thị xã Đức Phổ','Duc Pho Town','duc_pho',6,'51'),(389,'535','Ba Tơ','Ba To','Huyện Ba Tơ','Ba To District','ba_to',7,'51'),(390,'540','Quy Nhơn','Quy Nhon','Thành phố Quy Nhơn','Quy Nhon City','quy_nhon',4,'52'),(391,'542','An Lão','An Lao','Huyện An Lão','An Lao District','an_lao',7,'52'),(392,'543','Hoài Nhơn','Hoai Nhon','Thị xã Hoài Nhơn','Hoai Nhon Town','hoai_nhon',6,'52'),(393,'544','Hoài Ân','Hoai An','Huyện Hoài Ân','Hoai An District','hoai_an',7,'52'),(394,'545','Phù Mỹ','Phu My','Huyện Phù Mỹ','Phu My District','phu_my',7,'52'),(395,'546','Vĩnh Thạnh','Vinh Thanh','Huyện Vĩnh Thạnh','Vinh Thanh District','vinh_thanh',7,'52'),(396,'547','Tây Sơn','Tay Son','Huyện Tây Sơn','Tay Son District','tay_son',7,'52'),(397,'548','Phù Cát','Phu Cat','Huyện Phù Cát','Phu Cat District','phu_cat',7,'52'),(398,'549','An Nhơn','An Nhon','Thị xã An Nhơn','An Nhon Town','an_nhon',6,'52'),(399,'550','Tuy Phước','Tuy Phuoc','Huyện Tuy Phước','Tuy Phuoc District','tuy_phuoc',7,'52'),(400,'551','Vân Canh','Van Canh','Huyện Vân Canh','Van Canh District','van_canh',7,'52'),(401,'555','Tuy Hoà','Tuy Hoa','Thành phố Tuy Hoà','Tuy Hoa City','tuy_hoa',4,'54'),(402,'557','Sông Cầu','Song Cau','Thị xã Sông Cầu','Song Cau Town','song_cau',6,'54'),(403,'558','Đồng Xuân','Dong Xuan','Huyện Đồng Xuân','Dong Xuan District','dong_xuan',7,'54'),(404,'559','Tuy An','Tuy An','Huyện Tuy An','Tuy An District','tuy_an',7,'54'),(405,'560','Sơn Hòa','Son Hoa','Huyện Sơn Hòa','Son Hoa District','son_hoa',7,'54'),(406,'561','Sông Hinh','Song Hinh','Huyện Sông Hinh','Song Hinh District','song_hinh',7,'54'),(407,'562','Tây Hoà','Tay Hoa','Huyện Tây Hoà','Tay Hoa District','tay_hoa',7,'54'),(408,'563','Phú Hoà','Phu Hoa','Huyện Phú Hoà','Phu Hoa District','phu_hoa',7,'54'),(409,'564','Đông Hòa','Dong Hoa','Thị xã Đông Hòa','Dong Hoa Town','dong_hoa',6,'54'),(410,'568','Nha Trang','Nha Trang','Thành phố Nha Trang','Nha Trang City','nha_trang',4,'56'),(411,'569','Cam Ranh','Cam Ranh','Thành phố Cam Ranh','Cam Ranh City','cam_ranh',4,'56'),(412,'570','Cam Lâm','Cam Lam','Huyện Cam Lâm','Cam Lam District','cam_lam',7,'56'),(413,'571','Vạn Ninh','Van Ninh','Huyện Vạn Ninh','Van Ninh District','van_ninh',7,'56'),(414,'572','Ninh Hòa','Ninh Hoa','Thị xã Ninh Hòa','Ninh Hoa Town','ninh_hoa',6,'56'),(415,'573','Khánh Vĩnh','Khanh Vinh','Huyện Khánh Vĩnh','Khanh Vinh District','khanh_vinh',7,'56'),(416,'574','Diên Khánh','Dien Khanh','Huyện Diên Khánh','Dien Khanh District','dien_khanh',7,'56'),(417,'575','Khánh Sơn','Khanh Son','Huyện Khánh Sơn','Khanh Son District','khanh_son',7,'56'),(418,'576','Trường Sa','Truong Sa','Huyện Trường Sa','Truong Sa District','truong_sa',7,'56'),(419,'582','Phan Rang-Tháp Chàm','Phan Rang-Thap Cham','Thành phố Phan Rang-Tháp Chàm','Phan Rang-Thap Cham City','phan_rang-thap_cham',4,'58'),(420,'584','Bác Ái','Bac Ai','Huyện Bác Ái','Bac Ai District','bac_ai',7,'58'),(421,'585','Ninh Sơn','Ninh Son','Huyện Ninh Sơn','Ninh Son District','ninh_son',7,'58'),(422,'586','Ninh Hải','Ninh Hai','Huyện Ninh Hải','Ninh Hai District','ninh_hai',7,'58'),(423,'587','Ninh Phước','Ninh Phuoc','Huyện Ninh Phước','Ninh Phuoc District','ninh_phuoc',7,'58'),(424,'588','Thuận Bắc','Thuan Bac','Huyện Thuận Bắc','Thuan Bac District','thuan_bac',7,'58'),(425,'589','Thuận Nam','Thuan Nam','Huyện Thuận Nam','Thuan Nam District','thuan_nam',7,'58'),(426,'593','Phan Thiết','Phan Thiet','Thành phố Phan Thiết','Phan Thiet City','phan_thiet',4,'60'),(427,'594','La Gi','La Gi','Thị xã La Gi','La Gi Town','la_gi',6,'60'),(428,'595','Tuy Phong','Tuy Phong','Huyện Tuy Phong','Tuy Phong District','tuy_phong',7,'60'),(429,'596','Bắc Bình','Bac Binh','Huyện Bắc Bình','Bac Binh District','bac_binh',7,'60'),(430,'597','Hàm Thuận Bắc','Ham Thuan Bac','Huyện Hàm Thuận Bắc','Ham Thuan Bac District','ham_thuan_bac',7,'60'),(431,'598','Hàm Thuận Nam','Ham Thuan Nam','Huyện Hàm Thuận Nam','Ham Thuan Nam District','ham_thuan_nam',7,'60'),(432,'599','Tánh Linh','Tanh Linh','Huyện Tánh Linh','Tanh Linh District','tanh_linh',7,'60'),(433,'600','Đức Linh','Duc Linh','Huyện Đức Linh','Duc Linh District','duc_linh',7,'60'),(434,'601','Hàm Tân','Ham Tan','Huyện Hàm Tân','Ham Tan District','ham_tan',7,'60'),(435,'602','Phú Quí','Phu Qui','Huyện Phú Quí','Phu Qui District','phu_qui',7,'60'),(436,'608','Kon Tum','Kon Tum','Thành phố Kon Tum','Kon Tum City','kon_tum',4,'62'),(437,'610','Đắk Glei','Dak Glei','Huyện Đắk Glei','Dak Glei District','dak_glei',7,'62'),(438,'611','Ngọc Hồi','Ngoc Hoi','Huyện Ngọc Hồi','Ngoc Hoi District','ngoc_hoi',7,'62'),(439,'612','Đắk Tô','Dak To','Huyện Đắk Tô','Dak To District','dak_to',7,'62'),(440,'613','Kon Plông','Kon Plong','Huyện Kon Plông','Kon Plong District','kon_plong',7,'62'),(441,'614','Kon Rẫy','Kon Ray','Huyện Kon Rẫy','Kon Ray District','kon_ray',7,'62'),(442,'615','Đắk Hà','Dak Ha','Huyện Đắk Hà','Dak Ha District','dak_ha',7,'62'),(443,'616','Sa Thầy','Sa Thay','Huyện Sa Thầy','Sa Thay District','sa_thay',7,'62'),(444,'617','Tu Mơ Rông','Tu Mo Rong','Huyện Tu Mơ Rông','Tu Mo Rong District','tu_mo_rong',7,'62'),(445,'618','Ia H\' Drai','Ia H\' Drai','Huyện Ia H\' Drai','Ia H\' Drai District','ia_h_drai',7,'62'),(446,'622','Pleiku','Pleiku','Thành phố Pleiku','Pleiku City','pleiku',4,'64'),(447,'623','An Khê','An Khe','Thị xã An Khê','An Khe Town','an_khe',6,'64'),(448,'624','Ayun Pa','Ayun Pa','Thị xã Ayun Pa','Ayun Pa Town','ayun_pa',6,'64'),(449,'625','KBang','KBang','Huyện KBang','KBang District','kbang',7,'64'),(450,'626','Đăk Đoa','Dak Doa','Huyện Đăk Đoa','Dak Doa District','dak_doa',7,'64'),(451,'627','Chư Păh','Chu Pah','Huyện Chư Păh','Chu Pah District','chu_pah',7,'64'),(452,'628','Ia Grai','Ia Grai','Huyện Ia Grai','Ia Grai District','ia_grai',7,'64'),(453,'629','Mang Yang','Mang Yang','Huyện Mang Yang','Mang Yang District','mang_yang',7,'64'),(454,'630','Kông Chro','Kong Chro','Huyện Kông Chro','Kong Chro District','kong_chro',7,'64'),(455,'631','Đức Cơ','Duc Co','Huyện Đức Cơ','Duc Co District','duc_co',7,'64'),(456,'632','Chư Prông','Chu Prong','Huyện Chư Prông','Chu Prong District','chu_prong',7,'64'),(457,'633','Chư Sê','Chu Se','Huyện Chư Sê','Chu Se District','chu_se',7,'64'),(458,'634','Đăk Pơ','Dak Po','Huyện Đăk Pơ','Dak Po District','dak_po',7,'64'),(459,'635','Ia Pa','Ia Pa','Huyện Ia Pa','Ia Pa District','ia_pa',7,'64'),(460,'637','Krông Pa','Krong Pa','Huyện Krông Pa','Krong Pa District','krong_pa',7,'64'),(461,'638','Phú Thiện','Phu Thien','Huyện Phú Thiện','Phu Thien District','phu_thien',7,'64'),(462,'639','Chư Pưh','Chu Puh','Huyện Chư Pưh','Chu Puh District','chu_puh',7,'64'),(463,'643','Buôn Ma Thuột','Buon Ma Thuot','Thành phố Buôn Ma Thuột','Buon Ma Thuot City','buon_ma_thuot',4,'66'),(464,'644','Buôn Hồ','Buon Ho','Thị xã Buôn Hồ','Buon Ho Town','buon_ho',6,'66'),(465,'645','Ea H\'leo','Ea H\'leo','Huyện Ea H\'leo','Ea H\'leo District','ea_hleo',7,'66'),(466,'646','Ea Súp','Ea Sup','Huyện Ea Súp','Ea Sup District','ea_sup',7,'66'),(467,'647','Buôn Đôn','Buon Don','Huyện Buôn Đôn','Buon Don District','buon_don',7,'66'),(468,'648','Cư M\'gar','Cu M\'gar','Huyện Cư M\'gar','Cu M\'gar District','cu_mgar',7,'66'),(469,'649','Krông Búk','Krong Buk','Huyện Krông Búk','Krong Buk District','krong_buk',7,'66'),(470,'650','Krông Năng','Krong Nang','Huyện Krông Năng','Krong Nang District','krong_nang',7,'66'),(471,'651','Ea Kar','Ea Kar','Huyện Ea Kar','Ea Kar District','ea_kar',7,'66'),(472,'652','M\'Đrắk','M\'Drak','Huyện M\'Đrắk','M\'Drak District','mdrak',7,'66'),(473,'653','Krông Bông','Krong Bong','Huyện Krông Bông','Krong Bong District','krong_bong',7,'66'),(474,'654','Krông Pắc','Krong Pac','Huyện Krông Pắc','Krong Pac District','krong_pac',7,'66'),(475,'655','Krông A Na','Krong A Na','Huyện Krông A Na','Krong A Na District','krong_a_na',7,'66'),(476,'656','Lắk','Lak','Huyện Lắk','Lak District','lak',7,'66'),(477,'657','Cư Kuin','Cu Kuin','Huyện Cư Kuin','Cu Kuin District','cu_kuin',7,'66'),(478,'660','Gia Nghĩa','Gia Nghia','Thành phố Gia Nghĩa','Gia Nghia City','gia_nghia',4,'67'),(479,'661','Đăk Glong','Dak Glong','Huyện Đăk Glong','Dak Glong District','dak_glong',7,'67'),(480,'662','Cư Jút','Cu Jut','Huyện Cư Jút','Cu Jut District','cu_jut',7,'67'),(481,'663','Đắk Mil','Dak Mil','Huyện Đắk Mil','Dak Mil District','dak_mil',7,'67'),(482,'664','Krông Nô','Krong No','Huyện Krông Nô','Krong No District','krong_no',7,'67'),(483,'665','Đắk Song','Dak Song','Huyện Đắk Song','Dak Song District','dak_song',7,'67'),(484,'666','Đắk R\'Lấp','Dak R\'Lap','Huyện Đắk R\'Lấp','Dak R\'Lap District','dak_rlap',7,'67'),(485,'667','Tuy Đức','Tuy Duc','Huyện Tuy Đức','Tuy Duc District','tuy_duc',7,'67'),(486,'672','Đà Lạt','Da Lat','Thành phố Đà Lạt','Da Lat City','da_lat',4,'68'),(487,'673','Bảo Lộc','Bao Loc','Thành phố Bảo Lộc','Bao Loc City','bao_loc',4,'68'),(488,'674','Đam Rông','Dam Rong','Huyện Đam Rông','Dam Rong District','dam_rong',7,'68'),(489,'675','Lạc Dương','Lac Duong','Huyện Lạc Dương','Lac Duong District','lac_duong',7,'68'),(490,'676','Lâm Hà','Lam Ha','Huyện Lâm Hà','Lam Ha District','lam_ha',7,'68'),(491,'677','Đơn Dương','Don Duong','Huyện Đơn Dương','Don Duong District','don_duong',7,'68'),(492,'678','Đức Trọng','Duc Trong','Huyện Đức Trọng','Duc Trong District','duc_trong',7,'68'),(493,'679','Di Linh','Di Linh','Huyện Di Linh','Di Linh District','di_linh',7,'68'),(494,'680','Bảo Lâm','Bao Lam','Huyện Bảo Lâm','Bao Lam District','bao_lam',7,'68'),(495,'681','Đạ Huoai','Da Huoai','Huyện Đạ Huoai','Da Huoai District','da_huoai',7,'68'),(496,'682','Đạ Tẻh','Da Teh','Huyện Đạ Tẻh','Da Teh District','da_teh',7,'68'),(497,'683','Cát Tiên','Cat Tien','Huyện Cát Tiên','Cat Tien District','cat_tien',7,'68'),(498,'688','Phước Long','Phuoc Long','Thị xã Phước Long','Phuoc Long Town','phuoc_long',6,'70'),(499,'689','Đồng Xoài','Dong Xoai','Thành phố Đồng Xoài','Dong Xoai City','dong_xoai',4,'70'),(500,'690','Bình Long','Binh Long','Thị xã Bình Long','Binh Long Town','binh_long',6,'70'),(501,'691','Bù Gia Mập','Bu Gia Map','Huyện Bù Gia Mập','Bu Gia Map District','bu_gia_map',7,'70'),(502,'692','Lộc Ninh','Loc Ninh','Huyện Lộc Ninh','Loc Ninh District','loc_ninh',7,'70'),(503,'693','Bù Đốp','Bu Dop','Huyện Bù Đốp','Bu Dop District','bu_dop',7,'70'),(504,'694','Hớn Quản','Hon Quan','Huyện Hớn Quản','Hon Quan District','hon_quan',7,'70'),(505,'695','Đồng Phú','Dong Phu','Huyện Đồng Phú','Dong Phu District','dong_phu',7,'70'),(506,'696','Bù Đăng','Bu Dang','Huyện Bù Đăng','Bu Dang District','bu_dang',7,'70'),(507,'697','Chơn Thành','Chon Thanh','Thị xã Chơn Thành','Chon Thanh Town','chon_thanh',6,'70'),(508,'698','Phú Riềng','Phu Rieng','Huyện Phú Riềng','Phu Rieng District','phu_rieng',7,'70'),(509,'703','Tây Ninh','Tay Ninh','Thành phố Tây Ninh','Tay Ninh City','tay_ninh',4,'72'),(510,'705','Tân Biên','Tan Bien','Huyện Tân Biên','Tan Bien District','tan_bien',7,'72'),(511,'706','Tân Châu','Tan Chau','Huyện Tân Châu','Tan Chau District','tan_chau',7,'72'),(512,'707','Dương Minh Châu','Duong Minh Chau','Huyện Dương Minh Châu','Duong Minh Chau District','duong_minh_chau',7,'72'),(513,'708','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'72'),(514,'709','Hòa Thành','Hoa Thanh','Thị xã Hòa Thành','Hoa Thanh Town','hoa_thanh',6,'72'),(515,'710','Gò Dầu','Go Dau','Huyện Gò Dầu','Go Dau District','go_dau',7,'72'),(516,'711','Bến Cầu','Ben Cau','Huyện Bến Cầu','Ben Cau District','ben_cau',7,'72'),(517,'712','Trảng Bàng','Trang Bang','Thị xã Trảng Bàng','Trang Bang Town','trang_bang',6,'72'),(518,'718','Thủ Dầu Một','Thu Dau Mot','Thành phố Thủ Dầu Một','Thu Dau Mot City','thu_dau_mot',4,'74'),(519,'719','Bàu Bàng','Bau Bang','Huyện Bàu Bàng','Bau Bang District','bau_bang',7,'74'),(520,'720','Dầu Tiếng','Dau Tieng','Huyện Dầu Tiếng','Dau Tieng District','dau_tieng',7,'74'),(521,'721','Bến Cát','Ben Cat','Thành phố Bến Cát','Ben Cat City','ben_cat',4,'74'),(522,'722','Phú Giáo','Phu Giao','Huyện Phú Giáo','Phu Giao District','phu_giao',7,'74'),(523,'723','Tân Uyên','Tan Uyen','Thành phố Tân Uyên','Tan Uyen City','tan_uyen',4,'74'),(524,'724','Dĩ An','Di An','Thành phố Dĩ An','Di An City','di_an',4,'74'),(525,'725','Thuận An','Thuan An','Thành phố Thuận An','Thuan An City','thuan_an',4,'74'),(526,'726','Bắc Tân Uyên','Bac Tan Uyen','Huyện Bắc Tân Uyên','Bac Tan Uyen District','bac_tan_uyen',7,'74'),(527,'731','Biên Hòa','Bien Hoa','Thành phố Biên Hòa','Bien Hoa City','bien_hoa',4,'75'),(528,'732','Long Khánh','Long Khanh','Thành phố Long Khánh','Long Khanh City','long_khanh',4,'75'),(529,'734','Tân Phú','Tan Phu','Huyện Tân Phú','Tan Phu District','tan_phu',7,'75'),(530,'735','Vĩnh Cửu','Vinh Cuu','Huyện Vĩnh Cửu','Vinh Cuu District','vinh_cuu',7,'75'),(531,'736','Định Quán','Dinh Quan','Huyện Định Quán','Dinh Quan District','dinh_quan',7,'75'),(532,'737','Trảng Bom','Trang Bom','Huyện Trảng Bom','Trang Bom District','trang_bom',7,'75'),(533,'738','Thống Nhất','Thong Nhat','Huyện Thống Nhất','Thong Nhat District','thong_nhat',7,'75'),(534,'739','Cẩm Mỹ','Cam My','Huyện Cẩm Mỹ','Cam My District','cam_my',7,'75'),(535,'740','Long Thành','Long Thanh','Huyện Long Thành','Long Thanh District','long_thanh',7,'75'),(536,'741','Xuân Lộc','Xuan Loc','Huyện Xuân Lộc','Xuan Loc District','xuan_loc',7,'75'),(537,'742','Nhơn Trạch','Nhon Trach','Huyện Nhơn Trạch','Nhon Trach District','nhon_trach',7,'75'),(538,'747','Vũng Tàu','Vung Tau','Thành phố Vũng Tàu','Vung Tau City','vung_tau',4,'77'),(539,'748','Bà Rịa','Ba Ria','Thành phố Bà Rịa','Ba Ria City','ba_ria',4,'77'),(540,'750','Châu Đức','Chau Duc','Huyện Châu Đức','Chau Duc District','chau_duc',7,'77'),(541,'751','Xuyên Mộc','Xuyen Moc','Huyện Xuyên Mộc','Xuyen Moc District','xuyen_moc',7,'77'),(542,'752','Long Điền','Long Dien','Huyện Long Điền','Long Dien District','long_dien',7,'77'),(543,'753','Đất Đỏ','Dat Do','Huyện Đất Đỏ','Dat Do District','dat_do',7,'77'),(544,'754','Phú Mỹ','Phu My','Thị xã Phú Mỹ','Phu My Town','phu_my',6,'77'),(545,'760','1','1','Quận 1','District 1','1',5,'79'),(546,'761','12','12','Quận 12','District 12','12',5,'79'),(547,'764','Gò Vấp','Go Vap','Quận Gò Vấp','Go Vap District','go_vap',5,'79'),(548,'765','Bình Thạnh','Binh Thanh','Quận Bình Thạnh','Binh Thanh District','binh_thanh',5,'79'),(549,'766','Tân Bình','Tan Binh','Quận Tân Bình','Tan Binh District','tan_binh',5,'79'),(550,'767','Tân Phú','Tan Phu','Quận Tân Phú','Tan Phu District','tan_phu',5,'79'),(551,'768','Phú Nhuận','Phu Nhuan','Quận Phú Nhuận','Phu Nhuan District','phu_nhuan',5,'79'),(552,'769','Thủ Đức','Thu Duc','Thành phố Thủ Đức','Thu Duc City','thu_duc',3,'79'),(553,'770','3','3','Quận 3','District 3','3',5,'79'),(554,'771','10','10','Quận 10','District 10','10',5,'79'),(555,'772','11','11','Quận 11','District 11','11',5,'79'),(556,'773','4','4','Quận 4','District 4','4',5,'79'),(557,'774','5','5','Quận 5','District 5','5',5,'79'),(558,'775','6','6','Quận 6','District 6','6',5,'79'),(559,'776','8','8','Quận 8','District 8','8',5,'79'),(560,'777','Bình Tân','Binh Tan','Quận Bình Tân','Binh Tan District','binh_tan',5,'79'),(561,'778','7','7','Quận 7','District 7','7',5,'79'),(562,'783','Củ Chi','Cu Chi','Huyện Củ Chi','Cu Chi District','cu_chi',7,'79'),(563,'784','Hóc Môn','Hoc Mon','Huyện Hóc Môn','Hoc Mon District','hoc_mon',7,'79'),(564,'785','Bình Chánh','Binh Chanh','Huyện Bình Chánh','Binh Chanh District','binh_chanh',7,'79'),(565,'786','Nhà Bè','Nha Be','Huyện Nhà Bè','Nha Be District','nha_be',7,'79'),(566,'787','Cần Giờ','Can Gio','Huyện Cần Giờ','Can Gio District','can_gio',7,'79'),(567,'794','Tân An','Tan An','Thành phố Tân An','Tan An City','tan_an',4,'80'),(568,'795','Kiến Tường','Kien Tuong','Thị xã Kiến Tường','Kien Tuong Town','kien_tuong',6,'80'),(569,'796','Tân Hưng','Tan Hung','Huyện Tân Hưng','Tan Hung District','tan_hung',7,'80'),(570,'797','Vĩnh Hưng','Vinh Hung','Huyện Vĩnh Hưng','Vinh Hung District','vinh_hung',7,'80'),(571,'798','Mộc Hóa','Moc Hoa','Huyện Mộc Hóa','Moc Hoa District','moc_hoa',7,'80'),(572,'799','Tân Thạnh','Tan Thanh','Huyện Tân Thạnh','Tan Thanh District','tan_thanh',7,'80'),(573,'800','Thạnh Hóa','Thanh Hoa','Huyện Thạnh Hóa','Thanh Hoa District','thanh_hoa',7,'80'),(574,'801','Đức Huệ','Duc Hue','Huyện Đức Huệ','Duc Hue District','duc_hue',7,'80'),(575,'802','Đức Hòa','Duc Hoa','Huyện Đức Hòa','Duc Hoa District','duc_hoa',7,'80'),(576,'803','Bến Lức','Ben Luc','Huyện Bến Lức','Ben Luc District','ben_luc',7,'80'),(577,'804','Thủ Thừa','Thu Thua','Huyện Thủ Thừa','Thu Thua District','thu_thua',7,'80'),(578,'805','Tân Trụ','Tan Tru','Huyện Tân Trụ','Tan Tru District','tan_tru',7,'80'),(579,'806','Cần Đước','Can Duoc','Huyện Cần Đước','Can Duoc District','can_duoc',7,'80'),(580,'807','Cần Giuộc','Can Giuoc','Huyện Cần Giuộc','Can Giuoc District','can_giuoc',7,'80'),(581,'808','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'80'),(582,'815','Mỹ Tho','My Tho','Thành phố Mỹ Tho','My Tho City','my_tho',4,'82'),(583,'816','Gò Công','Go Cong','Thành phố Gò Công','Go Cong City','go_cong',4,'82'),(584,'817','Cai Lậy','Cai Lay','Thị xã Cai Lậy','Cai Lay Town','cai_lay',6,'82'),(585,'818','Tân Phước','Tan Phuoc','Huyện Tân Phước','Tan Phuoc District','tan_phuoc',7,'82'),(586,'819','Cái Bè','Cai Be','Huyện Cái Bè','Cai Be District','cai_be',7,'82'),(587,'820','Cai Lậy','Cai Lay','Huyện Cai Lậy','Cai Lay District','cai_lay',7,'82'),(588,'821','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'82'),(589,'822','Chợ Gạo','Cho Gao','Huyện Chợ Gạo','Cho Gao District','cho_gao',7,'82'),(590,'823','Gò Công Tây','Go Cong Tay','Huyện Gò Công Tây','Go Cong Tay District','go_cong_tay',7,'82'),(591,'824','Gò Công Đông','Go Cong Dong','Huyện Gò Công Đông','Go Cong Dong District','go_cong_dong',7,'82'),(592,'825','Tân Phú Đông','Tan Phu Dong','Huyện Tân Phú Đông','Tan Phu Dong District','tan_phu_dong',7,'82'),(593,'829','Bến Tre','Ben Tre','Thành phố Bến Tre','Ben Tre City','ben_tre',4,'83'),(594,'831','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'83'),(595,'832','Chợ Lách','Cho Lach','Huyện Chợ Lách','Cho Lach District','cho_lach',7,'83'),(596,'833','Mỏ Cày Nam','Mo Cay Nam','Huyện Mỏ Cày Nam','Mo Cay Nam District','mo_cay_nam',7,'83'),(597,'834','Giồng Trôm','Giong Trom','Huyện Giồng Trôm','Giong Trom District','giong_trom',7,'83'),(598,'835','Bình Đại','Binh Dai','Huyện Bình Đại','Binh Dai District','binh_dai',7,'83'),(599,'836','Ba Tri','Ba Tri','Huyện Ba Tri','Ba Tri District','ba_tri',7,'83'),(600,'837','Thạnh Phú','Thanh Phu','Huyện Thạnh Phú','Thanh Phu District','thanh_phu',7,'83'),(601,'838','Mỏ Cày Bắc','Mo Cay Bac','Huyện Mỏ Cày Bắc','Mo Cay Bac District','mo_cay_bac',7,'83'),(602,'842','Trà Vinh','Tra Vinh','Thành phố Trà Vinh','Tra Vinh City','tra_vinh',4,'84'),(603,'844','Càng Long','Cang Long','Huyện Càng Long','Cang Long District','cang_long',7,'84'),(604,'845','Cầu Kè','Cau Ke','Huyện Cầu Kè','Cau Ke District','cau_ke',7,'84'),(605,'846','Tiểu Cần','Tieu Can','Huyện Tiểu Cần','Tieu Can District','tieu_can',7,'84'),(606,'847','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'84'),(607,'848','Cầu Ngang','Cau Ngang','Huyện Cầu Ngang','Cau Ngang District','cau_ngang',7,'84'),(608,'849','Trà Cú','Tra Cu','Huyện Trà Cú','Tra Cu District','tra_cu',7,'84'),(609,'850','Duyên Hải','Duyen Hai','Huyện Duyên Hải','Duyen Hai District','duyen_hai',7,'84'),(610,'851','Duyên Hải','Duyen Hai','Thị xã Duyên Hải','Duyen Hai Town','duyen_hai',6,'84'),(611,'855','Vĩnh Long','Vinh Long','Thành phố Vĩnh Long','Vinh Long City','vinh_long',4,'86'),(612,'857','Long Hồ','Long Ho','Huyện Long Hồ','Long Ho District','long_ho',7,'86'),(613,'858','Mang Thít','Mang Thit','Huyện Mang Thít','Mang Thit District','mang_thit',7,'86'),(614,'859','Vũng Liêm','Vung Liem','Huyện Vũng Liêm','Vung Liem District','vung_liem',7,'86'),(615,'860','Tam Bình','Tam Binh','Huyện Tam Bình','Tam Binh District','tam_binh',7,'86'),(616,'861','Bình Minh','Binh Minh','Thị xã Bình Minh','Binh Minh Town','binh_minh',6,'86'),(617,'862','Trà Ôn','Tra On','Huyện Trà Ôn','Tra On District','tra_on',7,'86'),(618,'863','Bình Tân','Binh Tan','Huyện Bình Tân','Binh Tan District','binh_tan',7,'86'),(619,'866','Cao Lãnh','Cao Lanh','Thành phố Cao Lãnh','Cao Lanh City','cao_lanh',4,'87'),(620,'867','Sa Đéc','Sa Dec','Thành phố Sa Đéc','Sa Dec City','sa_dec',4,'87'),(621,'868','Hồng Ngự','Hong Ngu','Thành phố Hồng Ngự','Hong Ngu City','hong_ngu',4,'87'),(622,'869','Tân Hồng','Tan Hong','Huyện Tân Hồng','Tan Hong District','tan_hong',7,'87'),(623,'870','Hồng Ngự','Hong Ngu','Huyện Hồng Ngự','Hong Ngu District','hong_ngu',7,'87'),(624,'871','Tam Nông','Tam Nong','Huyện Tam Nông','Tam Nong District','tam_nong',7,'87'),(625,'872','Tháp Mười','Thap Muoi','Huyện Tháp Mười','Thap Muoi District','thap_muoi',7,'87'),(626,'873','Cao Lãnh','Cao Lanh','Huyện Cao Lãnh','Cao Lanh District','cao_lanh',7,'87'),(627,'874','Thanh Bình','Thanh Binh','Huyện Thanh Bình','Thanh Binh District','thanh_binh',7,'87'),(628,'875','Lấp Vò','Lap Vo','Huyện Lấp Vò','Lap Vo District','lap_vo',7,'87'),(629,'876','Lai Vung','Lai Vung','Huyện Lai Vung','Lai Vung District','lai_vung',7,'87'),(630,'877','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'87'),(631,'883','Long Xuyên','Long Xuyen','Thành phố Long Xuyên','Long Xuyen City','long_xuyen',4,'89'),(632,'884','Châu Đốc','Chau Doc','Thành phố Châu Đốc','Chau Doc City','chau_doc',4,'89'),(633,'886','An Phú','An Phu','Huyện An Phú','An Phu District','an_phu',7,'89'),(634,'887','Tân Châu','Tan Chau','Thị xã Tân Châu','Tan Chau Town','tan_chau',6,'89'),(635,'888','Phú Tân','Phu Tan','Huyện Phú Tân','Phu Tan District','phu_tan',7,'89'),(636,'889','Châu Phú','Chau Phu','Huyện Châu Phú','Chau Phu District','chau_phu',7,'89'),(637,'890','Tịnh Biên','Tinh Bien','Thị xã Tịnh Biên','Tinh Bien Town','tinh_bien',6,'89'),(638,'891','Tri Tôn','Tri Ton','Huyện Tri Tôn','Tri Ton District','tri_ton',7,'89'),(639,'892','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'89'),(640,'893','Chợ Mới','Cho Moi','Huyện Chợ Mới','Cho Moi District','cho_moi',7,'89'),(641,'894','Thoại Sơn','Thoai Son','Huyện Thoại Sơn','Thoai Son District','thoai_son',7,'89'),(642,'899','Rạch Giá','Rach Gia','Thành phố Rạch Giá','Rach Gia City','rach_gia',4,'91'),(643,'900','Hà Tiên','Ha Tien','Thành phố Hà Tiên','Ha Tien City','ha_tien',4,'91'),(644,'902','Kiên Lương','Kien Luong','Huyện Kiên Lương','Kien Luong District','kien_luong',7,'91'),(645,'903','Hòn Đất','Hon Dat','Huyện Hòn Đất','Hon Dat District','hon_dat',7,'91'),(646,'904','Tân Hiệp','Tan Hiep','Huyện Tân Hiệp','Tan Hiep District','tan_hiep',7,'91'),(647,'905','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'91'),(648,'906','Giồng Riềng','Giong Rieng','Huyện Giồng Riềng','Giong Rieng District','giong_rieng',7,'91'),(649,'907','Gò Quao','Go Quao','Huyện Gò Quao','Go Quao District','go_quao',7,'91'),(650,'908','An Biên','An Bien','Huyện An Biên','An Bien District','an_bien',7,'91'),(651,'909','An Minh','An Minh','Huyện An Minh','An Minh District','an_minh',7,'91'),(652,'910','Vĩnh Thuận','Vinh Thuan','Huyện Vĩnh Thuận','Vinh Thuan District','vinh_thuan',7,'91'),(653,'911','Phú Quốc','Phu Quoc','Thành phố Phú Quốc','Phu Quoc City','phu_quoc',4,'91'),(654,'912','Kiên Hải','Kien Hai','Huyện Kiên Hải','Kien Hai District','kien_hai',7,'91'),(655,'913','U Minh Thượng','U Minh Thuong','Huyện U Minh Thượng','U Minh Thuong District','u_minh_thuong',7,'91'),(656,'914','Giang Thành','Giang Thanh','Huyện Giang Thành','Giang Thanh District','giang_thanh',7,'91'),(657,'916','Ninh Kiều','Ninh Kieu','Quận Ninh Kiều','Ninh Kieu District','ninh_kieu',5,'92'),(658,'917','Ô Môn','O Mon','Quận Ô Môn','O Mon District','o_mon',5,'92'),(659,'918','Bình Thuỷ','Binh Thuy','Quận Bình Thuỷ','Binh Thuy District','binh_thuy',5,'92'),(660,'919','Cái Răng','Cai Rang','Quận Cái Răng','Cai Rang District','cai_rang',5,'92'),(661,'923','Thốt Nốt','Thot Not','Quận Thốt Nốt','Thot Not District','thot_not',5,'92'),(662,'924','Vĩnh Thạnh','Vinh Thanh','Huyện Vĩnh Thạnh','Vinh Thanh District','vinh_thanh',7,'92'),(663,'925','Cờ Đỏ','Co Do','Huyện Cờ Đỏ','Co Do District','co_do',7,'92'),(664,'926','Phong Điền','Phong Dien','Huyện Phong Điền','Phong Dien District','phong_dien',7,'92'),(665,'927','Thới Lai','Thoi Lai','Huyện Thới Lai','Thoi Lai District','thoi_lai',7,'92'),(666,'930','Vị Thanh','Vi Thanh','Thành phố Vị Thanh','Vi Thanh City','vi_thanh',4,'93'),(667,'931','Ngã Bảy','Nga Bay','Thành phố Ngã Bảy','Nga Bay City','nga_bay',4,'93'),(668,'932','Châu Thành A','Chau Thanh A','Huyện Châu Thành A','Chau Thanh A District','chau_thanh_a',7,'93'),(669,'933','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'93'),(670,'934','Phụng Hiệp','Phung Hiep','Huyện Phụng Hiệp','Phung Hiep District','phung_hiep',7,'93'),(671,'935','Vị Thuỷ','Vi Thuy','Huyện Vị Thuỷ','Vi Thuy District','vi_thuy',7,'93'),(672,'936','Long Mỹ','Long My','Huyện Long Mỹ','Long My District','long_my',7,'93'),(673,'937','Long Mỹ','Long My','Thị xã Long Mỹ','Long My Town','long_my',6,'93'),(674,'941','Sóc Trăng','Soc Trang','Thành phố Sóc Trăng','Soc Trang City','soc_trang',4,'94'),(675,'942','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh',7,'94'),(676,'943','Kế Sách','Ke Sach','Huyện Kế Sách','Ke Sach District','ke_sach',7,'94'),(677,'944','Mỹ Tú','My Tu','Huyện Mỹ Tú','My Tu District','my_tu',7,'94'),(678,'945','Cù Lao Dung','Cu Lao Dung','Huyện Cù Lao Dung','Cu Lao Dung District','cu_lao_dung',7,'94'),(679,'946','Long Phú','Long Phu','Huyện Long Phú','Long Phu District','long_phu',7,'94'),(680,'947','Mỹ Xuyên','My Xuyen','Huyện Mỹ Xuyên','My Xuyen District','my_xuyen',7,'94'),(681,'948','Ngã Năm','Nga Nam','Thị xã Ngã Năm','Nga Nam Town','nga_nam',6,'94'),(682,'949','Thạnh Trị','Thanh Tri','Huyện Thạnh Trị','Thanh Tri District','thanh_tri',7,'94'),(683,'950','Vĩnh Châu','Vinh Chau','Thị xã Vĩnh Châu','Vinh Chau Town','vinh_chau',6,'94'),(684,'951','Trần Đề','Tran De','Huyện Trần Đề','Tran De District','tran_de',7,'94'),(685,'954','Bạc Liêu','Bac Lieu','Thành phố Bạc Liêu','Bac Lieu City','bac_lieu',4,'95'),(686,'956','Hồng Dân','Hong Dan','Huyện Hồng Dân','Hong Dan District','hong_dan',7,'95'),(687,'957','Phước Long','Phuoc Long','Huyện Phước Long','Phuoc Long District','phuoc_long',7,'95'),(688,'958','Vĩnh Lợi','Vinh Loi','Huyện Vĩnh Lợi','Vinh Loi District','vinh_loi',7,'95'),(689,'959','Giá Rai','Gia Rai','Thị xã Giá Rai','Gia Rai Town','gia_rai',6,'95'),(690,'960','Đông Hải','Dong Hai','Huyện Đông Hải','Dong Hai District','dong_hai',7,'95'),(691,'961','Hoà Bình','Hoa Binh','Huyện Hoà Bình','Hoa Binh District','hoa_binh',7,'95'),(692,'964','Cà Mau','Ca Mau','Thành phố Cà Mau','Ca Mau City','ca_mau',4,'96'),(693,'966','U Minh','U Minh','Huyện U Minh','U Minh District','u_minh',7,'96'),(694,'967','Thới Bình','Thoi Binh','Huyện Thới Bình','Thoi Binh District','thoi_binh',7,'96'),(695,'968','Trần Văn Thời','Tran Van Thoi','Huyện Trần Văn Thời','Tran Van Thoi District','tran_van_thoi',7,'96'),(696,'969','Cái Nước','Cai Nuoc','Huyện Cái Nước','Cai Nuoc District','cai_nuoc',7,'96'),(697,'970','Đầm Dơi','Dam Doi','Huyện Đầm Dơi','Dam Doi District','dam_doi',7,'96'),(698,'971','Năm Căn','Nam Can','Huyện Năm Căn','Nam Can District','nam_can',7,'96'),(699,'972','Phú Tân','Phu Tan','Huyện Phú Tân','Phu Tan District','phu_tan',7,'96'),(700,'973','Ngọc Hiển','Ngoc Hien','Huyện Ngọc Hiển','Ngoc Hien District','ngoc_hien',7,'96');
/*!40000 ALTER TABLE `address_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_province`
--

DROP TABLE IF EXISTS `address_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_province` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `full_name_en` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `administrative_region_id` bigint NOT NULL,
  `administrative_unit_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `address_province_administrative_regio_23d0e11c_fk_address_a` (`administrative_region_id`),
  KEY `address_province_administrative_unit__6e14270b_fk_address_a` (`administrative_unit_id`),
  CONSTRAINT `address_province_administrative_regio_23d0e11c_fk_address_a` FOREIGN KEY (`administrative_region_id`) REFERENCES `address_administrativeregion` (`id`),
  CONSTRAINT `address_province_administrative_unit__6e14270b_fk_address_a` FOREIGN KEY (`administrative_unit_id`) REFERENCES `address_administrativeunit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_province`
--

LOCK TABLES `address_province` WRITE;
/*!40000 ALTER TABLE `address_province` DISABLE KEYS */;
INSERT INTO `address_province` VALUES (1,'01','Hà Nội','Ha Noi','Thành phố Hà Nội','Ha Noi City','ha_noi',3,1),(2,'02','Hà Giang','Ha Giang','Tỉnh Hà Giang','Ha Giang Province','ha_giang',1,2),(3,'04','Cao Bằng','Cao Bang','Tỉnh Cao Bằng','Cao Bang Province','cao_bang',1,2),(4,'06','Bắc Kạn','Bac Kan','Tỉnh Bắc Kạn','Bac Kan Province','bac_kan',1,2),(5,'08','Tuyên Quang','Tuyen Quang','Tỉnh Tuyên Quang','Tuyen Quang Province','tuyen_quang',1,2),(6,'10','Lào Cai','Lao Cai','Tỉnh Lào Cai','Lao Cai Province','lao_cai',2,2),(7,'11','Điện Biên','Dien Bien','Tỉnh Điện Biên','Dien Bien Province','dien_bien',2,2),(8,'12','Lai Châu','Lai Chau','Tỉnh Lai Châu','Lai Chau Province','lai_chau',2,2),(9,'14','Sơn La','Son La','Tỉnh Sơn La','Son La Province','son_la',2,2),(10,'15','Yên Bái','Yen Bai','Tỉnh Yên Bái','Yen Bai Province','yen_bai',2,2),(11,'17','Hoà Bình','Hoa Binh','Tỉnh Hoà Bình','Hoa Binh Province','hoa_binh',2,2),(12,'19','Thái Nguyên','Thai Nguyen','Tỉnh Thái Nguyên','Thai Nguyen Province','thai_nguyen',1,2),(13,'20','Lạng Sơn','Lang Son','Tỉnh Lạng Sơn','Lang Son Province','lang_son',1,2),(14,'22','Quảng Ninh','Quang Ninh','Tỉnh Quảng Ninh','Quang Ninh Province','quang_ninh',1,2),(15,'24','Bắc Giang','Bac Giang','Tỉnh Bắc Giang','Bac Giang Province','bac_giang',1,2),(16,'25','Phú Thọ','Phu Tho','Tỉnh Phú Thọ','Phu Tho Province','phu_tho',1,2),(17,'26','Vĩnh Phúc','Vinh Phuc','Tỉnh Vĩnh Phúc','Vinh Phuc Province','vinh_phuc',3,2),(18,'27','Bắc Ninh','Bac Ninh','Tỉnh Bắc Ninh','Bac Ninh Province','bac_ninh',3,2),(19,'30','Hải Dương','Hai Duong','Tỉnh Hải Dương','Hai Duong Province','hai_duong',3,2),(20,'31','Hải Phòng','Hai Phong','Thành phố Hải Phòng','Hai Phong City','hai_phong',3,1),(21,'33','Hưng Yên','Hung Yen','Tỉnh Hưng Yên','Hung Yen Province','hung_yen',3,2),(22,'34','Thái Bình','Thai Binh','Tỉnh Thái Bình','Thai Binh Province','thai_binh',3,2),(23,'35','Hà Nam','Ha Nam','Tỉnh Hà Nam','Ha Nam Province','ha_nam',3,2),(24,'36','Nam Định','Nam Dinh','Tỉnh Nam Định','Nam Dinh Province','nam_dinh',3,2),(25,'37','Ninh Bình','Ninh Binh','Tỉnh Ninh Bình','Ninh Binh Province','ninh_binh',3,2),(26,'38','Thanh Hóa','Thanh Hoa','Tỉnh Thanh Hóa','Thanh Hoa Province','thanh_hoa',4,2),(27,'40','Nghệ An','Nghe An','Tỉnh Nghệ An','Nghe An Province','nghe_an',4,2),(28,'42','Hà Tĩnh','Ha Tinh','Tỉnh Hà Tĩnh','Ha Tinh Province','ha_tinh',4,2),(29,'44','Quảng Bình','Quang Binh','Tỉnh Quảng Bình','Quang Binh Province','quang_binh',4,2),(30,'45','Quảng Trị','Quang Tri','Tỉnh Quảng Trị','Quang Tri Province','quang_tri',4,2),(31,'46','Thừa Thiên Huế','Thua Thien Hue','Tỉnh Thừa Thiên Huế','Thua Thien Hue Province','thua_thien_hue',4,2),(32,'48','Đà Nẵng','Da Nang','Thành phố Đà Nẵng','Da Nang City','da_nang',5,1),(33,'49','Quảng Nam','Quang Nam','Tỉnh Quảng Nam','Quang Nam Province','quang_nam',5,2),(34,'51','Quảng Ngãi','Quang Ngai','Tỉnh Quảng Ngãi','Quang Ngai Province','quang_ngai',5,2),(35,'52','Bình Định','Binh Dinh','Tỉnh Bình Định','Binh Dinh Province','binh_dinh',5,2),(36,'54','Phú Yên','Phu Yen','Tỉnh Phú Yên','Phu Yen Province','phu_yen',5,2),(37,'56','Khánh Hòa','Khanh Hoa','Tỉnh Khánh Hòa','Khanh Hoa Province','khanh_hoa',5,2),(38,'58','Ninh Thuận','Ninh Thuan','Tỉnh Ninh Thuận','Ninh Thuan Province','ninh_thuan',5,2),(39,'60','Bình Thuận','Binh Thuan','Tỉnh Bình Thuận','Binh Thuan Province','binh_thuan',5,2),(40,'62','Kon Tum','Kon Tum','Tỉnh Kon Tum','Kon Tum Province','kon_tum',6,2),(41,'64','Gia Lai','Gia Lai','Tỉnh Gia Lai','Gia Lai Province','gia_lai',6,2),(42,'66','Đắk Lắk','Dak Lak','Tỉnh Đắk Lắk','Dak Lak Province','dak_lak',6,2),(43,'67','Đắk Nông','Dak Nong','Tỉnh Đắk Nông','Dak Nong Province','dak_nong',6,2),(44,'68','Lâm Đồng','Lam Dong','Tỉnh Lâm Đồng','Lam Dong Province','lam_dong',6,2),(45,'70','Bình Phước','Binh Phuoc','Tỉnh Bình Phước','Binh Phuoc Province','binh_phuoc',7,2),(46,'72','Tây Ninh','Tay Ninh','Tỉnh Tây Ninh','Tay Ninh Province','tay_ninh',7,2),(47,'74','Bình Dương','Binh Duong','Tỉnh Bình Dương','Binh Duong Province','binh_duong',7,2),(48,'75','Đồng Nai','Dong Nai','Tỉnh Đồng Nai','Dong Nai Province','dong_nai',7,2),(49,'77','Bà Rịa - Vũng Tàu','Ba Ria - Vung Tau','Tỉnh Bà Rịa - Vũng Tàu','Ba Ria - Vung Tau Province','ba_ria_vung_tau',7,2),(50,'79','Hồ Chí Minh','Ho Chi Minh','Thành phố Hồ Chí Minh','Ho Chi Minh City','ho_chi_minh',7,1),(51,'80','Long An','Long An','Tỉnh Long An','Long An Province','long_an',8,2),(52,'82','Tiền Giang','Tien Giang','Tỉnh Tiền Giang','Tien Giang Province','tien_giang',8,2),(53,'83','Bến Tre','Ben Tre','Tỉnh Bến Tre','Ben Tre Province','ben_tre',8,2),(54,'84','Trà Vinh','Tra Vinh','Tỉnh Trà Vinh','Tra Vinh Province','tra_vinh',8,2),(55,'86','Vĩnh Long','Vinh Long','Tỉnh Vĩnh Long','Vinh Long Province','vinh_long',8,2),(56,'87','Đồng Tháp','Dong Thap','Tỉnh Đồng Tháp','Dong Thap Province','dong_thap',8,2),(57,'89','An Giang','An Giang','Tỉnh An Giang','An Giang Province','an_giang',8,2),(58,'91','Kiên Giang','Kien Giang','Tỉnh Kiên Giang','Kien Giang Province','kien_giang',8,2),(59,'92','Cần Thơ','Can Tho','Thành phố Cần Thơ','Can Tho City','can_tho',8,1),(60,'93','Hậu Giang','Hau Giang','Tỉnh Hậu Giang','Hau Giang Province','hau_giang',8,2),(61,'94','Sóc Trăng','Soc Trang','Tỉnh Sóc Trăng','Soc Trang Province','soc_trang',8,2),(62,'95','Bạc Liêu','Bac Lieu','Tỉnh Bạc Liêu','Bac Lieu Province','bac_lieu',8,2),(63,'96','Cà Mau','Ca Mau','Tỉnh Cà Mau','Ca Mau Province','ca_mau',8,2);
/*!40000 ALTER TABLE `address_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_ward`
--

DROP TABLE IF EXISTS `address_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_ward` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `full_name_en` varchar(255) DEFAULT NULL,
  `code_name` varchar(255) DEFAULT NULL,
  `administrative_unit_id` bigint NOT NULL,
  `district_code_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `address_ward_administrative_unit__bf86b4d9_fk_address_a` (`administrative_unit_id`),
  KEY `address_ward_district_code_id_97c5e861_fk_address_district_code` (`district_code_id`),
  CONSTRAINT `address_ward_administrative_unit__bf86b4d9_fk_address_a` FOREIGN KEY (`administrative_unit_id`) REFERENCES `address_administrativeunit` (`id`),
  CONSTRAINT `address_ward_district_code_id_97c5e861_fk_address_district_code` FOREIGN KEY (`district_code_id`) REFERENCES `address_district` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10596 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_ward`
--

LOCK TABLES `address_ward` WRITE;
/*!40000 ALTER TABLE `address_ward` DISABLE KEYS */;
INSERT INTO `address_ward` VALUES (10536,'32107','Trần Hợi','Tran Hoi','Xã Trần Hợi','Tran Hoi Commune','tran_hoi',10,'968'),(10537,'32108','Khánh Lộc','Khanh Loc','Xã Khánh Lộc','Khanh Loc Commune','khanh_loc',10,'968'),(10538,'32110','Khánh Bình','Khanh Binh','Xã Khánh Bình','Khanh Binh Commune','khanh_binh',10,'968'),(10539,'32113','Khánh Hưng','Khanh Hung','Xã Khánh Hưng','Khanh Hung Commune','khanh_hung',10,'968'),(10540,'32116','Khánh Bình Đông','Khanh Binh Dong','Xã Khánh Bình Đông','Khanh Binh Dong Commune','khanh_binh_dong',10,'968'),(10541,'32119','Khánh Hải','Khanh Hai','Xã Khánh Hải','Khanh Hai Commune','khanh_hai',10,'968'),(10542,'32122','Lợi An','Loi An','Xã Lợi An','Loi An Commune','loi_an',10,'968'),(10543,'32124','Phong Điền','Phong Dien','Xã Phong Điền','Phong Dien Commune','phong_dien',10,'968'),(10544,'32125','Phong Lạc','Phong Lac','Xã Phong Lạc','Phong Lac Commune','phong_lac',10,'968'),(10545,'32128','Cái Nước','Cai Nuoc','Thị trấn Cái Nước','Cai Nuoc Township','cai_nuoc',9,'969'),(10546,'32130','Thạnh Phú','Thanh Phu','Xã Thạnh Phú','Thanh Phu Commune','thanh_phu',10,'969'),(10547,'32131','Lương Thế Trân','Luong The Tran','Xã Lương Thế Trân','Luong The Tran Commune','luong_the_tran',10,'969'),(10548,'32134','Phú Hưng','Phu Hung','Xã Phú Hưng','Phu Hung Commune','phu_hung',10,'969'),(10549,'32137','Tân Hưng','Tan Hung','Xã Tân Hưng','Tan Hung Commune','tan_hung',10,'969'),(10550,'32140','Hưng Mỹ','Hung My','Xã Hưng Mỹ','Hung My Commune','hung_my',10,'969'),(10551,'32141','Hoà Mỹ','Hoa My','Xã Hoà Mỹ','Hoa My Commune','hoa_my',10,'969'),(10552,'32142','Đông Hưng','Dong Hung','Xã Đông Hưng','Dong Hung Commune','dong_hung',10,'969'),(10553,'32143','Đông Thới','Dong Thoi','Xã Đông Thới','Dong Thoi Commune','dong_thoi',10,'969'),(10554,'32146','Tân Hưng Đông','Tan Hung Dong','Xã Tân Hưng Đông','Tan Hung Dong Commune','tan_hung_dong',10,'969'),(10555,'32149','Trần Thới','Tran Thoi','Xã Trần Thới','Tran Thoi Commune','tran_thoi',10,'969'),(10556,'32152','Đầm Dơi','Dam Doi','Thị trấn Đầm Dơi','Dam Doi Township','dam_doi',9,'970'),(10557,'32155','Tạ An Khương','Ta An Khuong','Xã Tạ An Khương','Ta An Khuong Commune','ta_an_khuong',10,'970'),(10558,'32158','Tạ An Khương Đông','Ta An Khuong Dong','Xã Tạ An Khương Đông','Ta An Khuong Dong Commune','ta_an_khuong_dong',10,'970'),(10559,'32161','Trần Phán','Tran Phan','Xã Trần Phán','Tran Phan Commune','tran_phan',10,'970'),(10560,'32162','Tân Trung','Tan Trung','Xã Tân Trung','Tan Trung Commune','tan_trung',10,'970'),(10561,'32164','Tân Đức','Tan Duc','Xã Tân Đức','Tan Duc Commune','tan_duc',10,'970'),(10562,'32167','Tân Thuận','Tan Thuan','Xã Tân Thuận','Tan Thuan Commune','tan_thuan',10,'970'),(10563,'32170','Tạ An Khương Nam','Ta An Khuong Nam','Xã Tạ An Khương Nam','Ta An Khuong Nam Commune','ta_an_khuong_nam',10,'970'),(10564,'32173','Tân Duyệt','Tan Duyet','Xã Tân Duyệt','Tan Duyet Commune','tan_duyet',10,'970'),(10565,'32174','Tân Dân','Tan Dan','Xã Tân Dân','Tan Dan Commune','tan_dan',10,'970'),(10566,'32176','Tân Tiến','Tan Tien','Xã Tân Tiến','Tan Tien Commune','tan_tien',10,'970'),(10567,'32179','Quách Phẩm Bắc','Quach Pham Bac','Xã Quách Phẩm Bắc','Quach Pham Bac Commune','quach_pham_bac',10,'970'),(10568,'32182','Quách Phẩm','Quach Pham','Xã Quách Phẩm','Quach Pham Commune','quach_pham',10,'970'),(10569,'32185','Thanh Tùng','Thanh Tung','Xã Thanh Tùng','Thanh Tung Commune','thanh_tung',10,'970'),(10570,'32186','Ngọc Chánh','Ngoc Chanh','Xã Ngọc Chánh','Ngoc Chanh Commune','ngoc_chanh',10,'970'),(10571,'32188','Nguyễn Huân','Nguyen Huan','Xã Nguyễn Huân','Nguyen Huan Commune','nguyen_huan',10,'970'),(10572,'32191','Năm Căn','Nam Can','Thị trấn Năm Căn','Nam Can Township','nam_can',9,'971'),(10573,'32194','Hàm Rồng','Ham Rong','Xã Hàm Rồng','Ham Rong Commune','ham_rong',10,'971'),(10574,'32197','Hiệp Tùng','Hiep Tung','Xã Hiệp Tùng','Hiep Tung Commune','hiep_tung',10,'971'),(10575,'32200','Đất Mới','Dat Moi','Xã Đất Mới','Dat Moi Commune','dat_moi',10,'971'),(10576,'32201','Lâm Hải','Lam Hai','Xã Lâm Hải','Lam Hai Commune','lam_hai',10,'971'),(10577,'32203','Hàng Vịnh','Hang Vinh','Xã Hàng Vịnh','Hang Vinh Commune','hang_vinh',10,'971'),(10578,'32206','Tam Giang','Tam Giang','Xã Tam Giang','Tam Giang Commune','tam_giang',10,'971'),(10579,'32209','Tam Giang Đông','Tam Giang Dong','Xã Tam Giang Đông','Tam Giang Dong Commune','tam_giang_dong',10,'971'),(10580,'32212','Cái Đôi Vàm','Cai Doi Vam','Thị trấn Cái Đôi Vàm','Cai Doi Vam Township','cai_doi_vam',9,'972'),(10581,'32214','Phú Thuận','Phu Thuan','Xã Phú Thuận','Phu Thuan Commune','phu_thuan',10,'972'),(10582,'32215','Phú Mỹ','Phu My','Xã Phú Mỹ','Phu My Commune','phu_my',10,'972'),(10583,'32218','Phú Tân','Phu Tan','Xã Phú Tân','Phu Tan Commune','phu_tan',10,'972'),(10584,'32221','Tân Hải','Tan Hai','Xã Tân Hải','Tan Hai Commune','tan_hai',10,'972'),(10585,'32224','Việt Thắng','Viet Thang','Xã Việt Thắng','Viet Thang Commune','viet_thang',10,'972'),(10586,'32227','Tân Hưng Tây','Tan Hung Tay','Xã Tân Hưng Tây','Tan Hung Tay Commune','tan_hung_tay',10,'972'),(10587,'32228','Rạch Chèo','Rach Cheo','Xã Rạch Chèo','Rach Cheo Commune','rach_cheo',10,'972'),(10588,'32230','Nguyễn Việt Khái','Nguyen Viet Khai','Xã Nguyễn Việt Khái','Nguyen Viet Khai Commune','nguyen_viet_khai',10,'972'),(10589,'32233','Tam Giang Tây','Tam Giang Tay','Xã Tam Giang Tây','Tam Giang Tay Commune','tam_giang_tay',10,'973'),(10590,'32236','Tân Ân Tây','Tan An Tay','Xã Tân Ân Tây','Tan An Tay Commune','tan_an_tay',10,'973'),(10591,'32239','Viên An Đông','Vien An Dong','Xã Viên An Đông','Vien An Dong Commune','vien_an_dong',10,'973'),(10592,'32242','Viên An','Vien An','Xã Viên An','Vien An Commune','vien_an',10,'973'),(10593,'32244','Rạch Gốc','Rach Goc','Thị trấn Rạch Gốc','Rach Goc Township','rach_goc',9,'973'),(10594,'32245','Tân Ân','Tan An','Xã Tân Ân','Tan An Commune','tan_an',10,'973'),(10595,'32248','Đất Mũi','Dat Mui','Xã Đất Mũi','Dat Mui Commune','dat_mui',10,'973');
/*!40000 ALTER TABLE `address_ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add administrative region',6,'add_administrativeregion'),(22,'Can change administrative region',6,'change_administrativeregion'),(23,'Can delete administrative region',6,'delete_administrativeregion'),(24,'Can view administrative region',6,'view_administrativeregion'),(25,'Can add administrative unit',7,'add_administrativeunit'),(26,'Can change administrative unit',7,'change_administrativeunit'),(27,'Can delete administrative unit',7,'delete_administrativeunit'),(28,'Can view administrative unit',7,'view_administrativeunit'),(29,'Can add province',8,'add_province'),(30,'Can change province',8,'change_province'),(31,'Can delete province',8,'delete_province'),(32,'Can view province',8,'view_province'),(33,'Can add district',9,'add_district'),(34,'Can change district',9,'change_district'),(35,'Can delete district',9,'delete_district'),(36,'Can view district',9,'view_district'),(37,'Can add ward',10,'add_ward'),(38,'Can change ward',10,'change_ward'),(39,'Can delete ward',10,'delete_ward'),(40,'Can view ward',10,'view_ward'),(41,'Can add citizen identification',11,'add_citizenidentification'),(42,'Can change citizen identification',11,'change_citizenidentification'),(43,'Can delete citizen identification',11,'delete_citizenidentification'),(44,'Can view citizen identification',11,'view_citizenidentification'),(45,'Can add status',12,'add_status'),(46,'Can change status',12,'change_status'),(47,'Can delete status',12,'delete_status'),(48,'Can view status',12,'view_status'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add admin',14,'add_admin'),(54,'Can change admin',14,'change_admin'),(55,'Can delete admin',14,'delete_admin'),(56,'Can view admin',14,'view_admin'),(57,'Can add representative unit',15,'add_representativeunit'),(58,'Can change representative unit',15,'change_representativeunit'),(59,'Can delete representative unit',15,'delete_representativeunit'),(60,'Can view representative unit',15,'view_representativeunit'),(61,'Can add employee',16,'add_employee'),(62,'Can change employee',16,'change_employee'),(63,'Can delete employee',16,'delete_employee'),(64,'Can view employee',16,'view_employee'),(65,'Can add driver',17,'add_driver'),(66,'Can change driver',17,'change_driver'),(67,'Can delete driver',17,'delete_driver'),(68,'Can view driver',17,'view_driver'),(69,'Can add customer',18,'add_customer'),(70,'Can change customer',18,'change_customer'),(71,'Can delete customer',18,'delete_customer'),(72,'Can view customer',18,'view_customer'),(73,'Can add student',19,'add_student'),(74,'Can change student',19,'change_student'),(75,'Can delete student',19,'delete_student'),(76,'Can view student',19,'view_student'),(77,'Can add route',20,'add_route'),(78,'Can change route',20,'change_route'),(79,'Can delete route',20,'delete_route'),(80,'Can view route',20,'view_route'),(81,'Can add time package',21,'add_timepackage'),(82,'Can change time package',21,'change_timepackage'),(83,'Can delete time package',21,'delete_timepackage'),(84,'Can view time package',21,'view_timepackage'),(85,'Can add vehicle',22,'add_vehicle'),(86,'Can change vehicle',22,'change_vehicle'),(87,'Can delete vehicle',22,'delete_vehicle'),(88,'Can view vehicle',22,'view_vehicle'),(89,'Can add schedule',23,'add_schedule'),(90,'Can change schedule',23,'change_schedule'),(91,'Can delete schedule',23,'delete_schedule'),(92,'Can view schedule',23,'view_schedule'),(93,'Can add station',24,'add_station'),(94,'Can change station',24,'change_station'),(95,'Can delete station',24,'delete_station'),(96,'Can view station',24,'view_station'),(97,'Can add trip detail',25,'add_tripdetail'),(98,'Can change trip detail',25,'change_tripdetail'),(99,'Can delete trip detail',25,'delete_tripdetail'),(100,'Can view trip detail',25,'view_tripdetail'),(101,'Can add student status',26,'add_studentstatus'),(102,'Can change student status',26,'change_studentstatus'),(103,'Can delete student status',26,'delete_studentstatus'),(104,'Can view student status',26,'view_studentstatus'),(105,'Can add attendance',27,'add_attendance'),(106,'Can change attendance',27,'change_attendance'),(107,'Can delete attendance',27,'delete_attendance'),(108,'Can view attendance',27,'view_attendance'),(109,'Can add location',28,'add_location'),(110,'Can change location',28,'change_location'),(111,'Can delete location',28,'delete_location'),(112,'Can view location',28,'view_location'),(113,'Can add route detail',29,'add_routedetail'),(114,'Can change route detail',29,'change_routedetail'),(115,'Can delete route detail',29,'delete_routedetail'),(116,'Can view route detail',29,'view_routedetail'),(117,'Can add student trip',30,'add_studenttrip'),(118,'Can change student trip',30,'change_studenttrip'),(119,'Can delete student trip',30,'delete_studenttrip'),(120,'Can view student trip',30,'view_studenttrip'),(121,'Can add notification',31,'add_notification'),(122,'Can change notification',31,'change_notification'),(123,'Can delete notification',31,'delete_notification'),(124,'Can view notification',31,'view_notification'),(125,'Can add payment method',32,'add_paymentmethod'),(126,'Can change payment method',32,'change_paymentmethod'),(127,'Can delete payment method',32,'delete_paymentmethod'),(128,'Can view payment method',32,'view_paymentmethod'),(129,'Can add payment list',33,'add_paymentlist'),(130,'Can change payment list',33,'change_paymentlist'),(131,'Can delete payment list',33,'delete_paymentlist'),(132,'Can view payment list',33,'view_paymentlist'),(133,'Can add order',34,'add_order'),(134,'Can change order',34,'change_order'),(135,'Can delete order',34,'delete_order'),(136,'Can view order',34,'view_order'),(137,'Can add order detail',35,'add_orderdetail'),(138,'Can change order detail',35,'change_orderdetail'),(139,'Can delete order detail',35,'delete_orderdetail'),(140,'Can view order detail',35,'view_orderdetail'),(141,'Can add order status',36,'add_orderstatus'),(142,'Can change order status',36,'change_orderstatus'),(143,'Can delete order status',36,'delete_orderstatus'),(144,'Can view order status',36,'view_orderstatus'),(145,'Can add transaction',37,'add_transaction'),(146,'Can change transaction',37,'change_transaction'),(147,'Can delete transaction',37,'delete_transaction'),(148,'Can view transaction',37,'view_transaction'),(149,'Can add PayPal IPN',38,'add_paypalipn'),(150,'Can change PayPal IPN',38,'change_paypalipn'),(151,'Can delete PayPal IPN',38,'delete_paypalipn'),(152,'Can view PayPal IPN',38,'view_paypalipn');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-21 10:07:26.641317','1','RepresentativeUnit object (1)',1,'[{\"added\": {}}]',15,1),(2,'2024-05-21 10:07:35.390010','1','CitizenIdentification object (1)',1,'[{\"added\": {}}]',11,1),(3,'2024-05-21 10:09:12.883139','2','Nguyen Duc Phuc Dai',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Address\", \"Address2\", \"Representative unit\", \"Citizen identification\", \"Date of birth\"]}}]',18,1),(4,'2024-05-22 23:23:47.605180','4','Route object (4)',3,'',20,1),(5,'2024-05-22 23:23:47.608900','3','Route object (3)',3,'',20,1),(6,'2024-05-22 23:55:38.986971','1','RouteDetail object (1)',3,'',29,1),(7,'2024-05-23 09:47:04.769343','4','Nguyen Duc Phuc Dai',3,'',13,1),(8,'2024-05-23 09:47:04.773125','3','Nguyen Duc Phuc Dai',3,'',13,1),(9,'2024-05-23 09:47:13.392758','2','Nguyen Duc Phuc Dai',3,'',13,1),(10,'2024-05-23 09:47:30.776637','5','Nguyen Duc Phuc Dai',1,'[{\"added\": {}}]',13,1),(11,'2024-05-23 09:47:46.055043','5','Nguyen Duc Phuc Dai',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',13,1),(12,'2024-05-23 09:48:06.173412','6','Nguyen Duc Phuc Dai',1,'[{\"added\": {}}]',13,1),(13,'2024-05-23 09:48:16.501886','7','Nguyen Duc Phuc Dai',1,'[{\"added\": {}}]',13,1),(14,'2024-05-23 09:48:37.841250','5','Khach Hang',2,'[{\"changed\": {\"fields\": [\"Full name\"]}}]',13,1),(15,'2024-05-23 09:48:43.711132','6','Tai xe',2,'[{\"changed\": {\"fields\": [\"Full name\"]}}]',13,1),(16,'2024-05-23 09:48:49.935843','7','Nhan vien',2,'[{\"changed\": {\"fields\": [\"Full name\"]}}]',13,1),(17,'2024-05-23 09:49:21.244148','4','Khach Hang',1,'[{\"added\": {}}]',18,1),(18,'2024-05-23 09:49:46.009056','5','Tai xe',1,'[{\"added\": {}}]',18,1),(19,'2024-05-23 09:50:02.290188','6','Nhan vien',1,'[{\"added\": {}}]',18,1),(20,'2024-05-23 09:50:19.824715','6','Nhan vien',3,'',18,1),(21,'2024-05-23 09:50:19.827707','5','Tai xe',3,'',18,1),(22,'2024-05-23 09:50:38.302211','1','Tai xe',1,'[{\"added\": {}}]',17,1),(23,'2024-05-23 09:50:56.198771','1','Nhan vien',1,'[{\"added\": {}}]',16,1),(24,'2024-05-23 12:40:16.281452','10','Khach Hang',3,'',34,1),(25,'2024-05-23 12:40:16.284490','9','Khach Hang',3,'',34,1),(26,'2024-05-23 12:40:16.286894','8','Khach Hang',3,'',34,1),(27,'2024-05-23 12:40:16.290035','7','Khach Hang',3,'',34,1),(28,'2024-05-23 12:40:16.293325','6','Khach Hang',3,'',34,1),(29,'2024-05-23 12:40:16.296080','5','Khach Hang',3,'',34,1),(30,'2024-05-23 12:40:16.298764','4','Khach Hang',3,'',34,1),(31,'2024-05-23 12:40:16.301438','3','Khach Hang',3,'',34,1),(32,'2024-05-23 12:40:16.303599','2','Khach Hang',3,'',34,1),(33,'2024-05-23 12:40:16.309980','1','Khach Hang',3,'',34,1),(34,'2024-05-23 12:40:22.398708','10','OrderDetail object (10)',3,'',35,1),(35,'2024-05-23 12:40:22.401690','9','OrderDetail object (9)',3,'',35,1),(36,'2024-05-23 12:40:22.404561','8','OrderDetail object (8)',3,'',35,1),(37,'2024-05-23 12:40:22.407776','7','OrderDetail object (7)',3,'',35,1),(38,'2024-05-23 12:40:22.410665','6','OrderDetail object (6)',3,'',35,1),(39,'2024-05-23 12:40:22.412871','5','OrderDetail object (5)',3,'',35,1),(40,'2024-05-23 12:40:22.415503','4','OrderDetail object (4)',3,'',35,1),(41,'2024-05-23 12:40:22.417732','3','OrderDetail object (3)',3,'',35,1),(42,'2024-05-23 12:40:22.419734','2','OrderDetail object (2)',3,'',35,1),(43,'2024-05-23 12:40:22.422215','1','OrderDetail object (1)',3,'',35,1),(44,'2024-05-23 13:31:08.737949','1','StudentTrip object (1)',3,'',30,1),(45,'2024-05-23 15:43:31.095763','2','TripDetail object (2)',3,'',25,1),(46,'2024-05-23 15:43:31.099451','1','TripDetail object (1)',3,'',25,1),(47,'2024-05-27 14:11:18.408382','2','',3,'',16,1),(48,'2024-05-27 14:11:23.463096','10','Nguyen Duc Phuc Dai',3,'',13,1),(49,'2024-05-27 14:16:33.641982','12','Nguyen Duc Phuc Dai',3,'',13,1),(50,'2024-05-27 22:01:58.436004','4','TripDetail object (4)',2,'[{\"changed\": {\"fields\": [\"End time\", \"Status\"]}}]',25,1),(51,'2024-05-27 22:02:02.557681','4','TripDetail object (4)',2,'[]',25,1),(52,'2024-05-27 22:02:05.117188','4','TripDetail object (4)',2,'[]',25,1),(53,'2024-05-27 22:02:09.455410','5','TripDetail object (5)',2,'[{\"changed\": {\"fields\": [\"End time\", \"Status\"]}}]',25,1),(54,'2024-05-27 22:14:07.333445','5','TripDetail object (5)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(55,'2024-05-27 23:21:41.487913','13','Nguyen Duc Phuc Dai',3,'',13,1),(56,'2024-05-27 23:21:41.494402','11','Nguyen Duc Phuc Dai',3,'',13,1),(57,'2024-05-27 23:21:41.497353','9','Nguyen Duc Phuc Dai',3,'',13,1),(58,'2024-05-27 23:21:41.501498','8','Test',3,'',13,1),(59,'2024-05-27 23:21:41.504535','7','Nhan vien',3,'',13,1),(60,'2024-05-27 23:21:41.508229','6','Tai xe',3,'',13,1),(61,'2024-05-27 23:21:41.511066','5','Khách Hàng 1',3,'',13,1),(62,'2024-05-27 23:21:46.106427','1','Phúc Đại',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',13,1),(63,'2024-05-27 23:26:02.896888','15','Nhân viên abc',1,'[{\"added\": {}}]',13,1),(64,'2024-05-27 23:26:06.825493','14','Khách hàng abc',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',13,1),(65,'2024-05-27 23:28:27.252120','4','Nhân viên abc',1,'[{\"added\": {}}]',16,1),(66,'2024-05-27 23:29:44.553892','4','Nhân viên abc',3,'',16,1),(67,'2024-05-27 23:31:10.778572','5','Nhân viên abc',1,'[{\"added\": {}}]',16,1),(68,'2024-05-27 23:31:46.281798','16','Tài xế abc',1,'[{\"added\": {}}]',13,1),(69,'2024-05-27 23:32:24.249358','3','Tài xế abc',1,'[{\"added\": {}}]',17,1),(70,'2024-05-28 01:08:20.319967','21','Khách hàng abc',3,'',34,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'account','admin'),(11,'account','citizenidentification'),(18,'account','customer'),(17,'account','driver'),(16,'account','employee'),(15,'account','representativeunit'),(12,'account','status'),(19,'account','student'),(13,'account','user'),(6,'address','administrativeregion'),(7,'address','administrativeunit'),(9,'address','district'),(8,'address','province'),(10,'address','ward'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(38,'ipn','paypalipn'),(31,'notification','notification'),(34,'order','order'),(35,'order','orderdetail'),(36,'order','orderstatus'),(37,'order','transaction'),(33,'payment','paymentlist'),(32,'payment','paymentmethod'),(27,'service','attendance'),(28,'service','location'),(20,'service','route'),(29,'service','routedetail'),(23,'service','schedule'),(24,'service','station'),(26,'service','studentstatus'),(30,'service','studenttrip'),(21,'service','timepackage'),(25,'service','tripdetail'),(22,'service','vehicle'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-20 04:21:27.667724'),(2,'contenttypes','0002_remove_content_type_name','2024-05-20 04:21:27.729831'),(3,'auth','0001_initial','2024-05-20 04:21:27.978008'),(4,'auth','0002_alter_permission_name_max_length','2024-05-20 04:21:28.042789'),(5,'auth','0003_alter_user_email_max_length','2024-05-20 04:21:28.048365'),(6,'auth','0004_alter_user_username_opts','2024-05-20 04:21:28.054486'),(7,'auth','0005_alter_user_last_login_null','2024-05-20 04:21:28.060189'),(8,'auth','0006_require_contenttypes_0002','2024-05-20 04:21:28.063869'),(9,'auth','0007_alter_validators_add_error_messages','2024-05-20 04:21:28.069798'),(10,'auth','0008_alter_user_username_max_length','2024-05-20 04:21:28.075556'),(11,'auth','0009_alter_user_last_name_max_length','2024-05-20 04:21:28.082543'),(12,'auth','0010_alter_group_name_max_length','2024-05-20 04:21:28.097707'),(13,'auth','0011_update_proxy_permissions','2024-05-20 04:21:28.105173'),(14,'auth','0012_alter_user_first_name_max_length','2024-05-20 04:21:28.109896'),(15,'address','0001_initial','2024-05-20 04:21:28.667034'),(16,'account','0001_initial','2024-05-20 04:21:30.222689'),(17,'admin','0001_initial','2024-05-20 04:21:30.362322'),(18,'admin','0002_logentry_remove_auto_add','2024-05-20 04:21:30.372008'),(19,'admin','0003_logentry_add_action_flag_choices','2024-05-20 04:21:30.388037'),(20,'notification','0001_initial','2024-05-20 04:21:30.613821'),(21,'service','0001_initial','2024-05-20 04:21:32.274448'),(22,'payment','0001_initial','2024-05-20 04:21:32.376475'),(23,'order','0001_initial','2024-05-20 04:21:33.117788'),(24,'sessions','0001_initial','2024-05-20 04:21:33.151923'),(25,'service','0002_alter_vehicle_vehicle_type','2024-05-22 07:59:44.705544'),(26,'service','0003_remove_vehicle_seats_alter_vehicle_vehicle_type','2024-05-22 08:06:31.989105'),(27,'service','0004_remove_station_address_remove_station_address2','2024-05-22 10:11:12.713051'),(28,'service','0005_alter_route_unique_together','2024-05-22 23:19:54.090385'),(29,'service','0006_alter_route_unique_together','2024-05-22 23:23:39.708985'),(30,'ipn','0001_initial','2024-05-23 02:32:21.670183'),(31,'ipn','0002_paypalipn_mp_id','2024-05-23 02:32:21.715647'),(32,'ipn','0003_auto_20141117_1647','2024-05-23 02:32:21.875135'),(33,'ipn','0004_auto_20150612_1826','2024-05-23 02:32:23.971909'),(34,'ipn','0005_auto_20151217_0948','2024-05-23 02:32:24.046752'),(35,'ipn','0006_auto_20160108_1112','2024-05-23 02:32:24.186385'),(36,'ipn','0007_auto_20160219_1135','2024-05-23 02:32:24.200090'),(37,'ipn','0008_auto_20181128_1032','2024-05-23 02:32:24.211101'),(38,'ipn','0009_alter_paypalipn_id','2024-05-23 02:32:24.312101'),(39,'service','0007_remove_schedule_estimated_time_schedule_pickup_time','2024-05-23 07:56:35.983376'),(40,'order','0002_alter_orderdetail_time_package','2024-05-23 08:15:36.649475'),(41,'order','0003_alter_order_payment_method','2024-05-23 10:56:28.185163'),(42,'payment','0002_alter_paymentlist_payment_method_and_more','2024-05-23 10:56:28.313722'),(43,'service','0008_alter_schedule_end_day','2024-05-23 10:56:28.410550'),(44,'notification','0002_alter_notification_status','2024-05-23 11:52:50.399540'),(45,'order','0004_alter_orderdetail_status_alter_orderstatus_status_and_more','2024-05-23 11:52:50.748925'),(46,'service','0009_alter_studentstatus_status_alter_studenttrip_status_and_more','2024-05-23 11:52:51.125447'),(47,'order','0005_alter_orderstatus_admin','2024-05-23 11:58:28.793310'),(48,'order','0006_order_payment_id','2024-05-23 12:17:32.094658'),(49,'notification','0003_alter_notification_status','2024-05-23 12:39:50.106256'),(50,'order','0007_orderdetail_order_alter_orderdetail_status_and_more','2024-05-23 12:39:50.221604'),(51,'service','0010_alter_studentstatus_status_alter_studenttrip_status_and_more','2024-05-23 12:39:50.247554'),(52,'service','0011_alter_studenttrip_notification_and_more','2024-05-23 13:27:17.686831'),(53,'service','0012_alter_tripdetail_end_time','2024-05-23 15:42:13.708951'),(54,'service','0013_alter_attendance_unique_together','2024-05-23 16:55:40.583020'),(55,'service','0014_alter_schedule_distance','2024-05-23 17:40:59.892501'),(56,'account','0002_alter_employee_citizen_identification','2024-05-27 14:09:08.528292'),(57,'account','0003_alter_driver_citizen_identification','2024-05-27 14:14:58.621825'),(58,'account','0004_remove_driver_representative_unit_and_more','2024-05-27 23:30:06.846058'),(59,'notification','0004_alter_notification_status','2024-05-27 23:30:06.856957'),(60,'order','0008_alter_orderdetail_status_alter_orderstatus_status_and_more','2024-05-27 23:30:06.881960'),(61,'service','0015_alter_studentstatus_status_alter_studenttrip_status_and_more','2024-05-27 23:30:06.908586');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('06zgq60p6bk0iz7rjun9hu4sn3f7d6em','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1s9MDx:iDXkk0inGYikfRuGAgyza2lUqW-cyaL_P4RQUKYYbt8','2024-06-04 09:56:01.007157'),('128tjz3bu1hv46oulzaq7qcjxx56tj0l','.eJxVjEEOwiAQRe_C2jQFSqe40xN4A_I7nQZiAonQlfHutkkXun3v_f9WAVuLYavyCmlRV-XU5ZfN4KfkQ4C5bLl1J6ndI5Yst72U3BKjpZLvZ_13EVHjsafFEXjAqGFktPA0wPTW6XV1dsLsicgyJvIsIppn63u7u36BN-OkPl-fbzlR:1sA7cA:0HzzNSUScXSbWebEPHU2ltzgVAX-SFECxljyonkIZRg','2024-06-06 12:32:10.586671'),('14twqnbj3bmo3ksgxdodmqrdf0gyfu6r','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1s9hPP:m-fzlzqIYZYAwl1TavDULchr2oRLmu4dgzLCDclGVqY','2024-06-05 08:33:15.886845'),('1t07ktm3k5s6lgphm5z6rmmjt95qym3l','.eJxVjEEOwiAQRe_C2jQFSqe40xN4A_I7nQZiAonQlfHutkkXun3v_f9WAVuLYavyCmlRV-XU5ZfN4KfkQ4C5bLl1J6ndI5Yst72U3BKjpZLvZ_13EVHjsafFEXjAqGFktPA0wPTW6XV1dsLsicgyJvIsIppn63u7u36BN-OkPl-fbzlR:1sACju:mZnNgrHZZ1skp2FsBuf6KpLcPD0Uehl5FXSJyqdZGFk','2024-06-06 18:00:30.029024'),('5zzcfnlpsga1k7gdba74u361clzs23gh','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1s9jkd:qMQg6otuQpuA9L3ijkOR_DLQKt5A6PWYDje_BYaPIcc','2024-06-05 11:03:19.957201'),('7ms6pypol1qunc5w2vvrvd7tmyeplwel','.eJxVjEEOwiAQRe_C2jSlFAbc6Qm8AfkdpqExoYmFlfHutkkXun3v_f9WEa3m2DZ5xSWpq3Lq8ssm8FPKIcC8tlK7k2zdI69FbnsppS6MuqzlftZ_FxlbPvaULIFHOI1BnEGgEUNvrJ5nazymQESG4SmwiGieTOjN7vqEMDivPl-gCjlS:1sAHzC:yQa-cHjAP9kyQ8YTvKAtiwgr-fsdqWZRCopvuOu7mIw','2024-06-06 23:36:38.068058'),('958utbgnk3s22w3tkydtwteeyiyzccz6','.eJxVjEEOwiAQRe_C2jQFSqe40xN4A_I7nQZiAonQlfHutkkXun3v_f9WAVuLYavyCmlRV-XU5ZfN4KfkQ4C5bLl1J6ndI5Yst72U3BKjpZLvZ_13EVHjsafFEXjAqGFktPA0wPTW6XV1dsLsicgyJvIsIppn63u7u36BN-OkPl-fbzlR:1sBVOC:2snpNOm4BCkgH-32oo5FB74qoiVplPoUsvL_hgQHGDk','2024-06-10 08:07:28.958229'),('anepx6nqnpp6zpx7aguzr4itymfe3jmo','.eJxVjEEOwiAQRe_C2jSFzpTWnT2BNyDDMARiAomFlfHu1qQL3b7_3n8pR70l13d5uhzUVWlUl1_oiR9Svgsx117acJJ9uKda5HaYUlpmarmW7bT_LhLt6eht0HpcxIIGErBCxqCgj5MVE4ADe7MASpgM0so2GBxnngGRYhSIq3p_AL5bOa4:1sBn4x:rU0PooWSkJqjcyPry6IJgW77ujB_VHek7ifDC1yVDTc','2024-06-11 03:00:47.768524'),('eschorlyko3iwnkrydzk7gj3qxkib90b','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1sBb2X:7djbpdc3n6MSGx8vOIee-YsMzA1YtgGAMuuZLnCFtVI','2024-06-10 14:09:29.388629'),('estkaeez660jr3cykfxe83jqf3h1p3mi','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1sBlJp:vlL-INNt0KFRASUPDjYMn04VESLjbRuhIRZJOXAv338','2024-06-11 01:08:01.771730'),('et5w6bdl6d57ohuoskkrt1uzdrakqpku','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1s9gYI:AWqjErgmoYkWK3pzmHSjCGJDibtUrtH6p5hZGuMz5_0','2024-06-05 07:38:22.104940'),('fkv5cz7dij2069l1bmh4zbjogpckvc6d','.eJxVjEEKwyAQRe_iuoQxozHTXXuC3iCMZkApKFRdhd69FrJot--9_w-1cW9x61VeW9rVVaG6_DLP4Sn5KziE0nObTlKnRyxZbqOU3FLglkq-n_XfReQax37ZaQYGcd6vgLM4MpaM10SGaQhCXJwYK7SiXqwBD-g0WAFkEjTq_QFlCDdo:1s9gV5:08X5oufpxQtt1775V8L05mBVyu-u1D2YjVQx1BjYyU0','2024-06-05 07:35:03.611556'),('m8azldxllw4fgx8tqzsov0eg8mezg76m','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1s9gg6:-TrUwsgXEG9KKQfIxJYy2CTwG08E743tVkCaR59QBdg','2024-06-05 07:46:26.925560'),('nkzug2a9o6j7qfqf38eqkjrnjdmdgqrc','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1s9gWW:r7gP-5AjMtTSy4arMd52LwLSK-2ZA2yxjKI4J6TcQHg','2024-06-05 07:36:32.648338'),('nomww5zyr6vz3svx29p3ey1ffbxoz76a','.eJxVjEEOwiAQRe_C2jSllA640xN4A_IZpqExoYmFlfHutkkXun3v_f9WAa3m0DZ5hSWpq9Lq8ssi-CnlEGBeW6ndSbbukdcit72UUhdGXdZyP-u_i4wtH3tKlsAjJo1BJgNPI4beWD3P1jhET0SG4ciziGiOxvdmd32CHyanPl-dAzlN:1s9vE4:WFWj27p7JL2TEME8ZlhRC7ebryZYv96RON7SgUGj508','2024-06-05 23:18:28.313459'),('ns4e48q0mllo0nnisj0m3t1mu2sq783h','.eJxVjEEOwiAQRe_C2jQFSqe40xN4A_I7nQZiAonQlfHutkkXun3v_f9WAVuLYavyCmlRV-XU5ZfN4KfkQ4C5bLl1J6ndI5Yst72U3BKjpZLvZ_13EVHjsafFEXjAqGFktPA0wPTW6XV1dsLsicgyJvIsIppn63u7u36BN-OkPl-fbzlR:1sA75w:pb5-ZWEXHND-SQoXsAcALeyKPxCMnXvIlOiXSmuIwtU','2024-06-06 11:58:52.821418'),('p6pyv8z0a9t3t9ka4m89ehlz4gvxx4t5','.eJxVjEEKwyAQRe_iuoQxozHTXXuC3iCMZkApKFRdhd69FrJot--9_w-1cW9x61VeW9rVVaG6_DLP4Sn5KziE0nObTlKnRyxZbqOU3FLglkq-n_XfReQax37ZaQYGcd6vgLM4MpaM10SGaQhCXJwYK7SiXqwBD-g0WAFkEjTq_QFlCDdo:1s9MAI:-rSizHSjV9RX-hY_FgqqQCDrV7QoeNlAbJBMVmcuig4','2024-06-04 09:52:14.161145'),('qhkiz9awcm4kxogyjzavza4y4h5lqxt1','.eJxVjEEKwyAQRe_iuoQxozHTXXuC3iCMZkApKFRdhd69FrJot--9_w-1cW9x61VeW9rVVaG6_DLP4Sn5KziE0nObTlKnRyxZbqOU3FLglkq-n_XfReQax37ZaQYGcd6vgLM4MpaM10SGaQhCXJwYK7SiXqwBD-g0WAFkEjTq_QFlCDdo:1s9cti:xXFXe_Jc9unAmtSJQXngUDxcJx1kAZtl5LVcLHY1CrM','2024-06-05 03:44:14.305063'),('tzdwej0euy1dx7zxt66j3an9cm7ystza','.eJxVjEEOwiAQRe_C2jSFzpTWnT2BNyDDMARiAomFlfHu1qQL3b7_3n8pR70l13d5uhzUVWlQl1_oiR9Svgsx117acJJ9uKda5HaYUlpmarmW7bT_LhLt6eht0HpcxIIGErBCxqCgj5MVE4ADe7MASpgM0so2GBxnngGRYhSIq3p_AL3AOa0:1sBlBx:YXASB85yddsgj8Wlm73weuZco2CgJQOGN4SavX9mqD4','2024-06-11 00:59:53.663214'),('ujf1mlu4ej8o1l7ski3dtxs56lkvg4mk','.eJxVjEEKwyAQRe_iuoQxozHTXXuC3iCMZkApKFRdhd69FrJot--9_w-1cW9x61VeW9rVVaG6_DLP4Sn5KziE0nObTlKnRyxZbqOU3FLglkq-n_XfReQax37ZaQYGcd6vgLM4MpaM10SGaQhCXJwYK7SiXqwBD-g0WAFkEjTq_QFlCDdo:1s9cpy:oZs40Pepe_tOkPL5-o7uS4ceGllJi7qXITiu97d4zJU','2024-06-05 03:40:22.987840'),('w1rn2sv2cw0xyd8h9oowkgkksxqnu0z8','.eJxVjEEOwiAQRe_C2jQFSqe40xN4A_I7nQZiAonQlfHutkkXun3v_f9WAVuLYavyCmlRV-XU5ZfN4KfkQ4C5bLl1J6ndI5Yst72U3BKjpZLvZ_13EVHjsafFEXjAqGFktPA0wPTW6XV1dsLsicgyJvIsIppn63u7u36BN-OkPl-fbzlR:1sA7B5:C4UjRuEV2yNfric7kjuOhy0HnhZvHZQQn3U-ozMO6RE','2024-06-06 12:04:11.665371'),('w7fa1m2z7heuht5owu8kq9cdag172xjp','.eJxVjEsKAyEQBe_iOgz-ehyzS06QG4jaLUpAIeoq5O6ZgVkk23r16s2cnyO72enlCrIr0-zyy4KPT6rH4GNss47lJH155FbptptUR4l-lFbvp_2XyL7n408JzKZNxL2AYG2QAFKKJDCsehUKOHriiQLKYIwi2pIBlFZHxZGQfb62JDoK:1s9c2k:o32v-T6Vhgi8cETCAofQCXsxa5pUmUO3PZDr5RdG5Z0','2024-06-05 02:49:30.793207');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_notification`
--

DROP TABLE IF EXISTS `notification_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_notification`
--

LOCK TABLES `notification_notification` WRITE;
/*!40000 ALTER TABLE `notification_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_notification_user`
--

DROP TABLE IF EXISTS `notification_notification_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_notification_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_notificatio_notification_id_user_id_335f2fd4_uniq` (`notification_id`,`user_id`),
  KEY `notification_notific_user_id_9b9bccea_fk_account_u` (`user_id`),
  CONSTRAINT `notification_notific_notification_id_64d54954_fk_notificat` FOREIGN KEY (`notification_id`) REFERENCES `notification_notification` (`id`),
  CONSTRAINT `notification_notific_user_id_9b9bccea_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_notification_user`
--

LOCK TABLES `notification_notification_user` WRITE;
/*!40000 ALTER TABLE `notification_notification_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_notification_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `total_price` double NOT NULL,
  `customer_id` bigint NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_customer_id_5bbbd957_fk_account_customer_id` (`customer_id`),
  CONSTRAINT `order_order_customer_id_5bbbd957_fk_account_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `account_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (20,'2024-05-27 23:33:16.664608','2024-05-27 23:34:10.249867','2024-05-27 23:33:16.664640',240,8,'paypal','PAYID-MZKRQPQ8800188782832730H'),(22,'2024-05-28 02:09:46.954993','2024-05-28 02:09:49.102464','2024-05-28 02:09:46.955080',75.6,8,'paypal','PAYID-MZKTZ3I0MR0787339920294L'),(23,'2024-05-28 02:56:35.536058','2024-05-28 02:56:36.764379','2024-05-28 02:56:35.536089',151.2,9,'paypal','PAYID-MZKUPZI6JC77301680662442'),(24,'2024-05-28 02:56:53.568805','2024-05-28 02:56:53.568824','2024-05-28 02:56:53.568830',0,9,'paypal',NULL),(25,'2024-05-28 02:57:11.251189','2024-05-28 02:57:39.930026','2024-05-28 02:57:11.251219',151.2,9,'paypal','PAYID-MZKUQCA72728046D1968821P');
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdetail`
--

DROP TABLE IF EXISTS `order_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_orderdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `price` double NOT NULL,
  `schedule_id` bigint NOT NULL,
  `status` varchar(50) NOT NULL,
  `time_package` varchar(20) NOT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdetail_schedule_id_837e5df1_fk_service_schedule_id` (`schedule_id`),
  KEY `order_orderdetail_order_id_2c6526df_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_orderdetail_order_id_2c6526df_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_orderdetail_schedule_id_837e5df1_fk_service_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `service_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdetail`
--

LOCK TABLES `order_orderdetail` WRITE;
/*!40000 ALTER TABLE `order_orderdetail` DISABLE KEYS */;
INSERT INTO `order_orderdetail` VALUES (20,'2024-05-27 23:33:16.668545','2024-05-27 23:34:10.262881','2024-05-27 23:33:16.668604',240,22,'success','6 tháng',20),(22,'2024-05-28 02:09:46.962634','2024-05-28 02:09:46.962696','2024-05-28 02:09:46.962744',75.6,25,'pending','3 tháng',22),(23,'2024-05-28 02:56:35.538928','2024-05-28 02:56:35.538949','2024-05-28 02:56:35.538968',151.2,26,'pending','6 tháng',23),(24,'2024-05-28 02:56:53.573571','2024-05-28 02:56:53.573598','2024-05-28 02:56:53.573619',0,27,'pending','6 tháng',24),(25,'2024-05-28 02:57:11.254325','2024-05-28 02:57:39.944198','2024-05-28 02:57:11.254373',151.2,28,'success','6 tháng',25);
/*!40000 ALTER TABLE `order_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderstatus`
--

DROP TABLE IF EXISTS `order_orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_orderstatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderstatus_order_id_d13e4d24_fk_order_order_id` (`order_id`),
  KEY `order_orderstatus_admin_id_8bdfa1ad_fk_account_admin_id` (`admin_id`),
  CONSTRAINT `order_orderstatus_admin_id_8bdfa1ad_fk_account_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `account_admin` (`id`),
  CONSTRAINT `order_orderstatus_order_id_d13e4d24_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderstatus`
--

LOCK TABLES `order_orderstatus` WRITE;
/*!40000 ALTER TABLE `order_orderstatus` DISABLE KEYS */;
INSERT INTO `order_orderstatus` VALUES (24,'2024-05-27 23:33:16.672984','2024-05-27 23:33:16.673008','2024-05-27 23:33:16.673015',NULL,20,'pending'),(25,'2024-05-27 23:34:10.267507','2024-05-27 23:34:10.267540','2024-05-27 23:34:10.267548',NULL,20,'success'),(28,'2024-05-28 02:09:46.968264','2024-05-28 02:09:46.968314','2024-05-28 02:09:46.968330',NULL,22,'pending'),(29,'2024-05-28 02:56:35.543600','2024-05-28 02:56:35.543626','2024-05-28 02:56:35.543633',NULL,23,'pending'),(30,'2024-05-28 02:56:53.576470','2024-05-28 02:56:53.576493','2024-05-28 02:56:53.576501',NULL,24,'pending'),(31,'2024-05-28 02:57:11.259232','2024-05-28 02:57:11.259256','2024-05-28 02:57:11.259264',NULL,25,'pending'),(32,'2024-05-28 02:57:39.948637','2024-05-28 02:57:39.948669','2024-05-28 02:57:39.948676',NULL,25,'success');
/*!40000 ALTER TABLE `order_orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transaction`
--

DROP TABLE IF EXISTS `order_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `amount` double NOT NULL,
  `order_id` bigint NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transaction_order_id_27d919d5_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_transaction_order_id_27d919d5_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transaction`
--

LOCK TABLES `order_transaction` WRITE;
/*!40000 ALTER TABLE `order_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymentlist`
--

DROP TABLE IF EXISTS `payment_paymentlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_paymentlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_paymentlist_payment_method_id_client_id_799d0ddd_uniq` (`payment_method`,`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymentlist`
--

LOCK TABLES `payment_paymentlist` WRITE;
/*!40000 ALTER TABLE `payment_paymentlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paymentlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_ipn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_attendance`
--

DROP TABLE IF EXISTS `service_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `employee_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `trip_detail_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_attendance_trip_detail_id_student_id_49c8172b_uniq` (`trip_detail_id`,`student_id`),
  KEY `service_attendance_employee_id_c10c42b2_fk_account_employee_id` (`employee_id`),
  KEY `service_attendance_student_id_97b101b2_fk_account_student_id` (`student_id`),
  CONSTRAINT `service_attendance_employee_id_c10c42b2_fk_account_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `account_employee` (`id`),
  CONSTRAINT `service_attendance_student_id_97b101b2_fk_account_student_id` FOREIGN KEY (`student_id`) REFERENCES `account_student` (`id`),
  CONSTRAINT `service_attendance_trip_detail_id_b40265cf_fk_service_t` FOREIGN KEY (`trip_detail_id`) REFERENCES `service_tripdetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_attendance`
--

LOCK TABLES `service_attendance` WRITE;
/*!40000 ALTER TABLE `service_attendance` DISABLE KEYS */;
INSERT INTO `service_attendance` VALUES (2,'2024-05-27 23:35:31.165285','2024-05-27 23:35:31.165307','2024-05-27 23:35:31.165330',NULL,5,10,7);
/*!40000 ALTER TABLE `service_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_location`
--

DROP TABLE IF EXISTS `service_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `vehicle_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_location_vehicle_id_c043a850_fk_service_vehicle_id` (`vehicle_id`),
  CONSTRAINT `service_location_vehicle_id_c043a850_fk_service_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `service_vehicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_location`
--

LOCK TABLES `service_location` WRITE;
/*!40000 ALTER TABLE `service_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_route`
--

DROP TABLE IF EXISTS `service_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_route` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `dropoff_id` bigint NOT NULL,
  `pickup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_route_dropoff_id_ab5e1249_fk_service_station_id` (`dropoff_id`),
  KEY `service_route_pickup_id_21465eff` (`pickup_id`),
  CONSTRAINT `service_route_dropoff_id_ab5e1249_fk_service_station_id` FOREIGN KEY (`dropoff_id`) REFERENCES `service_station` (`id`),
  CONSTRAINT `service_route_pickup_id_21465eff_fk_service_station_id` FOREIGN KEY (`pickup_id`) REFERENCES `service_station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_route`
--

LOCK TABLES `service_route` WRITE;
/*!40000 ALTER TABLE `service_route` DISABLE KEYS */;
INSERT INTO `service_route` VALUES (7,'2024-05-23 23:30:31.234491','2024-05-23 23:30:31.234511','Chợ Thủ Đức tới Học viện BCVT Q9',8,9),(11,'2024-05-27 23:20:39.725924','2024-05-27 23:20:39.725949','Học viện Công nghệ BCVT Từ Q1 sang Q9',8,10),(12,'2024-05-28 01:10:30.533301','2024-05-28 01:10:30.533387','Hầm thủ thiêm đi Học viện CN BCVT Q9',8,3),(13,'2024-05-28 01:16:07.393253','2024-05-28 01:16:07.393394','Học viện CN BCVT Q1 đi Sư phạm kỹ thuật',4,10),(14,'2024-05-28 02:59:44.120146','2024-05-28 02:59:44.120174','chợ thủ đức tới hv bcvt q9',8,9);
/*!40000 ALTER TABLE `service_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_routedetail`
--

DROP TABLE IF EXISTS `service_routedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_routedetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `sequence` int unsigned NOT NULL,
  `route_id` bigint NOT NULL,
  `station_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_routedetail_route_id_station_id_sequence_d4c4d4c7_uniq` (`route_id`,`station_id`,`sequence`),
  KEY `service_routedetail_station_id_ae9d6ff0_fk_service_station_id` (`station_id`),
  CONSTRAINT `service_routedetail_route_id_b3f77dee_fk_service_route_id` FOREIGN KEY (`route_id`) REFERENCES `service_route` (`id`),
  CONSTRAINT `service_routedetail_station_id_ae9d6ff0_fk_service_station_id` FOREIGN KEY (`station_id`) REFERENCES `service_station` (`id`),
  CONSTRAINT `service_routedetail_chk_1` CHECK ((`sequence` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_routedetail`
--

LOCK TABLES `service_routedetail` WRITE;
/*!40000 ALTER TABLE `service_routedetail` DISABLE KEYS */;
INSERT INTO `service_routedetail` VALUES (16,'2024-05-23 23:30:39.616380','2024-05-23 23:30:39.616405',2,7,4),(18,'2024-05-27 23:20:47.615650','2024-05-27 23:20:47.615673',2,11,3),(19,'2024-05-27 23:20:49.470164','2024-05-27 23:20:49.470192',3,11,4),(21,'2024-05-28 01:12:37.450025','2024-05-28 01:12:37.450058',2,12,11),(22,'2024-05-28 01:12:51.812953','2024-05-28 01:12:51.813017',3,12,4),(23,'2024-05-28 03:00:02.779682','2024-05-28 03:00:02.779705',2,14,4);
/*!40000 ALTER TABLE `service_routedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_schedule`
--

DROP TABLE IF EXISTS `service_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `distance` double NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date DEFAULT NULL,
  `driver_id` bigint NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  `route_id` bigint NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `pickup_time` time(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_schedule_driver_id_a3492367_fk_account_driver_id` (`driver_id`),
  KEY `service_schedule_employee_id_8caca25f_fk_account_employee_id` (`employee_id`),
  KEY `service_schedule_route_id_d042178c_fk_service_route_id` (`route_id`),
  KEY `service_schedule_vehicle_id_774bb536_fk_service_vehicle_id` (`vehicle_id`),
  CONSTRAINT `service_schedule_driver_id_a3492367_fk_account_driver_id` FOREIGN KEY (`driver_id`) REFERENCES `account_driver` (`id`),
  CONSTRAINT `service_schedule_employee_id_8caca25f_fk_account_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `account_employee` (`id`),
  CONSTRAINT `service_schedule_route_id_d042178c_fk_service_route_id` FOREIGN KEY (`route_id`) REFERENCES `service_route` (`id`),
  CONSTRAINT `service_schedule_vehicle_id_774bb536_fk_service_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `service_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_schedule`
--

LOCK TABLES `service_schedule` WRITE;
/*!40000 ALTER TABLE `service_schedule` DISABLE KEYS */;
INSERT INTO `service_schedule` VALUES (22,'2024-05-27 23:33:16.629840','2024-05-27 23:33:16.629865',20,'2024-05-30','2024-11-30',3,5,11,4,'19:30:00.000000'),(23,'2024-05-28 00:59:38.980531','2024-05-28 00:59:38.980610',20,'2024-05-30','2024-11-30',3,5,11,4,'07:20:00.000000'),(24,'2024-05-28 01:00:19.726118','2024-05-28 01:00:19.726261',20,'2024-05-30','2024-08-30',3,5,11,3,'08:00:00.000000'),(25,'2024-05-28 02:09:46.915805','2024-05-28 02:09:46.915841',12.6,'2024-06-06','2024-09-06',3,5,13,3,'09:10:00.000000'),(26,'2024-05-28 02:56:35.531691','2024-05-28 02:56:35.531715',12.6,'2024-05-30','2024-11-30',3,5,13,4,'07:00:00.000000'),(27,'2024-05-28 02:56:53.561606','2024-05-28 02:56:53.561629',12.6,'2024-05-29','2024-11-29',3,5,13,4,'07:00:00.000000'),(28,'2024-05-28 02:57:11.243731','2024-05-28 02:57:11.243756',12.6,'2024-05-28','2024-11-28',3,5,13,4,'07:00:00.000000');
/*!40000 ALTER TABLE `service_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_station`
--

DROP TABLE IF EXISTS `service_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_station` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_station`
--

LOCK TABLES `service_station` WRITE;
/*!40000 ALTER TABLE `service_station` DISABLE KEYS */;
INSERT INTO `service_station` VALUES (3,'2024-05-22 10:32:36.357429','2024-05-22 10:32:36.357451','10.770070','106.711015','Hầm Thủ Thiêm'),(4,'2024-05-22 10:33:04.284431','2024-05-22 10:33:04.284451','10.849351','106.774528','Sư phạm Kỹ Thuật'),(7,'2024-05-23 17:33:06.545617','2024-05-23 17:33:06.545639','10.75787248779643','106.65943263225768','Bệnh viện chợ rẫy'),(8,'2024-05-23 23:29:17.522784','2024-05-27 23:19:47.748743','10.847876349626745','106.78717967936088','Học viện Công nghệ BCVT Q9'),(9,'2024-05-23 23:30:07.082866','2024-05-23 23:30:07.082889','10.850203216944795','106.75429331747401','Chợ Thủ Đức'),(10,'2024-05-27 23:20:07.722890','2024-05-27 23:20:07.722913','10.789416','106.700722','Học viện Công nghệ BCVT Q1'),(11,'2024-05-28 01:12:27.021358','2024-05-28 01:12:27.021389','10.801975','106.741244','Vincom Mega Mall');
/*!40000 ALTER TABLE `service_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_studentstatus`
--

DROP TABLE IF EXISTS `service_studentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_studentstatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  `student_id` bigint NOT NULL,
  `trip_detail_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_studentstatus_student_id_a03090fd_fk_account_student_id` (`student_id`),
  KEY `service_studentstatu_trip_detail_id_50906eff_fk_service_t` (`trip_detail_id`),
  CONSTRAINT `service_studentstatu_trip_detail_id_50906eff_fk_service_t` FOREIGN KEY (`trip_detail_id`) REFERENCES `service_tripdetail` (`id`),
  CONSTRAINT `service_studentstatus_student_id_a03090fd_fk_account_student_id` FOREIGN KEY (`student_id`) REFERENCES `account_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_studentstatus`
--

LOCK TABLES `service_studentstatus` WRITE;
/*!40000 ALTER TABLE `service_studentstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_studentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_studenttrip`
--

DROP TABLE IF EXISTS `service_studenttrip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_studenttrip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `notification_id` bigint DEFAULT NULL,
  `schedule_id` bigint NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_studenttrip_student_id_schedule_id_429c8f9f_uniq` (`student_id`,`schedule_id`),
  KEY `service_studenttrip_schedule_id_f9e83e3c_fk_service_schedule_id` (`schedule_id`),
  KEY `service_studenttrip_notification_id_ac22260e_fk_notificat` (`notification_id`),
  CONSTRAINT `service_studenttrip_notification_id_ac22260e_fk_notificat` FOREIGN KEY (`notification_id`) REFERENCES `notification_notification` (`id`),
  CONSTRAINT `service_studenttrip_schedule_id_f9e83e3c_fk_service_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `service_schedule` (`id`),
  CONSTRAINT `service_studenttrip_student_id_2c0049b3_fk_account_student_id` FOREIGN KEY (`student_id`) REFERENCES `account_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_studenttrip`
--

LOCK TABLES `service_studenttrip` WRITE;
/*!40000 ALTER TABLE `service_studenttrip` DISABLE KEYS */;
INSERT INTO `service_studenttrip` VALUES (11,'2024-05-27 23:34:47.658268','2024-05-27 23:34:47.658310',NULL,22,NULL,10),(12,'2024-05-28 01:01:39.265541','2024-05-28 01:01:39.265588',NULL,24,NULL,10),(13,'2024-05-28 02:58:13.003219','2024-05-28 02:58:13.003248',NULL,28,NULL,13);
/*!40000 ALTER TABLE `service_studenttrip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_timepackage`
--

DROP TABLE IF EXISTS `service_timepackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_timepackage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `total_days` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `service_timepackage_chk_1` CHECK ((`total_days` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_timepackage`
--

LOCK TABLES `service_timepackage` WRITE;
/*!40000 ALTER TABLE `service_timepackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_timepackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_tripdetail`
--

DROP TABLE IF EXISTS `service_tripdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_tripdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `schedule_id` bigint NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_tripdetail_schedule_id_c15a7a05_fk_service_schedule_id` (`schedule_id`),
  CONSTRAINT `service_tripdetail_schedule_id_c15a7a05_fk_service_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `service_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_tripdetail`
--

LOCK TABLES `service_tripdetail` WRITE;
/*!40000 ALTER TABLE `service_tripdetail` DISABLE KEYS */;
INSERT INTO `service_tripdetail` VALUES (7,'2024-05-27 23:35:11.964580','2024-05-27 23:35:33.107333','2024-05-29 07:30:00.000000',NULL,22,'success');
/*!40000 ALTER TABLE `service_tripdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_vehicle`
--

DROP TABLE IF EXISTS `service_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_vehicle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `code` varchar(55) NOT NULL,
  `vehicle_type` varchar(55) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_vehicle`
--

LOCK TABLES `service_vehicle` WRITE;
/*!40000 ALTER TABLE `service_vehicle` DISABLE KEYS */;
INSERT INTO `service_vehicle` VALUES (2,'2024-05-22 08:42:35.235465','2024-05-27 22:39:23.669792','77c1-82257','45 chỗ',1),(3,'2024-05-23 23:27:26.354329','2024-05-23 23:27:26.354351','77C - 68686','16 chỗ',2),(4,'2024-05-23 23:27:46.738968','2024-05-23 23:27:46.739001','78C - 12345','29 chỗ',2),(5,'2024-05-28 02:58:59.077462','2024-05-28 02:58:59.077484','1721','45 chỗ',10);
/*!40000 ALTER TABLE `service_vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-01 15:21:22