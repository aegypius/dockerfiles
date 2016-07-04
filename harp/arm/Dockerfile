FROM hypriot/rpi-node:5

EXPOSE 9000
ENV HARP_VERSION=0.20.3
RUN npm install -g harp@${HARP_VERSION}

WORKDIR /app
VOLUME /app

CMD ["harp", "server", "/app"]
