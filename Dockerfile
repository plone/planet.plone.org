FROM alpine:3.5
LABEL maintainer "Sven <sven@testthedocs.org>"

ENV PIP_CACHE /root/.cache

RUN apk --no-cache add \
	ca-certificates \
	git \
	python \
	libxslt \
	&& adduser -g "Planet User" -D -s /bin/ash -h /opt/venus planet \
	&& rm -rf $PIP_CACHE

WORKDIR /opt/venus
COPY planet planet
RUN chown -R planet:planet planet

USER planet

RUN git clone https://github.com/rubys/venus.git source


# Todo:
# Add caddy as webserver
# Change planet config to generate html and cache in /srv/planet and /srv/planet-cache
# Check cache of dockerfile
# Add cron to run planet script every 10 minutes
# Check entrypoint

