### 启动任务队列
```
    php artisan queue:work
```

### 启动Ngrok
```
    ngrok http -host-header=[you-url] -region us 80
```

### 清除phpstorm 所有断点
1. ctrl + shift + F8
2. 选择你要清除的断点

### 安装laravel/horizon
1. composer require laravel/horizon
2. php artisan vendor:publish --provider="Laravel\Horizon\HorizonServiceProvider"

### 内网穿透
```
    php natapp.php  --authtoken=922f12dfa1db31ca
```





