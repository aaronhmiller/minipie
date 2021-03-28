FROM alpine:latest

RUN apk add --no-cache httpie \
    rm -rf /root/.cache && rm -rf /var/cache/apk/*

ENTRYPOINT [ "http" ]
