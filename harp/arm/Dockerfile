FROM hypriot/rpi-node

EXPOSE 9000

RUN npm install -g harp

WORKDIR /app
VOLUME /app

CMD ["harp", "server", "/app"]
