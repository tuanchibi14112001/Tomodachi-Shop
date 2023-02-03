<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $table = "customer";
    protected $primaryKey = "id";
    public $timestamps = false;
    protected $guarded = [];
    public function user(){
        return $this->hasOne(User::class, 'cs_id', 'id');
    }  
}
