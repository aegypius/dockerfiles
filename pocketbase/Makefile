PLATFORM ?= linux/arm,linux/amd64
POCKETBASE_VERSION ?= 0.7.9

aegypius/pocketbase:
	docker buildx build --build-arg POCKETBASE_VERSION=$(POCKETBASE_VERSION) --tag $@ --platform=$(PLATFORM) . --push
