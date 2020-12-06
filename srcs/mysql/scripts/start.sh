#!/bin/sh

# run telegraf
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo '[i] MySQL directory already present, skipping creation'
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	chown -R mysql:mysql /var/lib/mysql

	# init database
	echo 'Initializing database'
	mysql_install_db --user=root > /dev/null
	echo 'Database initialized'

	chown -R mysql /var/lib/mysql
	exec /usr/bin/mysqld --user=root &
	
	echo "[i] wait 5 sec"
    sleep 5
	echo "[i] CREATE DATABASE"

	echo "CREATE DATABASE wordpress;" | mysql -u root
	echo "GRANT ALL ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root
	echo "EXIT" | mysql -u root
	cd
	mysql wordpress -u root --password=password < /etc/wordpress.sql

	pkill mysqld
fi

echo "[i] Sleeping 5 sec"
sleep 5

echo "Starting all process"
exec /usr/bin/mysqld --user=root --console

