<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'name',
        'is_directory',
        'level',
        'path'
    ];

    protected $casts = [
        'is_directory' => 'boolean'
    ];

    protected static function boot()
    {
        parent::boot();
        // 监听 category 的创建事件, 用于初始化 path和level字段
        static::creating(function (Category $category) {
            // 如果创建是一个根类目
            if (is_null($category->parent_id)) {
                // 层级设为0
                $category->level = 0;
                // 将path设置为 "-"
                $category->path = '-';
            } else {
                // 将成绩设为父类目的层级 + 1
                $category->level = $category->parent->level + 1;
                // 将path值设为父类目的path追加父类目ID以及最后跟上一个 - 分隔符
                $category->path = $category->parent->path . $category->parent_id . '-';
            }
        });
    }

    public function parent()
    {
        return $this->belongsTo(Category::class);
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    // 定义一个访问器, 获取所有的祖先类目的ID值
    public function getPathIdsAttribute()
    {
        return array_filter(explode('-', trim($this->path, '-')));
    }

    // 定义一个访问器, 获取所有祖先类目并按层级排序
    public function getAncestorsAttribute()
    {
        return Category::query()->whereIn('id', $this->path_ids)->orderBy('level')->get();
    }

    // 定义一个访问器, 获取以 - 为分隔符的所有祖先类目名称以及当前类目的名称
    public function getFullNameAttribute()
    {
        return $this->ancestors->pluck('name')->push($this->name)->implode(' - ');
    }
}
