# Utilise une image de base plus légère basée sur Alpine Linux
FROM debian:bullseye

# Met à jour les paquets disponibles et installe les paquets nécessaires avec des versions spécifiques
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    php-gd \
    php-curl \
    php-json \
    wget \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Active le module Apache mod_rewrite pour permettre la réécriture d'URL
RUN a2enmod rewrite

# Copie les fichiers de configuration, le script SQL d'initialisation de la base de données et les thèmes WordPress dans les emplacements appropriés
COPY wp-config.php /var/www/html/wp-config.php
COPY db.sql /docker-entrypoint-initdb.d/db.sql
COPY wordpress.conf /etc/apache2/sites-enabled/wordpress.conf

CMD ["httpd", "-D", "FOREGROUND"]
# Télécharge la dernière version de WordPress depuis le site officiel et l'extrait dans le dossier de destination
RUN wget -O /var/www/html/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /var/www/html/wordpress.tar.gz && \
    rm /var/www/html/wordpress.tar.gz

# Expose le port 80 pour permettre les connexions entrantes vers le conteneur
EXPOSE 80

# Lance le serveur Apache en premier plan en utilisant la commande "apache2ctl"
CMD ["apache2ctl", "-D", "FOREGROUND"]