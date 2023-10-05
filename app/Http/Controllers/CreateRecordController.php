<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreRecordRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\Record;
use App\Jobs\CreateRecord;

class CreateRecordController extends Controller
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

        dispatch(new CreateRecord($validated, Auth::User()));
        
        return redirect('/records')
            ->with('message', 'Your request is being processed!')
            ->with('positive', true);
    }
}
