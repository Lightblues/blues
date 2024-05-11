brew install minio/stable/mc
mc --help

access_key=av6bu763RPXt7zafLx8q
secret_key=GWybpg3OGkkjxYABUNJvFJ42eSaPwJHmM2XXN0qN

mc alias set myminio http://localhost:9000 $access_key $secret_key

mc admin info myminio

mc anonymous set public myminio/img

wget http://localhost:9000/img/_meta/about.jpg