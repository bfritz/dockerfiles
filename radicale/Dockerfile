FROM alpine:3.18

RUN apk add --no-cache radicale

USER radicale:radicale
EXPOSE 5232

ENTRYPOINT ["/usr/bin/radicale"]
CMD ["--server-hosts=0.0.0.0:5232", "--storage-filesystem_folder=/data/collections"]
