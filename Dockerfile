# Dockerfile for building a Docker image for the application
# PHP and Laravel with libraries and dependencies

FROM php:8.3.7-apache
WORKDIR /var/www/html/
# Install libraries and dependencies for Laravel PHP and MySQL
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug
# Config apache site default
COPY ./config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
# Enable mod_rewrite for Apache
RUN a2enmod rewrite
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Copy the application
COPY ./app .
# Run Composer
RUN composer install --no-scripts
# Set permissions
RUN chown -R www-data:www-data /var/www/html/
# Expose port 80
EXPOSE 80
# Start Apache
CMD ["apache2-foreground"]
