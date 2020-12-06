FROM alpine:latest

COPY script/start.sh srcs/telegraf.conf ./

RUN apk update && apk add --no-cache vsftpd

RUN adduser -h /home/./files -s /bin/false -D files

RUN echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "ftpd_banner=Welcome to dalba-de FTPS server" >> /etc/vsftpd/vsftpd.conf \
  && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf \
  && echo "passwd_chroot_enable=yes" >> /etc/vsftpd/vsftpd.conf \
  && echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf \
  && echo 'pasv_enable=Yes' >> /etc/vsftpd/vsftpd.conf \
  && echo 'pasv_address=192.168.99.103' >> /etc/vsftpd/vsftpd.conf \
  && echo 'pasv_max_port=10091' >> /etc/vsftpd/vsftpd.conf \
  && echo 'pasv_min_port=10090' >> /etc/vsftpd/vsftpd.conf \
  && sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf

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

EXPOSE 20 21 10090 10091

CMD /start.sh