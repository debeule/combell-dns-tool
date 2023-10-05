<?php

namespace App\Http\Controllers;

use App\Models\Record;
use App\Models\User;

class GetUsersController extends Controller
{

    public function __invoke() 
    {
        $users = User::orderBy('created_at', 'asc')
            ->withCount('records')
            ->paginate(20);
        
        return view('frontend.admin', ['responses' => $users]);
    }
}
