FROM alpine:3.1

RUN apk -U add bash bind-tools && rm -rf /var/cache/apk/*

ADD . /app
WORKDIR /app

CMD ["/app/run.sh"]
