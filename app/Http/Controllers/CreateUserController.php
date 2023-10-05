<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Jobs\CreateUser;
use App\Http\Requests\CreateUserRequest;

use App\Models\Record;
use App\Models\User;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class CreateUserController extends Controller
{
    public function __invoke(CreateUserRequest $request)
    {
        $validated = $request->validated();
        
        $file = $validated['csvFile']->get();
        $rows = array_map('str_getcsv', explode("\n", $file));
        
        for ($i=0; $i < count($rows[0]); $i++) 
        { 
            if ('domain_name' === $rows[0][$i]) 
            {
                $rowNumber = $i;
            }
        }

        $userDomains = array_column($rows, $rowNumber);
        unset($userDomains[0]);

        foreach ($userDomains as $key => $value) 
        {
            if (User::where('user_domain', $value)->exists()) 
            {
                unset($userDomains[$key]);
            }
        }

        foreach ($userDomains as $userDomain) 
        {
            $data = [
                'userDomain' => $userDomain,
                'servicePack' => config('combell.servicepacks.kdgStudent'),
            ];
            
            dispatch(new CreateUser($data));
        }

        return redirect('/')
            ->with('message', 'Your request is being processed!')
            ->with('positive', true);
    }
}
