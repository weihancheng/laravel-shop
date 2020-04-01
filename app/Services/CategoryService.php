<?php


namespace App\Services;


use App\Models\Category;

class CategoryService
{
    public function getCategoryTree($parent_id = null, $allCategories = null)
    {
        if (is_null($allCategories)) $allCategories = Category::all();

        return $allCategories->where('parent', $parent_id)->map(function (Category $category) use ($allCategories) {
            $data = ['id' => $category->id, 'name' => $category->name];
            // 回调结束条件
            if (!$category->is_directory) {
                return $data;
            }
            // 继续回调
            $data['children'] = $this->getCategoryTree($category->id, $allCategories);

            return $data;
        });
    }
}
