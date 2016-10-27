BOX_VERSION ?= $(shell cat VERSION)
BOX_PREFIX ?= django
BOX_PATH := boxes/$(BOX_PREFIX)-$(BOX_VERSION).box
S3_PREFIX ?= s3://transcode-vagrantcloud/virtualbox
S3_PATH := $(S3_PREFIX)/$(BOX_PREFIX)-$(BOX_VERSION).box
VAGRANT_ID_PATH := .vagrant/machines/default/virtualbox/id
VENV := .venv
AWSCLI := $(VENV)/bin/aws
PIP_INSTALL := $(VENV)/bin/python3 -m pip install

.DEFAULT_GOAL := help

.PHONY: help all build clean clean-venv package upload

help:
	@grep -E '^[\.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: clean build package upload ## Build, package and upload the re-usable box

$(VAGRANT_ID_PATH):
	vagrant up
	cat cleanup.log

build: $(VAGRANT_ID_PATH) ## Create, configure and provision the Vagrant box

clean: ## Destroy the Vagrant box and delete the re-usable box
	vagrant destroy -f
	rm -f $(BOX_PATH)

clean-venv: ## Delete the Python virtual environment
	rm -f $(VENV)

$(BOX_PATH):
	vagrant package --vagrantfile Vagrantfile.package --output $(BOX_PATH)

package: $(BOX_PATH) ## Package the currently running VirtualBox environment into a re-usable box

$(VENV):
	python3 -m venv $(VENV)
	$(PIP_INSTALL) --upgrade pip setuptools wheel

$(AWSCLI): $(VENV)
	$(PIP_INSTALL) awscli

upload: $(AWSCLI) ## Upload the re-usable box to a Amazon S3 bucket
	$(AWSCLI) s3 cp $(BOX_PATH) $(S3_PATH)
	$(AWSCLI) s3 ls $(S3_PREFIX)/
