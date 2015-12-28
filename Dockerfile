FROM alpine:3.3
MAINTAINER Plone Admins <admins@plone.org>

RUN apk update && apk add \
	ca-certificates \
	git \
	python \
	libxslt \
	&& rm -rf /var/cache/apk/*
