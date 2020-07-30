# Build sickchill
# ------------------------------------------------------------------------------
FROM python:2-slim

LABEL maintainer="Nicolas LAURENT <docker@aegypius.com>"

ARG SICKRAGE_REPOSITORY=https://github.com/SickChill/SickChill.git
ARG SICKRAGE_CHANNEL=master

EXPOSE 8081
ENTRYPOINT ["docker-entry"]
CMD ["docker-start"]
VOLUME ["/data"]

ENV PATH=/usr/local/bin:$PATH \
  OPEN_FILE_LIMIT=32768 \
  SUPERVISOR_LOG_LEVEL=WARN \
  SICKRAGE_REPOSITORY=$SICKRAGE_REPOSITORY \
  SICKRAGE_CHANNEL=$SICKRAGE_CHANNEL \
  UPDATE_FREQUENCY=28800 \
  SB_HOME=/app \
  SB_USER=root \
  SB_PORT=8081 \
  SB_DATA=/data \
  PYTHONIOENCODING="UTF-8"

COPY --from=aegypius/dockerize /usr/local/bin/dockerize /usr/local/bin/

# Activate non-free repository for unrar
RUN sed -i 's#main$#main non-free#g' /etc/apt/sources.list \
	&& apt-get update -qy \
	&& export build_deps="build-essential libffi-dev libssl-dev" \
	&& apt-get install -y --no-install-recommends \
		bash git mediainfo unrar tzdata libffi6 openssl dnsmasq supervisor musl $build_deps \
	&& pip install pyopenssl \
	&& apt-get remove --purge -y $build_deps \
	&& apt-get autoremove --purge -y \
	&& rm -fr /var/cache/apt/archives/ \
	&& mkdir /app /var/run/sickchill

WORKDIR /app

RUN git init \
  && git remote add origin $SICKRAGE_REPOSITORY \
  && git fetch --depth 1 origin $SICKRAGE_CHANNEL \
  && git checkout $SICKRAGE_CHANNEL

COPY templates /templates
COPY scripts/* /usr/local/bin/

RUN chmod a+rx /usr/local/bin/* \
  && chown root.root /usr/local/bin/*
