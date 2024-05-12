# 生成key, 保存 到 ./id_deploy
ssh-keygen -t rsa -b 4096 -C "oldcitystal@gmail.com"
# test connection
ssh ${SERVER_USER}@${SERVER_HOST} -p ${SERVER_PORT} -i ./id_deploy