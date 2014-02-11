DOCKER_TAG=aegypius/$(shell realpath . | sed -r 's@^.*/@@')

.PHONY: all build bash

all: build

build:
	docker build -t $(DOCKER_TAG) .

run: build
	docker run $(DOCKER_TAG)

bash: build
	docker run -i -t -entrypoint='/bin/bash' $(DOCKER_TAG)
