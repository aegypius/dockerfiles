FROM google/debian:wheezy

RUN apt-get update -qy && \
    apt-get install --no-install-recommends -qy php5 php5-cli php5-intl php-apc


ENV PHP_DATE_TIMEZONE Europe/Paris

# Update Configuration
RUN echo /etc/php5/cli/php.ini /etc/php5/apache2/php.ini | xargs sed -i "s#;date\.timezone\s*=.*#date.timezone = $PHP_DATE_TIMEZONE#g" 

