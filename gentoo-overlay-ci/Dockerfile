FROM aegypius/gentoo-amd64

# Update portage with the latest snapshot
ADD http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2 /portage-latest.tar.bz2
WORKDIR /usr
RUN tar -xpjf /portage-latest.tar.bz2
RUN rm /portage-latest.tar.bz2
RUN eselect profile set 1
RUN emerge --regen --quiet

# Adds /overlay to PORTDIR_OVERLAY
VOLUME /overlay
WORKDIR /overlay
RUN echo 'PORTDIR_OVERLAY="/overlay"' >> /etc/portage/make.conf
