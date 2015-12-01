FROM armbuild/alpine:latest
MAINTAINER Nicolas LAURENT <docker@aegypius.com>

EXPOSE 8081

ENV PATH=/usr/local/bin:$PATH \
  OPEN_FILE_LIMIT=32768 \
  SUPERVISOR_LOG_LEVEL=WARN \
  SICKRAGE_CHANNEL=master \
  UPDATE_FREQUENCY=28800 \
  SB_HOME=/app \
  SB_USER=root \
  SB_PORT=8081 \
  SB_DATA=/data

RUN apk --update add -t runtime-deps git python py-pip py-virtualenv dnsmasq bash unrar openssl libffi libxml2 libxslt \
  && apk add -t build-deps curl ca-certificates gcc python-dev musl-dev openssl-dev libffi-dev libxml2-dev libxslt-dev \
  && git clone git://github.com/sickragetv/sickrage /app \
  && virtualenv venv \
  && venv/bin/pip install mako pyopenssl lxml supervisor \
  && apk del --purge build-deps \
  && rm -vfr /var/cache/apk/*

WORKDIR /app
COPY templates /templates
COPY scripts/* /usr/local/bin/
COPY dockerize-armhf /usr/local/bin/dockerize
RUN chmod a+rx /usr/local/bin/* \
  && chown root.root /usr/local/bin/*

ENTRYPOINT ["docker-entry"]
CMD ["docker-start"]
VOLUME ["/data"]
