<?php

declare(strict_types=1);

namespace App\Console\Commands\Upgrade;

use DB;
use Illuminate\Console\Command;

class V5_8_10_0 extends Command
{
    protected $signature = 'upgrade:v5.8.10.0';

    protected $description = 'upgrade to v5.8.10.0';

    public function handle(): int
    {
        DB::table('oauth_clients')->insert([
            'id'                     => 1,
            'user_id'                => null,
            'name'                   => config('app.name') . ' Password Grant Client',
            'secret'                 => '',
            'redirect'               => 'http://localhost',
            'personal_access_client' => 0,
            'password_client'        => 1,
            'revoked'                => 0,
            'created_at'             => '2019-06-29 20:35:12',
            'updated_at'             => '2019-06-29 20:35:12',
        ]);

        $this->call('passport:keys');

        return 0;
    }
}
