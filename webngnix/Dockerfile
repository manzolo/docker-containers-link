FROM ubuntu:14.04.4
MAINTAINER Andrea Manzi <manzolo@libero.it>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y php5-common php5-cli php5-fpm php5-mysql && \
apt-get install -y wget zip unzip nginx

RUN wget https://wordpress.org/latest.tar.gz && \
tar -zxvf latest.tar.gz && \
rm latest.tar.gz

ARG DATABASE_NAME=wpmanzolo
ARG DATABASE_USER=root
ARG DATABASE_PASSWORD=defaultpassword
ARG DATABASE_HOST=aliasdblink

RUN cp wordpress/wp-config-sample.php wordpress/wp-config.php && \
sed -i "s/database_name_here/${DATABASE_NAME}/g" wordpress/wp-config.php && \
sed -i "s/username_here/${DATABASE_USER}/g" wordpress/wp-config.php && \
sed -i "s/password_here/${DATABASE_PASSWORD}/g" wordpress/wp-config.php && \
sed -i "s/localhost/${DATABASE_HOST}/g" wordpress/wp-config.php
#TO Debug wordpress
RUN sed -i "s/define('WP_DEBUG', false);/define('WP_DEBUG', true);/g" wordpress/wp-config.php

RUN echo 'daemon off;' >> /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
EXPOSE 80
ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
CMD ["/bin/bash", "/opt/start.sh"]

#docker build --build-arg DATABASE_NAME=wpmanzolo --build-arg DATABASE_USER=manzolo --build-arg DATABASE_PASSWORD=manzolo --build-arg DATABASE_HOST=aliasdblink -t manzolo/webnginx:v1 .
#docker run -d --name wordpress -p 8080:80 --link database:aliasdblink manzolo/webnginx:v1
#docker exec -i -t wordpress /bin/bash
#docker run -it manzolo/webnginx:v1 /bin/bash

#start database and webserver
#docker run -d -v /var/lib/docker-mysql-wordpress:/var/lib/mysql --name database -p 33060:3306 manzolo/mysql:v1 && docker run -d -P --name wordpress --link database:aliasdblink -p 8080:80 manzolo/webnginx:v1

#docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
