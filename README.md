# Ubuntu-based Docker image for GStreamer

Ubuntu-based container images with upstream GStreamer and plugins pre-installed

The following components are included:

- GStreamer
- libnice
- gst-plugin-pravega
- gst-plugins-base
- gst-plugins-good
- gst-plugins-bad
- gst-plugins-ugly
- gst-libav
- gst-rtsp-server
- gstreamer-vaapi

Ubuntu: 22.04
GStreamer: 1.22.5

# Image Types

- streamstorage/gstreamer:22.04-1.22.5-dev - includes unoptimized build with debug symbols
- streamstorage/gstreamer:22.04-1.22.5-prod - optimized (-O3 and LTO) build without debug symbols for production purposes

## Build

```bash
./build-release.sh
```

# References

- https://github.com/restreamio/docker-gstreamer
- https://github.com/ducksouplab/docker-gstreamer
- https://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer10.html
- https://gstreamer.freedesktop.org/download/

# License

All components are available under [Apache 2 License](https://www.apache.org/licenses/LICENSE-2.0.html) on GitHub.
