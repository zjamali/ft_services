#!/bin/bash
rc-status

#mysql -u root -e "SET PASSWORD FOR 'zjamali'@'localhost' = PASSWORD('passwd')";
mysql -u root -e "CREATE USER 'zjamali'@'localhost' IDENTIFIED BY 'Zouhair'";
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost'";
mysql -u root -e "FLUSH PRIVILEGES";
sed 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-status 
while true
do	/bin/sh
done