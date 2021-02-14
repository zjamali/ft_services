#!/bin/bash
# run the vsftp service
rc-status 
touch /run/openrc/softlevel
rc-service vsftpd restart
rc-service vsftpd status
rc-service telegraf start
while true
do	/bin/sh
done