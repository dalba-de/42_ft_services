#!/bin/sh
kubectl delete deployment nginx-deployment
kubectl delete deployment mysql
kubectl delete deployment wordpress-deployment
kubectl delete deployment phpmyadmin-deployment
kubectl delete deployment ftp-deployment
kubectl delete deployment influxdb
kubectl delete deployment grafana
kubectl delete svc nginx
kubectl delete svc mysql
kubectl delete svc wordpress-service
kubectl delete svc ftp-service
kubectl delete svc phpmyadmin-service
kubectl delete svc influxdb
kubectl delete svc grafana
kubectl delete pvc --all
kubectl delete secret mysql-pass
