<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Session;

class PesertaLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Session::has('peserta')){
            return $next($request);
		}else{
			return redirect('/login')->with('error', 'Anda Harus Login Terlebih Dahulu');
		}
    }
}
