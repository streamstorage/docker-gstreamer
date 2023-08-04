# docker-gstreamer

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
- gst-plugins-rs
- gst-python

Ubuntu: 22.04

GStreamer: 1.22.5

# Image Types

There are 2 kinds of images that are built.

- streamstorage/gstreamer:22.04-1.22.5-dev - includes unoptimized build with debug symbols
- streamstorage/gstreamer:22.04-1.22.5-prod - optimized (-O3 and LTO) build without debug symbols for production purposes

# Build

```bash
BUILD_PROD=1 ./build-release.sh
```

# References

- https://github.com/restreamio/docker-gstreamer
- https://github.com/ducksouplab/docker-gstreamer
- https://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer10.html
- https://gstreamer.freedesktop.org/download/
- https://gstreamer.freedesktop.org/documentation/installing/building-from-source-using-meson.html?gi-language=c

# License

All components are available under [Apache 2 License](https://www.apache.org/licenses/LICENSE-2.0.html) on GitHub.


# Build targets Info

The meson configuration output ends by listing the enabled build targets:

```
Build targets in project: 363

gst-plugins-bad 1.22.5

    Plugins               : accurip, adpcmdec, adpcmenc, aiff, asfmux, audiobuffersplit, audiofxbad, audiomixmatrix, audiolatency, audiovisualizers, autoconvert, bayer, camerabin, codecalpha,
                            codectimestamper, coloreffects, debugutilsbad, dvbsubenc, dvbsuboverlay, dvdspu, faceoverlay, festival, fieldanalysis, freeverb, frei0r, gaudieffects, gdp, geometrictransform,
                            id3tag, inter, interlace, ivfparse, ivtc, jp2kdecimator, jpegformat, rfbsrc, midi, mpegpsdemux, mpegpsmux, mpegtsdemux, mpegtsmux, mxf, netsim, rtponvif, pcapparse, pnm, proxy,
                            legacyrawparse, removesilence, rist, rtmp2, rtpmanagerbad, sdpelem, segmentclip, siren, smooth, speed, subenc, switchbin, timecode, transcode, videofiltersbad,
                            videoframe_audiolevel, videoparsersbad, videosignal, vmnc, y4mdec, decklink, dvb, fbdevsink, ipcpipeline, kms, nvcodec, shm, aes, avtp, closedcaption, dash, dtls, fdkaac, hls,
                            iqa, microdns, openh264, opusparse, sctp, smoothstreaming, ttmlsubs, webrtc
    (A)GPL license allowed: True

gst-plugins-base 1.22.5

    GL api     : gl
    GL platform: glx
    GL winsys  : x11
    Plugins    : adder, app, audioconvert, audiomixer, audiorate, audioresample, audiotestsrc, compositor, encoding, gio, overlaycomposition, pbtypes, playback, rawparse, subparse, tcp, typefindfunctions,
                 videoconvertscale, videorate, videotestsrc, volume, opengl, ogg, opus, pango, vorbis, ximagesink

gst-plugins-good 1.22.5

    Plugins: alpha, alphacolor, apetag, audiofx, audioparsers, auparse, autodetect, avi, cutter, navigationtest, debug, deinterlace, dtmf, effectv, equalizer, flv, flxdec, goom, goom2k1, icydemux,
             id3demux, imagefreeze, interleave, isomp4, alaw, mulaw, level, matroska, monoscope, multifile, multipart, replaygain, rtp, rtpmanager, rtsp, shapewipe, smpte, spectrum, udp, videobox,
             videocrop, videofilter, videomixer, wavenc, wavparse, xingmux, y4menc, ossaudio, oss4, video4linux2, ximagesrc, adaptivedemux2, cairo, jpeg, lame, dv, png, soup

gst-plugins-rs 0.9.11

    Plugins: rsaudiofx, claxon, lewton, spotify, rsfile, threadshare, mp4, fmp4, aws, hlssink3, ndi, rsonvif, raptorq, reqwest, rsrtp, webrtchttp, rswebrtc, textahead, json, regex, textwrap, rstracers,
             uriplaylistbin, cdg, rsclosedcaption, ffv1, rsflv, gif, hsv, rspng, rav1e, rsvideofx, sodium

gst-plugins-ugly 1.22.5

    Plugins               : asf, dvdlpcmdec, dvdsub, realmedia, x264
    (A)GPL license allowed: True

gst-rtsp-server 1.22.5

    Plugins: rtspclientsink

gstreamer 1.22.5

    Plugins: coreelements, coretracers

gstreamer-full 1.22.5

  Build options
    gstreamer-full library       : NO
    Tools                        : gst-inspect, gst-stats, gst-typefind, gst-launch, gst-device-monitor, gst-discoverer, gst-play

  Subprojects
    gl-headers                   : YES (from gst-plugins-base)
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
    libnice                      : YES
    libopenjp2                   : NO In subproject libopenjp2: Unknown options: "libopenjp2:build_codec"
    libva                        : NO Neither a subproject directory nor a libva.wrap file was found.
    tinyalsa                     : NO Neither a subproject directory nor a tinyalsa.wrap file was found.

  User defined options
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
    gst-plugins-base:gl          : enabled
    gst-plugins-base:pango       : enabled
    gst-plugins-rs:fallbackswitch: disabled
    gst-plugins-rs:fmp4          : enabled
    gst-plugins-rs:livesync      : disabled
    gst-plugins-rs:togglerecord  : disabled
    gst-plugins-ugly:x264        : enabled
    libnice:gupnp                : disabled
```
