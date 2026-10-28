<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use PDO;

class LeverancierRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = DB::connection()->getPdo();
    }

    // Alle leveranciers met het aantal verschillende producten, aflopend gesorteerd
    public function alleLeveranciers(): array
    {
        $stmt = $this->pdo->prepare('CALL sp_GetAllLeveranciers()');
        $stmt->execute();
        $leveranciers = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        return $leveranciers;
    }

    public function leverancier(int $leverancierId): array|false
    {
        $stmt = $this->pdo->prepare('CALL sp_GetLeverancierById(:leverancierId)');
        $stmt->execute(['leverancierId' => $leverancierId]);
        $leverancier = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        return $leverancier;
    }

    // Geleverde producten van een leverancier, aflopend op aantal in magazijn
    public function geleverdeProducten(int $leverancierId): array
    {
        $stmt = $this->pdo->prepare('CALL sp_GetGeleverdeProductenByLeverancierId(:leverancierId)');
        $stmt->execute(['leverancierId' => $leverancierId]);
        $producten = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        return $producten;
    }
}
