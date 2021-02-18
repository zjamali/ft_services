FROM alpine:3.12
COPY srcs/stop-supervisor.sh /stop-supervisor.sh
RUN chmod +x /stop-supervisor.sh &&\
apk update && apk add nginx openrc --no-cache php7-fpm phpmyadmin &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
apk add supervisor &&\
adduser -D -g 'www' www &&\
mkdir /www &&\
chown -R www:www /var/lib/nginx &&\
chown -R www:www /www &&\
rc-update add nginx default &&\
rc-update add php-fpm7 default &&\
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig &&\
openrc &&\
touch /run/openrc/softlevel
WORKDIR /www/
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz &&\
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
rm phpMyAdmin-5.0.2-all-languages.tar.gz &&\
mv phpMyAdmin-5.0.2-all-languages phpmyadmin &&\
mkdir phpmyadmin/temp && chmod 777 phpmyadmin/temp &&\
mkdir /run/nginx/
#mv /etc/telegraf.conf /etc//etc/telegraf.conf.orig
COPY srcs/config.inc.php /www/phpmyadmin
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/telegraf.conf /etc/
COPY srcs/supervisord.conf /etc/supervisord.conf
EXPOSE 5000
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
#ENTRYPOINT sh /run.sh