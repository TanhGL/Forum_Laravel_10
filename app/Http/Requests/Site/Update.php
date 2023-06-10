<?php

declare(strict_types=1);

namespace App\Http\Requests\Site;

class Update extends Store
{
    /**
     * @return array<string,string>
     */
    public function rules()
    {
        return [
            'name'        => 'required',
            'url'         => 'required',
            'description' => 'required',
            'email'       => 'email',
        ];
    }
}
