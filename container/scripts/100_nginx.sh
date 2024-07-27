
# ===================================================
#                       Ubuntu
# 配置文件: /etc/nginx/nginx.conf
# 网站配置文件: /etc/nginx/sites-available/default
# 日志文件: /var/log/nginx/access.log
# 修改之后记得 nginx -s reload

sudo apt install nginx
# check config
nginx -t

# ln /etc/nginx/ -> ./nginx
ln -s /etc/nginx ./nginx

# restart
sudo systemctl restart nginx
sudo systemctl reload nginx
# reload
nginx -s reload


# ===================================================
#                       Mac
brew services start nginx

# 重启服务
brew services restart nginx
# 更简单的, 也可以重载 nginx 的配置文件
nginx -s reload

brew services stop nginx


sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx

# sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

sudo certbot certonly --webroot -w /work/blues/container/mnt/nginx/config -d easonsi.site -d blog.easonsi.site
