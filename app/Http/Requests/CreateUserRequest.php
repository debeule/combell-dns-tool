<?php

namespace App\Http\Requests;

use App\Http\Requests\CustomFormRequest;

class CreateUserRequest extends CustomFormRequest
{
    public function rules(): array
    {
        return [
            'csvFile' => 'required|file|mimes:txt,csv'
        ];
    }
}