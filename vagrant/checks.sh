#!/bin/bash

PROGNAME=$(basename $0)

# Colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function check_vagrant_plugins()
{
# Check if all needed vagrant plugins all installed #we do not use vbox-guest atm
PLUGINS='vagrant-hostsupdater vagrant-cachier'
for plugin in $PLUGINS; do
    if vagrant plugin list | grep -q "$plugin"
        then
            echo "${green} $plugin is installed, looking for updates ${reset}"
            vagrant plugin update $plugin
        else
            echo "${green} Installing $plugin ${reset}"
            vagrant plugin install $plugin
        fi
done
}

# error function
function error_exit ()
{

#   ----------------------------------------------------------------
#   Function for exit due to fatal program error
#       Accepts 1 argument:
#           string containing descriptive error message
#   ----------------------------------------------------------------


    echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
    exit 1
}

# Example call of the error_exit function.  Note the inclusion
# of the LINENO environment variable.  It contains the current
# line number.


check_vagrant_plugins

