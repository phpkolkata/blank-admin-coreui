<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use JWTAuth;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('jwt', ['except' => ['login']]);
        // $this->middleware('auth:api', ['except' => ['login']]);
    }

    /**
     * Get a JWT token via given credentials.
     *
     * @param  \Illuminate\Http\Request  $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {

        $credentials = $request->only('email', 'password');

        // $con = \Config::get('database.connections.mysql');
        // print_r($con);

        if ($token = Auth::attempt($credentials)) {
            // if normal login success,then login with jwt-auth with payload from db
            return $this->respondWithToken($credentials);
        }
        return response()->json(['success' => false, 'error' => 'Unauthorized Access or wrong email/password.']);
    }

    /**
     * Get the authenticated User
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json($this->guard()->user());
    }

    public function authenticate()
    {
        if (!$user = JWTAuth::parseToken()->authenticate()) {
            return response()->json(['success' => false, 'error' => 'unauthenticated token! Please login again.']);
        } else {
            return response()->json(['success' => true]);
        }

    }

    public function payload()
    {
        $payload = auth()->payload();
        return $payload;
    }

    /**
     * Log the user out (Invalidate the token)
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        $this->guard()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken($this->guard()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($credentials)
    {
        $user  = Auth::user();
        $token = $this->guard()
            ->claims([
                'role' => $user->role,
                'modules' => $user->modules,
                'name' => $user->name,
            ])
            ->attempt($credentials);

        return response()->json([
            'success'      => true,
            'access_token' => $token,
            'token_type'   => 'bearer',
            'active_id'    => $user->centre_admin_id,
            'expires_in'   => $this->guard()->factory()->getTTL() * 60,
        ]);
    }

    /**
     * Get the guard to be used during authentication.
     *
     * @return \Illuminate\Contracts\Auth\Guard
     */
    public function guard()
    {
        return Auth::guard();
    }
}
