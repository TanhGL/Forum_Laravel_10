<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOauthClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (Schema::hasTable('oauth_clients')) {
            Schema::rename('oauth_clients', 'socialite_clients');
        }

        Schema::create('oauth_clients', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->index()->nullable();
            $table->string('name');
            $table->string('secret', 100);
            $table->string('provider')->nullable();
            $table->text('redirect');
            $table->unsignedTinyInteger('personal_access_client');
            $table->unsignedTinyInteger('password_client');
            $table->unsignedTinyInteger('revoked');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('oauth_clients');
    }
}
