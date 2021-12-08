FROM alpine:edge
ADD config.sh /config.sh
RUN apk update
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
    && chmod +x /config.sh
RUN rm -rf /var/cache/apk/*
RUN apk del .build-deps
ENTRYPOINT ["sh", "-c", "/config.sh"]
