<?php

namespace App\Admin\Actions\Common;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Replicate extends RowAction
{
    public $name = '复制';

    public function handle(Model $model)
    {
        // $model ...
        // 这里调用模型的`replicate`方法复制数据，再调用`save`方法保存
        $model->replicate()->save();

        return $this->response()->success('Success message.')->refresh();
    }

}
