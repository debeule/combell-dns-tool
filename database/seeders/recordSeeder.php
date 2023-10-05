<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Helpers\CombellApi\Tasks;
use App\Traits\DecodeJsonFile;
use App\Models\User;

class RecordSeeder extends Seeder
{
    use DecodeJsonFile;

    public function run()
    {
        $Tasks = new Tasks();
        $response = $Tasks->getAllRecords();
        $records = Self::decodeJsonFile($response);

        $i = 0;
        $filteredRecords = array();
        foreach ($records as $record)
        {
            if (!in_array($record['type'], ['AAAA', 'SRV', 'MX', 'CNAME']))
            {
                $filteredRecords[$i] = $record;
                $i++;
            }
        }

        foreach ($filteredRecords as $record) {
            $recordNameArray = explode('.', $record['record_name']);
            array_splice($recordNameArray, -2);
            $recordName = implode($recordNameArray);
                
            $userDomainArray = explode('.', $record['record_name']);
            array_splice($userDomainArray, 0, count($userDomainArray) - 2);
            $userDomain = implode('.', $userDomainArray);

            $user = User::where('user_domain', $userDomain)->first(['id']);

            if (!empty($user->id)) 
            {
                DB::table('records')->insert([
                    'record_id' => $record['id'],
                    'type' => $record['type'],
                    'record_name' => $recordName,
                    'content' => $record['type'] == 'A' ? null : $record['content'],
                    'user_id' =>  $user['id'],
                ]);
            }
            
            $user = User::where('user_domain', $userDomain)->first();
            
            if (!empty($user) && empty($user['user_combell_ip'])) 
            {
                $user->user_combell_ip = $record['content'];
                $user->save();
            }
        }
    }
}