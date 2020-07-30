PLATFORM ?= linux/arm,linux/amd64

aegypius/dockerize:
	docker buildx build -t $@ --platform=$(PLATFORM) . --push
