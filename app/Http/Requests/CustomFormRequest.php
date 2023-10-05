<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;

class CustomFormRequest extends FormRequest
{
    public function failedValidation(Validator $validator)
    {
        return redirect()->back()
            ->with('message', 'Invalid input!')
            ->with('positive', false);
    }
}