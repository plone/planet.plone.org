FROM alpine:3.3
MAINTAINER Plone Admins <admins@plone.org>

RUN apk update && apk add \
	ca-certificates \
	git \
	python \
	libxslt \
	&& adduser -g "Planet User" -D -s /bin/ash -h /opt/venus planet \
	&& rm -rf /var/cache/apk/*

WORKDIR /opt/venus
COPY planet planet
RUN chown -R planet:planet planet

USER planet

RUN git clone https://github.com/rubys/venus.git source


# Todo:
# change planet config to generate html and cache in /srv/planet and /srv/planet-cache
# add cron to run planet script every 10 minutes
# check entrypoint
# ensure we get logs if something goes wrong
