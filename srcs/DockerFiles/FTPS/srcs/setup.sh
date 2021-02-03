#!/bin/bash
# run the vsftp service
rc-status 
touch /run/openrc/softlevel
rc-service vsftpd restart
rc-service vsftpd status
/bin/sh