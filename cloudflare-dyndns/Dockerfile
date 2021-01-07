FROM alpine

RUN apk add jq curl
RUN mkdir /app
WORKDIR /app
COPY loop.sh update.sh /app/

CMD ./loop.sh
