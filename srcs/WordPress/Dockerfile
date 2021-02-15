FROM alpine:3.12
COPY srcs/run.sh .
RUN chmod +x /run.sh &&\
apk update && apk add nginx && apk add openrc --no-cache php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
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
RUN wget http://wordpress.org/latest.tar.gz &&\
tar -xzvf latest.tar.gz &&\
rm latest.tar.gz &&\
rm wordpress/wp-config-sample.php &&\
mv wordpress/* . &&\
rm -rf wordpress
#mv /etc/telegraf.conf /etc//etc/telegraf.conf.orig
COPY srcs/wp-config.php .
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/telegraf.conf /etc/
EXPOSE 5050
ENTRYPOINT sh /run.sh
