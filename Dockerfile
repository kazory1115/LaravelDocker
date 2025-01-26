FROM php:8.2-fpm

# 更新並安裝系統依賴
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libonig-dev \
    libbz2-dev \
    zip \
    unzip \
    curl \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    mbstring \
    bcmath \
    xml

# 安裝 Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# 安裝 Node.js 和 npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs

# 設置工作目錄
WORKDIR /var/www/html

# 複製應用代碼
COPY ./app /var/www/html

# 設置適當的權限
RUN chown -R www-data:www-data /var/www/html


