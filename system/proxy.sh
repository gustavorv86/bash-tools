#!/bin/bash

echo -n "Proxy host: "
read proxy_host=

echo -n "Proxy port: "
read proxy_port

echo -n "Username: "
read proxy_user

echo -n "Password: "
read -s proxy_passwd

export {ftp,http,https}_proxy=http://${proxy_user}:${proxy_passwd}@${proxy_host}:${proxy_port}
export no_proxy="localhost, 127.0.0.0/8, 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16"

echo "Done"

