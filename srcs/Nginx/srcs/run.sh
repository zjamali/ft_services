rc-status
touch /run/openrc/softlevel
rc-service nginx restart
rc-service sshd restart
rc-service nginx status
rc-service sshd status
while true
do	/bin/sh
done