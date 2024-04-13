#!/bin/sh
# Alpine Linux install script

apk add --nocache samba bind dhcp-server perl perl-net-ssleay \
  --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main
cd /opt
wget -O - https://www.webmin.com/download/webmin-current.tar.gz | tar -xzf -
mv webmin* webmin
cd webmin
export config_dir=/etc/webmin
export var_dir=/var/webmin
export perl=/usr/bin/perl
export port=10000
export login=admin
export password=admin
export ssl=0
export atboot=1

./setup.sh /usr/local/webmin

