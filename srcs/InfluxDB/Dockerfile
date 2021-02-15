FROM alpine:3.12
COPY srcs/run.sh .
RUN chmod +x run.sh &&\ 
apk add openrc influxdb &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
openrc &&\
touch /run/openrc/softlevel &&\
rc-update add influxdb default
#mv /etc/telegraf.conf /etc//etc/telegraf.conf.orig 
COPY srcs/telegraf.conf /etc/
EXPOSE 8086
ENTRYPOINT sh run.sh
