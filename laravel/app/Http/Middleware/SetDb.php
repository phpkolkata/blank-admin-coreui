<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;


class SetDb
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
        // check coulm db in users
        $db = Auth::user()->db;
        if($db){
             config()->set('database.connections.mysql.database', $db);
            \DB::purge('mysql');
        }

        return $next($request);
    }
}
