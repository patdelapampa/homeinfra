#!/bin/sh

addgroup -g 10000 tinker
adduser -SHD -u 10000 -G tinker tinker

# Add needed and wanted packages
apk update
apk add --no-cache \
    tar \
    gzip \
    unzip \
    perl \
    perl-app-cpanminus \
    perl-net-ssleay \
    shared-mime-info \
    openssl \
    bind \
    dhcp-server \
    samba-dc \
    krb5 \
    chrony

# Install Perl modules
cpanm DateTime DateTime::Locale DateTime::TimeZone Data::Dumper \
    Digest::MD5 Digest::SHA Encode::Detect File::Basename \
    File::Path Net::SSLeay Time::HiRes Time::Local Time::Piece \
    lib open

cd /opt
wget -O - https://www.webmin.com/download/webmin-current.tar.gz | tar -xzf -
mv webmin* webmin
cd /opt/webmin
./setup.sh /usr/local/webmin
cd /usr/local/webmin

# Clean up
rm -rf /opt/webmin
rm -rf /var/cache/apk/*

# chown -R tinker:tinker /usr/local/webmin


