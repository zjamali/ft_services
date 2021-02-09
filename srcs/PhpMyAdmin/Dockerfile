FROM alpine:3.12
RUN  apk update && apk add nginx && apk add openrc --no-cache php7-fpm phpmyadmin
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
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages/* .
RUN rm -rf phpMyAdmin-5.0.2-all-languages
WORKDIR /home
COPY srcs/run.sh .
RUN chmod +x run.sh
EXPOSE 5000
ENTRYPOINT sh run.sh