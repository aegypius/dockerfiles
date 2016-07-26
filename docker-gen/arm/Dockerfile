FROM quay.io/aegypius/base:edge-arm


ENV VERSION 0.7.3
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$VERSION/docker-gen-linux-armhf-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

ENTRYPOINT ["/usr/local/bin/docker-gen"]

RUN apk add --update -t build-deps curl \
  && curl -L $DOWNLOAD_URL | tar -C /usr/local/bin -xvz \
  && apk del --purge build-deps \
	&& rm -rf /go /var/cache/apk/*


