# create new hybriscommerce database
CREATE SCHEMA `hybriscommerce`
DEFAULT CHARACTER SET utf8
COLLATE utf8_bin;
 
# create new user and grant him access to hybriscommerce database
create user 'hybris'@'%' identified by 'hybris';
 
grant all on hybriscommerce.* to 'hybris'@'%';