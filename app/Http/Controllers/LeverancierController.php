<?php

namespace App\Http\Controllers;

use App\Repositories\LeverancierRepository;

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
}
