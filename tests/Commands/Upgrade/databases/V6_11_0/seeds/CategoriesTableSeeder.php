<?php

declare(strict_types=1);

namespace Tests\Commands\Upgrade\Databases\V6_11_0\Seeds;

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
        DB::table('categories')->truncate();
        DB::table('categories')->insert([
            [
                'id'          => 1,
                'name'        => 'php',
                'slug'        => 'php',
                'keywords'    => 'php',
                'description' => 'php相关的文章',
                'sort'        => 1,
                'pid'         => 0,
                'created_at'  => '2017-7-16 07:35:12',
                'updated_at'  => '2016-7-16 07:35:12',
                'deleted_at'  => null,
            ],
            [
                'id'          => 2,
                'name'        => '用于删除',
                'slug'        => 'for-deletion',
                'keywords'    => '用于删除',
                'description' => '用于删除',
                'sort'        => 2,
                'pid'         => 0,
                'created_at'  => '2019-01-04 16:35:12',
                'updated_at'  => '2019-01-04 16:35:12',
                'deleted_at'  => null,
            ],
            [
                'id'          => 3,
                'name'        => '已删除',
                'slug'        => 'deleted',
                'keywords'    => '已删除',
                'description' => '已删除',
                'sort'        => 3,
                'pid'         => 0,
                'created_at'  => '2019-01-04 16:35:12',
                'updated_at'  => '2019-01-04 16:35:12',
                'deleted_at'  => '2019-01-04 16:35:12',
            ],
        ]);
    }
}
