### dockerized Hybris MySQL

The [Dockerfile](Dockerfile) included in this repository can be used to build a docker image of a mysql db.

It is based on the official **mysql:5.6** image and adds a [init script](https://github.com/stefanleh/hybris-mysql/blob/master/init-db-script.sql) for creating user and schema needed by the hybris Commerce Suite.


The command to start a hybris-mysql container is:

	docker run -d --name hybris-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d stefanlehmann/hybris-mysql:latest

#### local.properties

	db.url=jdbc:mysql://yourhostorip:mappedmysqlport/hybriscommerce?useConfigs=maxPerformance&characterEncoding=utf8
	db.driver=com.mysql.jdbc.Driver
	db.username=hybris
	db.password=hybris
	
	# table prefix e.g. if db is shared
	db.tableprefix=
	
	# other *mandatory* settings
	db.customsessionsql=SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
	mysql.optional.tabledefs=CHARSET=utf8 COLLATE=utf8_bin
	mysql.tabletype=InnoDB
	
	# MySQL DATETIME handling
	#   from MySQL 5.6.4 -> mysql.allow.fractional.seconds=true
	#   before MySQL 5.6.4 -> mysql.allow.fractional.seconds=false (or omit the property)
	#
	mysql.allow.fractional.seconds=true
	#
	# Note: after changing this property you must re-run initialization / update because
	# is only has a effect if the initialization / update DDL statements are re-generated!
	#

#### performance

MySQL suggests using a data directory located on the docker host for performance reasons. This can be achieved by using the following command:

	docker run -d --name hybris-mysql -v /my/mysql/data/dir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d stefanlehmann/hybris-mysql:latest
