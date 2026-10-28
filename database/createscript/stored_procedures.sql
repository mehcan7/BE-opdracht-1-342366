USE `jamin`;

DELIMITER $$


-- Alle leveranciers met het aantal verschillende producten dat zij leveren, aflopend gesorteerd
DROP PROCEDURE IF EXISTS sp_GetAllLeveranciers$$
CREATE PROCEDURE sp_GetAllLeveranciers()
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
END$$


-- Gegevens van één leverancier
DROP PROCEDURE IF EXISTS sp_GetLeverancierById$$
CREATE PROCEDURE sp_GetLeverancierById(IN p_LeverancierId INT UNSIGNED)
BEGIN
    SELECT Id, Naam, ContactPersoon, LeverancierNummer, Mobiel
    FROM Leverancier
    WHERE Id = p_LeverancierId;
END$$


-- Verschillende producten die een leverancier heeft geleverd, aflopend op aantal in magazijn
DROP PROCEDURE IF EXISTS sp_GetGeleverdeProductenByLeverancierId$$
CREATE PROCEDURE sp_GetGeleverdeProductenByLeverancierId(IN p_LeverancierId INT UNSIGNED)
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
END$$


-- Product- en leveranciergegevens voor het scherm Levering product
DROP PROCEDURE IF EXISTS sp_GetLeveringProductInfo$$
CREATE PROCEDURE sp_GetLeveringProductInfo(IN p_LeverancierId INT UNSIGNED, IN p_ProductId INT UNSIGNED)
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
END$$


-- Nieuwe levering opslaan en het aantal in het magazijn verhogen
DROP PROCEDURE IF EXISTS sp_CreateLevering$$
CREATE PROCEDURE sp_CreateLevering(
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
END$$


DELIMITER ;
