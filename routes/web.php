<?php

use App\Http\Controllers\AllergenenController;
use App\Http\Controllers\LeverancierController;
use App\Http\Controllers\LeveringController;
use App\Http\Controllers\MagazijnController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::middleware(['auth', 'rol:Admin,Magazijnmedewerker'])->group(function () {
    Route::get('/magazijn', [MagazijnController::class, 'overzicht'])->name('magazijn.overzicht');
    Route::get('/magazijn/{product}/levering', [LeveringController::class, 'show'])->name('magazijn.levering');
    Route::get('/magazijn/{product}/allergenen', [AllergenenController::class, 'show'])->name('magazijn.allergenen');

    Route::get('/leveranciers', [LeverancierController::class, 'overzicht'])->name('leverancier.overzicht');
    Route::get('/leveranciers/{leverancier}/producten', [LeverancierController::class, 'producten'])->name('leverancier.producten');
    Route::get('/leveranciers/{leverancier}/producten/{product}/levering', [LeverancierController::class, 'nieuweLevering'])->name('leverancier.levering');
    Route::post('/leveranciers/{leverancier}/producten/{product}/levering', [LeverancierController::class, 'opslaanLevering'])->name('leverancier.levering.opslaan');
});

require __DIR__.'/auth.php';
