-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cloud
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `registration_subject`
--
CREATE Database IF NOT EXISTS cloud;
USE cloud;
DROP TABLE IF EXISTS `registration_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_subject` (
  `studentUsername` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subjectID` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `studentUsername` (`studentUsername`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `registration_subject_ibfk_1` FOREIGN KEY (`studentUsername`) REFERENCES `student` (`studentUsername`),
  CONSTRAINT `registration_subject_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_subject`
--

LOCK TABLES `registration_subject` WRITE;
/*!40000 ALTER TABLE `registration_subject` DISABLE KEYS */;
INSERT INTO `registration_subject` VALUES ('hagerart_','02-24-00101'),('hagerart_','02-24-00106'),('joee2_0','POM100'),('themarxisthabib','02-24-00203'),('themarxisthabib','02-24-00204'),('themarxisthabib','02-24-00104'),('raghadhesham','02-24-00104'),('raghadhesham','02-24-00204'),('nadaemad','02-24-00104');
/*!40000 ALTER TABLE `registration_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentFirstName` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `studentLastName` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `studentLevel` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `studentUsername` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `studentPassword` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `studentEmail` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `studentCGPA` float NOT NULL,
  `studentID` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `studentCreditHours` int NOT NULL,
  `studentAge` int NOT NULL,
  PRIMARY KEY (`studentUsername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Hager','Ali','second','hagerart_','sudo','hagerali_art@gmail.com',3.54,'22010288',48,20),('Youssef','Usama','second','joee2_0','012012012y','youssefusama55@gmail.com',3.334,'2010299',52,21),('Ezzeldina','Habib','second','themarxisthabib','root','ezzaldin.vlog@gmail.com',3.991,'22011597',54,22),('raghad','hesham','second','raghadhesham','rooot','raghad29@gmail.com',3.891,'22010336',54,20),('nada','emad','second','nadaemad','roooot','nada21@gmail.com',3.791,'22010283',54,19);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_subjects`
--

DROP TABLE IF EXISTS `student_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_subjects` (
  `studentUsername` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subjectID` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subjectGrade` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `studentUsername` (`studentUsername`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `student_subjects_ibfk_1` FOREIGN KEY (`studentUsername`) REFERENCES `student` (`studentUsername`),
  CONSTRAINT `student_subjects_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_subjects`
--

LOCK TABLES `student_subjects` WRITE;
/*!40000 ALTER TABLE `student_subjects` DISABLE KEYS */;
INSERT INTO `student_subjects` VALUES ('themarxisthabib','02-24-00101','A'),('themarxisthabib','02-24-00106','A'),('hagerart_','02-24-00203','A'),('hagerart_','02-24-00204','B'),('joee2_0','02-24-01201','B+'),('joee2_0','02-24-00104','A-'),('joee2_0','02-24-00203','A'),('joee2_0','02-24-00101','B'),('themarxisthabib','02-24-00105','A'),('themarxisthabib','POM100','A-'),('nadaemad','02-24-00104','A'),('raghadhesham','02-24-00204','B+'),('raghadhesham','02-24-00104','A-');
/*!40000 ALTER TABLE `student_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectID` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `subjectName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `subjectCreditHours` int NOT NULL,
  `subjectLevel` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `subjectPrerequisites` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('02-24-00101','Linear Algebra',3,'first',''),('02-24-00104','Introduction to Data Sciences',3,'second',''),('02-24-00105','Programming I',3,'first',''),('02-24-00106','Probability and Statistics I',3,'first',''),('02-24-00203','Numerical Computations',3,'second','02-24-00101'),('02-24-00204','Cloud Computing',3,'second','02-24-00108'),('02-24-01201','Advanced Calculus',3,'first','02-24-00102'),('POM100','Principles of Management',2,'second','');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-06  3:48:11
