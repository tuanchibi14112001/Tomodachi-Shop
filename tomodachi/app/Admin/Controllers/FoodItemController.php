<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Models\FoodItem;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Arr;

class FoodItemController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FoodItem';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FoodItem());

        // $grid->column('id', __('Id'));
        $grid->column('category.name', __('Category'));
        $grid->column('name', __('Name'));
        $grid->column('quantity', __('Quantity'));
        $grid->column('description', __('Description'));
        $grid->column('price', __('Price'));
        //$grid->column('url', __('Image'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(FoodItem::findOrFail($id));
    
        $show->field('id', __('Id'));
        $show->field('category.name', __('Category'));
        $show->field('name', __('Name'));
        $show->field('quantity', __('Quantity'));
        $show->field('description', __('Description'));
        $show->field('price', __('Price'));
        $show->field('url', __('Image'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FoodItem());
        $categorys=Category::all();
        $options=array();
        foreach($categorys as $category){
            $options=Arr::add($options,$category->id,$category->name);
        }
        // $form->number('cate_id', __('Category ID'));
        $form->select('cate_id', __('Category'))->options($options)->required();
        // $form->select('cate_id')->options((new Category())::selectOptions());
        $form->text('name', __('Name')) ->required()->creationRules(['required', "unique:fooditem"]);
        $form->number('quantity', __('Quantity')) ->required()->min(1);
        $form->textarea('description', __('Description'));
        $form->number('price', __('Price'))->required()->min(1);
        $form->image('url', __('Image'))->required();
        $form->datetime('updated_at',__('Updated At'))->default(date('Y-m-d H:i:s'));

        return $form;
    }
}
