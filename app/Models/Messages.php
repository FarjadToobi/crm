<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Messages extends Model
{
    use HasFactory;
    protected $fillable = [
        'name', 'message', 'sender_id'
    ];

    public function messagefiles()
    {
        return $this->hasMany(MessageFiles::class, 'message_id');
    }

    // public function project(){
    //     return $this->belongsTo(Project::class);
    // }
}