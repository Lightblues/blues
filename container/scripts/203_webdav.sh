# ===
# 用的是 https://hub.docker.com/r/bytemark/webdav/ https://github.com/BytemarkHosting/docker-webdav/ 不过已经5年没更新了
# 另见 https://github.com/rucio/containers/tree/master/webdav
# 中文有问题的话: https://blog.csdn.net/u011459717/article/details/128758573

# === debug: The server sent this message: request too large
# 发现在直接用IP登陆的时候没问题, 但是用域名登陆上传就有这个报错 —— 是 nginx 的问题! 
# 在 http 块中配置 `client_max_body_size 100M;` 即可! 