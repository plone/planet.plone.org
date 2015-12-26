SHELL := /bin/bash
VENUS=/srv/venus

# We like color
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

.PHONY: planet

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "${yellow}planet${reset}:	Script to fetch and update the planet"

planet:
	@echo "${green}Fetching posts and updating planet${reset}"
	vagrant ssh -c 'cd $(VENUS) && python source/planet.py planet.plone.org/planet.ini --verbose'

clean:
	vagrant ssh -c 'cd $(VENUS)/planet.plone.org && rm -rf planet-cache && rm -rf public_html'
