FROM alpine:3.22

RUN apk add --no-cache mopidy py3-pip python3-dev && \
    python3 -m pip install --break-system-packages Mopidy-MusicBox-Webclient Mopidy-Podcast Mopidy-Mobile

USER mopidy:audio
EXPOSE 6680

ENTRYPOINT ["/usr/bin/mopidy"]
