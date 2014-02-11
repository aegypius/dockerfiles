DOCKER_TAG=aegypius/$(shell realpath . | sed -r 's@^.*/@@')

.PHONY: all build bash

all: build

build:
	docker build -t $(DOCKER_TAG) .

run: build 
	docker run --link mongo:db -d -p 5000:5000 --link mongo:db $(DOCKER_TAG)

bash: build 
	docker run --link mongo:db -i -t --entrypoint='/bin/bash' $(DOCKER_TAG)

