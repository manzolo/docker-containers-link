# docker-containers-link
A project inspired by [www.tothenew.com](http://www.tothenew.com/blog/docker-dockerfile-and-communication-between-containers/)

* How to build two container linked
 * A web server container with nginx + wordpress
 * A database server container with mysql server

##Build container database server
```bash
cd database
docker build --build-arg DATABASE_NAME=wpmanzolo --build-arg DATABASE_USER=manzolo --build-arg DATABASE_PASSWORD=manzolo -t manzolo/mysql:v1 .
cd ..
```
###Parameters
```
DATABASE_NAME => database name (will be created)
DATABASE_USER => database username (will be created)
DATABASE_PASSWORD => database user password

```
##Build container web server
```bash
cd web
docker build --build-arg DATABASE_NAME=wpmanzolo --build-arg DATABASE_USER=manzolo --build-arg DATABASE_PASSWORD=manzolo --build-arg DATABASE_HOST=aliasdblink -t manzolo/webnginx:v1 .
cd ..
```
###Parameters
```
DATABASE_NAME => database name
DATABASE_USER => database username 
DATABASE_PASSWORD => database user password
DATABASE_HOST => alias database nome host (see later...)

```

##Start containers (database first, web then)
```bash
cd database
docker run -d -v /var/lib/mysql-wordpress-container:/var/lib/mysql --name database -p 33060:3306 manzolo/mysql:v1
cd ..
cd web
docker run -d -P --name wordpress --link database:aliasdblink -p 8080:80 manzolo/webnginx:v1
cd ..
```

###Database server container start command
```
-d : run container as daemon
--name "database": set name of the container
-p 33060:3306 : map container’s 3306 port to host’s 33060 port
-v /var/lib/mysql-wordpress-container:/var/lib/mysql : maps host’s directory /var/lib/mysql-wordpress-container to container’s directory "/var/lib/mysql"

```
###Web server container start command
```
-d : run container as daemon
--name wordpress : create container with name "wordpress"
-p 8080:80 : maps 8080 port of host to 80 port of container
--link database:aliasdblink : enables wordpress container to communicate with database container
  and creates alias "db" to database. We have used this alias in the wp-config.php to specify database host.
```

##Navigate to
```bash
http://localhost:8080/
```

#Dockerfile:
* [Database docker link](https://github.com/manzolo/docker-containers-link/blob/master/database/Dockerfile)
* [Web server docker link](https://github.com/manzolo/docker-containers-link/blob/master/web/Dockerfile)


