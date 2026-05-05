FROM php:5.6-apache

# Install mysql and mysqli extensions
RUN docker-php-ext-install mysql mysqli

# Enable apache mod_rewrite
RUN a2enmod rewrite
