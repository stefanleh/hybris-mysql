### dockerized Hybris MySQL

The [Dockerfile](Dockerfile) included in this repository can be used to build a docker image of a mysql db.

It is based on the official **mysql:5.6** image and adds a [init script](https://github.com/stefanleh/hybris-mysql/blob/master/init-db-script.sql) for creating user and schema needed by the hybris Commerce Suite.


The command to start a hybris-mysql container is:

	docker run -d --name hybris-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d stefanlehmann/hybris-mysql:latest

#### performance

MySQL suggests using a data directory located on the docker host for performance reasons. This can be achived by using the following command:

	docker run -d --name hybris-mysql -v /my/mysql/data/dir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d stefanlehmann/hybris-mysql:latest
