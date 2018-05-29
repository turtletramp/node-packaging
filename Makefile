# This should match the FROM line in Dockerfile:

# These override the ARG lines in Dockerfile:
VERSION:= 0.1
VCS_REF := $(shell git rev-parse --short HEAD)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

# If you need to change anything below, please raise an issue:
TAG := node-packaging:stretch-1

.PHONY: image

image: $(GCCF)
	docker build --build-arg "VERSION=$(VERSION)" --build-arg "VCS_REF=$(VCS_REF)" --build-arg "BUILD_DATE=$(BUILD_DATE)" --tag "$(TAG)" .
