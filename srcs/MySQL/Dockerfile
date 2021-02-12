FROM alpine:3.12
COPY srcs/run.sh .
RUN chmod +x run.sh  &&\
apk add mysql mysql-client  openrc --no-cache  &&\
openrc  &&\
touch /run/openrc/softlevel  &&\
rc-update add mariadb default 
EXPOSE 3306
ENTRYPOINT sh run.sh