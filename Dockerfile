FROM alpine:3.21.0

RUN apk update && \
    apk add --no-cache \
    caddy \
    ffmpeg \
    tini

COPY config/Caddyfile /etc/caddy/Caddyfile
COPY web/index.html /web/index.html
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT [ "/sbin/tini", "/entrypoint.sh" ]
