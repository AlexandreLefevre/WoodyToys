FROM ubuntu


RUN apt-get update

RUN apt-get -y install asterisk


VOLUME /etc/asterisk


EXPOSE 5060/udp
EXPOSE 5060/tcp
EXPOSE 4569/udp
EXPOSE 4569/tcp

ENTRYPOINT [ "/usr/sbin/asterisk", "-f" ]
