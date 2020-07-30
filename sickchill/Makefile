PLATFORM ?= linux/arm,linux/amd64
aegypius/sickchill:
	docker buildx build -t $@ --platform=$(PLATFORM) . --push
