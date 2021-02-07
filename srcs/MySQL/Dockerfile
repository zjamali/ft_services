FROM alpine:latest
RUN apk add mysql mysql-client  openrc --no-cache
#VOLUME [ “/sys/fs/cgroup” ]
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN rc-update add mariadb default 
RUN rc-service mariadb start && \
mysql -u root -e "CREATE DATABASE wp";
WORKDIR /home
COPY srcs/run.sh .
RUN chmod +x run.sh
EXPOSE 3306
ENTRYPOINT sh run.sh