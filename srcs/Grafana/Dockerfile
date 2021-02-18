FROM alpine:3.12
COPY srcs/run.sh .
COPY srcs/stop-supervisor.sh /stop-supervisor.sh
RUN chmod +x run.sh  &&\
chmod +x /stop-supervisor.sh &&\
apk add supervisor &&\
apk add openrc && \
apk add libc6-compat &&\
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
apk add telegraf &&\
openrc &&\
touch /run/openrc/softlevel &&\
wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz &&\
tar -zxvf grafana-7.4.1.linux-amd64.tar.gz 
#mv /etc/telegraf.conf /etc/telegraf.conf.orig
WORKDIR  /grafana-7.4.1
COPY srcs/telegraf.conf /etc/
COPY srcs/grafana.db /grafana-7.4.1/data/
EXPOSE 3000
ENTRYPOINT sh /run.sh


