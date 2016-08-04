FROM quay.io/aegypius/armhf-alpine:edge
MAINTAINER Nicolas LAURENT <innercircle@aegypius.com>

RUN chmod 0755 / \
  && apk add --update tini \
  && rm /var/cache/apk/*

ENTRYPOINT ["/sbin/tini", "--"]
