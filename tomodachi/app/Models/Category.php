<?php

namespace App\Models;

use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    use ModelTree;
    protected $table = "category";
    public $timestamps = false;
    protected $primaryKey = "id";
    protected $guarded = [];

    public function FoodItems()
    {
        return $this->hasMany(FoodItem::class, 'cate_id', 'id');
    }
}
