<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Jobs\DeleteRecord;
use App\Models\Record;
use App\Models\User;
use App\Http\Requests\DeleteUserRecordsRequest;

class DeleteUserRecordsController extends Controller
{
    public function __invoke(DeleteUserRecordsRequest $request)
    {
        $validated = $request->validated();
        
        foreach ($validated['userIds'] as $userId) 
        {
            $userRecords = Record::getUserRecords(userId: $userId)->get();
            
            foreach ($userRecords as $record) 
            {
                $data = [
                    'recordId' => $record->record_id
                ];
                
                dispatch(new DeleteRecord($data, User::find($userId)));
            }
        }
    }
}
