<?php

declare(strict_types=1);

namespace App\Http\Resources;

/**
 * @mixin \App\Models\SocialiteUser
 */
class SocialiteUser extends Base
{
    /**
     * @param \Illuminate\Http\Request $request
     *
     * @return array<string,mixed>
     */
    public function toArray($request): array
    {
        /** @var SocialiteClient $socialite_client */
        $socialite_client = $this->socialiteClient;

        return [
            'id'               => $this->id,
            'name'             => $this->name,
            'email'            => $this->email,
            'avatar'           => $this->avatar,
            'is_admin'         => $this->is_admin,
            'is_blocked'       => $this->is_blocked,
            'socialite_client' => $socialite_client->only('id', 'name', 'icon'),
            'created_at'       => $this->created_at,
            'updated_at'       => $this->updated_at,
            'deleted_at'       => $this->deleted_at,
        ];
    }
}
