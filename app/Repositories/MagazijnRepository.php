<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use PDO;

class MagazijnRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = DB::connection()->getPdo();
    }

    // Alle producten met hun magazijngegevens, gesorteerd op Barcode oplopend
    public function alleProducten(): array
    {
        $sql = "SELECT
                    p.Id,
                    p.Naam,
                    p.Barcode,
                    m.VerpakkingsEenheidInKilogram,
                    m.AantalAanwezig
                FROM product p
                INNER JOIN magazijn m ON m.ProductId = p.Id
                ORDER BY p.Barcode ASC";

        $stmt = $this->pdo->query($sql);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
