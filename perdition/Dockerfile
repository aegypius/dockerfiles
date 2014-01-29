FROM ubuntu:latest

# Activate "Universe" repository
RUN sed 's/main/universe multiverse/' /etc/apt/sources.list > /etc/apt/sources.list.d/ubuntu-universe.list
RUN apt-get update

# Setup peridition
RUN apt-get -y install perdition

# Expose ports
EXPOSE [143, 993, 110, 995, 4190]
