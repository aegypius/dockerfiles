FROM ubuntu:latest

# Install dependencies
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy nodejs rubygems build-essential curl git

# Let's install go just like Docker (from source).
RUN curl -Ls https://storage.googleapis.com/golang/go1.2.2.src.tar.gz | tar -v -C /usr/local -xz
RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1
ENV PATH /usr/local/go/bin:$PATH

# Install gitreceived

# Install controller ui

# Setup Foreman
RUN gem install foreman
