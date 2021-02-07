#!/bin/bash
rc-status
rc-service mariadb restart
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('passwd')";
rc-status 
while true
do	/bin/sh
done