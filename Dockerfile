FROM testthedocs/ttd-caddy:latest
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "Plone Community" \
    description="Planet Plone"

ENV PIP_CACHE /root/.cache

RUN builddeps=' \
    git \
    ' \
    && apk --no-cache add \
	ca-certificates \
	$builddeps \
        su-exec \
	python \
        dcron \
	libxslt \
    && adduser -g "Planet User" -D -s /bin/ash -h /srv/venus planet \
    && apk del --purge $builddeps \
    && rm -rf $PIP_CACHE

WORKDIR /srv/venus
COPY planet planet
RUN chown -R planet:planet planet

USER planet

RUN git clone https://github.com/rubys/venus.git source


# Todo:
# Change planet config to generate html and cache in /srv/planet and /srv/planet-cache
# Check cache of dockerfile
# Add cron to run planet script every 10 minutes
# Check entrypoint

