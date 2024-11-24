-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.5.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla presupuesto_familiar.ahorro
CREATE TABLE IF NOT EXISTS `ahorro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `familia_id` int(11) DEFAULT NULL,
  `Monto_Total` decimal(10,2) DEFAULT NULL,
  `Objetivo` varchar(100) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Final` date DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `ID_Familia` (`familia_id`) USING BTREE,
  CONSTRAINT `FK_ahorro_familia` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla presupuesto_familiar.ahorro: ~1 rows (aproximadamente)
INSERT INTO `ahorro` (`Id`, `familia_id`, `Monto_Total`, `Objetivo`, `Fecha_Inicio`, `Fecha_Final`) VALUES
	(1, 1, 300.00, 'Alimento', '2024-11-23', '2024-11-23');

-- Volcando estructura para tabla presupuesto_familiar.familia
CREATE TABLE IF NOT EXISTS `familia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripción` text DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla presupuesto_familiar.familia: ~1 rows (aproximadamente)
INSERT INTO `familia` (`Id`, `Nombre`, `Descripción`) VALUES
	(1, 'Gregory', 'Hijo');

-- Volcando estructura para tabla presupuesto_familiar.gastos
CREATE TABLE IF NOT EXISTS `gastos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL DEFAULT '0',
  `fecha_gasto` year(4) NOT NULL DEFAULT 2000,
  `monto` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `tipo` varchar(50) NOT NULL DEFAULT '0',
  `familia_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `ID_Familia` (`familia_id`) USING BTREE,
  KEY `FK_gastos_familia` (`familia_id`),
  CONSTRAINT `FK_gastos_familia` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla presupuesto_familiar.gastos: ~1 rows (aproximadamente)
INSERT INTO `gastos` (`Id`, `categoria`, `fecha_gasto`, `monto`, `tipo`, `familia_id`) VALUES
	(1, '1', '2000', 1000.000000, 'alimento', 1);

-- Volcando estructura para tabla presupuesto_familiar.ingreso
CREATE TABLE IF NOT EXISTS `ingreso` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `familia_id` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `Descripción` text DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `ID_Familia` (`familia_id`) USING BTREE,
  CONSTRAINT `FK_ingreso_familia` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla presupuesto_familiar.ingreso: ~1 rows (aproximadamente)
INSERT INTO `ingreso` (`Id`, `familia_id`, `Fecha`, `Monto`, `Descripción`) VALUES
	(1, 1, '2024-11-23', 1.00, '');

-- Volcando estructura para tabla presupuesto_familiar.miembro
CREATE TABLE IF NOT EXISTS `miembro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `familia_id` int(11) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `ID_Familia` (`familia_id`) USING BTREE,
  CONSTRAINT `FK_miembro_familia` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla presupuesto_familiar.miembro: ~1 rows (aproximadamente)
INSERT INTO `miembro` (`Id`, `familia_id`, `Nombre`, `Rol`, `Email`) VALUES
	(1, 1, 'No se', 'Hijo sis', 'hgdhgdhg');

-- Volcando estructura para tabla presupuesto_familiar.presupuesto
CREATE TABLE IF NOT EXISTS `presupuesto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `familia_id` int(11) DEFAULT NULL,
  `Mes` int(11) DEFAULT NULL,
  `Año` int(11) DEFAULT NULL,
  `Monto_Planificado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `ID_Familia` (`familia_id`) USING BTREE,
  CONSTRAINT `FK_presupuesto_familia` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla presupuesto_familiar.presupuesto: ~1 rows (aproximadamente)
INSERT INTO `presupuesto` (`Id`, `familia_id`, `Mes`, `Año`, `Monto_Planificado`) VALUES
	(1, 1, 11, 2024, 700.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
