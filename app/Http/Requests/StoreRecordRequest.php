<?php

namespace App\Http\Requests;

use App\Http\Requests\CustomFormRequest;
use Illuminate\Support\Facades\Config;

class StoreRecordRequest extends CustomFormRequest
{
    public function rules()
    {        
        return [
            'recordId' => 'string|min:12|max:12',
            'recordType' => 'required|in:' . config('combell.validation.recordTypes'),
            'recordName' => 'required|regex:' . config('combell.validation.regexRecordName'),
            'content' => 'max:255|nullable|required_unless:recordType,A' . ($this->recordType == 'CNAME' ? '|regex:' . config('combell.validation.regexCnameDestination') : ''),
        ];
    }
}   