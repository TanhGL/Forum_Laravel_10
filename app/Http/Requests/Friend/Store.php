<?php

declare(strict_types=1);

namespace App\Http\Requests\Friend;

use Illuminate\Foundation\Http\FormRequest;

class Store extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string,string>
     */
    public function rules()
    {
        return [
            'name' => 'required|unique:friends,name',
            'url'  => 'required|unique:friends,url',
        ];
    }
}
