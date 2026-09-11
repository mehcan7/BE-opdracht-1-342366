<?php

namespace App\Http\Controllers;

use App\Repositories\LeveringRepository;

class LeveringController extends Controller
{
    public function show(int $product, LeveringRepository $repository)
    {
        $productInfo = $repository->product($product);
        $heeftVoorraad = $repository->heeftVoorraad($product);

        $leveringen = [];
        $eerstvolgendeLevering = null;

        if ($heeftVoorraad) {
            $leveringen = $repository->leveringen($product);
        } else {
            $eerstvolgendeLevering = $repository->eerstvolgendeLevering($product);
        }

        return view('magazijn.levering', compact('productInfo', 'heeftVoorraad', 'leveringen', 'eerstvolgendeLevering'));
    }
}
