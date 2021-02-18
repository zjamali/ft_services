FROM alpine:3.12
COPY srcs/stop-supervisor.sh /stop-supervisor.sh
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod +x /stop-supervisor.sh &&\
apk update && apk add vsftpd && apk add openrc && apk add openssl &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
apk add supervisor &&\
openrc  &&\
touch /run/openrc/softlevel  &&\
rc-update add vsftpd default  &&\
echo -e "Zouhair\nZouhair" | adduser zjamali  &&\
echo "zjamali" | tee -a /etc/vsftpd.userlist  &&\
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
COPY srcs/telegraf.conf /etc/
COPY srcs/supervisord.conf /etc/supervisord.conf
EXPOSE 21
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]