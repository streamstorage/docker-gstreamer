# docker-gstreamer

Ubuntu-based container images with upstream GStreamer and plugins pre-installed

The following components are included:

- GStreamer
- libnice
- gst-plugins-base
- gst-plugins-good
- gst-plugins-bad
- gst-plugins-ugly
- gst-libav
- gst-rtsp-server
- gst-plugins-rs
- gst-python

Ubuntu: 22.04

GStreamer: 1.22.6

The pre-built images are available here: https://github.com/orgs/streamstorage/packages/container/package/gstreamer

# Image Types

There are 4 kinds of images that are built.

- streamstorage/gstreamer:22.04-1.22.6-dev - includes unoptimized build with debug symbols
- streamstorage/gstreamer:22.04-1.22.6-dev-with-source - includes unoptimized build with debug symbols and source code it was built with
- streamstorage/gstreamer:22.04-1.22.6-prod - optimized (-O3 and LTO) build without debug symbols for production purposes
- streamstorage/gstreamer:22.04-1.22.6-prod-dbg - optimized (-O2 only) build with debug symbols included for production purposes with better debugging experience

# Build

```bash
BUILD_DEV=1 ./build-release.sh
BUILD_DEV_WITH_SOURCE=1 ./build-release.sh
BUILD_PROD=1 ./build-release.sh
BUILD_PROD_DBG=1 ./build-release.sh
```

# References

- https://github.com/restreamio/docker-gstreamer
- https://github.com/ducksouplab/docker-gstreamer
- https://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer10.html
- https://gstreamer.freedesktop.org/documentation/installing/building-from-source-using-meson.html?gi-language=c

# License

All components are available under [Apache 2 License](https://www.apache.org/licenses/LICENSE-2.0.html) on GitHub.

# Build targets Info

The meson configuration output ends by listing the enabled build targets:

```
Build targets in project: 715

gstreamer-full 1.22.6

  Build options
    gstreamer-full library       : NO
    Tools                        : gst-inspect, gst-stats, gst-typefind,
                                   gst-launch, gst-device-monitor,
                                   gst-discoverer, gst-play

  Subprojects
    FFmpeg                       : YES (from gst-libav)
    avtp                         : YES (from gst-plugins-bad)
    cairo                        : YES (from gst-plugins-base => pango)
    dssim                        : YES (from gst-plugins-bad)
    dv                           : YES (from gst-plugins-good)
    fdk-aac                      : YES (from gst-plugins-bad)
    fontconfig                   : YES 4 warnings
                                   (from gst-plugins-base => pango)
    freetype2                    : YES
                                   (from gst-plugins-base => pango => harfbuzz)
    fribidi                      : YES (from gst-plugins-base => pango)
    gi-docgen                    : NO
                                   python3 is missing modules: jinja2, pygments, toml, typogrify
    gl-headers                   : YES (from gst-plugins-base)
    gperf                        : YES
                                   (from gst-plugins-base => pango => fontconfig)
    graphene                     : YES 2 warnings (from gst-plugins-base)
    gst-devtools                 : NO Feature 'devtools' disabled
    gst-editing-services         : NO Feature 'ges' disabled
    gst-examples                 : NO Feature 'gst-examples' disabled
    gst-integration-testsuites   : NO Feature 'devtools' disabled
    gst-libav                    : YES
    gst-omx                      : NO Feature 'omx' disabled
    gst-plugins-bad              : YES 1 warnings
    gst-plugins-base             : YES 1 warnings
    gst-plugins-good             : YES 1 warnings
    gst-plugins-rs               : YES 1 warnings
    gst-plugins-ugly             : YES
    gst-python                   : YES
    gst-rtsp-server              : YES
    gstreamer                    : YES 1 warnings
    gstreamer-sharp              : NO Feature 'sharp' disabled
    gstreamer-vaapi              : NO Feature 'vaapi' disabled
    harfbuzz                     : YES 3 warnings
                                   (from gst-plugins-base => pango)
    lame                         : YES 1 warnings (from gst-plugins-good)
    libdrm                       : YES 1 warnings (from gst-plugins-bad)
    libjpeg-turbo                : YES (from gst-plugins-good)
    libmicrodns                  : YES (from gst-plugins-bad)
    libnice                      : YES
    libopenjp2                   : NO
                                   In subproject libopenjp2: Unknown options: "libopenjp2:build_codec"
    libpng                       : YES
                                   (from gst-plugins-base => pango => harfbuzz => freetype2)
    libva                        : NO
                                   Neither a subproject directory nor a libva.wrap file was found.
    libxml2                      : YES 2 warnings (from gst-plugins-good)
    ogg                          : YES (from gst-plugins-base)
    openh264                     : YES (from gst-plugins-bad)
    opus                         : YES 1 warnings (from gst-plugins-base)
    pango                        : YES (from gst-plugins-base)
    pixman                       : YES
                                   (from gst-plugins-base => pango => cairo)
    pycairo                      : YES 4 warnings (from pygobject)
    pygobject                    : YES 5 warnings
    tinyalsa                     : NO
                                   Neither a subproject directory nor a tinyalsa.wrap file was found.
    vorbis                       : YES (from gst-plugins-base)
    x264                         : YES (from gst-plugins-ugly)

  User defined options
    debug                        : true
    libdir                       : /usr/lib
    prefix                       : /usr
    bad                          : enabled
    base                         : enabled
    devtools                     : disabled
    doc                          : disabled
    examples                     : disabled
    ges                          : disabled
    good                         : enabled
    gpl                          : enabled
    gst-examples                 : disabled
    libav                        : enabled
    libnice                      : enabled
    orc                          : disabled
    python                       : enabled
    rs                           : enabled
    rtsp_server                  : enabled
    tests                        : disabled
    tls                          : disabled
    ugly                         : enabled
    gst-plugins-bad:x265         : enabled
    gst-plugins-base:gl          : enabled
    gst-plugins-base:pango       : enabled
    gst-plugins-rs:fallbackswitch: disabled
    gst-plugins-rs:fmp4          : enabled
    gst-plugins-rs:livesync      : disabled
    gst-plugins-rs:togglerecord  : disabled
    gst-plugins-ugly:x264        : enabled
    libnice:gupnp                : disabled
```
