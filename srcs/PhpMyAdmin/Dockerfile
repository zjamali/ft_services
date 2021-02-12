FROM alpine:3.12
COPY srcs/run.sh /
RUN chmod +x /run.sh &&\
apk update && apk add nginx openrc --no-cache php7-fpm phpmyadmin &&\
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
mkdir phpmyadmin/temp && chmod 777 phpmyadmin/temp
COPY srcs/config.inc.php /www/phpmyadmin
COPY srcs/nginx.conf /etc/nginx/nginx.conf
EXPOSE 5000
ENTRYPOINT sh /run.sh