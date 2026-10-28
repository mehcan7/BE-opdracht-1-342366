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


DELIMITER ;
