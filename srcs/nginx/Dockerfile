FROM alpine:latest

# copy files
COPY srcs/index.html srcs/nginx.conf srcs/setup.sh srcs/telegraf.conf srcs/Superhero.ttf ./

# install nginx, ssl and ssh
RUN apk update && apk add nginx openssl openssh;

# create run dir and copy nginx config files
RUN mkdir -p /run/nginx www && \
	mv nginx.conf /etc/nginx/ && \
	mv index.html /www/

# create ssl key
RUN openssl req -x509 -nodes -days 365 -subj "/C=SP/ST=Madrid/O=42, \
	/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;

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

# remove cache
RUN rm  -rf /tmp/* /var/cache/apk/* \
	&& rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

EXPOSE 22 80 443 9090

CMD ./setup.sh