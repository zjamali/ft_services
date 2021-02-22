FROM alpine:3.12
COPY srcs/stop-supervisor.sh /stop-supervisor.sh
RUN chmod +x /stop-supervisor.sh &&\
apk add openrc influxdb &&\
apk add supervisor &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
openrc &&\
touch /run/openrc/softlevel &&\
rc-update add influxdb default
COPY srcs/telegraf.conf /etc/
COPY srcs/supervisord.conf /etc/supervisord.conf
EXPOSE 8086
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
