FROM hypriot/rpi-alpine-scratch:latest

RUN echo "http://nl.alpinelinux.org/alpine/v3.3/main" > /etc/apk/repositories \
  && echo "@community http://nl.alpinelinux.org/alpine/v3.3/community" >> /etc/apk/repositories \
  && echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
  && echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk update \
  && apk upgrade \
  && apk add tini@testing \
	&& rm -rf /go /var/cache/apk/*

ENTRYPOINT ["tini", "--"]
