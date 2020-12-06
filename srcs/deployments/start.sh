#!/bin/sh
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/deployments/secret.yaml
kubectl apply -f srcs/deployments/nginx-deployment.yaml
kubectl apply -f srcs/deployments/mysql-deployment.yaml
kubectl apply -f srcs/deployments/wordpress-deployment.yaml
kubectl apply -f srcs/deployments/phpmyadmin-deployment.yaml
kubectl apply -f srcs/deployments/ftps-deployment.yaml
kubectl apply -f srcs/deployments/influxdb-deployment.yaml
kubectl apply -f srcs/deployments/grafana-deployment.yaml