# Copyright (c) ECP/RIVERNET AIAS Development Team.
# Distributed under the terms of the Modified BSD License.

all: build-all tag-all push-all
.PHONY: all build-all tag-all push-all

# Use bash for inline if-statements in test target
SHELL:=bash

OWNER:=rivernet

ALL_IMAGES:=jupyter tensorflow tensorflow-serving

GIT_BRANCH:=$(shell git rev-parse --abbrev-ref HEAD)

build/%: 
	sudo docker build --rm --force-rm -t $(OWNER)/$(notdir $@):latest ./$(notdir $@)

build-all: $(foreach I,$(ALL_IMAGES),build/$(I) ) ## build all images

tag/%:
	sudo docker tag $(OWNER)/$(notdir $@):latest $(OWNER)/$(notdir $@):$(GIT_BRANCH)

tag-all: $(ALL_IMAGES:%=tag/%)

push/%: ## push the latest and HEAD git SHA tags for a stack to Docker Hub
	sudo docker push $(OWNER)/$(notdir $@):latest
	sudo docker push $(OWNER)/$(notdir $@):$(GIT_BRANCH)

push-all: $(ALL_IMAGES:%=push/%)

