#!/bin/bash

# Check if brew is install

if command -v brew &> /dev/null; then
	echo -e "\x1B[1;31m Brew already install\x1B[0m"
else
	echo -e "\x1B[1;31m Installing Brew, please wait...\x1B[0m"
	rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && export PATH=$HOME/.brew/bin:$PATH && brew update && echo "export PATH=$HOME/.brew/bin:$PATH" >> ~/.zshrc
fi

# Check if minikube is install

if command -v minikube &> /dev/null; then
	echo -e "\x1B[1;31m Minikube already install\x1B[0m"
else
	echo -e "\x1B[1;31m Installing Minikube, please wait...\x1B[0m"
	brew install minikube
fi

# Export minikube home to goinfre & Initializing Minikube

echo -e "\x1B[1;31m Starting Minikube, please wait...\x1B[0m"
#export MINIKUBE_HOME=/goinfre/dalba-de/minikube
#ln -s /goinfre/dalba-de/.minikube /Users/dalba-de/.minikube
printf "🐳 : Minikube installed\n"
minikube start --vm-driver=virtualbox

# Bringing docker enviroment

echo -e "\x1B[1;31m Bringing docker enviroment\x1B[0m"
eval $(minikube docker-env)

# Enable minikube addons

minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

# Check images

if [[ "$(docker images -q my_nginx 2> /dev/null)" == "" ]]; then
	echo -e "\x1B[1;31m Creating nginx image \x1B[0m"
	docker build -t my_nginx srcs/nginx/ | grep Step
else
	echo -e "\x1B[1;31m Nginx image already exist\x1B[0m"
fi

if [[ "$(docker images -q my_mysql 2> /dev/null)" == "" ]]; then
	echo -e "\x1B[1;31m Creating mysql image \x1B[0m"
	docker build -t my_mysql srcs/mysql/ | grep Step
else
	echo -e "\x1B[1;31m Mysql image already exist\x1B[0m"
fi

if [[ "$(docker images -q my_wordpress 2> /dev/null)" == "" ]]; then
	echo -e "\x1B[1;31m Creating wordpress image \x1B[0m"
	docker build -t my_wordpress srcs/wordpress/ | grep Step
else
	echo -e "\x1B[1;31m Wordpress image already exist\x1B[0m"
fi

if [[ "$(docker images -q my_phpmyadmin 2> /dev/null)" == "" ]]; then
	echo -e "\x1B[1;31m Creating PhpMyAdmin image \x1B[0m"
	docker build -t my_phpmyadmin srcs/phpmyadmin/ | grep Step
else
	echo -e "\x1B[1;31m PhpMyAdmin image already exist\x1B[0m"
fi

if [[ "$(docker images -q my_ftp 2> /dev/null)" == "" ]]; then
	echo -e "\x1B[1;31m Creating FTP image \x1B[0m"
	docker build -t my_ftp srcs/ftps/ | grep Step
else
	echo -e "\x1B[1;31m FTP image already exist\x1B[0m"
fi

if [[ "$(docker images -q my_influxdb 2> /dev/null)" == "" ]]; then
	echo -e "\x1B[1;31m Creating InfluxDB image \x1B[0m"
	docker build -t my_influxdb srcs/influxdb/ | grep Step
else
	echo -e "\x1B[1;31m InfluxDB image already exist\x1B[0m"
fi

if [[ "$(docker images -q my_grafana 2> /dev/null)" == "" ]]; then
	echo -e "\x1B[1;31m Creating Grafana image \x1B[0m"
	docker build -t my_grafana srcs/grafana/ | grep Step
else
	echo -e "\x1B[1;31m Grafana image already exist\x1B[0m"
fi

# Launch deployments

echo -e "\x1B[1;33m Launching deployments \x1B[0m"
srcs/deployments/start.sh

clear

echo -e "\x1B[1;33m     _  _  _  _  _  _  _  _  _  _                       _  _  _  _    _  _  _  _  _  _  _  _  _     _           _  _  _  _    _  _  _     _  _  _  _  _   _  _  _  _     "
echo -e "\x1B[1;33m    (_)(_)(_)(_)(_)(_)(_)(_)(_)(_)                    _(_)(_)(_)(_)_ (_)(_)(_)(_)(_)(_)(_)(_)(_) _ (_)         (_)(_)(_)(_)_ (_)(_)(_) _ (_)(_)(_)(_)(_)_(_)(_)(_)(_)_   "
echo -e "\x1B[1;33m    (_)                  (_)                         (_)          (_)(_)            (_)         (_)(_)         (_)   (_)  (_)         (_)(_)           (_)          (_)  "
echo -e "\x1B[1;33m    (_) _  _             (_)                         (_)_  _  _  _   (_) _  _       (_) _  _  _ (_)(_)_       _(_)   (_)  (_)            (_) _  _      (_)_  _  _  _     "
echo -e "\x1B[1;33m    (_)(_)(_)            (_)                           (_)(_)(_)(_)_ (_)(_)(_)      (_)(_)(_)(_)     (_)     (_)     (_)  (_)            (_)(_)(_)       (_)(_)(_)(_)_   "
echo -e "\x1B[1;33m    (_)                  (_)                          _           (_)(_)            (_)   (_) _       (_)   (_)      (_)  (_)          _ (_)            _           (_)  "
echo -e "\x1B[1;33m    (_)                  (_)                         (_)_  _  _  _(_)(_) _  _  _  _ (_)      (_) _     (_)_(_)     _ (_) _(_) _  _  _ (_)(_) _  _  _  _(_)_  _  _  _(_)  "
echo -e "\x1B[1;33m    (_)                  (_)                           (_)(_)(_)(_)  (_)(_)(_)(_)(_)(_)         (_)      (_)      (_)(_)(_)  (_)(_)(_)   (_)(_)(_)(_)(_) (_)(_)(_)(_)    "
echo -e "\x1B[1;33m                                  _  _  _  _  _  _  _                                                                                                                    "
echo -e "\x1B[1;33m                                 (_)(_)(_)(_)(_)(_)(_)                                                                                                                   "                                                                                           


echo -e "\x1B[1;33m \t\t\t\t\t\tSuccessful deployment. Welcome to Fantabulous World of Kubernetes\x1B[0m"
echo -e "\x1B[1;33m \t\t\t\t\t\t Try with 192.168.99.100 to go to the main page. Enjoy!\x1B[0m"
echo ""
echo ""
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                              \x1B[1;32mSSH                                \x1B[1;31m##"
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##        \x1B[1;32madmin_ssh              \x1B[1;31m##              \x1B[1;32mpass              \x1B[1;31m##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                              \x1B[1;32mFTPS                               \x1B[1;31m##"
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##          \x1B[1;32mfiles                \x1B[1;31m##            \x1B[1;32mpassword            \x1B[1;31m##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                          \x1B[1;32mPHPMYADMIN                             \x1B[1;31m##"
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##          \x1B[1;32mroot                 \x1B[1;31m##            \x1B[1;32mpassword            \x1B[1;31m##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                            \x1B[1;32mGRAFANA                              \x1B[1;31m##"
echo -e "\x1B[1;31m #####################################################################"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##          \x1B[1;32madmin                \x1B[1;31m##             \x1B[1;32madmin              \x1B[1;31m##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m ##                               ##                                ##"
echo -e "\x1B[1;31m #####################################################################"

# Delete images?

#echo -e "\x1B[1;36m Do you want to delete images? [y/n] \x1B[0m"
#read varname

#if [[ $varname =~ ^[Yy]$ ]]; then
#	./deleteImages.sh
#fi