#!/bin/bash
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root -e "CREATE DATABASE wp"; 
mysql -u root -e "CREATE USER 'zjamali'@'%' IDENTIFIED BY 'Zouhair'"; 
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'zjamali'@'%'"; 
mysql -u root -e "FLUSH PRIVILEGES";
mysql -u root wp < /wp.sql
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb stop
sleep 2
/usr/bin/supervisord -c /etc/supervisord.conf