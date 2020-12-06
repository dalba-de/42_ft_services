FROM alpine:latest

# copy files
COPY srcs/telegraf.conf scripts/start.sh srcs/dashboard.yaml srcs/datasource.yaml srcs/dashboards ./

# add grafana
RUN apk update \
	&& apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# copy dashboards && datasource
RUN mv datasource.yaml /usr/share/grafana/conf/provisioning/datasources/ \
	&& mv dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/ \
	&& mv *.json /usr/share/grafana/public/dashboards/

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

EXPOSE 3000

CMD ./start.sh