<?php

namespace App\Http\Controllers;

use App\Models\Record;
use Illuminate\Support\Facades\Auth;

class GetRecordsController extends Controller
{

    public function __invoke() 
    {
        $myRecords = Record::where('user_id', Auth::User()->id)
            ->whereRaw('record_name <> ""')
            ->orderBy('record_name', 'asc')
            ->select('record_name', 'type', 'record_id', 'is_pending', 'content')
            ->paginate(8);
        
        return view('frontend.index', ['responses' => $myRecords, 'userDomain' => Auth::User()->user_domain]);
    }
}
