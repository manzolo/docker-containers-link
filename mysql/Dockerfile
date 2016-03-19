FROM ubuntu:14.04.4
MAINTAINER Andrea Manzi <manzolo@libero.it>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install mysql-server mysql-client

ARG DATABASE_NAME=wpmanzolo
ARG DATABASE_USER=root
ARG DATABASE_PASSWORD=shroot12
ENV DATABASE_NAME $DATABASE_NAME
ENV DATABASE_USER $DATABASE_USER
ENV DATABASE_PASSWORD $DATABASE_PASSWORD
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
EXPOSE 3306
CMD ["/bin/bash", "/opt/start.sh"]

#Debug
#docker build --build-arg DATABASE_NAME=wpmanzolo --build-arg DATABASE_USER=manzolo --build-arg DATABASE_PASSWORD=manzolo -t manzolo/mysql:v1 .
#docker run -d -v /var/lib/mysql-container:/var/lib/mysql --name database -p 33060:3306 manzolo/mysql:v1
#docker exec -i -t database /bin/bash
#docker run -it manzolo/mysql:v1 /bin/bash

#docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
