FROM google/debian:wheezy

RUN apt-get update -qy && \
    apt-get install --no-install-recommends -qy \
      php5-cli php5-intl php-apc php5-curl php5-mcrypt php5-mysql

ENV PHP_DATE_TIMEZONE Europe/Paris
ENV PHP_SHORT_OPEN_TAG Off

# Update Configuration
RUN echo /etc/php5/cli/php.ini | \
    xargs sed -i -e \
      "s#;?date\.timezone\s*=.*#date.timezone = $PHP_DATE_TIMEZONE#g" -e \
      "s#;?short_open_tag\s*=.*#short_open_tag = $PHP_SHORT_OPEN_TAG#g" -e \
      "s#;?magic_quotes_gpc\s*=.*#magic_quotes_gpc = Off#g" -e \
      "s#;?session\.auto_start\s*=.*#session.autostart = Off#g"

