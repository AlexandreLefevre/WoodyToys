FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get -y install asterisk

ADD https://github.com/AlexandreLefevre/WoodyToys/blob/master/VoIP/conf/extensions.conf /etc/asterisk/extensions.conf
ADD https://github.com/AlexandreLefevre/WoodyToys/blob/master/VoIP/conf/sip.conf /etc/asterisk/sip.conf
ADD https://github.com/AlexandreLefevre/WoodyToys/blob/master/VoIP/conf/users.conf /etc/asterisk/users.conf
ADD https://github.com/AlexandreLefevre/WoodyToys/blob/master/VoIP/conf/voicemail.conf /etc/asterisk/voicemail.conf

VOLUME /etc/asterisk


EXPOSE 5060/udp
EXPOSE 5060/tcp
EXPOSE 4569/udp
EXPOSE 4569/tcp

ENTRYPOINT [ "/usr/sbin/asterisk", "-f" ]
