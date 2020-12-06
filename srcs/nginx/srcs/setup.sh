if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
	# generate fresh rsa key
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
fi
if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
	# generate fresh dsa key
	ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
fi

#prepare run dir
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

# create admin_ssh user
adduser -D admin_ssh \
&& echo "admin_ssh:pass" | chpasswd

# run telegraf
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

# run sshd
/usr/sbin/sshd

# run nginx
/usr/sbin/nginx -g "daemon off;"