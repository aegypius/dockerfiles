FROM alpine:3.1
MAINTAINER Nicolas LAURENT <docker@aegypius.com>

RUN apk --update upgrade \
	&& apk add -t build-deps git \
	&& apk add --update -t runtime-deps git bash \

	&& git clone https://github.com/sstephenson/bats.git /app \
	&& bash /app/install.sh /usr/local \

	&& apk del --purge build-deps \
	&& rm -fvr /var/cache/apk/* /app

WORKDIR /data

CMD ["bats"]
