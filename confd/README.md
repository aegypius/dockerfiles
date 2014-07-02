# confd

[confd](https://github.com/kelseyhightower/confd) allows to manage local application
configuration files using templates and data from etcd.


## Standalone

You can use this base box standalone doing:

    docker pull aegypius/confd

You can run it using a configuration volume (see [configuration guide](https://github.com/kelseyhightower/confd/blob/master/docs/configuration-guide.md)):

    docker run -v /path/to/confd/config:/etc/confd -t aegypius/confd

Or directly from command line:

    docker run -t aegypius/confd confd -node http://etcd-server:4001

... where etcd-server is the IP or host of your etcd server


## As a base image

This image is based on ```ubuntu:latest``` image to use confd as a base image,
simply update the ```FROM``` line from your dockerfile :

    FROM aegypius/confd

You can find the trusted build image in [the docker registry](https://registry.hub.docker.com/u/aegypius/confd/)
