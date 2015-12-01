#
# Go container based on google/golang
#
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install --no-install-recommends -qy curl build-essential ca-certificates git mercurial bzr

RUN mkdir /goroot /gopath
RUN curl -Ls https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
