FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
		libmemcached-dev \
		zlib1g-dev \
		zip \
		libonig-dev \
		libzip-dev \
		libssl-dev \
		libcurl4-openssl-dev \
		libxml2-dev \
		libmagickwand-dev \
    && docker-php-ext-install -j$(nproc) gettext iconv mbstring mysqli pdo_mysql zip bcmath curl json opcache phar session soap sockets zip \
	&& pecl install memcached \
	&& pecl install imagick \
	&& docker-php-ext-enable memcached \
	&& docker-php-ext-enable imagick

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/