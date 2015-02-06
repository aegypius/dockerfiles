FROM dockerfile/python:latest
MAINTAINER Nicolas LAURENT <docker@aegypius.com>

WORKDIR /app

ADD http://distfiles.gentoo.org/snapshots/portage-latest.tar.xz /app/portage-latest.tar.xz
ADD http://distfiles.gentoo.org/distfiles/portage-2.2.14.tar.bz2 /app/portage.tar.bz2

RUN mkdir -p /etc/portage /usr/portage/distfiles \
  && tar xJf portage-latest.tar.xz -C /usr/ \
  && rm portage-latest.tar.xz \

  && tar xjf portage.tar.bz2 \
  && rm portage.tar.bz2 \

  && mv portage* portage \
  && cp portage/cnf/repos.conf /etc/portage/ \

  && rsync --recursive --links --safe-links --perms --times --omit-dir-times \
    --compress --force --whole-file --delete --stats --human-readable \
    --timeout=180 --exclude=/distfiles --checksum --quiet \
    rsync://rsync.gentoo.org/gentoo-portage /usr/portage \
  && ln -s /usr/portage/profiles/default/linux/amd64/13.0/developer/ /etc/portage/make.profile \

  && apt-get update -qy \
  && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y libxml2-utils \
  && rm -rf /var/lib/apt/lists/* \

  && echo "portage:x:250:250:portage:/var/tmp/portage:/bin/false"  > /etc/passwd \
  && echo "portage::250:portage" > /etc/group

WORKDIR /overlay

ENTRYPOINT ["/app/portage/bin/repoman"]
CMD ["full"]
