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

