#!/bin/sh
set -e

/usr/local/webmin/miniserv.pl /etc/webmin.miniserv.conf \
&& sleep infinity
