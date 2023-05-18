<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'User';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        // $grid->column('id', __('Id'));
        // $grid->column('cs_id', __('Cs id'));
        $grid->column('email', __('Email'));
        // $grid->column('password', __('Password'));
        // $grid->column('role', __('Role'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->disableCreateButton();
        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableEdit();
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
        $show = new Show(User::findOrFail($id));

        // $show->field('id', __('Id'));
        $show->field('cs_id', __('Cs id'));
        $show->field('customer.name', __('Name'));
        $show->field('customer.address', __('Address'));
        $show->field('customer.phone_num', __('Phone number'));
        $show->field('email', __('Email'));
        // $show->field('password', __('Password'));
        // $show->field('role', __('Role'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
            });;

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User());

        $form->number('cs_id', __('Cs id'));
        $form->email('email', __('Email'));
        $form->password('password', __('Password'));
        $form->number('role', __('Role'))->default(1);

        return $form;
    }
}
