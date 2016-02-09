# docker-containers-link
- How to build two container linked
* A web server with nginx + wordpress
* A database server with mysql server

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
```

##Navigate to
```http://localhost:8080/
