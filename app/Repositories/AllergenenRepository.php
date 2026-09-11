<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use PDO;

class AllergenenRepository
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

    // Allergenen van een product, gesorteerd op Naam oplopend
    public function allergenen(int $productId): array
    {
        $sql = "SELECT a.Naam, a.Omschrijving
                FROM productperallergeen pa
                INNER JOIN allergeen a ON a.Id = pa.AllergeenId
                WHERE pa.ProductId = :productId
                ORDER BY a.Naam ASC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['productId' => $productId]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
