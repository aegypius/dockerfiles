PLATFORM := linux/arm,linux/amd64

aegypius/gitea:
	docker buildx build -t $@ --platform=$(PLATFORM) https://github.com/go-gitea/gitea.git --push --build-arg TAGS="bindata sqlite sqlite_unlock_notify"
