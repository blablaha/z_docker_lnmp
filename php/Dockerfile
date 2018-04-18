FROM php:7.0-fpm-alpine
ADD conf/php.ini-development /usr/local/etc/php/php.ini


#GD dependency
RUN apk update && \
    apk add libjpeg-turbo-dev libpng-dev freetype-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-zlib-dir
#extension
RUN docker-php-ext-install mysqli pdo pdo_mysql gd
