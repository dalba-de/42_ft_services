# run telegraf
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

# run grafana
rm /usr/share/grafana/public/dashboards/template_vars.json
rm /usr/share/grafana/public/dashboards/default.json
/usr/sbin/grafana-server -config /etc/grafana.ini -homepath /usr/share/grafana/