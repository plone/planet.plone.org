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
    && mkdir -p /srv/venus \
    && git clone https://github.com/rubys/venus.git /srv/venus/source \
    && pip2 install --upgrade pip \
    && pip2 install honcho \
    && apk del --purge $builddeps \
    && rm -rf $PIP_CACHE

COPY dockerfiles/Caddyfile /etc/Caddyfile
COPY dockerfiles/crontab.tmp /etc/cron.d/planet.cron
COPY dockerfiles/Procfile /srv/Procfile
COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN crontab /etc/cron.d/planet.cron

WORKDIR /srv/venus
COPY planet planet.plone.org

EXPOSE 2015:2015
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#ENTRYPOINT ["/bin/bash"]

# Todo:
# Cleanup
# Change setup to run as user
