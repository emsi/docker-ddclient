FROM ubuntu:23.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ddclient dnsutils ca-certificates

RUN echo "dig @resolver4.opendns.com myip.opendns.com +short" > whatismyip  && chmod +x whatismyip

CMD ddclient -daemon 5m -foreground -use=cmd -cmd=/whatismyip -noquiet
