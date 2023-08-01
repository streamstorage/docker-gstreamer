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
    --build-arg GST_PLUGINS_BASE_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git \
    --build-arg GST_PLUGINS_BASE_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_PLUGINS_BAD_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git \
    --build-arg GST_PLUGINS_BAD_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_PLUGINS_GOOD_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git \
    --build-arg GST_PLUGINS_GOOD_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_PLUGINS_UGLY_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly.git \
    --build-arg GST_PLUGINS_UGLY_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_LIBAV_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-libav.git \
    --build-arg GST_LIBAV_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GST_RTSP_SERVER_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server.git \
    --build-arg GST_RTSP_SERVER_CHECKOUT=${GSTREAMER_CHECKOUT} \
    --build-arg GSTREAMER_VAAPI_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi.git \
    --build-arg GSTREAMER_VAAPI_CHECKOUT==${GSTREAMER_CHECKOUT} \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --target prod \
    -f Dockerfile \
    ${ROOT_DIR}
