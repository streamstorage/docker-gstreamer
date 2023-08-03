ARG BASE_IMAGE

FROM "${BASE_IMAGE}" as dev-dependencies

COPY docker/build-gstreamer/install-dependencies /
RUN ["./install-dependencies"]

ARG RUST_ARCH=x86_64-unknown-linux-gnu
ARG RUSTUP_VERSION=1.26.0
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.71.0

RUN set -eux; \
    url="https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/${RUST_ARCH}/rustup-init"; \
    wget "$url"; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host ${RUST_ARCH}; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version;

RUN cargo install cargo-c


FROM dev-dependencies as dev-source-code
ARG GSTREAMER_REPOSITORY=https://gitlab.freedesktop.org/gstreamer/gstreamer.git
ARG GSTREAMER_CHECKOUT=6e5ca29e8f445f61e292a88cbba8282a629004a6

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
ENV GST_PLUGIN_SCANNER=/usr/libexec/gstreamer-1.0/gst-plugin-scanner

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
ENV GST_PLUGIN_SCANNER=/usr/libexec/gstreamer-1.0/gst-plugin-scanner
