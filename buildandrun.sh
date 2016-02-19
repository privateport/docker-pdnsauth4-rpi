docker build -t privateport/pdnsauth4-rpi .
docker run -it -v /docker.persistant/pdnsauth4-rpi:/persistant privateport/pdnsauth4-rpi $1
