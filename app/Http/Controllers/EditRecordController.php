<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreRecordRequest;
use Illuminate\Http\Request;
use App\Models\Record;
use Illuminate\Support\Facades\Auth;
use App\Jobs\DeleteRecord;
use App\Jobs\CreateRecord;
use Illuminate\Support\Facades\Gate;

class EditRecordController extends Controller
{
    public function __invoke(StoreRecordRequest $request) 
    {
        $validated = $request->validated();

        $query = Record::RecordExists(
            recordName: $validated['recordName'], 
            content: $validated['content']
        );

        if ($query->exists())
        {
            return redirect('/records')
                ->with('message', 'Record already exists!')
                ->with('positive', false);
        }
        
        $record = Record::GetRecordByRecordId(recordId: $validated['recordId'])->first();
        
        Gate::authorize('delete-record', $record->user_id);

        $record->Pending(recordId: $validated['recordId'])->save();
        
        dispatch(new DeleteRecord($validated, Auth::User()));
        dispatch(new CreateRecord($validated, Auth::User()));
        
        return redirect('/')
            ->with('message', 'Your request is being processed!')
            ->with('positive', true);
    }
}