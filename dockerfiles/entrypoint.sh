#!/bin/sh
set -e

# Run planet on startup
python2 /srv/venus/source /srv/venus/planet.plone.org/planet.ini

# Start honcho
cd /srv && honcho start
