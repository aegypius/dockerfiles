FROM sdhibit/rpi-raspbian:latest
LABEL maintainer "Nicolas LAURENT <docker@aegypius.com>"

WORKDIR /builder

CMD ["/builder/build.sh", "-b", ${BUILD_ARCH:-all}, "-v", ${BUILD_VERSION:-2.0}, "-d", ${BUILD_DEVICE:-all}, ${BUILD_EXTRA} ]

RUN apt-get update \
  && apt-get install -y --no-install-recommends squashfs-tools kpartx multistrap qemu-user-static samba debootstrap parted dosfstools qemu binfmt-support git ca-certificates
RUN git clone https://github.com/volumio/build /builder

