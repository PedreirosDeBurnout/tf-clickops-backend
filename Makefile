# Variables
DOCKER_IMAGE := $(shell basename $(CURDIR))
DOCKER_BUILD_OPTIONS := --rm

# Targets
.PHONY: all build run clean help

all: help

build: ## Build the Docker image
	docker build $(DOCKER_BUILD_OPTIONS) -t $(DOCKER_IMAGE) .

run: ## Run the Docker container
	docker run $(DOCKER_IMAGE)

clean: ## Remove the Docker image
	docker rmi -f $(DOCKER_IMAGE)

help: ## Display this help message
	@echo "Available targets:"
	@awk '/^[a-zA-Z_-]+:.*?## .*$$/ {printf "%-20s %s\n", $$1, $$3}' $(MAKEFILE_LIST)
