<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cookie;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    public function register(Request $request)
    {
         // Create the user
    $user = User::create([
        'name' => $request->input('name'),
        'email' => $request->input('email'),
        'password' => Hash::make($request->input('password'))
    ]);

    // Return the success response with a message
    return response()->json([
        'message' => 'Registration successful!',
        'user' => $user
    ], Response::HTTP_CREATED);
    }

    public function login(Request $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response([ 
                'message' => 'Invalid credentials!'
            ], Response::HTTP_UNAUTHORIZED);
        }

        $user = Auth::user();
        // return $user;

     // Debug: Print the user to see if authentication works
    // dd($user);

    // Generate the API token
    $token = $user->createToken('api-token')->plainTextToken;

   //$cookie = cookie('jwt',$token,60*24);
    return response([
        'message' => 'Success',
        "JWt"=>$token
      
    ]);
    //->withCookie($cookie)
    }

    public function user()
    {
        return Auth::user();
    }

    public function logout(Request $request)
    {
        $cookie = Cookie::forget('jwt');

        return response([
            'message' => 'Success'
        ])->withCookie($cookie);
    }
}