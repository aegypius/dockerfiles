FROM hypriot/rpi-node:latest

EXPOSE 3000
WORKDIR /data
VOLUME /data

RUN npm install -g statik

CMD ["statik", "--verbose", "--port=3000", "/data"]
