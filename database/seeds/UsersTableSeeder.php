<?php

declare(strict_types=1);

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        if (DB::table('users')->exists()) {
            $this->command->getOutput()->writeln('<question>Skipping: ' . __CLASS__ . '</question>');

            return;
        }

        DB::table('users')->insert([
            [
                'id'             => 1,
                'name'           => 'test',
                'email'          => 'test@test.com',
                'password'       => bcrypt(123456),
                'remember_token' => null,
                'created_at'     => '2016-10-22 07:35:12',
                'updated_at'     => '2016-10-22 07:35:12',
                'deleted_at'     => null,
            ],
            [
                'id'             => 2,
                'name'           => '已删除',
                'email'          => 'deleted@test.com',
                'password'       => bcrypt(123456),
                'remember_token' => null,
                'created_at'     => '2019-01-04 15:35:12',
                'updated_at'     => '2016-01-04 15:35:12',
                'deleted_at'     => '2016-01-04 15:35:12',
            ],
        ]);
    }
}
