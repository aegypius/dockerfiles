FROM ubuntu:latest

ENV LOCALE C
ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y build-essential
# Setup Ruby 2.0
RUN add-apt-repository ppa:brightbox/ruby-ng-experimental
RUN apt-get update
RUN apt-get install -y ruby2.0 ruby2.0-dev

RUN gem install --no-ri --no-rdoc bson_ext
RUN gem install --no-ri --no-rdoc genghisapp
ADD start /start
RUN chmod +x /start

EXPOSE 5000

ENTRYPOINT ["/start"]
