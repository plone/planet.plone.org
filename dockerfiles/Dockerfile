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
	python2 \
        dcron \
	libxslt \
        bash \
        py-pip \
        vim \
    && mkdir -p /srv/venus \
    && adduser -g "Planet User" -D -s /bin/bash -h /srv/venus planet \
    && git clone https://github.com/rubys/venus.git /srv/venus/source \
    && chown -R planet:planet /srv/venus \
    && pip2 install --upgrade pip \
    && pip2 install honcho \
    && apk del --purge $builddeps \
    && rm -rf $PIP_CACHE

COPY dockerfiles/Caddyfile /etc/Caddyfile
COPY dockerfiles/crontab.tmp /etc/cron.d/planet.cron
COPY dockerfiles/Procfile /srv/Procfile
RUN crontab /etc/cron.d/planet.cron

WORKDIR /srv/venus
#COPY dockerfiles/Procfile /Procfile
COPY planet planet.plone.org
RUN chown -R planet:planet planet.plone.org

EXPOSE 2015:2015
#USER planet
ENTRYPOINT ["/bin/bash"]

# Todo:
# Change planet config to generate html and cache in /srv/planet and /srv/planet-cache
# Add cron to run planet script every hour
# Check entrypoint
