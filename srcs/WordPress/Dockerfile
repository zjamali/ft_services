FROM alpine:3.12
RUN  apk update && apk add nginx && apk add openrc --no-cache php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
#RUN echo -e "Zouhair\nZouhair" | adduser zjamali
RUN adduser -D -g 'www' www
#VOLUME [ “/sys/fs/cgroup” ]
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN rc-update add nginx default
RUN rc-update add php-fpm7 default
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY srcs/nginx.conf /etc/nginx/nginx.conf
RUN openrc
RUN touch /run/openrc/softlevel
#RUN rc-service php-fpm7 restart
#RUN rc-service nginx restart
WORKDIR /www/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress/* .
RUN rm -rf wordpress
RUN srcs/wp-config.php .
WORKDIR /home
COPY srcs/run.sh .
RUN chmod +x run.sh
EXPOSE 5050
ENTRYPOINT sh run.sh
