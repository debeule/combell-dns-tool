<?php

namespace App\Http\Requests;

use App\Http\Requests\CustomFormRequest;

class DeleteUserRecordsRequest extends CustomFormRequest
{
    public function rules(): array
    {
        return [
            'userIds' => 'required|array',
            'userIds.*' => 'required|string',
        ];
    }
}