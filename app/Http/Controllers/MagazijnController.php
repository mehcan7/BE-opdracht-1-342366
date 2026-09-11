<?php

namespace App\Http\Controllers;

use App\Repositories\MagazijnRepository;

class MagazijnController extends Controller
{
    public function overzicht(MagazijnRepository $repository)
    {
        $producten = $repository->alleProducten();

        return view('magazijn.overzicht', compact('producten'));
    }
}
