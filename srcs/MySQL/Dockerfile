FROM alpine:3.12
COPY srcs/run.sh /
COPY srcs/wp.sql /
COPY srcs/stop-supervisor.sh /stop-supervisor.sh
RUN chmod +x run.sh &&\
chmod +x /stop-supervisor.sh &&\
apk add mysql mysql-client  openrc --no-cache  &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf supervisor &&\
openrc  &&\
touch /run/openrc/softlevel  &&\
rc-update add mariadb default &&\
openrc &&\
#mv /etc/telegraf.conf /etc//etc/telegraf.conf.orig &&\
touch /run/openrc/softlevel
COPY srcs/telegraf.conf /etc/
COPY srcs/supervisord.conf /etc/supervisord.conf
EXPOSE 3306
CMD ["sh", "/run.sh"]