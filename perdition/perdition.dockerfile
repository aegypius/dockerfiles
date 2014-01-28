FROM ubuntu:quantal

# Update ubuntu
RUN apt-get update
RUN apt-get -y upgrade

# Setup peridition
RUN apt-get -y install perdition
