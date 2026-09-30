<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RolMiddleware
{
    // Gebruik: ->middleware('rol:Admin,Magazijnmedewerker')
    public function handle(Request $request, Closure $next, string ...$rollen): Response
    {
        if (! $request->user() || ! in_array($request->user()->rol, $rollen, true)) {
            abort(403, 'Je hebt geen toegang tot deze pagina.');
        }

        return $next($request);
    }
}
