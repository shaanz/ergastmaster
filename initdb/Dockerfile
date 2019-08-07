FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install mysql-client
RUN apt-get install -y wget
CMD ["wget", "https://github.com/biennt/ergastmaster/raw/master/initdb/f1db.sql.gz"]
CMD ["wget", "https://github.com/biennt/ergastmaster/raw/master/initdb/importdb.sh"]
CMD ["/bin/bash", "./importdb.sh"]
