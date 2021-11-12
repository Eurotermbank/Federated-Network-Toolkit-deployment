
CREATE DATABASE IF NOT EXISTS `keycloak`;
CREATE DATABASE IF NOT EXISTS `cms`;
CREATE DATABASE IF NOT EXISTS `terminologyservice`;
CREATE DATABASE IF NOT EXISTS `discussionservice`;

CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'user'@'%';