FROM php:7.4-fpm-alpine

# Comment this to improve stability on "auto deploy" environments
RUN apk update && apk upgrade

# Install basic dependencies
RUN apk -u add bash git

# Install PHP extensions
ADD ./.docker/install-php.sh /usr/sbin/install-php.sh
RUN chmod +x /usr/sbin/install-php.sh
# [WARNING] Although the following script fails, this building process does NOT stop.
RUN /usr/sbin/install-php.sh

# Copy existing application directory contents
COPY ./.docker/*.ini /usr/local/etc/php/conf.d/
#COPY . .

# Expose ports and start php-fpm server
EXPOSE 9000

ENTRYPOINT if [ ! -d 'vendor' ]; then composer install; fi  && php artisan key:gen && chgrp -R www-data ./ && chmod -R 775 bootstrap/cache/ storage/ && composer dump-autoload && php artisan config:clear && php-fpm
