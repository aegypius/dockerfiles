FROM quay.io/aegypius/armhf-alpine:3.4
MAINTAINER Nicolas LAURENT <innercircle@aegypius.com>

RUN chmod 0755 / \
  && apk add --update tini \
  && rm /var/cache/apk/*

ENTRYPOINT ["/sbin/tini", "--"]
