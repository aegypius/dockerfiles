# aegypius/gitolite

Based on [elsdoerfer/gitolite](https://registry.hub.docker.com/u/elsdoerfer/gitolite)
and [betacz/gitolite](https://registry.hub.docker.com/u/betacz/gitolite) Dockerfiles.

**This is a work-in-progress image**, you may not want to run it in production.

## Examples

New installation:

    docker run -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" aegypius/gitolite

Use an existing gitolite installation:

    docker run -v /var/vcroot/git:/home/git/repositories aegypius/gitolite

## Environment variables:

- ```SSH_KEY``` - SSH public key for initial access to the gitolite-admin
  repository.

- ```TRUST_HOSTS``` - Hostnames (only a single one is supported currently)
  to add to known_hosts, i.e. *github.com*.

## Volumes

- ```/home/git/repositories``` - The actual git repositories will be stored here.
