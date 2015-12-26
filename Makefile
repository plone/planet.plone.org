SHELL := /bin/bash
VENUS=/srv/venus

# We like color
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

.PHONY: planet

planet:
	@echo "${green}Fetching posts and updating planet${reset}"
	vagrant ssh -c 'cd $(VENUS) && python source/planet.py planet.plone.org/planet.ini --verbose'


