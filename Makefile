SHELL := /bin/bash
VENV=.

# We like color
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


.PHONY: boot help check planet

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "boot:   Booting Vagrant Box"
	@echo "check:  Checking vagrant plugins"
	@echo "help:   Showing this help"
	@echo "planet: Run plugin checks and booting vagrant"

check:
	@echo -e "${green}>>> Checking vagrant plugins...${reset}"
	./vagrant_checks.sh

boot:
	@echo -e "${green}>>> Starting Vagrant Box...${reset}"
	vagrant up

planet: check boot


