FROM alpine:edge

MAINTAINER patrick@tinkerscave.com

WORKDIR /opt

# Add script to execute webmin and 'sleep infinity'
COPY scripts/ .

# ENV needed for webmin install.sh
ENV APP_UID=10000 \
    APP_USER=infra \
    config_dir=/etc/webmin \
    var_dir=/var/webmin \
    perl=/usr/bin/perl \
    login=admin \
    password=admin \
    port=10000 \
    ssl=0 \
    atboot=1

RUN chmod +x /opt/*.sh \
    && ./config.sh

CMD ["/opt/entrypoint.sh"]
# ENTRYPOINT [ "/usr/local/webmin/miniserv.pl", "\$/etc/webmin/miniserv.conf" ]
# ENTRYPOINT /usr/bin/perl /usr/local/webmin/miniserv.pl /etc/webmin/miniserv.conf
# CMD sleep infinity