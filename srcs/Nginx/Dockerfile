FROM alpine:3.12
COPY srcs/stop-supervisor.sh /stop-supervisor.sh
RUN chmod +x /stop-supervisor.sh &&\
apk update && apk add nginx && apk add openrc --no-cache && apk add openssl && apk add openssh&&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
apk add supervisor &&\
echo -e "Zouhair\nZouhair" | adduser zjamali  &&\
adduser -D -g 'www' www  &&\
mkdir /www  &&\
chown -R www:www /var/lib/nginx  &&\
chown -R www:www /www  &&\
openrc &&\
mkdir /run/nginx/ &&\
ssh-keygen -A &&\
touch /run/openrc/softlevel &&\
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048  -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/telegraf.conf /etc/
COPY srcs/supervisord.conf /etc/supervisord.conf
EXPOSE 22
EXPOSE 80
EXPOSE 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
