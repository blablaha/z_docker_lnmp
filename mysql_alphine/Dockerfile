FROM alpine:3.5

RUN apk update && \
	apk add mysql && \
	apk add mysql-client && \
	rm -rf /var/cache/apk/*

EXPOSE 3306

COPY ./init.sh /init.sh
ENTRYPOINT ["/init.sh"]
