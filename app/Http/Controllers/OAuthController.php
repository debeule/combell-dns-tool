<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class OAuthController extends Controller
{
    public function login()
    {
        return Socialite::driver('azure')->stateless()->redirect();
    }

    public function redirect()
    {
        $user = Socialite::driver('azure')->stateless()->user();
        
        $userExist = User::where('oauth_id', $user->id)->first();
        
        if ($userExist != null)
        {
            Auth::login($userExist);
            return redirect('/records');
        }

        $newUser = User::where('email', $user->email)->first();
        $newUser->oauth_id = $user->id;
        $newUser->save();


        Auth::login($newUser);

        return redirect('/records');
    }

    public function logout()
    {
        Auth::logout();
        
        return redirect('/login');
    }
}