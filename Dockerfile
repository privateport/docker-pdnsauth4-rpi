FROM privateport/alpine-rpi:3.3
MAINTAINER SneakyShrimp
WORKDIR /root
#A bit unreadable but this minimizes space needed
RUN apk update && apk upgrade && apk add git bash alpine-sdk autoconf automake libtool gettext bison flex openssl-dev ragel boost-dev sqlite-dev > /tmp/install.txt && git clone https://github.com/PowerDNS/pdns.git && cd /root/pdns && adduser -S pdns && addgroup -S pdns && ./bootstrap && ./configure --with-modules="gsqlite3" --without-lua && make && make install && ln -s /etc/powerdns/pdns.conf /usr/local/etc/pdns.conf && apk del `grep 'Installing' /tmp/install.txt | awk {'print $3'} | xargs echo` && rm -rf /tmp/install.txt && apk add sqlite bash sqlite-libs libstdc++ libgcc && rm -rf /root/pdns
COPY /assets/sqlite.conf /etc/powerdns/pdns.d/
COPY /assets/pdns.conf /etc/powerdns/
COPY startup.sh /opt/
#ENTRYPOINT ["/opt/startup.sh"]
CMD ["/opt/startup.sh"]


