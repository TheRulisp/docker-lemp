FROM composer

WORKDIR /var/www/html

COPY ./www/composer.json ./www/composer.lock ./