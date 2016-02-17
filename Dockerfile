FROM privateport/alpine-rpi:3.3
MAINTAINER SneakyShrimp
RUN apk update && apk upgrade && apk add git bash alpine-sdk autoconf automake libtool gettext bison flex openssl-dev ragel boost-dev sqlite-dev
WORKDIR /root
RUN git clone https://github.com/PowerDNS/pdns.git
WORKDIR /root/pdns
RUN make clean && ./bootstrap && ./configure --with-modules="gsqlite3" --without-lua && make && make install 
COPY /assets/sqlite.conf /etc/powerdns/pdns.d/
COPY /assets/pdns.conf /etc/powerdns/
COPY startup.sh /opt/

#ENTRYPOINT ["/opt/startup.sh"]
CMD ["/opt/startup.sh"]


