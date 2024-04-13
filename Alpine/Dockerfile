FROM alpine:latest
COPY install.sh /install.sh
RUN chmod +x /install.sh && \
    /install.sh

# ENTRYPOINT [ "/usr/local/webmin/miniserv.pl", '$/etc/webmin/miniserv.conf' ]
CMD sleep infinity