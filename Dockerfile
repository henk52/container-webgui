FROM alpine:edge
#FROM alpine

EXPOSE 5900

RUN apk update 
RUN apk upgrade 
# bash for starting the services on target.
RUN apk add bash

# Windows server?
RUN apk add xvfb
RUN apk add xdpyinfo
# Windows manager
RUN apk add fluxbox
ADD menu /usr/share/fluxbox/menu
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing wmctrl

# VNC like
#RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/community vino
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing x11vnc

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/community firefox

RUN apk add chromium

RUN adduser  runner -u 2255 -D
# -D		Don't assign a password
# -S		Create a system user

WORKDIR /home/runner
#ENV HOME /desktop
USER runner

ADD run_all.sh /

ENTRYPOINT [ "/run_all.sh" ]

