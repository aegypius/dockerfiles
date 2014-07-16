FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Install requirements
RUN apt-get update -qy && \
    apt-get install --no-install-recommends -qy \
       git openssh-server

# Creates a git user
RUN useradd --system --create-home --shell /bin/sh git
USER git 
ENV HOME /home/git
WORKDIR /home/git

# Install Gitolite
RUN mkdir -p bin
RUN git clone git://github.com/sitaramc/gitolite
RUN gitolite/install -ln 
RUN mkdir repositories 

# Setup Gitolite volume
VOLUME /home/git/repositories

# Final steps 
USER root
RUN mkdir /var/run/sshd

# prevent the perl warning
RUN sed  -i 's/AcceptEnv/# \0/' /etc/ssh/sshd_config

# fix fatal: protocol error: bad line length character: Welc
RUN sed -i 's/session\s\+required\s\+pam_loginuid.so/# \0/' /etc/pam.d/sshd

EXPOSE 22

ADD ./bin/gitolited /bin/gitolited
RUN chmod +x /bin/gitolited
CMD /bin/gitolited

