FROM mcr.microsoft.com/devcontainers/base:0-alpine-3.16

# Avoiding OpenSSH >8.8 for compatibility for now: https://github.com/microsoft/vscode-remote-release/issues/7482
RUN echo "@old https://dl-cdn.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories

RUN apk add --no-cache \
	git-lfs \
	nodejs \
	python3 \
	npm \
	make \
	g++ \
	docker-cli \
	docker-cli-buildx \
	docker-cli-compose \
	openssh-client-default@old \
	;

RUN cd && npm i node-pty

COPY .vscode-remote-containers /root/.vscode-remote-containers
