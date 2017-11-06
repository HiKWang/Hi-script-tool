# 快速搭建LEMP（Linux/nginx/mysql/php）
*创建时间：星期二, 17. 十月 2017 03:52下午*
***更新时间：星期二, 17. 十月 2017 03:52下午***

[TOC]

## 安装Nginx
本文以ubutn为例。
```shell
$ sudo apt install nginx
```

## 安装Mysql
```shell
$ sudo apt install mysql-server
```
运行以下命令并按提示进行可进一步增强mysql安全性：
```shell
$ mysql_secure_installation
```


## 安装PHP
```shell
$ sudo apt install php-fpm php-mysql
```
由于nginx没有包含原始的php进程，所以需要安装php-fpm，fpm指“fastCGI process manager”。
php.ini位于：/etc/php/7.0/fpm/

## 配置nginx
在nginx中配置php的相关部分：
```shell
$ vim /etc/nginx/sites-available/default
```
配置完成后，使用`nginx -t`检查配置是否有误，无误则重启nginx`sudo systemctl reload nginx`.

### nginx配置虚拟主机
在`/etc/nginx/conf.d/`创建文件`vhosts.conf`，在`vhosts.conf`写入以下内容：
```nginx
server {
    listen 81; 
    server_name local.me;
    # 自定义项目根目录
    root /home/hikwang/www/sshx;
    index index.html index.php;
    location / { 
        try_files $uri $uri/ =404;
    }   

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;

        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }   

    location ~ /\.ht {
        deny all;    
    }   

}
```
运行`sudo nginx -t`检查配置是否正确，正确则重启nginx:`sudo /etc/init.d/nginx restart`。
## 延伸学习
### Nginx
- 配置文件位于/etc/nginx/nginx.conf
- 关闭启动nginx的文件/etc/init.d/nginx stop/start/restart
- 程序文件是/etc/sbin/nginx
- 查看nginx的版本是nginx -v