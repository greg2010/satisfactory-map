FROM alpine:3

RUN apk add --no-cache nginx fcgiwrap envsubst

COPY conf/serve_latest_save.sh /usr/local/bin/serve_latest_save.sh
RUN chmod +x /usr/local/bin/serve_latest_save.sh

COPY conf/nginx.conf.tmpl /nginx.conf.tmpl
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT /docker-entrypoint.sh