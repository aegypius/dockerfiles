FROM quay.io/aegypius/armhf-alpine:3.4
LABEL maintainer "Nicolas LAURENT <docker@aegypius.com>"

RUN chmod 0755 / \
  && apk add --update tini \
  && rm /var/cache/apk/*

ENTRYPOINT ["/sbin/tini", "--"]
