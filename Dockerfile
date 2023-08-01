ARG BASE_IMAGE

FROM ${BASE_IMAGE} as gstreamer-dependencies
COPY docker/build-gstreamer/install-dependencies /
RUN ["/install-dependencies"]


FROM gstreamer-dependencies as gstreamer-source-code
ARG GSTREAMER_REPOSITORY=https://gitlab.freedesktop.org/nazar-pc/gstreamer.git
ARG GSTREAMER_CHECKOUT=e89a4b843724ecbe18dd48e5e313101cbb860b04

ARG LIBNICE_REPOSITORY=https://gitlab.freedesktop.org/libnice/libnice.git
ARG LIBNICE_CHECKOUT=caf9f1d8b1d4675c8c88f8f6fa04d3ff5e27f09a

ARG GST_PLUGINS_BASE_REPOSITORY=https://gitlab.freedesktop.org/nazar-pc/gst-plugins-base.git
ARG GST_PLUGINS_BASE_CHECKOUT=ba1971ab1e447bbbb5ef7d446e9310ac0458bee8

ARG GST_PLUGINS_BAD_REPOSITORY=https://gitlab.freedesktop.org/philn/gst-plugins-bad.git
ARG GST_PLUGINS_BAD_CHECKOUT=78aa6896e33f90aca8ed42fee9b3e0a861277e78

ARG GST_PLUGINS_GOOD_REPOSITORY=https://gitlab.freedesktop.org/nazar-pc/gst-plugins-good.git
ARG GST_PLUGINS_GOOD_CHECKOUT=486c795861eb905a7dc10d7bffcb84e3e2127185

ARG GST_PLUGINS_UGLY_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly.git
ARG GST_PLUGINS_UGLY_CHECKOUT=3ff44eabc3589584ed73ba77ce34e62042d6e578

ARG GST_LIBAV_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-libav.git
ARG GST_LIBAV_CHECKOUT=672f1caf85493a830e9a81af974e6386580031a6

ARG GST_RTSP_SERVER_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server.git
ARG GST_RTSP_SERVER_CHECKOUT=master

ARG GSTREAMER_VAAPI_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi.git
ARG GSTREAMER_VAAPI_CHECKOUT=0193751ce844776ef1823f99aff053ee423f7004

COPY docker/build-gstreamer/download /

RUN ["/download"]

COPY docker/build-gstreamer/compile /


# Compile binaries with debug symbols
FROM gstreamer-source-code as dev-with-source
ENV DEBUG=true
ENV OPTIMIZATIONS=false
RUN ["/compile"]


FROM gstreamer-dependencies as dev
# And binaries built with debug symbols
COPY --from=dev-with-source /compiled-binaries /


# Compile binaries without debug symbols
FROM gstreamer-source-code as prod-compile
ENV DEBUG=false
ENV OPTIMIZATIONS=true
RUN ["/compile"]


FROM ${BASE_IMAGE} as prod-base
COPY docker/build-gstreamer/install-prod-dependencies /
RUN ["/install-prod-dependencies"]

FROM prod-base as prod
COPY --from=prod-compile /compiled-binaries /
