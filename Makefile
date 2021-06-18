.PHONY: build run clean
GIT_HASH := $(shell git rev-parse --short HEAD)
IMAGE_NAME := xshyamx/git-hash

run: build
	docker run --rm ${IMAGE_NAME}

build:
	docker build \
	  --build-arg GIT_VERSION=${GIT_HASH} \
	  -t ${IMAGE_NAME} .

clean:
	docker rmi ${IMAGE_NAME}
