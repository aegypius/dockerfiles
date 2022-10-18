FROM alpine:3.16 AS download
ARG POCKETBASE_VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

ADD https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_${TARGETOS}_${TARGETARCH}${TARGETVARIANT}.zip /pocketbase.zip
RUN unzip /pocketbase.zip \
	&& chmod a+x /pocketbase

FROM alpine:3.16
LABEL POCKETBASE_VERSION=$POCKETBASE_VERSION

ARG POCKETBASE_VERSION
ENV PB_HOST=0.0.0.0
ENV PB_PORT=8090
ENV PB_DIR=/data
ENV PB_ENCRYPTION_KEY=this-is-a-secret

COPY --from=download /pocketbase /usr/local/bin/pocketbase
CMD /usr/local/bin/pocketbase serve \
	--http "${PB_HOST}:${PB_PORT}" \
	--dir "${PB_DIR}" \
	--encryptionEnv ${PB_ENCRYPTION_KEY}
