SHELL := /bin/bash
VENUS=/srv/venus

# We like color
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

# Name
NAME = plone/panet
# Get version form VERSION
VERSION := $(shell cat VERSION)
DOCKER := $(bash docker)


.PHONY: help
help: ## This help message
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "${yellow}planet${reset}:	Script to fetch and update the planet"

.PHONY: planet
planet: ## Update Planet in Vagrant
	@echo "${green}Fetching posts and updating planet${reset}"
	vagrant ssh -c 'cd $(VENUS) && python source/planet.py planet.plone.org/planet.ini --verbose'

.PHONY: clean
clean: ## Removing planet-cache and planet HTML in vagrant
	vagrant ssh -c 'cd $(VENUS)/planet.plone.org && rm -rf planet-cache && rm -rf public_html'

.PHONY: build
build: ## Builds docker image
	docker build --no-cache=true -t $(NAME):$(VERSION) --rm -f dockerfiles/Dockerfile .

.PHONY: push
push: ## Push container image do docker hub
	docker push $(NAME):$(VERSION)
	docker push $(NAME):latest

.PHONY: tag_latest
tag_latest: ## Tag container image with version and latest tag
	docker tag $(NAME):$(VERSION) $(NAME):latest

.PHONY: last_built_date
last_built_date: ## Show last build date
	docker inspect -f '{{ .Created }}' $(NAME):$(VERSION)

.PHONY: release
release: check_release_version build tag_latest push ## Combine steps to make release

.PHONY: check_release_version
check_release_version:
	@if docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(RED)$(NAME) version $(VERSION) is already build !$(RESET)"; false; fi

