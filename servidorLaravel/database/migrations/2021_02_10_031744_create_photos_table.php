<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePhotosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('photos', function (Blueprint $table) {
          $table->increments('idPhoto');
          $table->foreignId('user_id')->constrained()->onDelete('cascade')->onUpdate('no action');
          $table->string('pathPhoto', 120);
          $table->string('subtitle', 80);
          $table->boolean("actived")->default(1);
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
        Schema::dropIfExists('photos');
    }
}
