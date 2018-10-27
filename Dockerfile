FROM alpine

COPY backup.sh /usr/local/bin/backup.sh

RUN apk add --no-cache bash wget \
    && mkdir /backup

WORKDIR /backup

VOLUME [ "/backup" ]
CMD [ "/usr/local/bin/backup.sh" ]
