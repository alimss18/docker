CREATE DATABASE IF NOT EXISTS dbwordpress;
CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED WITH mysql_native_password BY 'wpmdp';
GRANT ALL PRIVILEGES ON dbwordpress.* TO 'wpuser'@'%' IDENTIFIED BY 'wpmdp';
FLUSH PRIVILEGES;
QUIT;