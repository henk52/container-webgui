# Web GUI in a container

## Introduction

### Purpose

Runs a Web browser in a container, with VNC access.

It is expected that this can reduce tracking, by removing the container after use.
  So after each use, the container can be stopped/removed and it will start from a fresh.

Please note:

* The author has no clue about security.
* Using this container provides not security increase
  * (though maybe some maliscious loads might be contained inside the container(for now))
* Websites will probably still be able to fingerprint the browser, via OS, browser, CPU id etc.

### References

* https://medium.com/dot-debug/running-chrome-in-a-docker-container-a55e7f4da4a8
* https://wiki.alpinelinux.org/wiki/Remote_Desktop_Server

## Usage

### Using the container

1. docker run --rm --detach --name vncweb webgui:0.1.0
  * --rm - remove the container, when the container is stopped
  * --detach - run the container in the background
2. docker inspect vncweb | grep IPAddress
3. Attach you VNC viewer to the IP address.
4. docker stop vncweb

### Building the container

* make
  * This will actually both build and run the container
