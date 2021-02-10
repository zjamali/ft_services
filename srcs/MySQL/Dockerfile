FROM alpine:3.12
RUN apk add mysql mysql-client  openrc --no-cache
#VOLUME [ “/sys/fs/cgroup” ]
#RUN echo -e "Zouhair\nZouhair" | adduser zjamali
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN rc-update add mariadb default 
RUN rc-service mariadb start && \
mysql -u root -e "CREATE DATABASE wp"; 
RUN  rc-service mariadb restart && \
mysql -u root -e "CREATE USER 'zjamali'@'%' IDENTIFIED BY 'Zouhair'"; 
RUN  rc-service mariadb restart && \
mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO 'zjamali'@'%'"; 
RUN  rc-service mariadb restart && \
mysql -u root -e "FLUSH PRIVILEGES"; 
#RUN sed 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf
#RUN sed 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/' /etc/my.cnf.d/mariadb-server.cnf 
RUN rc-service mariadb restart
WORKDIR /home
COPY srcs/run.sh .
RUN chmod +x run.sh
EXPOSE 3306
CMD sh run.sh