3. 安装ide-help
```
    step 1:
    composer require --dev barryvdh/laravel-ide-helper

    step 2: the providers array in config/app.php
    Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class,

    step 3: 在composer.json 中添加
    "scripts":{
        "post-update-cmd": [
            "php artisan clear-compiled",
            "php artisan ide-helper:generate",
            "php artisan ide-helper:meta",
            "php artisan optimize"
        ]
    }

    step 4:
    php artisan vendor:publish --provider="Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider" --tag=config

    step 5:
    php artisan ide-helper:generate
```

4. 配置github
```
    step 1: 创建git仓库

    step 2: 安装git的事例进行操作

    遇见问题：fatal: remote origin already exists.
    解决：
    step 1:
    git remote rm origin

    step 2:
    git remote add origin [你的git项目的ssh地址]

    git: 强制覆盖本地代码
    git fetch --all
    git reset --hard origin/master
```

5. 安装webpack编译环境
```
    step 1:
    npm install 或者 cnpm install

    备注：主要使用的命令
    npm run dev
    npm run watch
```

6. 将layui样式放到resources文件夹内
```
    step 1:   在webpack.mix.js添加
    mix.copyDirectory('resources/layuiadmin', 'public/layuiadmin');

    step 2: 重新跑监听
    npm run watch

    step 3: 将layui的html文件放到resources的view下，并修改为的blade文件
```

7. 安装laravel语言包
```
    step 1:
    composer require caouecs/laravel-lang

    step 2: 语言包的使用
    ...
```

8. 发现laravel没有tp那样的验证场景
> 方案一：定义不同的Request   缺点：会造成非常多的Request文件
> 方案二：参考https://learnku.com/docs/laravel-specification/5.5/form-validation/507的FormRequest 表验证类文件

9. git常用上传流程
```
    git add .
    git commit -m "[你的备注信息]"
    git push origin master
```
10. laravel 新知识
```
    compact 函数
    laravel 模板中route传$user表示传输主键
    laravel 依赖注入模型 模型策略
```
11. 常用artisan 命令
```
    artisan make:controller [Name] --resources --model
    artisan make:policy --model=[Name] [NamePolicy]
```

12. laravel 自带用户认证使用 - 安装 || Laravel 项目中使用 Bootstrap 前端框架
```
    composer require laravel/ui
    php artisan ui vue --auth    (部分项目: php artisan ui vue)
    npm install
```
- 以上命令做了以下事情：
1. 在 npm 依赖配置文件 package.json 中引入 bootstrap、jquery、popper.js、vue 作为依赖；
2. 修改 resources/js/bootstrap.js ，在此文件中初始化 Bootstrap UI 框架的 JS 部分；
3. 修改 resources/sass/app.scss 以加载 Bootstrap 的样式文件；
4. 新增 resources/sass/_variables.scss 样式配置文件。

13. laravel扩展实现用户角色权限管理
```
    step 1:
    composer require spatie/laravel-permission

    step 2: 生成迁移文件
    php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider" --tag="migrations"

    step 3:
    php artisan migrate
```

14. pjax 使用
插件地址: https://github.com/spatie/laravel-pjax
学习地址: http://houdunren.gitee.io/note/javascript/pjax.html
```
    step 1:
    后台安装: composer require spatie/laravel-pjax
    在 app/Http/Kernel.php 文件添加
    protected $middleware = [
        ...
        \Spatie\Pjax\Middleware\FilterIfPjax::class,
    ];

    step 2:
    前台引入: (以laravel为例子)
    <script src="https://cdn.bootcss.com/jquery.pjax/2.0.1/jquery.pjax.min.js"></script>
    <script src="{{asset('plugin/pjax/pjax.js')}}"></script>
    <link rel="stylesheet" href="{{asset('plugin/pjax/pjax.css')}}">

    step 3:
    修改 Laravel框架根目录下的 webpack.mix.js 文件，添加以下代码用于复制 plugin 目录
    .mix.copyDirectory('resources/plugin', 'public/plugin')

    定义 pjax加载区域
    <div class="main-content container-fluid" id="pjax-container">
    	<!--pjax加载动画-->
    	<div id="loading">
    		<div class="spinner">
    			<div class="rect1"></div>
    			<div class="rect2"></div>
    			<div class="rect3"></div>
    			<div class="rect4"></div>
    			<div class="rect5"></div>
    		</div>
    	</div>
    	<!--pjax加载动画 结束-->
    	<div id="app">
    		@yield('content')
    	</div>
    </div>

    pjax文件内容:
    //定义加载区域
    $(document).pjax('a','#pjax-container');
    //定义pjax有效时间，超过这个时间会整页刷新
    $.pjax.defaults.timeout = 1200;
    //显示加载动画
    $(document).on('pjax:click', function() {
        $("#loading").show();
    });
    //隐藏加载动画
    $(document).on('pjax:end', function() {
        $("#loading").hide();
    });
```

15. homestead 经常出现的问题php-fpm关闭
```
    // php -v 获取你的版本
    sudo service php7.4-fpm restart
```

16. 执行seed 有可能报错
```
    composer dump-autoload
```

17. composer加速
```
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
```

18. git 版本回退
```
  回退到当前版本:
  git reset --hard
  回退一个版本（将版本退回上一个commit的状态）：
  git reset --hard HEAD^
  回退两个版本：
  git reset --hard HEAD^^
  回退100个版本：
  git reset --hard HEAD~100
  回退到指定版本：
  git reset --hard 版本号
  查看版本号:
  git log
```

19. 添加Models并把User放到Models时报错
```
    修改RegisterController 和 config/auth.php
    修改User.php的命名空间
```


20. encore/laravel-admin 安装
```
    composer require encore/laravel-admin "1.7.7"

    php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"

    php artisan admin:install

    php artisan config:clear
```
