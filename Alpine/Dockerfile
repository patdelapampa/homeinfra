FROM alpine:edge

# ENV needed for webmin install.sh
ENV config_dir /etc/webmin
ENV var_dir /var/webmin
ENV perl /usr/bin/perl
ENV login admin
ENV password admin
ENV port 10000
ENV ssl 0
ENV atboot 1

RUN apk add --no-cache \
    perl \
    perl-net-ssleay \
    openssl \
    bind \
    dhcp-server \
    samba

    WORKDIR /opt
RUN wget -O - https://www.webmin.com/download/webmin-current.tar.gz | tar -xzf - \
    && mv webmin* webmin
WORKDIR /opt/webmin
RUN ./setup.sh /usr/local/webmin



# COPY install.sh /install.sh
# RUN chmod +x /install.sh && \
    # /install.sh

# ENTRYPOINT [ "/usr/local/webmin/miniserv.pl", "\$/etc/webmin/miniserv.conf" ]
CMD ["sleep", "infinity"]