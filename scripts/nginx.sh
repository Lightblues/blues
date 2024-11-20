
# ================== nginx
sudo systemctl restart nginx
sudo systemctl status nginx


nginx -V  # 查看具体运行配置
# --conf-path=/etc/nginx/nginx.conf

# DEBUG: 403 Forbidden
# 主要是权限问题! 需要保证路径都是 755!
sudo chown -R www-data:www-data /usr/share/nginx/html
sudo chmod -R 755 /usr/share/nginx/html


# ================== certbot 
sudo apt update
sudo apt install certbot python3-certbot-nginx

# NOTE: obtain and install certificates for each of your domains using Certbot. 
sudo certbot --nginx -d blog.easonsi.site -d hexo2.easonsi.site
# check https://blog.easonsi.site

# Check if automatic renew!!
sudo systemctl status certbot.timer
# or manually run
sudo certbot renew --dry-run


sudo certbot --nginx -d chatgpt.easonsi.site
sudo certbot --nginx -d minio.easonsi.site -d cloud.easonsi.site
sudo certbot --nginx -d webdav.easonsi.site
sudo certbot --nginx -d piwigo.easonsi.site
sudo certbot --nginx -d notes.easonsi.site -d technotes.easonsi.site

sudo certbot --nginx -d git.easonsi.site
sudo certbot --nginx -d substack.easonsi.site
