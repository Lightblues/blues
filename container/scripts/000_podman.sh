# =================================================
#                       install 
# https://podman.io/docs/installation

sudo apt-get -y install podman  # ubuntu
brew install podman             # mac

# podman machine init
# podman machine start

podman info

# =================================================
#                       basic 
# 一个基本的 nginx 的例子! 
podman run --name basic_httpd -dt -p 8080:80/tcp docker.io/nginx
podman ps -a

# check the web page
curl http://localhost:8080

# inspect container
podman inspect basic_httpd | grep IPAddress
# view logs
podman logs basic_httpd
# view processes
podman top basic_httpd

podman stop <container_id>
podman stop <container_id>

# =================================================
#                       podman-compose 
pip3 install podman-compose
