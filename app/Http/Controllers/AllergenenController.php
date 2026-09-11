<?php

namespace App\Http\Controllers;

use App\Repositories\AllergenenRepository;

class AllergenenController extends Controller
{
    public function show(int $product, AllergenenRepository $repository)
    {
        $productInfo = $repository->product($product);
        $allergenen = $repository->allergenen($product);

        return view('magazijn.allergenen', compact('productInfo', 'allergenen'));
    }
}
