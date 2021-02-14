rc-status
rc-service influxdb start
sleep 2
rc-service telegraf start
rc-status -s
while true
do	/bin/sh
done