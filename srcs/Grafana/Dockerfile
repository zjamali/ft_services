FROM alpine:3.12
COPY srcs/run.sh .
RUN chmod +x run.sh &&\ 
apk add openrc && \
apk add libc6-compat &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
openrc &&\
touch /run/openrc/softlevel &&\
wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz &&\
tar -zxvf grafana-7.4.1.linux-amd64.tar.gz
EXPOSE 3000
ENTRYPOINT sh run.sh


