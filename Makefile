.PHONY: all list build clean prepare

SRC:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
NAMESPACE?=quay.io/aegypius
BASHBREW=.bashbrew/bashbrew.sh
BASHBREW_OPTIONS?=--library $(SRC)/library/$(shell uname -m | sed 's/(v6l)//')
REPOSITORIES?=--all


all: build

clean:
	rm -fr .bashbrew

prepare:
	([ -d .bashbrew ] || mkdir .bashbrew) && wget -qO- https://github.com/docker-library/official-images/archive/master.tar.gz | tar xz --strip-components 2 -C .bashbrew official-images-master/bashbrew

list: prepare
	${BASHBREW} list ${BASHBREW_OPTIONS} --namespaces=${NAMESPACE} ${REPOSITORIES}

build: prepare
	${BASHBREW} build ${BASHBREW_OPTIONS} --namespaces=${NAMESPACE} ${REPOSITORIES}

push: build
	${BASHBREW} push ${BASHBREW_OPTIONS} --namespaces=${NAMESPACE} ${REPOSITORIES}

