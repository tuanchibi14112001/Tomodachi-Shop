<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoodOrder extends Model
{
    use HasFactory;
    protected $table = "foodorder";
    protected $primaryKey = "id";
    public $timestamps = false;
    protected $guarded = [];
    public function customer(){
        return $this->belongsTo(Customer::class, 'cs_id', 'id');
    } 
    public function order_detail(){
        return $this->hasMany(OrderDetail::class,'order_id','id');
    }
}
