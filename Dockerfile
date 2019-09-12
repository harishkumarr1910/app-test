FROM alpine:3.8

# VERSIONS
ENV ALPINE_VERSION=3.8 

FROM python:3
RUN pip install --upgrade pip \
	&& pip install --upgrade pip setuptools wheel \
        && pip install utils \
        && pip install virtualenv \
        && pip install apache-beam 
FROM maven
RUN maven -v
