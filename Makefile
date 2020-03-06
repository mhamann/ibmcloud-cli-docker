# Variables
YELLOW = \033[1;33m
NC = \033[0m # No Color

# Build docker image
.PHONY: build
build:
	docker build -t ibmcloud:latest .
	@echo "${YELLOW}Docker image built successfully. Run via 'docker run -it ibmcloud'"

