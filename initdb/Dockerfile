FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install mysql-client
RUN apt-get install -y wget
COPY importscript.sh /
COPY f1db.sql.gz /
CMD ["/importscript.sh"]

