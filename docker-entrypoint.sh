#!/bin/sh

# start fastcgiwrap
rm -f /var/run/fcgiwrap.socket
nohup fcgiwrap -s unix:/var/run/fcgiwrap.socket &
while ! [ -S /var/run/fcgiwrap.socket ]; do sleep .2; done
chown nginx:www-data /var/run/fcgiwrap.socket

# start nginx server
envsubst '${USER_DOMAIN}' < /nginx.conf.tmpl > /etc/nginx/nginx.conf
nginx -g "daemon off;"