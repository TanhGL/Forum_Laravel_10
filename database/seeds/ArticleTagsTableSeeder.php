<?php

declare(strict_types=1);

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ArticleTagsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if (DB::table('article_tags')->exists()) {
            $this->command->getOutput()->writeln('<question>Skipping: ' . __CLASS__ . '</question>');

            return;
        }

        DB::table('article_tags')->insert([
            [
                'article_id' => 1,
                'tag_id'     => 1,
                'created_at' => '2017-7-18 07:35:12',
                'updated_at' => '2016-7-18 07:35:12',
                'deleted_at' => null,
            ],
            [
                'article_id' => 2,
                'tag_id'     => 2,
                'created_at' => '2019-01-04 16:35:12',
                'updated_at' => '2019-01-04 16:35:12',
                'deleted_at' => '2019-01-04 16:35:12',
            ],
        ]);
    }
}
