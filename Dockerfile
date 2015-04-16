FROM ubuntu:14.10

MAINTAINER Ilya Epifanov <elijah.epifanov@gmail.com>

RUN apt-get update &&\
    apt-get -y upgrade &&\
    apt-get install -y 'bind9=1:9.9.5.*' --no-install-recommends &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/run/named &&\
    chgrp bind /var/run/named &&\
    chmod g+rwx /var/run/named

VOLUME /etc/bind9
EXPOSE 53 53/udp

CMD ["/usr/sbin/named", "-g", "-u", "bind", "-c", "/etc/bind9/named.conf"]
