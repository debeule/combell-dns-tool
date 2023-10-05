<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('records', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            
            $table->string('record_id');
            $table->string('type');
            $table->string('record_name')->nullable();
            $table->string('content')->nullable();
            $table->string('is_pending')->default(0);

            $table->foreignId('user_id')->constrained();
        });
    }

    public function down()
    {
        Schema::dropIfExists('records');
    }
};
