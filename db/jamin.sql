SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `jamin` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `jamin`;

DROP TABLE IF EXISTS `allergeen`;
CREATE TABLE `allergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Omschrijving` varchar(100) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `allergeen` (`Id`, `Naam`, `Omschrijving`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`)
VALUES
    (1, 'Gluten', 'Dit product bevat gluten', b'1', NULL, '2026-10-28 10:38:14.800119', '2026-10-28 10:38:14.800121'),
    (2, 'Gelatine', 'Dit product bevat gelatine', b'1', NULL, '2026-10-28 10:38:14.800140', '2026-10-28 10:38:14.800141'),
    (3, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen', b'1', NULL, '2026-10-28 10:38:14.800149', '2026-10-28 10:38:14.800150'),
    (4, 'Lactose', 'Dit product bevat lactose', b'1', NULL, '2026-10-28 10:38:14.800153', '2026-10-28 10:38:14.800153'),
    (5, 'Soja', 'Dit product bevat soja', b'1', NULL, '2026-10-28 10:38:14.800155', '2026-10-28 10:38:14.800155');

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `leverancier`;
CREATE TABLE `leverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `ContactPersoon` varchar(75) NOT NULL,
  `LeverancierNummer` varchar(15) NOT NULL,
  `Mobiel` varchar(12) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Leverancier_LeverancierNummer` (`LeverancierNummer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `leverancier` (`Id`, `Naam`, `ContactPersoon`, `LeverancierNummer`, `Mobiel`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`)
VALUES
    (1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', b'1', NULL, '2026-10-28 10:38:14.817426', '2026-10-28 10:38:14.817428'),
    (2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', b'1', NULL, '2026-10-28 10:38:14.817445', '2026-10-28 10:38:14.817446'),
    (3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', b'1', NULL, '2026-10-28 10:38:14.817456', '2026-10-28 10:38:14.817457'),
    (4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', b'1', NULL, '2026-10-28 10:38:14.817461', '2026-10-28 10:38:14.817461'),
    (5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', b'1', NULL, '2026-10-28 10:38:14.817465', '2026-10-28 10:38:14.817465'),
    (6, 'Quality Street', 'Johan Nooij', 'L1029234586', '06-23458456', b'1', NULL, '2026-10-28 10:38:14.817468', '2026-10-28 10:38:14.817468');

DROP TABLE IF EXISTS `magazijn`;
CREATE TABLE `magazijn` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `VerpakkingsEenheidInKilogram` decimal(6,3) NOT NULL,
  `AantalAanwezig` int unsigned DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `magazijn` (`Id`, `ProductId`, `VerpakkingsEenheidInKilogram`, `AantalAanwezig`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`)
VALUES
    (1, 1, 5.000, 453, b'1', NULL, '2026-10-28 10:38:14.837518', '2026-10-28 10:38:14.837520'),
    (2, 2, 2.500, 400, b'1', NULL, '2026-10-28 10:38:14.837542', '2026-10-28 10:38:14.837542'),
    (3, 3, 5.000, 1, b'1', NULL, '2026-10-28 10:38:14.837554', '2026-10-28 10:38:14.837554'),
    (4, 4, 1.000, 800, b'1', NULL, '2026-10-28 10:38:14.837558', '2026-10-28 10:38:14.837558'),
    (5, 5, 3.000, 234, b'1', NULL, '2026-10-28 10:38:14.837562', '2026-10-28 10:38:14.837562'),
    (6, 6, 2.000, 345, b'1', NULL, '2026-10-28 10:38:14.837566', '2026-10-28 10:38:14.837566'),
    (7, 7, 1.000, 795, b'1', NULL, '2026-10-28 10:38:14.837569', '2026-10-28 10:38:14.837569'),
    (8, 8, 10.000, 233, b'1', NULL, '2026-10-28 10:38:14.837573', '2026-10-28 10:38:14.837573'),
    (9, 9, 2.500, 123, b'1', NULL, '2026-10-28 10:38:14.837576', '2026-10-28 10:38:14.837576'),
    (10, 10, 3.000, NULL, b'1', NULL, '2026-10-28 10:38:14.837580', '2026-10-28 10:38:14.837580'),
    (11, 11, 2.000, 367, b'1', NULL, '2026-10-28 10:38:14.837584', '2026-10-28 10:38:14.837584'),
    (12, 12, 1.000, 467, b'1', NULL, '2026-10-28 10:38:14.837587', '2026-10-28 10:38:14.837587'),
    (13, 13, 5.000, 20, b'1', NULL, '2026-10-28 10:38:14.837591', '2026-10-28 10:38:14.837591');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
    (1, '0001_01_01_000000_create_users_table', 1),
    (2, '0001_01_01_000001_create_cache_table', 1),
    (3, '0001_01_01_000002_create_jobs_table', 1),
    (4, '2026_09_30_000000_add_rol_to_users_table', 1);

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Barcode` varchar(13) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Product_Barcode` (`Barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product` (`Id`, `Naam`, `Barcode`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`)
VALUES
    (1, 'Mintnopjes', '8719587231278', b'1', NULL, '2026-10-28 10:38:14.787183', '2026-10-28 10:38:14.787186'),
    (2, 'Schoolkrijt', '8719587326713', b'1', NULL, '2026-10-28 10:38:14.787212', '2026-10-28 10:38:14.787212'),
    (3, 'Honingdrop', '8719587327836', b'1', NULL, '2026-10-28 10:38:14.787227', '2026-10-28 10:38:14.787228'),
    (4, 'Zure Beren', '8719587321441', b'1', NULL, '2026-10-28 10:38:14.787232', '2026-10-28 10:38:14.787233'),
    (5, 'Cola Flesjes', '8719587321237', b'1', NULL, '2026-10-28 10:38:14.787237', '2026-10-28 10:38:14.787237'),
    (6, 'Turtles', '8719587322245', b'1', NULL, '2026-10-28 10:38:14.787241', '2026-10-28 10:38:14.787241'),
    (7, 'Witte Muizen', '8719587328256', b'1', NULL, '2026-10-28 10:38:14.787245', '2026-10-28 10:38:14.787246'),
    (8, 'Reuzen Slangen', '8719587325641', b'1', NULL, '2026-10-28 10:38:14.787268', '2026-10-28 10:38:14.787269'),
    (9, 'Zoute Rijen', '8719587322739', b'1', NULL, '2026-10-28 10:38:14.787273', '2026-10-28 10:38:14.787273'),
    (10, 'Winegums', '8719587327527', b'0', NULL, '2026-10-28 10:38:14.787277', '2026-10-28 10:38:14.787277'),
    (11, 'Drop Munten', '8719587322345', b'1', NULL, '2026-10-28 10:38:14.787281', '2026-10-28 10:38:14.787281'),
    (12, 'Kruis Drop', '8719587322265', b'1', NULL, '2026-10-28 10:38:14.787284', '2026-10-28 10:38:14.787285'),
    (13, 'Zoute Ruitjes', '8719587323256', b'1', NULL, '2026-10-28 10:38:14.787288', '2026-10-28 10:38:14.787288');

DROP TABLE IF EXISTS `productperallergeen`;
CREATE TABLE `productperallergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `AllergeenId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_ProductPerAllergeen_ProductId_AllergeenId` (`ProductId`,`AllergeenId`),
  KEY `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` (`AllergeenId`),
  CONSTRAINT `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` FOREIGN KEY (`AllergeenId`) REFERENCES `allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `productperallergeen` (`Id`, `ProductId`, `AllergeenId`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`)
VALUES
    (1, 1, 2, b'1', NULL, '2026-10-28 10:38:14.877594', '2026-10-28 10:38:14.877597'),
    (2, 1, 1, b'1', NULL, '2026-10-28 10:38:14.877626', '2026-10-28 10:38:14.877627'),
    (3, 1, 3, b'1', NULL, '2026-10-28 10:38:14.877641', '2026-10-28 10:38:14.877641'),
    (4, 3, 4, b'1', NULL, '2026-10-28 10:38:14.877648', '2026-10-28 10:38:14.877648'),
    (5, 6, 5, b'1', NULL, '2026-10-28 10:38:14.877655', '2026-10-28 10:38:14.877655'),
    (6, 9, 2, b'1', NULL, '2026-10-28 10:38:14.877661', '2026-10-28 10:38:14.877661'),
    (7, 9, 5, b'1', NULL, '2026-10-28 10:38:14.877667', '2026-10-28 10:38:14.877668'),
    (8, 10, 2, b'1', NULL, '2026-10-28 10:38:14.877674', '2026-10-28 10:38:14.877674'),
    (9, 12, 4, b'1', NULL, '2026-10-28 10:38:14.877680', '2026-10-28 10:38:14.877680'),
    (10, 13, 1, b'1', NULL, '2026-10-28 10:38:14.877699', '2026-10-28 10:38:14.877700'),
    (11, 13, 4, b'1', NULL, '2026-10-28 10:38:14.877706', '2026-10-28 10:38:14.877706'),
    (12, 13, 5, b'1', NULL, '2026-10-28 10:38:14.877751', '2026-10-28 10:38:14.877751');

DROP TABLE IF EXISTS `productperleverancier`;
CREATE TABLE `productperleverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `LeverancierId` int unsigned NOT NULL,
  `ProductId` int unsigned NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int unsigned NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `productperleverancier` (`Id`, `LeverancierId`, `ProductId`, `DatumLevering`, `Aantal`, `DatumEerstVolgendeLevering`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`)
VALUES
    (1, 1, 1, '2024-11-09', 23, '2024-11-16', b'1', NULL, '2026-10-28 10:38:14.899123', '2026-10-28 10:38:14.899124'),
    (2, 1, 1, '2024-11-18', 21, '2024-11-25', b'1', NULL, '2026-10-28 10:38:14.899147', '2026-10-28 10:38:14.899147'),
    (3, 1, 2, '2024-11-09', 12, '2024-11-16', b'1', NULL, '2026-10-28 10:38:14.899159', '2026-10-28 10:38:14.899160'),
    (4, 1, 3, '2024-11-10', 11, '2024-11-17', b'1', NULL, '2026-10-28 10:38:14.899166', '2026-10-28 10:38:14.899166'),
    (5, 2, 4, '2024-11-14', 16, '2024-11-21', b'1', NULL, '2026-10-28 10:38:14.899171', '2026-10-28 10:38:14.899172'),
    (6, 2, 4, '2024-11-21', 23, '2024-11-28', b'1', NULL, '2026-10-28 10:38:14.899177', '2026-10-28 10:38:14.899177'),
    (7, 2, 5, '2024-11-14', 45, '2024-11-21', b'1', NULL, '2026-10-28 10:38:14.899182', '2026-10-28 10:38:14.899182'),
    (8, 2, 6, '2024-11-14', 30, '2024-11-21', b'1', NULL, '2026-10-28 10:38:14.899187', '2026-10-28 10:38:14.899187'),
    (9, 3, 7, '2024-11-12', 12, '2024-11-19', b'1', NULL, '2026-10-28 10:38:14.899192', '2026-10-28 10:38:14.899192'),
    (10, 3, 7, '2024-11-19', 23, '2024-11-26', b'1', NULL, '2026-10-28 10:38:14.899197', '2026-10-28 10:38:14.899197'),
    (11, 3, 8, '2024-11-10', 12, '2024-11-17', b'1', NULL, '2026-10-28 10:38:14.899202', '2026-10-28 10:38:14.899202'),
    (12, 3, 9, '2024-11-11', 1, '2024-11-18', b'1', NULL, '2026-10-28 10:38:14.899208', '2026-10-28 10:38:14.899208'),
    (13, 4, 10, '2024-11-16', 24, '2024-11-30', b'1', NULL, '2026-10-28 10:38:14.899213', '2026-10-28 10:38:14.899213'),
    (14, 5, 11, '2024-11-10', 47, '2024-11-17', b'1', NULL, '2026-10-28 10:38:14.899218', '2026-10-28 10:38:14.899218'),
    (15, 5, 11, '2024-11-19', 60, '2024-11-26', b'1', NULL, '2026-10-28 10:38:14.899223', '2026-10-28 10:38:14.899223'),
    (16, 5, 12, '2024-11-11', 45, NULL, b'1', NULL, '2026-10-28 10:38:14.899228', '2026-10-28 10:38:14.899228'),
    (17, 5, 13, '2024-11-12', 23, NULL, b'1', NULL, '2026-10-28 10:38:14.899234', '2026-10-28 10:38:14.899234');

DROP PROCEDURE IF EXISTS `sp_CreateLevering`;
DELIMITER ;;
CREATE PROCEDURE `sp_CreateLevering`(
    IN p_LeverancierId              INT UNSIGNED,
    IN p_ProductId                  INT UNSIGNED,
    IN p_Aantal                     INT UNSIGNED,
    IN p_DatumEerstVolgendeLevering DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF (SELECT IsActief FROM Product WHERE Id = p_ProductId) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dit product wordt niet meer geproduceerd';
    END IF;

    START TRANSACTION;

    INSERT INTO ProductPerLeverancier
        (LeverancierId, ProductId, DatumLevering, Aantal, DatumEerstVolgendeLevering, IsActief, Opmerking, DatumAangemaakt, DatumGewijzigd)
    VALUES
        (p_LeverancierId, p_ProductId, CURDATE(), p_Aantal, p_DatumEerstVolgendeLevering, 1, NULL, SYSDATE(6), SYSDATE(6));

    UPDATE Magazijn
    SET AantalAanwezig = COALESCE(AantalAanwezig, 0) + p_Aantal,
        DatumGewijzigd = SYSDATE(6)
    WHERE ProductId = p_ProductId;

    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `sp_GetAllLeveranciers`;
DELIMITER ;;
CREATE PROCEDURE `sp_GetAllLeveranciers`()
BEGIN
    SELECT
        l.Id,
        l.Naam,
        l.ContactPersoon,
        l.LeverancierNummer,
        l.Mobiel,
        COUNT(DISTINCT ppl.ProductId) AS AantalVerschillendeProducten
    FROM Leverancier l
    LEFT JOIN ProductPerLeverancier ppl ON ppl.LeverancierId = l.Id
    GROUP BY l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel
    ORDER BY AantalVerschillendeProducten DESC, l.Naam ASC;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `sp_GetGeleverdeProductenByLeverancierId`;
DELIMITER ;;
CREATE PROCEDURE `sp_GetGeleverdeProductenByLeverancierId`(IN p_LeverancierId INT UNSIGNED)
BEGIN
    SELECT
        p.Id AS ProductId,
        p.Naam AS NaamProduct,
        m.AantalAanwezig,
        m.VerpakkingsEenheidInKilogram,
        MAX(ppl.DatumLevering) AS LaatsteLevering
    FROM ProductPerLeverancier ppl
    INNER JOIN Product p ON p.Id = ppl.ProductId
    INNER JOIN Magazijn m ON m.ProductId = p.Id
    WHERE ppl.LeverancierId = p_LeverancierId
    GROUP BY p.Id, p.Naam, m.AantalAanwezig, m.VerpakkingsEenheidInKilogram
    ORDER BY m.AantalAanwezig DESC;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `sp_GetLeverancierById`;
DELIMITER ;;
CREATE PROCEDURE `sp_GetLeverancierById`(IN p_LeverancierId INT UNSIGNED)
BEGIN
    SELECT Id, Naam, ContactPersoon, LeverancierNummer, Mobiel
    FROM Leverancier
    WHERE Id = p_LeverancierId;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `sp_GetLeveringProductInfo`;
DELIMITER ;;
CREATE PROCEDURE `sp_GetLeveringProductInfo`(IN p_LeverancierId INT UNSIGNED, IN p_ProductId INT UNSIGNED)
BEGIN
    SELECT
        p.Id AS ProductId,
        p.Naam AS NaamProduct,
        CAST(p.IsActief AS UNSIGNED) AS ProductIsActief,
        l.Id AS LeverancierId,
        l.Naam AS NaamLeverancier,
        l.ContactPersoon,
        l.Mobiel
    FROM Product p
    INNER JOIN Leverancier l ON l.Id = p_LeverancierId
    WHERE p.Id = p_ProductId
      AND EXISTS (
          SELECT 1
          FROM ProductPerLeverancier ppl
          WHERE ppl.LeverancierId = p_LeverancierId
            AND ppl.ProductId = p_ProductId
      );
END ;;
DELIMITER ;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL DEFAULT 'Klant',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
