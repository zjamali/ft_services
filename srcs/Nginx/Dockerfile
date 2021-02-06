FROM alpine:latest
RUN  apk update && apk add nginx && apk add openrc --no-cache && apk add openssl && apk add openssh 
RUN echo -e "Zouhair\nZouhair" | adduser zjamali
RUN adduser -D -g 'www' www
VOLUME [ “/sys/fs/cgroup” ]
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN rc-update add nginx default
RUN rc-update add sshd default
RUN openrc
RUN touch /run/openrc/softlevel
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/run.sh .
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048  -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
RUN chmod +x /run.sh
EXPOSE 22
EXPOSE 80
EXPOSE 443
ENTRYPOINT sh run.sh
