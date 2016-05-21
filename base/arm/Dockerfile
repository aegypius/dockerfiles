FROM quay.io/aegypius/armhf-alpine:edge
MAINTAINER Nicolas LAURENT <innercircle@aegypius.com>
RUN apk add --update tini \
  && rm /var/cache/apk/*
ENTRYPOINT ["tini", "--"]
