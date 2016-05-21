#!/bin/bash
REL=${REL:-edge}
MIRROR=${MIRROR:-http://nl.alpinelinux.org/alpine}
SAVE=${SAVE:-0}
REPO=$MIRROR/$REL
REPOSITORIES="main community"
ARCH=armhf
#ARCH=$(uname -m)
TAG=quay.io/aegypius/$ARCH-alpine

[ $(id -u) -eq 0 ] || {
	printf >&2 '%s requires root\n' "$0" 
	exit 1
}

indent() {
	while read line; do 
		if [[ "$line" == --* ]]; then
			echo $'[\e[1G'$line;
		else
			echo $'[\e[1G    '$line;
	  fi
	done
}

usage() {
  printf >&2 '%s: [-r release] [-m mirror] [-s]\n' "$0"
  exit 1
}

tmp() {
	echo Creating temp dir
  TMP=$(mktemp -d /tmp/alpine-docker-XXXXXXXXXX)
  ROOTFS=$(mktemp -d /tmp/alpine-docker-rootfs-XXXXXXXXXX)
  trap "rm -rf $TMP $ROOTFS" EXIT TERM INT
}

apkv() {
  curl -s $REPO/main/$ARCH/APKINDEX.tar.gz | tar -Oxz | \
    grep '^P:apk-tools-static$' -a -A1 | tail -n1 | cut -d: -f2
}

getapk() {
	local version=$(apkv)
	echo Getting APK tools $version
  curl -s $REPO/main/$ARCH/apk-tools-static-${version}.apk |
    tar -xz -C $TMP sbin/apk.static 2>&1 | indent
}

mkbase() {
	echo Building base
  $TMP/sbin/apk.static --repository $REPO/main --update-cache --allow-untrusted \
    --root $ROOTFS --initdb add alpine-base | indent
}

conf() {
	echo Configuration
	for repo in $REPOSITORIES; do
		echo Adding repository $repo | indent
  	printf '%s\n' $REPO/$repo > $ROOTFS/etc/apk/repositories
	done
	$TMP/sbin/apk.static --update-cache --allow-untrusted \
		--root $ROOTFS upgrade | indent && \
		rm -fr $ROOTFS/var/cache/apk/* 
}

pack() {
  local id
	echo Packing
  id=$(tar --numeric-owner -C $ROOTFS -c . | docker import - $TAG:$REL)
	docker tag $id $TAG:latest
}

save() {
  [ $SAVE -eq 1 ] || return
	echo Saving
  tar --numeric-owner -C $ROOTFS -cf rootfs.tar .
}


main() {
	tmp && getapk
	mkbase
	conf
	pack
	save
}

while getopts "hr:m:s" opt; do
  case $opt in
    r)
      REL=$OPTARG
      ;;
    m)
      MIRROR=$OPTARG
      ;;
    s)
      SAVE=1
      ;;
    *)
      usage
      ;;
  esac
done

main 
