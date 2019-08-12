FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install mysql-client
RUN apt-get install -y wget
CMD ["wget", "http://vietphil.edu.vn/uploads/f1db.sql.gz"]
CMD ["wget", "http://vietphil.edu.vn/uploads/importdb.sh"]
CMD ["/bin/bash", "./importdb.sh"]
