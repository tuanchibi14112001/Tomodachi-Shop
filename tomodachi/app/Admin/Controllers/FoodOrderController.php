<?php

namespace App\Admin\Controllers;

use App\Models\FoodOrder;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FoodOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FoodOrder';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FoodOrder());

        $grid->column('id', __('Id'));
        $grid->column('cs_id', __('Cs id'));
        // $grid->column('total_price', __('Price'))->totalRow();
        $grid->column('total_price')->totalRow(function ($amount) {

            return "<span class='text-danger text-bold'><i class='fa fa-dolar-sign'></i> Total : {$amount} </span>" ;
        
        });
        $grid->column('note', __('Note'));
        $grid->column('created_at', __('Created at'));
        $grid->column('status', __('Status'));
        $grid->filter(function($filter){
            $filter->month('created_at', 'Month');

        });
       
        

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
        $show = new Show(FoodOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('cs_id', __('Cs id'));
        $show->field('total_price', __('Total price'));
        $show->field('note', __('Note'));
        $show->field('created_at', __('Created at'));
        $show->field('status', __('Status'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FoodOrder());

        $form->number('cs_id', __('Cs id'));
        $form->decimal('total_price', __('Total price'));
        $form->textarea('note', __('Note'));
        $form->number('status', __('Status'));

        return $form;
    }
}
