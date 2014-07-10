FROM aegypius/golang

# Install gitreceived
RUN go get -u github.com/flynn/gitreceived

VOLUME /cache /etc/gitreceived


# Setup scripts
ADD ./bin/authchecker /usr/local/bin/authchecker
ADD ./bin/receiver    /usr/local/bin/receiver 
RUN chmod +x /usr/local/bin/authchecker \
             /usr/local/bin/receiver


ENV GITRECEIVED_CACHE /cache

EXPOSE 22

CMD gitreceived -n=false -r=$GITRECEIVED_CACHE -k=/etc/gitreceived/private.pem /usr/local/bin/authchecker /usr/local/bin/receiver
