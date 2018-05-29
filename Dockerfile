FROM node:stretch

ARG VERSION=0.1
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="node-packaging" \
      org.label-schema.description="a headless packaging environment for node applications" \
      org.label-schema.url="https://github.com/turtletramp/node-packaging" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.vcs-url="https://github.com/turtletramp/node-packaging.git" \
      org.label-schema.version="$VERSION" \
      org.label-schema.schema-version="1.0"

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
        ca-certificates \
        git \
        locales \
        p7zip \
        p7zip-full \
        unzip \
        zip \
    && apt-get clean

RUN locale-gen en_US.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN npm i -g npm
RUN npm i -g npm-license-crawler

RUN npm -v
RUN node -v

