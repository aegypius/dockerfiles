#
# Nginx Dockerfile
#
# https://github.com/aegypius/docker-nginx
#

# Pull base image.
FROM aegypius/confd

# Install requirements
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update -q && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
