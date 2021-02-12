#!/bin/bash
rc-status
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root -e "CREATE DATABASE wp"; 
mysql -u root -e "CREATE USER 'zjamali'@'%' IDENTIFIED BY 'Zouhair'"; 
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'zjamali'@'%'"; 
mysql -u root -e "FLUSH PRIVILEGES"; 
#mysql -u root -e "SET PASSWORD FOR 'zjamali'@'localhost' = PASSWORD('passwd')";
#mysql -u root -e "CREATE USER 'zjamali'@'%' IDENTIFIED BY 'Zouhair'";
#mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'zjamali'@'%'";
#mysql -u root -e "FLUSH PRIVILEGES";
#sed 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-erver.cnf
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
#sed 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/' /etc/my.cnf.d/mariadb-server.cnf 
rc-service mariadb restart
rc-service mariadb restart
rc-status 
while true
do	/bin/sh
done