IMAGE_NAME=hgjt/emacs-texlive
IMAGE_TAG=latest

.PHONY: help
.DEFAULT_GOAL := help

build: ## build the image
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

publish: build  ## publish the image
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

run: ## run the image
	docker run --rm -it $(IMAGE_NAME):$(IMAGE_TAG)

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
