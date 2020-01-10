MAKEFILES = $(shell find . -maxdepth 2 -type f -name Makefile)
SUBDIRS   = $(filter-out ./,$(dir $(MAKEFILES)))

PLATFORM := linux/arm,linux/amd64
BUILDX_INSTALLED    := $(shell docker buildx 2> /dev/null)


build: install
	for dir in $(SUBDIRS); do \
		make -C $$dir; \
	done

install:
ifndef BUILDX_INSTALLED
	# Setup buildx
	DOCKER_CLI_EXPERIMENTAL=enabled DOCKER_BUILDKIT=1 docker build --platform=local -o . git://github.com/docker/buildx
	mkdir -p ~/.docker/cli-plugins && mv buildx ~/.docker/cli-plugins/docker-buildx

	# Setup binfmt
	docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d

	# Switch to the multi-arch builder
	docker buildx create --use --append --node multi-arch0 --name multi-arch
endif
