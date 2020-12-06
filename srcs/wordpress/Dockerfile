
FROM alpine:latest

COPY srcs/wp-config.php srcs/start.sh srcs/telegraf.conf ./

# Create temporary folder
RUN mkdir -p aux

COPY srcs/aux /aux

# Install PHP
RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

# Download Wordpress
ADD https://wordpress.org/latest.tar.gz .

# Install Wordpress
RUN tar -xvf latest.tar.gz && \
	mv wordpress /www && \
	mv wp-config.php /www/ && \
	rm -f latest.tar.gz

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

EXPOSE 5050

CMD ./start.sh