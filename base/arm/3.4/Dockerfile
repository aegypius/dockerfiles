FROM quay.io/aegypius/armhf-alpine:3.4
MAINTAINER Nicolas LAURENT <innercircle@aegypius.com>
RUN apk add --update tini \
  && rm /var/cache/apk/*
ENTRYPOINT ["/sbin/tini", "--"]
