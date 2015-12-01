FROM armbuild/alpine:latest
MAINTAINER Nicolas LAURENT <docker@aegypius.com>

EXPOSE 67 67/udp \
  547 547/udp \
  647 647/udp \
  847 847/udp

RUN apk --update add dhcp \
  && rm -vfr /var/cache/apk/*

COPY ./dockerize-armhf /usr/local/bin/dockerize
COPY ./scripts/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*
COPY ./templates /etc/dockerize/templates

ENTRYPOINT ["docker-entry"]
CMD ["dhcpd", "-f", "-cf", "/data/dhcpd.conf", "-lf", "/data/dhcpd.leases", "--no-pid"]
