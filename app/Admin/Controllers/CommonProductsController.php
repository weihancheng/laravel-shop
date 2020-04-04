<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;

abstract class CommonProductsController extends AdminController
{
    // 为了区分每个控制器负责哪一种商品, 要求每个子类都实现一个 getProductType() 方法来返回对应的商品类型
    abstract public function getProductType();

    // 每个控制器将要实现本方法来定义列表应该展示那些字段
    abstract protected function customGrid(Grid $grid);

    // 每个控制器将要实现本方法来定义表单需要哪些字段
    abstract protected function customForm(Form $form);

    protected function grid()
    {
        $grid = new Grid(new Product);
        $grid->model()->where('type', $this->getProductType())->orderBy('id', 'desc');

        $this->customGrid($grid);

        $grid->actions(function ($actions) {
            $actions->disableView();  // 去掉查看
            $actions->disableDelete();  // 去掉删除
        });

        $grid->tools(function ($tools) {
            // 禁用批量删除按钮
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });

        return $grid;
    }

    protected function form()
    {
        $form = new Form(new Product());

        $form->hidden('type')->value($this->getProductType());
        $form->text('title', '商品名称')->rules('required');
        $form->select('category_id', '类目')->options(function ($id) {
            $category = Category::find($id);
            if ($category) {
                return [$category->id => $category->full_name];
            }
        })->ajax('/admin/api/categories?is_directory=0');
        $form->image('image', '封面图片')->rules('required|image');
        $form->quill('description', '商品描述')->rules('required');
        $form->radio('on_sale', '上架')->options(['1' => '是', '0' => '否'])->default('0');

        // 调用自定义方法
        $this->customForm($form);

        $form->hasMany('skus', '商品 SKU', function (Form\NestedForm $form) {
            $form->text('title', 'SKU 名称')->rules('required');
            $form->text('description', 'SKU 描述')->rules('required');
            $form->text('price', '单价')->rules('required|numeric|min:0.01');
            $form->text('stock', '剩余库存')->rules('required|integer|min:0');
        });

        $form->saving(function (Form $form) {
            $form->model()->price = collect($form->input('skus'))->where(Form::REMOVE_FLAG_NAME, 0)->min('price');
        });

        return $form;
    }
}
