FROM ubuntu:latest

ENV LOCALE C
ENV DEBIAN_FRONTEND noninteractive

# add mongo repo
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
RUN apt-get update

# install mongo itself
RUN apt-get -y install apt-utils
RUN apt-get -y install mongodb-10gen

VOLUME     ["/data/db"]

EXPOSE     27017 28017
ENTRYPOINT ["/usr/bin/mongod"]
