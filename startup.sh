#!/bin/bash
DB=/persistant/powerdns/powerdns.sqlite3
if [ ! -f "$DB" ]; then
	mkdir -p /persistant/powerdns
        sqlite3 $DB < /usr/local/share/doc/pdns/schema.sqlite3.sql 
fi
pdns_server

