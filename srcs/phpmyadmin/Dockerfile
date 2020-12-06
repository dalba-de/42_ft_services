FROM alpine:latest

COPY srcs/config.inc.php srcs/start.sh srcs/telegraf.conf ./

# Install PHP
RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

# Download PhpMyAdmin
ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz .

# Install PhpMyAdmin
RUN tar -xvf phpMyAdmin-4.9.7-all-languages.tar.gz && \
	mv phpMyAdmin-4.9.7-all-languages /www && \
	mv config.inc.php /www/ && \
	rm -f phpMyAdmin-4.9.7-all-languages.tar.gz

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

EXPOSE 5000

CMD ./start.sh
