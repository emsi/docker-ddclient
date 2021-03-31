FROM ubuntu:20.10

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ddclient ca-certificates

RUN echo "dig @resolver4.opendns.com myip.opendns.com +short" > whatismyip  && chmod + whatismyip

ENTRYPOINT ddclient -daemon 5m -foreground -use=cmd -cmd=./whatismyip
