<?php

namespace App\Admin\Controllers;

use App\Models\FoodOrder;
use App\Models\Category;
use App\Models\Address;

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

        $grid->column('customer.name', __('Customer name'));
        //$grid->column('cs_id', __('Cs id'));
        // $grid->column('total_price', __('Price'))->totalRow();
        $grid->column('total_price')->totalRow(function ($amount) {

            return "<span class='text-danger text-bold'><i class='fa fa-dolar-sign'></i> Total : {$amount} </span>";
        });
        $grid->column('note', __('Note'));
        $grid->column('created_at', __('Created at'));
        $options = array(0 => 'pending', 1 => 'success', 2 => 'cancel');
        // $grid->column('status', __('Status'))->array('pending','success','cancel');
        $grid->status()->display(function ($status) {
            switch ($status) {
                case 0:
                    return "<span style=\"font-family: 'Source Sans Pro','Helvetica Neue',Helvetica,Arial,sans-serif;
                    font-weight: 400;color:#333333;font-size:14px\" class='label'>pending</span>";
                    break;
                case 1:
                    return "<span style=\"font-family: 'Source Sans Pro','Helvetica Neue',Helvetica,Arial,sans-serif;
                    font-weight: 400;color:green;font-size:14px\" class='label'>success</span>";
                    break;
                case 2:
                    return "<span style=\"font-family: 'Source Sans Pro','Helvetica Neue',Helvetica,Arial,sans-serif;
                    font-weight: 400;color:red;font-size:14px\" class='label'>cancel</span>";
                    break;
                default:
                    break;
            }
        });
        $grid->filter(function ($filter) {
            $filter->month('created_at', 'Month');
        });
        $grid->disableCreateButton();
        $grid->actions(function (Grid\Displayers\Actions $actions) {
            //$actions->disableEdit();
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
        $foodorder =  FoodOrder::findOrFail($id);

        $show = new Show(FoodOrder::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableList();
                $tools->disableDelete();
            });;
        $show->field('id', __('Id'));
        $show->field('address.name', __('Customer Name'));
        $show->field('address.email', __('Customer Email'));
        $show->field('address.address', __('Customer Address'));
        $show->field('address.phone', __('Customer Phone'));

        $show->status()->as(function ($status) {

            switch ($status) {
                case 0:
                    return "pending";
                    break;
                case 1:
                    return "success";
                    break;
                case 2:
                    return "cancel";
                    break;
                default:
                    break;
            }
        });
        $show->order_detail('Order Detail', function ($order_detail) {
            // dd($order_detail);
            $order_detail->disableActions();
            $order_detail->disableFilter();
            $order_detail->disableCreateButton();
            $order_detail->disableExport();
            $order_detail->disableColumnSelector();
            $order_detail->actions(function (Grid\Displayers\Actions $actions) {
                $actions->disableView();
                $actions->disableEdit();
                $actions->disableDelete();
            });
            $order_detail->food_item()->name('Food Name');
            $order_detail->food_item()->price('Price');

            $order_detail->quantity('Quantity');
        });


        // $show->field('cs_id', __('Cs id'));
        $show->field('total_price', __('Total price'));
        $show->field('note', __('Note'));
        $show->field('created_at', __('Created at'));
        // $options = array(0 => 'pending', 1 => 'success', 2 => 'cancel');
        //$show->select('status', __('Status'))->options($options);


        // $show->field('status', __('Status'));



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

        $form->number('cs_id', __('Cs id'))->readonly();
        $form->decimal('total_price', __('Total price'))->readonly();
        $form->textarea('note', __('Note'))->readonly();
        $options = array(0 => 'pending', 1 => 'success', 2 => 'cancel');
        $form->select('status', __('Status'))->options($options);

        return $form;
    }
}
