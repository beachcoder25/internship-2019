# Linking multiple containers together to perform a single service

In this tutorial I will link a mysql and Wordpress container togeter, I followed part 6 of this tutorial: https://www.youtube.com/watch?v=HY3WDz6j_hU

## Steps

1. Pull Wordpress and mySQL
```sh
docker pull mysql
docker pull wordpress
```

2. Get mySQL container running, make sure to use mysql:5.7
```
docker run --name easql -e MYSQL_ROOT_PASSWORD=abc123 -d mysql:5.7
```

3. Run Wordpress, attach to port 8080 on localhost
```
docker run --name ealocal --link easql:mysql -p 8080:80 -d wordpress
```