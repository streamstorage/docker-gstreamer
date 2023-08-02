#!/bin/bash
set -ex

ROOT_DIR=$(readlink -f $(dirname $0))
GSTREAMER_CHECKOUT=${GSTREAMER_CHECKOUT:-1.22.5}
UBUNTU_VERSION=${UBUNTU_VERSION:-22.04}
BASE_IMAGE=ubuntu:${UBUNTU_VERSION}

# Make sure to always have fresh base image
docker pull ${BASE_IMAGE}

DOCKER_BUILDKIT=1 docker build \
    -t streamstorage/gstreamer:${UBUNTU_VERSION}-${GSTREAMER_CHECKOUT}-prod \
    --build-arg GSTREAMER_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gstreamer.git \
    --build-arg GSTREAMER_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg HTTP_PROXY="http://172.17.0.1:19000" \
    --build-arg HTTPS_PROXY="http://172.17.0.1:19000" \
    --target prod \
    -f Dockerfile \
    ${ROOT_DIR}
