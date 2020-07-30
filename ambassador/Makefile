PLATFORM ?= linux/arm,linux/amd64

aegypius/ambassador:
	docker buildx build -t $@ --platform=$(PLATFORM) . --push
