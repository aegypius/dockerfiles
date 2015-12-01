FROM armbuild/alpine

EXPOSE 5050

RUN apk add --update git python && \
  rm -rf /var/cache/apk/* && \
  mkdir /app && \
  git clone https://github.com/RuudBurger/CouchPotatoServer.git /app

WORKDIR /app

CMD ["python", "/app/CouchPotato.py"]
