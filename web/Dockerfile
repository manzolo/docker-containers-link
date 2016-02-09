FROM ubuntu:15.04
MAINTAINER Andrea Manzi <manzolo@libero.it>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y php5-common php5-cli php5-fpm php5-mysql
RUN apt-get install -y wget zip unzip nginx

RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN rm latest.zip

RUN cp wordpress/wp-config-sample.php wordpress/wp-config.php
RUN sed -i "s/database_name_here/test/g" wordpress/wp-config.php
RUN sed -i "s/username_here/root/g" wordpress/wp-config.php
RUN sed -i "s/password_here/shroot12/g" wordpress/wp-config.php
RUN sed -i "s/localhost/db/g" wordpress/wp-config.php
#TO Debug wordpress
#RUN sed -i "s/define('WP_DEBUG', false);/define('WP_DEBUG', true);/g" wordpress/wp-config.php

RUN echo 'daemon off;' >> /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
EXPOSE 80
ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
CMD ["/bin/bash", "/opt/start.sh"]

#docker build -t web .
#docker run -d --name wordpress -p 8080:80 --link database:db web
