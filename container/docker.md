## services
[see tmp/index.md]


```sh
docker-compose run --rm certbot certonly --webroot -w /var/www/certbot  \
  -d easonsi.site -m oldcitystal@gmail.com --agree-tos  \
  ${LETSENCRYPT_STAGING:+--staging}

```



## docker

### 配置 Proxy

```sh
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf
# 写入下面的配置

sudo systemctl daemon-reload
sudo systemctl restart docker
# verify
systemctl show --property=Environment docker
```

```conf
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80/"
Environment="HTTPS_PROXY=https://proxy.example.com:443/"
Environment="NO_PROXY=localhost,127.0.0.1,.example.com"
```




## podman
另见 [help]

- GitHub: https://github.com/containers/podman
- 命令列表: https://docs.podman.io/en/latest/Commands.html


## clash
- github: https://github.com/juewuy/ShellCrash


## nginx
- 配置文档: https://www.runoob.com/w3cnote/nginx-setup-intro.html

### hexo
直接映射路径, 配置即可! 


## 所运行的容器

### piwigo | 图库

### minio | 存储/图床
- github: https://github.com/minio/minio
- doc: https://min.io/docs/minio/container/index.html


### chatgpt-next-web | 聊天机器人
- github: https://github.com/ChatGPTNextWeb/ChatGPT-Next-Web
- debug
    - webdav 同步好像有点问题: https://github.com/ChatGPTNextWeb/ChatGPT-Next-Web/issues/3423

### webdav
- 用的是 https://hub.docker.com/r/bytemark/webdav/ https://github.com/BytemarkHosting/docker-webdav/ 不过已经5年没更新了
- debug
    - 中文有问题的话: https://blog.csdn.net/u011459717/article/details/128758573

### grafana
- doc: https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/
- github: https://github.com/grafana/grafana?tab=readme-ov-file

