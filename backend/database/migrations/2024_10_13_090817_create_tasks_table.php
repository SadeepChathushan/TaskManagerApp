<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();  // Auto-increment primary key
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade'); // Foreign key reference to users table
            $table->string('title');  // Title of the task
            $table->text('description')->nullable();  // Description of the task (optional)
            $table->enum('status', ['pending', 'completed'])->default('pending');  // Task status, defaults to pending
            $table->timestamps();  // created_at and updated_at timestamps
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tasks');
    }
};
