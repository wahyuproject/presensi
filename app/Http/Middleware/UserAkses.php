<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class UserAkses
{
        /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, $kodeakses): Response
    {
        if(auth()->user()->kodeakses == $kodeakses){
            return $next($request);
        }
        // return response()->json('Anda tidak diperbolehkan akses halaman ini.');

        return response()->view('errors.403'); // tambahkan view khusus untuk pesan 403
    }
}
