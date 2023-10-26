#!/bin/bash
set -ex

ROOT_DIR=$(readlink -f $(dirname $0))
GSTREAMER_REPOSITORY=${GSTREAMER_REPOSITORY:-https://gitlab.freedesktop.org/gstreamer/gstreamer.git}
GSTREAMER_CHECKOUT=${GSTREAMER_CHECKOUT:-1.22.5}
GST_PLUGINS_RS_REPOSITORY=${GST_PLUGINS_RS_REPOSITORY:-https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git}
GST_PLUGINS_RS_CHECKOUT=${GST_PLUGINS_RS_CHECKOUT:-0.11.1}
UBUNTU_VERSION=${UBUNTU_VERSION:-22.04}
BASE_IMAGE=ubuntu:${UBUNTU_VERSION}

# Make sure to always have fresh base image
docker pull ${BASE_IMAGE}

if [[ "${BUILD_DEV}" == "1" ]]; then
DOCKER_BUILDKIT=1 docker build \
    -t streamstorage/gstreamer:${UBUNTU_VERSION}-${GSTREAMER_CHECKOUT}-${GST_PLUGINS_RS_CHECKOUT}-dev \
    --build-arg GSTREAMER_REPOSITORY=${GSTREAMER_REPOSITORY} \
    --build-arg GSTREAMER_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_PLUGINS_RS_REPOSITORY=${GST_PLUGINS_RS_REPOSITORY} \
    --build-arg GST_PLUGINS_RS_CHECKOUT=${GST_PLUGINS_RS_CHECKOUT} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --target dev \
    -f Dockerfile \
    ${ROOT_DIR}
fi

if [[ "${BUILD_DEV_WITH_SOURCE}" == "1" ]]; then
DOCKER_BUILDKIT=1 docker build \
    -t streamstorage/gstreamer:${UBUNTU_VERSION}-${GSTREAMER_CHECKOUT}-${GST_PLUGINS_RS_CHECKOUT}-dev-with-source \
    --build-arg GSTREAMER_REPOSITORY=${GSTREAMER_REPOSITORY} \
    --build-arg GSTREAMER_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_PLUGINS_RS_REPOSITORY=${GST_PLUGINS_RS_REPOSITORY} \
    --build-arg GST_PLUGINS_RS_CHECKOUT=${GST_PLUGINS_RS_CHECKOUT} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --target dev-with-source \
    -f Dockerfile \
    ${ROOT_DIR}
fi

if [[ "${BUILD_PROD}" == "1" ]]; then
DOCKER_BUILDKIT=1 docker build \
    -t streamstorage/gstreamer:${UBUNTU_VERSION}-${GSTREAMER_CHECKOUT}-${GST_PLUGINS_RS_CHECKOUT}-prod \
    --build-arg GSTREAMER_REPOSITORY=${GSTREAMER_REPOSITORY} \
    --build-arg GSTREAMER_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_PLUGINS_RS_REPOSITORY=${GST_PLUGINS_RS_REPOSITORY} \
    --build-arg GST_PLUGINS_RS_CHECKOUT=${GST_PLUGINS_RS_CHECKOUT} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --target prod \
    -f Dockerfile \
    ${ROOT_DIR}
fi

if [[ "${BUILD_PROD_DBG}" == "1" ]]; then
DOCKER_BUILDKIT=1 docker build \
    -t streamstorage/gstreamer:${UBUNTU_VERSION}-${GSTREAMER_CHECKOUT}-${GST_PLUGINS_RS_CHECKOUT}-prod-dbg \
    --build-arg GSTREAMER_REPOSITORY=${GSTREAMER_REPOSITORY} \
    --build-arg GSTREAMER_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_PLUGINS_RS_REPOSITORY=${GST_PLUGINS_RS_REPOSITORY} \
    --build-arg GST_PLUGINS_RS_CHECKOUT=${GST_PLUGINS_RS_CHECKOUT} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --target prod-dbg \
    -f Dockerfile \
    ${ROOT_DIR}
fi
