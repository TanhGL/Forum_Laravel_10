<?php

declare(strict_types=1);

namespace Tests\Commands\Upgrade\Databases\V5_5_6_0\Seeds;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->delete();
        DB::table('categories')->insert([
            0 => [
                'id'          => 1,
                'name'        => 'php',
                'keywords'    => 'php',
                'description' => 'php相关的文章',
                'sort'        => 1,
                'pid'         => 0,
                'created_at'  => '2017-7-16 07:35:12',
                'updated_at'  => '2016-7-16 07:35:12',
                'deleted_at'  => null,
            ],
        ]);
    }
}
