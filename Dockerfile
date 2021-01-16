FROM alpine/make as buildstage

WORKDIR /opt

RUN apk update && apk add --virtual build-dependencies gcc build-base

RUN wget https://vicerveza.homeunix.net/~viric/soft/ts/ts-1.0.1.tar.gz

RUN tar -xf ts-1.0.1.tar.gz;cd ts-1.0.1;make;chmod +x ts

FROM scratch
COPY --from=buildstage /opt/ts-1.0.1/ts /usr/local/bin/ts 
