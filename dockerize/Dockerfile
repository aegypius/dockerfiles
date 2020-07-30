FROM golang:1.13.11-alpine3.11 AS binary
RUN apk -U add openssl git \
	&& git clone https://github.com/jwilder/dockerize /go/src/github.com/jwilder/dockerize

WORKDIR /go/src/github.com/jwilder/dockerize

RUN go get github.com/robfig/glock
RUN glock sync -n < GLOCKFILE
RUN go install

FROM alpine:3.11
LABEL maintainer="Jason Wilder <mail@jasonwilder.com>"
LABEL maintainer="Nicolas LAURENT <docker@aegypius.com>"

COPY --from=binary /go/bin/dockerize /usr/local/bin

ENTRYPOINT ["dockerize"]
CMD ["--help"]
