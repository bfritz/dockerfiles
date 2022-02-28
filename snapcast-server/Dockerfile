FROM alpine:3.15

RUN apk add --no-cache snapcast-server

USER snapcast:audio
EXPOSE 1704
EXPOSE 1705
EXPOSE 1780

ENTRYPOINT ["/usr/bin/snapserver"]
