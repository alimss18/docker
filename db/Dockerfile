FROM debian:bullseye

# Met à jour les paquets disponibles
RUN apt-get update && \
    apt upgrade && \
    apt install wget -y

# Télécharge et installe le paquet mysql-apt-config pour configurer les sources de paquets MySQL
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb && \
    apt install ./mysql-apt-config_0.8.24-1_all.deb -y && \
    dpkg -i mysql-apt-config_0.8.24-1_all.deb

# Met à jour à nouveau les paquets disponibles
RUN apt update

# Installe le serveur MySQL, le client MySQL, les utilitaires MySQL et les paquets communs
RUN apt-get install mariadb-server -y && \
    apt-get install mariadb-client -y && \
    apt-get install mariadb-common -y

# Vérifie l'installation des commandes mysql et mysqld
RUN command -v mysql && \
    command -v mysqld

# Copie le fichier de configuration my.cnf dans le dossier approprié
COPY my.cnf /etc/mysql/my.cnf

# Copie le fichier SQL d'initialisation de la base de données dans le dossier approprié
COPY db.sql /docker-entrypoint-initdb.d/db.sql

# Expose le port 3306 pour les connexions MySQL
EXPOSE 3306

# Lance le serveur mysqld lors de l'exécution du conteneur
CMD ["mysqld"]