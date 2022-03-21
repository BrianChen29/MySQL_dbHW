CREATE DATABASE  IF NOT EXISTS `db_107403046` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_107403046`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_107403046
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `tbl_Seat`
--

DROP TABLE IF EXISTS `tbl_Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Seat` (
  `Seat_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`Seat_ID`),
  UNIQUE KEY `Seat_ID_UNIQUE` (`Seat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Seat`
--

LOCK TABLES `tbl_Seat` WRITE;
/*!40000 ALTER TABLE `tbl_Seat` DISABLE KEYS */;
INSERT INTO `tbl_Seat` VALUES ('10A'),('10B'),('10C'),('10D'),('1A'),('1B'),('1C'),('1D'),('2A'),('2B'),('2C'),('2D'),('3A'),('3B'),('3C'),('3D'),('4A'),('4B'),('4C'),('4D'),('5A'),('5B'),('5C'),('5D'),('6A'),('6B'),('6C'),('6D'),('7A'),('7B'),('7C'),('7D'),('8A'),('8B'),('8C'),('8D'),('9A'),('9B'),('9C'),('9D');
/*!40000 ALTER TABLE `tbl_Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Station`
--

DROP TABLE IF EXISTS `tbl_Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Station` (
  `Station_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Station_Name` varchar(100) NOT NULL,
  `Location_Marker` int(11) NOT NULL,
  `Time_Marker` int(11) NOT NULL,
  PRIMARY KEY (`Station_ID`),
  UNIQUE KEY `Station_ID_UNIQUE` (`Station_ID`),
  UNIQUE KEY `Station_Name_UNIQUE` (`Station_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Station`
--

LOCK TABLES `tbl_Station` WRITE;
/*!40000 ALTER TABLE `tbl_Station` DISABLE KEYS */;
INSERT INTO `tbl_Station` VALUES (1,'台北',1,0),(2,'桃園',3,20),(3,'新竹',4,30),(4,'台中',8,60),(5,'高雄',15,120);
/*!40000 ALTER TABLE `tbl_Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Ticket`
--

DROP TABLE IF EXISTS `tbl_Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Ticket` (
  `Ticket_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Train_Date` date NOT NULL,
  `Train_ID` int(11) NOT NULL,
  `Departure_Station` int(11) NOT NULL,
  `Arrival_Station` int(11) NOT NULL,
  `Seat_ID` varchar(64) NOT NULL,
  `Price` int(11) NOT NULL,
  `Book_Time` datetime NOT NULL,
  `Pay_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticket_ID`,`Seat_ID`,`Train_ID`,`User_ID`),
  UNIQUE KEY `Ticket_ID_UNIQUE` (`Ticket_ID`),
  KEY `ticket_user_id_fk_idx` (`User_ID`),
  KEY `ticket_train_id_fk_idx` (`Train_ID`),
  KEY `ticket_arr_station_fk_idx` (`Arrival_Station`),
  KEY `ticket_seat_id_fk` (`Seat_ID`),
  CONSTRAINT `ticket_arr_station_fk` FOREIGN KEY (`Arrival_Station`) REFERENCES `tbl_Station` (`Station_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_seat_id_fk` FOREIGN KEY (`Seat_ID`) REFERENCES `tbl_Seat` (`Seat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_train_id_fk` FOREIGN KEY (`Train_ID`) REFERENCES `tbl_Train` (`Train_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_user_id_fk` FOREIGN KEY (`User_ID`) REFERENCES `tbl_User` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Ticket`
--

LOCK TABLES `tbl_Ticket` WRITE;
/*!40000 ALTER TABLE `tbl_Ticket` DISABLE KEYS */;
INSERT INTO `tbl_Ticket` VALUES (1,1,'2020-06-10',1,1,2,'1D',200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(2,1,'2020-06-10',1,2,5,'3B',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(3,2,'2020-06-10',2,2,4,'2A',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(4,2,'2020-06-12',2,3,4,'2A',400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(5,3,'2020-06-13',3,1,5,'3D',1400,'2020-06-12 20:30:00','2020-06-13 07:35:00'),(6,4,'2020-06-13',3,2,3,'4B',100,'2020-06-12 14:30:00','2020-06-12 17:35:00'),(7,5,'2020-06-15',4,5,2,'1A',1200,'2020-06-15 10:22:00',NULL),(8,6,'2020-06-15',4,5,1,'2A',1400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(9,7,'2020-06-16',5,4,2,'5A',500,'2020-06-12 10:31:00',NULL),(10,7,'2020-06-16',5,4,2,'5B',500,'2020-06-11 10:31:00',NULL),(11,7,'2020-06-16',5,4,2,'5C',500,'2020-06-11 10:31:00','2020-06-11 11:35:00'),(12,8,'2020-06-16',6,3,2,'6C',500,'2020-06-16 10:30:00','2020-06-16 10:36:00');
/*!40000 ALTER TABLE `tbl_Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Train`
--

DROP TABLE IF EXISTS `tbl_Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Train` (
  `Train_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Departure_Time` time DEFAULT NULL,
  `Departure_Station` int(11) NOT NULL,
  `Arrival_Time` time DEFAULT NULL,
  `Off_Date` date DEFAULT NULL,
  `On_Date` date NOT NULL,
  PRIMARY KEY (`Train_ID`,`Departure_Station`),
  KEY `train_dep_station_fk_idx` (`Departure_Station`),
  CONSTRAINT `train_dep_station_fk` FOREIGN KEY (`Departure_Station`) REFERENCES `tbl_Station` (`Station_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Train`
--

LOCK TABLES `tbl_Train` WRITE;
/*!40000 ALTER TABLE `tbl_Train` DISABLE KEYS */;
INSERT INTO `tbl_Train` VALUES (1,'07:00:00',1,NULL,'2020-06-17','2020-01-01'),(1,'07:22:00',2,'07:20:00','2020-06-17','2020-01-01'),(1,'07:34:00',3,'07:32:00','2020-06-17','2020-01-01'),(1,'08:06:00',4,'08:04:00','2020-06-17','2020-01-01'),(1,NULL,5,'09:06:00','2020-06-17','2020-01-01'),(2,'10:00:00',1,NULL,NULL,'2020-01-01'),(2,'10:22:00',2,'10:20:00',NULL,'2020-01-01'),(2,'10:34:00',3,'10:32:00',NULL,'2020-01-01'),(2,NULL,4,'11:04:00',NULL,'2020-01-01'),(3,'13:00:00',1,NULL,NULL,'2020-02-01'),(3,'13:22:00',2,'13:20:00',NULL,'2020-02-01'),(3,'13:34:00',3,'13:32:00',NULL,'2020-02-01'),(3,'14:06:00',4,'14:04:00',NULL,'2020-02-01'),(3,NULL,5,'15:06:00',NULL,'2020-02-01'),(4,NULL,1,'10:06:00',NULL,'2020-02-01'),(4,'09:46:00',2,'09:44:00',NULL,'2020-02-01'),(4,'09:34:00',3,'09:32:00',NULL,'2020-02-01'),(4,'09:02:00',4,'09:00:00',NULL,'2020-02-01'),(4,'08:00:00',5,NULL,NULL,'2020-02-01'),(5,NULL,1,'13:04:00',NULL,'2020-02-01'),(5,'12:44:00',2,'12:42:00',NULL,'2020-02-01'),(5,'12:32:00',3,'12:30:00',NULL,'2020-02-01'),(5,'12:00:00',4,NULL,NULL,'2020-02-01'),(6,NULL,1,'19:06:00',NULL,'2020-01-01'),(6,'18:46:00',2,'18:44:00',NULL,'2020-01-01'),(6,'18:34:00',3,'18:32:00',NULL,'2020-01-01'),(6,'18:02:00',4,'18:00:00',NULL,'2020-01-01'),(6,'17:00:00',5,NULL,NULL,'2020-01-01');
/*!40000 ALTER TABLE `tbl_Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_User`
--

DROP TABLE IF EXISTS `tbl_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_User` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `salt` char(64) NOT NULL,
  `Dob` date NOT NULL,
  `Register_Date Time` date NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `salt_UNIQUE` (`salt`),
  UNIQUE KEY `User_ID_UNIQUE` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_User`
--

LOCK TABLES `tbl_User` WRITE;
/*!40000 ALTER TABLE `tbl_User` DISABLE KEYS */;
INSERT INTO `tbl_User` VALUES (1,'Steve','Rogers','Marvel_Steve@gmail.com','63652315D22919A8EC76F58F982EC08A6244474F8082B8E75A1271B3C63948E9','1918-07-04','2019-06-06'),(2,'Tony','Stark','Marvel_Tony@gmail.com','AA52032EAB8CC92F7B77CCE828940F95C2369F18DDF1C6B3A80A8A6195D137FB','1970-05-29','2019-06-07'),(3,'Thor','God','Marvel_Thor@gmail.com','3C567E0EA40F26755BB221C96AB02CC726DE673E85016EC1D949D14E5B16B223','1911-01-01','2019-06-08'),(4,'Peter','Parker','Marvel_Peter@gmail.com','95B79B147E492681F98C749E3AC329C1A975D3F4000FF25D0643D8D55A4E4E2B','2000-08-10','2019-06-09'),(5,'David','Banner','Marvel_David @gmail.com','EB7F11AE33003238D3FF14094E3BC569F077B8F39DF472423FD339CE22B5F050','1980-11-22','2019-06-10'),(6,'Natasha','Romanoff','Marvel_Natasha@gmail.com','5F79D14FB8A43CA9350E781EA1067B14B197D36671182C4C15E9EDBD921791DD','1984-11-22','2019-06-11'),(7,'Wanda','Maximoff','Marvel_Wanda@gmail.com','9C681B6D73E80D3C1F10E06BDEB48914ABE207ADA83405DC14485B6AD060C021','1980-08-02','2019-06-12'),(8,'Carol','Danvers','Marvel_Carol@gmail.com','6C40F0CC5D46DCE7D1A0E1D118E0750A7874087FC7199DDA34D171131002DCA9','1980-08-01','2019-06-13'),(9,'Stephen','Strange','Marvel_Stephen@gmail.com','039FB5567A6B559BE9999BF854BEF1699A14CB912AF431CCF90D9941900D8788','1930-07-01','2019-06-14'),(10,'Clint','Barton','Marvel_Clint@gmail.com','ABC1523C0333408EFF2B8CCF4248A0B2175723EBC65C8D05940B9D434B7A39A2','1971-01-07','2019-06-15'),(12,'jkf','lmn','jkf@gmail.com','13D15913DD50AB23642EEEF31294F868A9FAC0879A6805857A0AD95A8BCE2350','1966-04-01','2019-06-20'),(14,'brriii','chen','test234@gmail.com','93895FF1B2D3C9624A59C709B97D38F14D177E140A707E0E9BA44670652FD1F3','1990-02-09','2020-06-26');
/*!40000 ALTER TABLE `tbl_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_UserCredential`
--

DROP TABLE IF EXISTS `tbl_UserCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_UserCredential` (
  `UserCredential` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `HashedPwd` varchar(255) NOT NULL,
  `Create_DateTime` datetime NOT NULL,
  PRIMARY KEY (`UserCredential`,`User_ID`),
  UNIQUE KEY `UserCredential_UNIQUE` (`UserCredential`),
  UNIQUE KEY `User_ID_UNIQUE` (`User_ID`),
  KEY `userCredential_user_id_fk_idx` (`User_ID`),
  CONSTRAINT `userCredential_user_id_fk` FOREIGN KEY (`User_ID`) REFERENCES `tbl_User` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_UserCredential`
--

LOCK TABLES `tbl_UserCredential` WRITE;
/*!40000 ALTER TABLE `tbl_UserCredential` DISABLE KEYS */;
INSERT INTO `tbl_UserCredential` VALUES (1,1,'pfNFnTx50OjhU','2019-06-06 00:00:00'),(2,2,'brpgOmotwsnkA','2019-06-07 00:00:00'),(3,3,'brCHXrfmx/hRs','2019-06-08 00:00:00'),(4,4,'broklWTNGanYM','2019-06-09 00:00:00'),(5,5,'brrQ/CUvMgDMI','2019-06-10 00:00:00'),(6,6,'brCAXrfmx/hRs','2019-06-11 00:00:00'),(7,7,'bretXExZ676DI','2019-06-12 00:00:00'),(8,8,'brhAsn.S9pHfM','2019-06-13 00:00:00'),(9,9,'$2a$04$x5OREIIit45t/tMBg.8uS.RAHn4kkgigIK7RWnAKXqG68uYo2xmAO','2019-06-14 00:00:00'),(10,10,'brtnGNHRCIzXY','2019-06-15 00:00:00'),(11,14,'$2a$04$zj.cdioDnMC0LS23VfaF9OBU8Rc7uOrMQCrbNv1ipfTDhld8rN1ke','2020-06-26 20:08:11');
/*!40000 ALTER TABLE `tbl_UserCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_107403046'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_BookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_BookTicket`(

	in in_userID int(10),
    in in_trainID int(11),
    in in_depStation int,
    in in_arrStation int,
    in in_trainDate date,
    out num_row int(100) -- select出來的列數

)
BEGIN
	 declare price int;
     declare locmarker1 int;
     declare locmarker2 int; 
	 select `Seat_ID` from tbl_Seat order by rand() LIMIT 1;
	 select location_marker into locmarker1 from tbl_Station where station_id = in_arrStation;
     select location_marker into locmarker2 from tbl_Station where station_id = in_depStation;
     set price = abs(locmarker1 - locmarker2)*100;
     Insert into tbl_Ticket values(
     null,
	 in_userID,
     in_trainDate,
	 in_trainID,
     in_depStation,
     in_arrStation,
     Seat_ID,
     price,
     current_timestamp(),
     null
     );
     select (Ticket_ID - found_rows()+1) into num_row; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_DeleteUserByUserID`(
	in in_userID int(10),
    out affected_row_num int(100)     -- 被影響的列，為了確認store procedure有效的執行

)
sp:BEGIN
	if exists(select in_userID from tbl_Ticket where User_ID = in_userID)then
		leave sp;
	else
		select User_ID into affected_row_num from tbl_User where User_ID = in_userID;
		delete from tbl_User where User_ID = in_userID;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Delete_bookticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_Delete_bookticket`(
	in in_userID int(10),
    in in_ticketID int(11),
    out affected_row_num int(100) -- 被影響的列數，為了確認store procedure有效的執行

)
sp:BEGIN
	if exists(select in_ticketID from tbl_Ticket where user_id = in_userID && ticket_id = in_ticketID && Pay_time is null)then
		select Ticket_ID into affected_row_num from tbl_Ticket where Ticket_ID = in_ticketID;
        delete from tbl_Ticket where Ticket_ID = in_ticketID;
	else
		leave sp;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookTicketByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_GetBookTicketByUser`(
	in in_userID int(10),
    out num_row int(100)  -- select出來的列數
)
BEGIN
		select * from tbl_Ticket where user_id = in_userID && Pay_time is null;
        select foundrows() into num_row;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_GetStation`(
	OUT num_row INT
)
BEGIN
	SELECT `station_id`, `station_name`  FROM db_107403046.tbl_Station;
    SELECT COUNT(`station_id`) INTO num_row FROM db_107403046.tbl_Station;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_QueryTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_QueryTicket`(
	in in_depTime time,
    in in_depStation int,
    in in_arrStation int,
    out num_row int(100)  -- select出來的列數

)
BEGIN
	select departure.Train_ID, departure.Departure_Station, arrival.Arrival_Station, 
		   departure.Departure_Time, arrival.Arrival_Time, (abs(arrival.arrivalID - departure.departureID)*100)as price
	from
		(select Train_ID, Departure_Time, Departure_Station, Location_Marker as departureID from tbl_Train
        join tbl_Station on Departure_Station = Station_ID
        where (Departure_Station = in_depStation) and (Departure_Time > in_depTime) and (Off_Date is null)
        )as departure
	join
		(select Train_ID, Arrival_Time, Departure_Station as Arrival_Station, Location_Marker as arrivalID from tbl_Train
         join tbl_Station on Departure_Station = Station_ID
         where (Departure_Station = in_arrStation) && (Off_Date is null) && (Arrive_Time is not null)
		)as arrival
	on departure.Train_ID = arrival.Train_ID where Arrive_Time > Departure_Time;
    
	select count(*) into num_row from (select Train_ID, Departure_Time, Departure_Station, Location_Marker as departureID
		from tbl_Train join tbl_Station on Departure_Station = Station_ID
        where (Departure_Station = in_depStation) and (Departure_Time > in_depTime) and (Off_Date is null)
        )as departure
	join
		(select Train_ID, Arrive_Time, Departure_Station as Arrival_Station, Location_Marker as arrivalID
        from tbl_Train join tbl_Station on Departure_Station = Station_ID
        where (Departure_Station = in_arrStation) && (Off_Date is null) && (Arrival_Time is not null)
        )as arrival
	on departure.Train_ID = arrival.Train_ID where Arrive_Time > Departure_Time;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_RegisterUser`(
	in in_email varchar(255),
    in in_firstname varchar(100),
    in in_lastname varchar(100),
    in in_Dob date,
    in in_salt char(64),
    in in_hashedPwd char(255),
    out row_num int(100)
)
sp:BEGIN
	if exists (select in_email from tbl_User where email = in_email)then
		leave sp;
    else
		insert into tbl_User values (
			null,
			in_firstname,
			in_lastname,
			in_email,
			in_salt,
            in_dob,
			current_timestamp()
		);
		select User_ID into row_num from tbl_User where email = in_email;
        insert into tbl_UserCredential values (
			User_ID,
            row_num,
            in_hashedPwd,
            current_timestamp()
		);
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ResetNewPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_ResetNewPassword`(
	in in_userID int(10),
    in in_hashedPwd char(255),
    out affected_row_num int(100)
)
BEGIN
	if exists (select in_userID from tbl_UserCredential where  User_ID = in_userID)then
		update tbl_UserCredential set HashedPwd = in_hashedPwd where User_ID = in_userID;
		select User_ID into affected_row_num from tbl_UserCredential where User_ID = in_userID;
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403046`@`192.168.56.1` PROCEDURE `sp_UserLogin`(
	in in_email varchar(200),
    in in_hashedPwd char(255),
    out row_num int(100)
)
BEGIN
	if exists(select in_email from tbl_User where email = in_email)then
		select User_ID into row_num from tbl_User where email = in_email;
		if exists(select in_hashedPwd from tbl_UserCredential where  row_num = UserCredential)then
			select row_num;
		end if;
	end if;
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

-- Dump completed on 2020-06-26 23:20:20
