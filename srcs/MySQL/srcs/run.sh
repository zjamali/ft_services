#!/bin/bash

#if [ ! -f /var/lib/mysql/ib_buffer_pool ] ; then 
/etc/init.d/mariadb setup
rc-service mariadb start
sleep 2
mysql -u root -e "CREATE DATABASE wp"; 
mysql -u root -e "CREATE USER 'zjamali'@'%' IDENTIFIED BY 'Zouhair'"; 
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'zjamali'@'%'"; 
mysql -u root -e "FLUSH PRIVILEGES";
mysql -u root -p wp < wp.sql
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb stop
rc-service mariadb start
sleep 3
#fi
rc-service mariadb restart
while true
do	/bin/sh
done