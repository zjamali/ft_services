FROM alpine:3.12
RUN  apk update && apk add vsftpd && apk add openrc && apk add openssl
RUN openrc
RUN touch /run/openrc/softlevel
RUN rc-update add vsftpd default
RUN echo -e "Zouhair\nZouhair" | adduser zjamali
RUN echo "zjamali" | tee -a /etc/vsftpd.userlist
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
WORKDIR /
COPY srcs/setup.sh .
RUN chmod +x /setup.sh
EXPOSE 21
CMD sh setup.sh
