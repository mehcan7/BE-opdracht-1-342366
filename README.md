# BE-opdracht-1 - Jamin Magazijn

Laravel-applicatie voor BE-opdracht 01 (Realiseren van User Stories), klas IO-SD-2509*.

## User stories

1. **Inzien leveringsinformatie product** - via Overzicht Magazijn Jamin naar Levering Informatie
2. **Inzien allergeneninformatie van product** - via Overzicht Magazijn Jamin naar Overzicht Allergenen

## Techniek

- Laravel (routing, controllers, Blade views) + Laravel Breeze voor login/registratie
- Losse PDO-queries (`app/Repositories`) voor de Jamin-database, geen Eloquent

## Installatie

1. `composer install`
2. `npm install && npm run build`
3. `.env.example` kopiëren naar `.env` en `php artisan key:generate`
4. Database `jamin` aanmaken met `database/createscript/create_script.sql`
5. `php artisan migrate` (voor de users/cache/jobs tabellen)
6. `composer run dev`
