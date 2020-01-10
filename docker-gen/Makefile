PLATFORM := linux/arm,linux/amd64

aegypius/docker-gen:
	docker buildx build -t $@ --platform=$(PLATFORM) . --push
