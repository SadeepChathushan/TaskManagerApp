<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    // Define the fields that can be mass-assigned
    protected $fillable = ['user_id', 'title', 'description', 'status'];

    // Define the relationship with the User model (A task belongs to a user)
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
