FROM alpine

RUN apk add jq curl
RUN mkdir /app
WORKDIR /app
COPY loop.sh /app/
COPY update.sh /app/

CMD /app/loop.sh
