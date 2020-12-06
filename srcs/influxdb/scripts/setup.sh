# run telegraf
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

# Start influxDB
influxd run -config /etc/influxdb.conf

# Create Database
#influx -execute "CREATE DATABASE telegraf"
#influx -execute "CREATE USER root WITH PASSWORD 'root' WITH ALL PRIVILEGES"