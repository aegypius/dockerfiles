# Nginx

This repository contains Dockerfile for nginx with confd support

Build process is based on [dockerfile/nginx](https://registry.hub.docker.com/u/dockerfile/nginx/) 

## Dependencies

- [aegypius/confd](https://registry.hub.docker.com/u/aegypius/confd/)

## Usage

    docker run -d -p 80:80 aegypius/nginx

## Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <log-dir>:/var/log/nginx aegypius/nginx

After few seconds, open `http://<host>` to see the welcome page.

