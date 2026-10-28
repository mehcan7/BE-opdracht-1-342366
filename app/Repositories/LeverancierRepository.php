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

    // Product- en leveranciergegevens voor het scherm Levering product
    public function leveringProductInfo(int $leverancierId, int $productId): array|false
    {
        $stmt = $this->pdo->prepare('CALL sp_GetLeveringProductInfo(:leverancierId, :productId)');
        $stmt->execute(['leverancierId' => $leverancierId, 'productId' => $productId]);
        $info = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();

        return $info;
    }

    // Slaat de levering op en verhoogt het aantal in het magazijn
    public function createLevering(int $leverancierId, int $productId, int $aantal, string $datumEerstVolgendeLevering): void
    {
        $stmt = $this->pdo->prepare('CALL sp_CreateLevering(:leverancierId, :productId, :aantal, :datum)');
        $stmt->execute([
            'leverancierId' => $leverancierId,
            'productId' => $productId,
            'aantal' => $aantal,
            'datum' => $datumEerstVolgendeLevering,
        ]);
        $stmt->closeCursor();
    }
}
