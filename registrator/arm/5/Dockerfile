FROM armbuild/alpine:latest

RUN export REGISTRATOR_VERSION=v5 \
	&& apk add --update -t build-deps go gcc libgcc libc-dev git mercurial \
	&& git clone --single-branch --branch=${REGISTRATOR_VERSION} https://github.com/gliderlabs/registrator /go/src/github.com/gliderlabs/registrator \
        && export GOPATH=/go \
	&& mkdir -p /go/src/github.com/progrium \
	&& ln -s /go/src/github.com/gliderlabs/registrator /go/src/github.com/progrium/registrator \
	&& cd /go/src/github.com/progrium/registrator \
        && go get -d -v ../... \
	&& go build -ldflags "-X main.Version $(cat VERSION)" -o /usr/local/bin/registrator \
	&& apk del --purge build-deps \
	&& rm -rf /go /var/cache/apk/*

CMD ["registrator"]
