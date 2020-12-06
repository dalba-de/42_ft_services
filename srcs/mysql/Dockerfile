FROM alpine:latest

RUN apk update
RUN apk add --no-cache mysql mysql-client
RUN addgroup mysql mysql

COPY scripts/start.sh start.sh
COPY srcs/my.cnf /etc/my.cnf
COPY srcs/wordpress.sql /etc/wordpress.sql
COPY srcs/telegraf.conf ./

# add telegraf
RUN apk add wget \
  	&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz \
  	&& tar -xvf telegraf-1.6.3-static_linux_amd64.tar.gz \
  	&& chmod +x /telegraf/* \
  	&& cp /telegraf/telegraf /usr/bin/ \
  	&& rm -rf *.tar.gz* telegraf/ \
	&& mkdir -p /etc/telegraf \
	&& touch /var/run/utmp \
	&& mv telegraf.conf	/etc/telegraf/

EXPOSE 3306

ENTRYPOINT ["./start.sh"]