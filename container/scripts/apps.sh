PROJECT_DIR=/Users/frankshi/LProjects/blues/container
cd .

mkdir -p data/minio/data

# minio
podman run \
    -p 9000:9000 \
    -p 9001:9001 \
    -v ./mnt/minio/data:/data \
    -e "MINIO_ROOT_USER=eason" \
    -e "MINIO_ROOT_PASSWORD=s1928y6473c" \
    --name minio \
    --rm \
    quay.io/minio/minio server /data --console-address ":9001"

# nginx 
podman run \
    -p 9801:80 \
    -v ./mnt/nginx/data/html:/usr/share/nginx/html:Z \
    -v ./mnt/nginx/config/nginx.conf:/etc/nginx/nginx.conf:Z \
    -v ./mnt/minio/data:/mnt/minio/data:Z \
    --name nginx \
    --rm \
    nginx:latest

# chatgpt-next-web
docker pull yidadaa/chatgpt-next-web
podman run -d -p 9301:3000 \
    -e OPENAI_API_KEY=sk-xxxx \
    -e CODE=s1928y6473c \
    -e PROXY_URL=http://127.0.0.1:7890 \
    yidadaa/chatgpt-next-web


# clash
# https://github.com/juewuy/ShellCrash
# 执行安装命令
export url='https://fastly.jsdelivr.net/gh/juewuy/ShellCrash@master' && wget -q --no-check-certificate -O /tmp/install.sh $url/install.sh  && bash /tmp/install.sh && source /etc/profile &> /dev/null
# export url='https://fastly.jsdelivr.net/gh/juewuy/ShellCrash@master' && sh -c "$(curl -kfsSl $url/install.sh)" && source /etc/profile &> /dev/null
crash       # 配置! 但好像有点问题? 可以尝试下面的! 
cd /etc/ShellCrash && bash menu.sh


# proxyip=localhost  | http://lulu:lulu@easonsi.site:9366
proxyip=127.0.0.1
proxyport=7890
alias setproxy="export https_proxy=http://$proxyip:$proxyport; export http_proxy=http://$proxyip:$proxyport; export all_proxy=http://$proxyip:$proxyport; echo \"Set proxy $proxyip:$proxyport\" "
alias unsetproxy="unset http_proxy; unset https_proxy; unset all_proxy; echo \"Unset proxy successfully\" " 
setproxy
curl google.com