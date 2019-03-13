ARG GRAV_VERSION

FROM composer AS setup-step
RUN composer create-project --ignore-platform-reqs getgrav/grav /app $GRAV_VERSION

FROM php:latest
LABEL maintainer "Nicolas LAURENT <docker@aegypius.com>"
RUN apt-get update && apt-get install -y \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        zlib1g-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd zip opcache \
    && pecl install apcu \
    && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini
COPY --from=setup-step --chown=1000 /app /app
WORKDIR /app
VOLUME /app/backup /app/logs /app/user
USER 1000
CMD ./bin/grav
