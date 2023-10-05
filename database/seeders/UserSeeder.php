<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use App\Traits\DecodeJsonFile;
use App\Helpers\CombellApi\Tasks;
use App\Models\User;


class UserSeeder extends Seeder
{
    use DecodeJsonFile;
    
    public function run()
    {
        $Tasks = new Tasks();
        $response = $Tasks->getAllUsers();
        $response = Self::decodeJsonFile($response);
        
        $filteredResponse = array_filter($response, function ($item) 
        {            
            return $item['servicepack_id'] == config('combell.servicepacks.kdgStudent') || $item['servicepack_id'] == config('combell.servicepacks.webNinja');
        });

        foreach ($filteredResponse as $user) 
        {
            $identifierArray = explode('.', $user['identifier']);
            $firstName = $identifierArray[0];
            $lastName = $identifierArray[1];
            $userDomain = $firstName . '.' . $lastName;

            $email = $firstName . '.' . $lastName . '@student.kdg.be';
            if (in_array($userDomain, config::get('combell.admins')) ) 
            {
                $email  = $firstName . '.' . $lastName . '@kdg.be';
            }

            DB::table('users')->insert([
                'first_name' => $firstName,
                'last_name' => $lastName,
                'email' => $email,
                'user_domain' => $userDomain,
            ]);
        }

        $adminEmailsArray = [
            'sam.serrien@kdg.be',
            'yassin.samadi@student.kdg.be',
            'matthias.debeule@student.kdg.be',
        ];

        $admins = User::whereIn('email', $adminEmailsArray)->get();
        
        if (!empty($admins)) 
        {
            foreach ($admins as $admin) {
                $admin->assignRole('admin');
            }
        }
    }
}
