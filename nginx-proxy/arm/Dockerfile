FROM hypriot/rpi-alpine-scratch:latest

EXPOSE 80 443

RUN apk add --update nginx bash \
	&& mkdir -p /tmp/nginx

RUN apk add -t build-deps go gcc libgcc libc-dev git mercurial

ENV FOREGO_VERSION=v0.16.1 \
    DOCKER_GEN_VERSION=0.4.3 \
    GOPATH=/go

RUN git clone --single-branch --branch=${FOREGO_VERSION} https://github.com/ddollar/forego /go/src/github.com/ddollar/forego \
	&& cd /go/src/github.com/ddollar/forego \
	&& go get \
	&& go build -o /usr/local/bin/forego

RUN git clone --single-branch --branch=${DOCKER_GEN_VERSION} https://github.com/jwilder/docker-gen /go/src/github.com/jwilder/docker-gen \
	&& cd /go/src/github.com/jwilder/docker-gen \
	&& go get \
	&& go build -o /usr/local/bin/docker-gen

RUN git clone --single-branch --branch=master https://github.com/jwilder/nginx-proxy /app

RUN apk del --purge build-deps \
	&& rm -rf /go /var/cache/apk/*

WORKDIR /app

# Configure nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

ENV DOCKER_HOST unix:///tmp/docker.sock

VOLUME ["/etc/nginx/certs"]

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["forego", "start", "-r"]

