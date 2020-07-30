MAKEFILES = $(shell find . -maxdepth 2 -type f -name Makefile)
SUBDIRS   = $(filter-out ./,$(dir $(MAKEFILES)))

PLATFORM ?= linux/arm,linux/amd64
BUILDX_INSTALLED    := $(shell docker buildx 2> /dev/null)

.PHONY: all install $(SUBDIRS)

all: $(SUBDIRS)

$(SUBDIRS): install
	$(MAKE) -C $@

install:
ifndef BUILDX_INSTALLED
	# Setup buildx
	DOCKER_CLI_EXPERIMENTAL=enabled DOCKER_BUILDKIT=1 docker build --platform=local -o . git://github.com/docker/buildx
	mkdir -p ~/.docker/cli-plugins && mv buildx ~/.docker/cli-plugins/docker-buildx
endif

	# Setup qemu-user-static
	docker run --rm --privileged multiarch/qemu-user-static --reset -p yes 2>&1 > /dev/null

	# Switch to the multi-arch builder
	docker buildx create --use --append --node multi-arch0 --name multi-arch
	docker buildx inspect --bootstrap
