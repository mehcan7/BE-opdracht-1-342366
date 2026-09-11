<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use PDO;

class LeveringRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = DB::connection()->getPdo();
    }

    public function product(int $productId): array|false
    {
        $stmt = $this->pdo->prepare('SELECT Id, Naam, Barcode FROM product WHERE Id = :productId');
        $stmt->execute(['productId' => $productId]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Geen voorraad in het magazijn = AantalAanwezig staat op NULL
    public function heeftVoorraad(int $productId): bool
    {
        $stmt = $this->pdo->prepare('SELECT AantalAanwezig FROM magazijn WHERE ProductId = :productId');
        $stmt->execute(['productId' => $productId]);

        return $stmt->fetchColumn() !== null;
    }

    // Alle leveringen van een product, gesorteerd op Datum laatste levering oplopend
    public function leveringen(int $productId): array
    {
        $sql = "SELECT
                    l.Naam AS NaamLeverancier,
                    l.ContactPersoon,
                    l.LeverancierNummer,
                    l.Mobiel,
                    p.Naam AS NaamProduct,
                    pl.DatumLevering,
                    pl.Aantal,
                    pl.DatumEerstVolgendeLevering
                FROM productperleverancier pl
                INNER JOIN leverancier l ON l.Id = pl.LeverancierId
                INNER JOIN product p ON p.Id = pl.ProductId
                WHERE pl.ProductId = :productId
                ORDER BY pl.DatumLevering ASC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['productId' => $productId]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Eerstvolgende levering voor het geval er nu geen voorraad is
    public function eerstvolgendeLevering(int $productId): ?string
    {
        $sql = "SELECT DatumEerstVolgendeLevering
                FROM productperleverancier
                WHERE ProductId = :productId
                ORDER BY DatumLevering DESC
                LIMIT 1";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['productId' => $productId]);

        $datum = $stmt->fetchColumn();

        return $datum ?: null;
    }
}
