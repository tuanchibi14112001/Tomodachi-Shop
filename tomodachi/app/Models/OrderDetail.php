<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;
    protected $table = "orderdetail";
    //protected $primaryKey = ['food_id', 'order_id'];
    public $timestamps = false;
    protected $guarded = [];
    public function food_item(){
        return $this->belongsTo(FoodItem::class, 'food_id', 'id');
    } 
    public function food_order(){
        return $this->belongsTo(FoodOrder::class,'order_id','id');
    }
}
