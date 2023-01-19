<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    use HasFactory;
    protected $table = "user";
    protected $primaryKey = "id";
    public $timestamps = false;
    protected $guarded = [];

    public function customer(){
        return $this->belongsTo(Customer::class, 'cs_id', 'id');
    }   
}
