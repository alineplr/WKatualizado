-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dbwk
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `cadcliente`
--

DROP TABLE IF EXISTS `cadcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadcliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `idxnome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadcliente`
--

LOCK TABLES `cadcliente` WRITE;
/*!40000 ALTER TABLE `cadcliente` DISABLE KEYS */;
INSERT INTO `cadcliente` VALUES (1,'Aline','São José do Rio Preto','SP'),(2,'Márcio','Mirassol','SP'),(3,'José','Cuiabá','MT'),(4,'Antonio','Belo Horizonte','MG'),(5,'Ronaldo','Rio de Janeiro','RJ'),(6,'Mariana','São Paulo','SP'),(7,'Aparecida','Fortaleza','CE'),(8,'Mateus','Manaus','AM'),(9,'Tiago','José Bonifácio','SP'),(10,'Junior','Catanduva','SP'),(11,'Beatriz','Bady Bassit','SP'),(12,'Ana Luiza','Tanabi','SP'),(13,'Clara','São José do Rio Preto','SP'),(14,'Bruno','São José do Rio Preto','SP'),(15,'Fabiano','São José do Rio Preto','SP'),(16,'Carolina','São José do Rio Preto','SP'),(17,'Daniela','São José do Rio Preto','SP'),(18,'Gustavo','São José do Rio Preto','SP'),(19,'Pablo','São José do Rio Preto','SP'),(20,'Juliana','São José do Rio Preto','SP'),(21,'Guilherme','São José do Rio Preto','SP');
/*!40000 ALTER TABLE `cadcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadpedido`
--

DROP TABLE IF EXISTS `cadpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadpedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `dataemissao` date DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  `valortotal` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `fkcadclienteidcliente_idx` (`idcliente`),
  KEY `idxdataemissao` (`dataemissao`),
  CONSTRAINT `fkcadclienteidcliente` FOREIGN KEY (`idcliente`) REFERENCES `cadcliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadpedido`
--

LOCK TABLES `cadpedido` WRITE;
/*!40000 ALTER TABLE `cadpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadpedidoproduto`
--

DROP TABLE IF EXISTS `cadpedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadpedidoproduto` (
  `idpedidoproduto` int NOT NULL AUTO_INCREMENT,
  `idpedido` int DEFAULT NULL,
  `idproduto` int DEFAULT NULL,
  `quantidade` decimal(18,2) DEFAULT NULL,
  `valorunit` decimal(18,2) DEFAULT NULL,
  `valortotalproduto` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idpedidoproduto`),
  KEY `fkcadpedidoidpedido_idx` (`idpedido`),
  KEY `fkcadprodutoidproduto_idx` (`idproduto`),
  CONSTRAINT `fkcadpedidoidpedido` FOREIGN KEY (`idpedido`) REFERENCES `cadpedido` (`idpedido`),
  CONSTRAINT `fkcadprodutoidproduto` FOREIGN KEY (`idproduto`) REFERENCES `cadproduto` (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadpedidoproduto`
--

LOCK TABLES `cadpedidoproduto` WRITE;
/*!40000 ALTER TABLE `cadpedidoproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadpedidoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadproduto`
--

DROP TABLE IF EXISTS `cadproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadproduto` (
  `idproduto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `precovenda` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `idxdescricao` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadproduto`
--

LOCK TABLES `cadproduto` WRITE;
/*!40000 ALTER TABLE `cadproduto` DISABLE KEYS */;
INSERT INTO `cadproduto` VALUES (1,'Caneta',2.00),(2,'Apontador',3.00),(3,'Lapis',2.50),(4,'Regua',5.50),(5,'Lapis de cor',5.00),(6,'Tesoura',4.00),(7,'Barracha',4.50),(8,'Compasso',7.00),(9,'Transferidor',8.00),(10,'Marca texto',6.00),(11,'Caderno',2.00),(12,'Cola',1.00),(13,'Estojo',9.00),(14,'Caneta preta',0.70),(15,'Caneta rosa',2.00),(16,'Caneta azul',4.00),(17,'Caneta vermelha',2.00),(18,'Lapiseira',2.00),(19,'Pasta',12.00),(20,'Almaço',10.00);
/*!40000 ALTER TABLE `cadproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbwk'
--

--
-- Dumping routines for database 'dbwk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-16  9:36:40
