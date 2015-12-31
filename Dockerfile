FROM alpine:3.3
MAINTAINER Plone Admins <admins@plone.org>

RUN apk update && apk add \
	ca-certificates \
	git \
	python \
	libxslt \
	&& adduser -g "Planet User" -D -s /bin/ash -h /opt/venus planet \
	&& rm -rf /var/cache/apk/*

USER planet
WORKDIR /opt/venus

COPY planet /opt/venus/planet

RUN git clone https://github.com/rubys/venus.git source


# Todo:
# change planet config to generate html and cache in /srv/planet and /srv/lanet-cache
# add cron to run planet script every 10 minutes
# check entrypoint
# ensure we get logs if something goes wrong
