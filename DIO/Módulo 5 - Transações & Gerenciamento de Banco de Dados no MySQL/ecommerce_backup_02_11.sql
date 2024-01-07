-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(10) DEFAULT NULL,
  `mInit` char(3) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `corporateName` varchar(45) DEFAULT NULL,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `type_client` enum('PJ','PF') DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `unique_cpf_cliente` (`cpf_cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Maria','M','Silva','Gymnastic','12346789','Rua Silva de Prata 29, Carangola - Cidade das Flores','PJ'),(2,'Matheus','O','Pimentel',NULL,'987654321','Rua Alameda 289, Centro - Cidade das Flores','PF'),(3,'Ricardo','F','Silva',NULL,'45678913','Rua Almeda Vinha 1009, Centro - Cidade das Flores','PF'),(4,'Julia','S','França','Doctor J.','789123456','Rua Lareijras 861, Centro - Cidade das Flores','PJ'),(5,'Roberta','G','Assis',NULL,'98745631','Avenidade Koller 19, Centro - Cidade das Flores','PF'),(6,'Isabela','M','Cruz','Isacakes','654789123','Rua Alameda das Flores 28, Centro - Cidade das Flores','PJ');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idOrderCliente` int DEFAULT NULL,
  `orderStatus` enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  `orderDescription` varchar(255) NOT NULL,
  `sendValue` int DEFAULT NULL,
  `paymentCash` tinyint(1) DEFAULT '0',
  `trackingCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_oders_cliente` (`idOrderCliente`),
  CONSTRAINT `fk_oders_cliente` FOREIGN KEY (`idOrderCliente`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Confirmado','Via Website',3,0,'34561287'),(2,2,'Cancelado','Via Website',4,1,'654789524'),(3,3,'Em processamento','Via App',8,1,'56435159'),(4,4,'Em processamento','Via Website',4,0,'123456123'),(5,5,'Confirmado','Via App',3,1,'12345698');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(30) NOT NULL,
  `informations` varchar(150) NOT NULL,
  `category` enum('Vestimentas','Eletrônicos','Livraria','Brinquedos') NOT NULL,
  `avaliation` enum('1','2','3','4','5') DEFAULT '1',
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Touca de dormir','Ótimo material para proteger o cabelo','Vestimentas','4'),(2,'Abajur','Ilumina bem e economiza energia','Eletrônicos','3'),(3,'Lord of Rings','Conheça o mundo onde tudo é possível','Livraria','5'),(4,'1001 receitas','Fundamental para todo cozinheiro de primeira viagem','Livraria','4'),(5,'Barbie e Ken','Direto dos cinemas para seu quarto','Brinquedos','5'),(6,'Echo Dot 3','Tecnologia e inovação para sua casa','Eletrônicos','4'),(7,'Calça Balenciaga','Fora da curva, assim como você','Vestimentas','5');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productorder` (
  `idPOproduct` int NOT NULL,
  `idPOorder` int NOT NULL,
  `poQuantity` int DEFAULT '1',
  `poStatus` enum('Disponível','Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (`idPOproduct`,`idPOorder`),
  KEY `fk_po_order` (`idPOorder`),
  CONSTRAINT `fk_po_order` FOREIGN KEY (`idPOorder`) REFERENCES `orders` (`idOrder`),
  CONSTRAINT `fk_po_product` FOREIGN KEY (`idPOproduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (2,4,2,NULL),(3,2,1,NULL),(5,5,1,NULL);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productseller` (
  `idProdSeller` int NOT NULL,
  `idPproduct` int NOT NULL,
  `quantity` int DEFAULT '1',
  PRIMARY KEY (`idProdSeller`,`idPproduct`),
  KEY `fk_product_product` (`idPproduct`),
  CONSTRAINT `fk_product_product` FOREIGN KEY (`idPproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_seller` FOREIGN KEY (`idProdSeller`) REFERENCES `seller` (`idSeller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
INSERT INTO `productseller` VALUES (1,6,80),(2,7,10);
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsupplier` (
  `idPSproduct` int NOT NULL,
  `idPSsupplier` int NOT NULL,
  `quantity` int DEFAULT '1',
  PRIMARY KEY (`idPSproduct`,`idPSsupplier`),
  KEY `fk_ps_supplier` (`idPSsupplier`),
  CONSTRAINT `fk_ps_product` FOREIGN KEY (`idPSproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_ps_supplier` FOREIGN KEY (`idPSsupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (1,3,350),(2,4,100),(3,2,230),(4,5,540),(5,1,140);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productwarehouse`
--

DROP TABLE IF EXISTS `productwarehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productwarehouse` (
  `idPWHproduct` int NOT NULL,
  `idPWHwarehouse` int NOT NULL,
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`idPWHproduct`,`idPWHwarehouse`),
  KEY `fk_pwh_warehouse` (`idPWHwarehouse`),
  CONSTRAINT `fk_pwh_product` FOREIGN KEY (`idPWHproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_pwh_warehouse` FOREIGN KEY (`idPWHwarehouse`) REFERENCES `warehouse` (`idWarehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productwarehouse`
--

LOCK TABLES `productwarehouse` WRITE;
/*!40000 ALTER TABLE `productwarehouse` DISABLE KEYS */;
INSERT INTO `productwarehouse` VALUES (1,1,1000),(2,6,460),(3,2,500),(5,3,750),(6,5,580),(7,4,320);
/*!40000 ALTER TABLE `productwarehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idSeller` int NOT NULL AUTO_INCREMENT,
  `corporateName` varchar(45) NOT NULL,
  `sellerName` varchar(45) DEFAULT NULL,
  `cpf_cnpj` varchar(14) DEFAULT NULL,
  `sellerLocation` varchar(45) DEFAULT NULL,
  `sellerContact` char(11) NOT NULL,
  PRIMARY KEY (`idSeller`),
  UNIQUE KEY `unique_cnpj_seller` (`cpf_cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Tech eletronics','Tech eletronics','12345678945632','Rio de Janeiro','219946287'),(2,'Botique Durgas','Botique Durgas','123456783','Rio de Janeiro','219567895'),(3,'Kids World','Kids World','56789123654485','São Paulo','1198657484');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `corporateName` varchar(45) NOT NULL,
  `supName` varchar(45) DEFAULT NULL,
  `cnpj` char(14) DEFAULT NULL,
  `supLocation` varchar(45) DEFAULT NULL,
  `contactSupplier` char(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE KEY `unique_supplier` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Bezos Market','Amazon','62694405000124','Campos do Jordão','63975322748'),(2,'Pereira Shop','Shopeira','49579933000174','Guarulhos','69982680726'),(3,'Laila Campos','Lalahairs','48949512000125','Maceió','83985761917'),(4,'Rio Branco Soluções','SolCaseiro','99077148000191','Cuiabá','35992161238'),(5,'Imagination LTDA','Imagination','88432665000115','Amazonas','74997118678');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `idWarehouse` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`idWarehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Vitória'),(2,'Bahia'),(3,'Rio Grande do Sul'),(4,'Santa Catarina'),(5,'Brasília'),(6,'Mato Grosso do Sul');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-02 13:00:35
