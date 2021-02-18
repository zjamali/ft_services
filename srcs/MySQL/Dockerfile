FROM alpine:3.12
COPY srcs/run.sh /
COPY srcs/wp.sql /
RUN chmod +x run.sh  &&\
apk add mysql mysql-client  openrc --no-cache  &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
openrc  &&\
touch /run/openrc/softlevel  &&\
rc-update add mariadb default &&\
openrc &&\
#mv /etc/telegraf.conf /etc//etc/telegraf.conf.orig &&\
touch /run/openrc/softlevel
COPY srcs/telegraf.conf /etc/
EXPOSE 3306
ENTRYPOINT sh /run.sh