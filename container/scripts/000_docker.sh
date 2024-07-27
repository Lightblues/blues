# (base) ➜ ubuntu@VM-16-14-ubuntu ~/work/blues/container/configs/hello-world git:(main) ✗ docker-compose up                  22:51
# [+] Running 2/2
#  ✘ redis Error                                                                                                             11.0s 
#  ✘ web Error                                                                                                               11.0s 
# Error response from daemon: Get "https://registry-1.docker.io/v2/": net/http: TLS handshake timeout

export NO_PROXY=localhost,127.0.0.1,registry-1.docker.io

sudo mkdir -p /etc/systemd/system/docker.service.d
sudo vim /etc/systemd/system/docker.service.d/http-proxy.conf
# Environment="HTTP_PROXY=http://127.0.0.1:7890/"
# Environment="HTTPS_PROXY=http://127.0.0.1:7890/"
# Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,registry-1.docker.io"

sudo systemctl daemon-reload
sudo systemctl restart docker
