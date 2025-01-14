CREATE DATABASE  IF NOT EXISTS `jantri` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jantri`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: jantri
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `calendar_id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(45) DEFAULT NULL,
  `event_english` varchar(450) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `event_urdu` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`calendar_id`),
  UNIQUE KEY `calendar_id_UNIQUE` (`calendar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES (1,'2025-01-14','12 RABI UL AWAL','2025-01-14 05:44:05','active','12 ربیع الاول'),(2,'2024-10-25','12 rabiuwal','2025-01-14 12:49:41','active','12 ربیع الاول');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(450) DEFAULT NULL,
  `url` varchar(4500) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  UNIQUE KEY `document_id_UNIQUE` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'test jantri','http://194.233.69.219/images/a1c4c483-e95f-4eb6-a401-c16c7468c3bb.png','http://194.233.69.219/images//c2c1e5cf-c3d8-4e1c-b684-0e3d061cf738.pdf','active','2025-01-14 12:28:34','2025'),(2,'Imamia jantri 2024','http://194.233.69.219/images/1f1e7bae-3484-4389-94ad-d8688a573ac9.png','http://194.233.69.219/images//5ef7038c-b88b-490c-8572-034f12c9ae40.pdf','active','2025-01-14 05:34:56','2024');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `device_token` varchar(450) DEFAULT NULL,
  `image` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Hamza Shafique','h@gmail.com','03492055477','123','2025-01-14 04:33:22','active','device_token_string','image_string'),(4,'sheroze','sheroze2017@gmail.com','03162018229','123456','2025-01-14 11:42:14','active','null',''),(5,'Hamza Shafique','h1@gmail.com','03000000000','123','2025-01-14 11:42:51','active','device_token_string','image_string');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jantri'
--

--
-- Dumping routines for database 'jantri'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllCalendarRecords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllCalendarRecords`()
BEGIN
    DECLARE rowCount INT;

    -- Count the number of rows in the calendar table
    SELECT COUNT(*) INTO rowCount FROM calendar;

    -- Check if there are no rows in the table
    IF rowCount = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No records found in the calendar table.';
    ELSE
        -- Return all records from the calendar table
        SELECT * FROM calendar;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllDocuments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllDocuments`()
BEGIN
    DECLARE rowCount INT;
    DECLARE event_today DATE;
    DECLARE event_english VARCHAR(255);
    DECLARE event_urdu VARCHAR(255);
    
    -- Count the number of rows in the documents table
    SELECT COUNT(*) INTO rowCount FROM documents;

    -- Check if there are no records in documents table
    IF rowCount = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No records found in the documents table.';
    ELSE
        -- Get today's event by comparing the current date with the date in the calendar table
        SELECT 
            date AS event_today,
            event_english,
            event_urdu
        INTO event_today, event_english, event_urdu
        FROM calendar
        WHERE date = CURDATE();
        
        -- Return documents along with event_today as a nested object
        SELECT 
            document_id,
            name,
            image,
            url,
            status,
            created_at,
            year,
            JSON_OBJECT(
                'event_today', JSON_OBJECT(
                    'date', event_today,
                    'event_english', IFNULL(event_english, 'No Event in English'),
                    'event_urdu', IFNULL(event_urdu, 'کوئی ایونٹ نہیں')
                )
            ) AS event_today
        FROM documents;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUser`(
    IN p_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_phone VARCHAR(15),
    IN p_password VARCHAR(255),
    IN p_device_token VARCHAR(255),
    IN p_image VARCHAR(255)
)
BEGIN
    DECLARE v_user_id INT;

    -- Check if the email or phone already exists
    IF EXISTS (SELECT 1 FROM users WHERE email = p_email OR phone = p_phone) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email or Phone already exists';
    ELSE
        -- Insert the new user record
        INSERT INTO users (name, email, phone, password, device_token, image , created_at,status)
        VALUES (p_name, p_email, p_phone, p_password, p_device_token, p_image, now() , 'active');

        -- Get the last inserted user ID
        SET v_user_id = LAST_INSERT_ID();

        -- Return the inserted user record
        SELECT * FROM users WHERE user_id = v_user_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    -- Check if a user exists with the given email and password
    IF EXISTS (SELECT 1 FROM users WHERE email = p_email AND password = p_password) THEN
        -- Return the user record
        SELECT * 
        FROM users 
        WHERE email = p_email AND password = p_password;
    ELSE
        -- Signal an error if no user is found
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid email or password';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateDeviceToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateDeviceToken`(
    IN p_user_id INT,
    IN p_device_token VARCHAR(255)
)
BEGIN
    -- Check if the user exists
    IF EXISTS (SELECT 1 FROM users WHERE id = p_user_id) THEN
        -- Update the device token
        UPDATE users
        SET device_token = p_device_token
        WHERE user_id = p_user_id;

        -- Return success message and the updated record
        SELECT * FROM users WHERE user_id = p_user_id;
    ELSE
        -- Signal an error if the user does not exist
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'User ID does not exist';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upsertDocument` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upsertDocument`(
    IN p_name VARCHAR(255),
    IN p_image VARCHAR(255),
    IN p_year VARCHAR(255),
    IN p_url VARCHAR(255)
)
BEGIN
    -- Check if a document for the given year exists
    IF EXISTS (SELECT 1 FROM documents WHERE year = p_year) THEN
        -- Update the existing document
        UPDATE documents
        SET 
            name = p_name,
            image = p_image,
            url = p_url,
            created_at = now(),
            status = 'active'
        WHERE year = p_year;
    ELSE
        -- Insert a new document record
        INSERT INTO documents (name, image, year, url, created_at , status)
        VALUES (p_name, p_image, p_year, p_url, now() , 'active');
    END IF;

    -- Return the document for the specified year
    SELECT * FROM documents WHERE year = p_year;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upsertEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upsertEvent`(
    IN p_date DATE,
    IN p_english VARCHAR(255),
    IN p_urdu VARCHAR(255)
)
BEGIN
    -- Variable to hold the row count
    DECLARE rowCount INT;

    -- Check if the date already exists in the events table
    SELECT COUNT(*) INTO rowCount
    FROM calendar
    WHERE date = p_date;

    -- If the date exists, update the record
    IF rowCount > 0 THEN
        UPDATE calendar
        SET event_english = p_english,
            event_urdu = p_urdu,
            created_at = now(),
            status = 'active'
        WHERE date = p_date;
    ELSE
        -- If the date does not exist, insert a new record
        INSERT INTO calendar (date, event_english, event_urdu, created_at , status)
        VALUES (p_date, p_english, p_urdu, now() , 'active');
    END IF;

    -- Return the record for the given date
    SELECT * FROM calendar WHERE date = p_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-14 18:57:30
