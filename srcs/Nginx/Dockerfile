FROM alpine:3.12
COPY srcs/run.sh .
RUN chmod +x run.sh &&\
apk update && apk add nginx && apk add openrc --no-cache && apk add openssl && apk add openssh  &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
echo -e "Zouhair\nZouhair" | adduser zjamali  &&\
adduser -D -g 'www' www  &&\
mkdir /www  &&\
chown -R www:www /var/lib/nginx  &&\
chown -R www:www /www  &&\
rc-update add nginx default  &&\
rc-update add sshd default &&\
openrc &&\
touch /run/openrc/softlevel &&\
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048  -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
#mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/telegraf.conf /etc/
EXPOSE 22
EXPOSE 80
EXPOSE 443
ENTRYPOINT sh run.sh
