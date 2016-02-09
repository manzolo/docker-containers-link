FROM ubuntu:15.04
MAINTAINER Andrea Manzi <manzolo@libero.it>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install mysql-server mysql-client

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
EXPOSE 3306
CMD ["/bin/bash", "/opt/start.sh"]

#docker build -t mysql .
#docker run -d -v /var/lib/mysql-container:/var/lib/mysql --name database -p 33060:3306 mysql
