#!/bin/bash
DB=/persistant/powerdns/powerdns.sqlite3
if [ ! -f "$DB" ]; then
        echo hi
        sqlite3 $DB < /usr/share/doc/pdns-backend-sqlite3/schema.sqlite3.sql
fi
pdns_server

