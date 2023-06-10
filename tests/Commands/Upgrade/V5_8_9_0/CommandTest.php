<?php

declare(strict_types=1);

namespace Tests\Commands\Upgrade\V5_8_9_0;

use App\Models\Console;

class CommandTest extends \Tests\Commands\Upgrade\TestCase
{
    public function testCommand()
    {
        $this->artisan('upgrade:v5.8.9.0');

        $names = [
            'App\Console\Commands\Upgrade\V5_5_4_1',
            'App\Console\Commands\Upgrade\V5_5_4_3',
        ];
        static::assertEquals(0, Console::whereIn('name', $names)->count());

        $this->assertDatabaseHas('consoles', [
            'id'         => 1,
            'name'       => 'App\Console\Commands\Upgrade\V5_5_5_0',
        ]);
    }
}
