# docker-containers-link
* How to build two container linked
 * A web server container with nginx + wordpress
 * A database server container with mysql server

##Build container database server
```bash
cd database
docker build -t mysql .
cd ..
```
##Build container web server
```bash
cd web
docker build -t web .
cd ..
```
##Start containers (database first, web then)
```bash
cd database
docker run -d -v /var/lib/mysql-container:/var/lib/mysql --name database -p 33060:3306 mysql
cd ..
cd web
docker docker run -d --name wordpress -p 8080:80 --link database:db web
cd ..
```

###Database server container start command
```
-d : run container as daemon
--name "database": set name of the container
-p 33060:3306 : map container’s 3306 port to host’s 33060 port
-v /var/lib/mysql-container:/var/lib/mysql : maps host’s directory /var/lib/mysql-container to container’s directory "/var/lib/mysql"

```
###Web server container start command
```
-d : run container as daemon
--name wordpress : create container with name "wordpress"
-p 8080:80 : maps 8080 port of host to 80 port of container
--link db:database : enables wordpress container to communicate with database container and creates alias "db" to database. 
  We have used this alias in the wp-config.php to specify database host.
```

##Navigate to
```bash
http://localhost:8080/
```

#Web Docker
