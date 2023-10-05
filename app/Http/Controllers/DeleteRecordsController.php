<?php

namespace App\Http\Controllers;

use App\Http\Requests\DeleteRecordRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Record;
use App\Jobs\DeleteRecord;
use Illuminate\Support\Facades\Gate;

class DeleteRecordsController extends Controller
{
    public function __invoke(DeleteRecordRequest $request)
    {
        $validated = $request->validated();
        
        foreach ($validated['recordIds'] as $recordId) 
        {
            $record = Record::GetRecordByRecordId($recordId)->first();

            Gate::authorize('delete-record', $record->user_id);
            
            $record->Pending(recordId: $recordId)->save();

            $validated['recordId'] = $recordId;
            
            dispatch(new DeleteRecord($validated, Auth::User()));
        }
        
        return redirect('/')
            ->with('message', 'Your request is being processed!')
            ->with('positive', true);
    }
}
