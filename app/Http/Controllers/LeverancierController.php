<?php

namespace App\Http\Controllers;

use App\Repositories\LeverancierRepository;
use Illuminate\Http\Request;

class LeverancierController extends Controller
{
    public function overzicht(LeverancierRepository $repository)
    {
        $leveranciers = $repository->alleLeveranciers();

        return view('leverancier.overzicht', compact('leveranciers'));
    }

    public function producten(int $leverancier, LeverancierRepository $repository)
    {
        $leverancierInfo = $repository->leverancier($leverancier);

        abort_unless($leverancierInfo, 404);

        $producten = $repository->geleverdeProducten($leverancier);

        return view('leverancier.producten', compact('leverancierInfo', 'producten'));
    }

    public function nieuweLevering(int $leverancier, int $product, LeverancierRepository $repository)
    {
        $info = $repository->leveringProductInfo($leverancier, $product);

        abort_unless($info, 404);

        return view('leverancier.levering', ['info' => $info, 'melding' => null]);
    }

    public function opslaanLevering(Request $request, int $leverancier, int $product, LeverancierRepository $repository)
    {
        $info = $repository->leveringProductInfo($leverancier, $product);

        abort_unless($info, 404);

        $gegevens = $request->validate([
            'aantal' => ['required', 'integer', 'min:1'],
            'datum_eerstvolgende_levering' => ['required', 'date'],
        ]);

        if (! $info['ProductIsActief']) {
            $melding = "Het product {$info['NaamProduct']} van de leverancier {$info['NaamLeverancier']} wordt niet meer geproduceerd";

            return view('leverancier.levering', compact('info', 'melding'));
        }

        $repository->createLevering($leverancier, $product, (int) $gegevens['aantal'], $gegevens['datum_eerstvolgende_levering']);

        return redirect()->route('leverancier.producten', $leverancier);
    }
}
