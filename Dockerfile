ARG BASE_IMAGE

FROM "${BASE_IMAGE}" as dev-dependencies

COPY docker/build-gstreamer/install-dependencies /
RUN ["./install-dependencies"]


FROM dev-dependencies as dev-source-code
ARG GSTREAMER_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gstreamer.git
ARG GSTREAMER_CHECKOUT=master

COPY docker/build-gstreamer/download /

RUN ["/download"]

COPY docker/build-gstreamer/compile /


# Compile binaries with debug symbols
FROM dev-source-code as dev-with-source
ENV DEBUG=true
ENV OPTIMIZATIONS=false
RUN ["/compile"]


FROM dev-dependencies as dev
COPY --from=dev-with-source /compiled-binaries /


# Compile binaries without debug symbols
FROM dev-source-code as prod-compile
ENV DEBUG=false
ENV OPTIMIZATIONS=true
RUN ["/compile"]


FROM "${BASE_IMAGE}" as prod-base
COPY docker/build-gstreamer/install-prod-dependencies /
RUN ["/install-prod-dependencies"]


FROM prod-base as prod
COPY --from=prod-compile /compiled-binaries /
