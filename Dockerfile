FROM php:8.4-apache
RUN a2enmod headers && printf '%s\n' 'DirectoryIndex index.php' '<Directory /var/www/html>' 'Options -Indexes' 'AllowOverride None' 'Require all granted' '</Directory>' 'Header always set X-Content-Type-Options "nosniff"' 'Header always set X-Frame-Options "SAMEORIGIN"' 'Header always set Referrer-Policy "strict-origin-when-cross-origin"' > /etc/apache2/conf-available/pokeclaud.conf && a2enconf pokeclaud
COPY . /var/www/html/
RUN mkdir -p /data/uploads && chown -R www-data:www-data /data
EXPOSE 80
