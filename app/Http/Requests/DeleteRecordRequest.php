<?php

namespace App\Http\Requests;

use App\Http\Requests\CustomFormRequest;

class DeleteRecordRequest extends CustomFormRequest
{
    public function rules(): array
    {
        return [
            'recordIds' => 'required|array|min:1',
            'recordIds.*' => 'required|string|min:12|max:12',
        ];
    }
}
