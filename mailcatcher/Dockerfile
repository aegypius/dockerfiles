FROM alpine:latest

# Install Mailcatcher
RUN export MAILCATCHER_VERSION=0.6.1 \
  && apk add --update ruby ca-certificates ruby-dev libstdc++ sqlite-libs supervisor \
  && apk add -t build-deps build-base openssl-dev sqlite-dev \
  && gem install mailcatcher -V --no-ri --no-rdoc -v ${MAILCATCHER_VERSION} \
  && apk del --purge build-deps \
  && rm -rf /var/cache/apk/*

EXPOSE 1025 1080

COPY supervisord.conf supervisord.conf

CMD ["/usr/bin/supervisord"]
