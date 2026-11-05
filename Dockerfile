FROM php:8.3.4-fpm

# Instala dependências do sistema necessárias para compilar extensões PECL
RUN apt-get update -y && apt-get install -y \
    libzip-dev \
    zip \
    libssl-dev

# Instala a extensão oficial do MongoDB via PECL e o driver zip nativo
RUN pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-install zip