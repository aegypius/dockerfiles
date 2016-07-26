.PHONY: all list build clean prepare

SRC:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
NAMESPACE?=quay.io/aegypius
BASHBREW=.bashbrew/bashbrew.sh
LIBRARY?=--library $(SRC)/library/$(shell uname -m | sed 's/v6l//')
BASHBREW_OPTIONS?=
REPOSITORIES?=--all


all: build

clean:
	rm -fr .bashbrew

prepare:
	([ -d .bashbrew ] || mkdir .bashbrew) && wget -qO- https://github.com/docker-library/official-images/archive/master.tar.gz | tar xz --strip-components 2 -C .bashbrew official-images-master/bashbrew

list: prepare
	${BASHBREW} ${LIBRARY} list ${BASHBREW_OPTIONS} --namespace ${NAMESPACE} ${REPOSITORIES}

build: prepare
	${BASHBREW} ${LIBRARY} build ${BASHBREW_OPTIONS} --namespace ${NAMESPACE} ${REPOSITORIES}

push: build
	${BASHBREW} ${LIBRARY} push ${BASHBREW_OPTIONS} --namespace ${NAMESPACE} ${REPOSITORIES}

