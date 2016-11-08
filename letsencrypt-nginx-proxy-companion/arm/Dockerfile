FROM quay.io/aegypius/docker-gen:latest-arm 

WORKDIR /app

ENV DEBUG=false \
	DOCKER_LSE_COMPANION_VERSION=master \
	DOCKER_HOST=unix:///var/run/docker.sock

RUN apk update && \
  apk upgrade && \
  apk add bash curl ca-certificates procps jq tar && \
  curl -sL https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion/archive/$DOCKER_LSE_COMPANION_VERSION.tar.gz | tar -xvz --strip-components=1 -C /tmp && \
  apk del tar && \
  chmod +rx /tmp/install_simp_le.sh && \
  sync && \
  sed -i 's/py-pip/py2-pip/' /tmp/install_simp_le.sh && \
  /tmp/install_simp_le.sh && \
  mv /tmp/app/* /app && \
  rm -f /tmp/install_simp_le.sh && \
  rm -rf /tmp/app

ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh" ]
CMD ["/bin/bash", "/app/start.sh" ]
