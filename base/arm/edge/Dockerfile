FROM quay.io/aegypius/armhf-alpine:edge
LABEL maintainer "Nicolas LAURENT <docker@aegypius.com>"

RUN chmod 0755 / \
  && apk add --update tini \
  && rm /var/cache/apk/*

ENTRYPOINT ["/sbin/tini", "--"]
