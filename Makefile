.PHONY: all list build clean prepare

SRC:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
NAMESPACE?=quay.io/aegypius
BASHBREW=.bashbrew/bashbrew.sh
CONSTRAINT?=--constraint $(shell uname -m | sed 's/v\(6\|7\)l//')
LIBRARY?=--library $(SRC)/library
BASHBREW_OPTIONS?=
REPOSITORIES?=--all


all: build

clean:
	rm -fr .bashbrew

prepare:
	([ -d .bashbrew ] || mkdir .bashbrew) && wget -qO- https://github.com/docker-library/official-images/archive/master.tar.gz | tar xz --strip-components 2 -C .bashbrew official-images-master/bashbrew

list: prepare
	${BASHBREW} ${LIBRARY} ${CONSTRAINT} ${BASHBREW_OPTIONS} list --apply-constraints ${REPOSITORIES}

build: prepare
	${BASHBREW} ${LIBRARY} ${CONSTRAINT} ${BASHBREW_OPTIONS} build --namespace ${NAMESPACE} ${REPOSITORIES}

push: build
	${BASHBREW} ${LIBRARY} ${CONSTRAINT} ${BASHBREW_OPTIONS} push --namespace ${NAMESPACE} ${REPOSITORIES}
