<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Eén testaccount per gebruikersrol
        $gebruikers = [
            ['name' => 'Admin', 'email' => 'admin@gmail.com', 'rol' => 'Admin', 'password' => 'admin'],
            ['name' => 'Magazijnmedewerker', 'email' => 'magazijnmedewerker@gmail.com', 'rol' => 'Magazijnmedewerker', 'password' => 'magazijnmedewerker'],
            ['name' => 'Klant', 'email' => 'klant@gmail.com', 'rol' => 'Klant', 'password' => 'klant'],
        ];

        foreach ($gebruikers as $gebruiker) {
            User::updateOrCreate(
                ['email' => $gebruiker['email']],
                $gebruiker + ['email_verified_at' => now()],
            );
        }
    }
}
