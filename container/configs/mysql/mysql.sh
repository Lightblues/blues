# https://hub.docker.com/r/linuxserver/mysql

docker exec -it mysql bash
mysql -u root -p
# Cazwur-myqxuf-9mezva | piwigodb


CREATE USER 'easonsi'@'%' IDENTIFIED BY 's1928y6473c';
GRANT ALL PRIVILEGES ON piwigodb.* TO 'easonsi'@'%';
FLUSH PRIVILEGES;

SELECT User FROM mysql.user;

SHOW databases;
CREATE DATABASE piwigodb;
