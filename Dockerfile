FROM php:8.4-apache
RUN apt-get update \
 && apt-get install -y --no-install-recommends unzip \
 && rm -rf /var/lib/apt/lists/* \
 && a2enmod headers expires \
 && printf '%s\n' \
   'DirectoryIndex index.php' \
   '<Directory /var/www/html>' \
   '    Options -Indexes' \
   '    AllowOverride None' \
   '    Require all granted' \
   '</Directory>' \
   'Header always set X-Content-Type-Options "nosniff"' \
   'Header always set X-Frame-Options "SAMEORIGIN"' \
   'Header always set Referrer-Policy "strict-origin-when-cross-origin"' \
   > /etc/apache2/conf-available/pokeclaud.conf \
 && a2enconf pokeclaud
COPY deploy/hex /tmp/hex
RUN cat \
 /tmp/hex/001.part /tmp/hex/002.part /tmp/hex/003.part /tmp/hex/004.part /tmp/hex/005.part \
 /tmp/hex/006.part /tmp/hex/007.part /tmp/hex/008.part /tmp/hex/009.part /tmp/hex/010.part \
 /tmp/hex/011.part /tmp/hex/012a.part /tmp/hex/012b.part /tmp/hex/012c.part /tmp/hex/012d.part \
 /tmp/hex/013.part /tmp/hex/014.part /tmp/hex/015.part /tmp/hex/016a.part /tmp/hex/016b1.part \
 /tmp/hex/016b2.part /tmp/hex/016c.part /tmp/hex/016d1.part > /tmp/app.raw \
 && printf '%s' 'NmY2NzZmMmQ2YzY5Njc2ODc0MmU3Mzc2Njc1NTU0MDUwMDAzNTlkMGI3NmE3NTc4MGIwMDAxMDQwMDAwMDAwMDA0ZTkwMzAwMDA1MDRiMDEwMjFlMDMxNDAwMDAwMDA4MDBmYjcyM2E1ZGY3NTA2MDU1N2UwMTAwMDA5ZjAyMDAwMDBmMDAxODAwMDAwMDAwMDAwMTAwMDAwMGE0ODE2YjY2MDAwMDYxNzM3MzY1NzQ3MzJmNmM2ZjY3NmYyZTczNzY2NzU1NTQwNTAwMDM3YWQ1Yjc2YTc1NzgwYjAwMDEwNDAwMDAwMDAwMDRlOTAzMDAwMDUwNGIwMQ==' | base64 -d >> /tmp/app.raw \
 && printf '%s' 'MDIxZTAzMTQwMDAwMDAwODAwZmI3MjNhNWQzZDJmYWRiYWFlMDAwMDAwNDkwMTAwMDAxMjAwMTgwMDAwMDAwMDAwMDEwMDAwMDBhNDgxMzI2ODAwMDA2MTczNzM2NTc0NzMyZjY2NjE3NjY5NjM2ZjZlMmU3Mzc2Njc1NTU0MDUwMDAzN2FkNWI3NmE3NTc4MGIwMDAxMDQwMDAwMDAwMDA0ZTkwMzAwMDA1MDRiMDEwMjFlMDMxNDAwMDAwMDA4MDBmYjcyM2E1ZDQ1ZDFkMjg1NzMwMTAwMDBiODAyMDAwMDFlMDAxODAwMDAwMDAwMDAwMTAwMDAwMA==' | base64 -d >> /tmp/app.raw \
 && cat /tmp/hex/017.part >> /tmp/app.raw \
 && php -r '$h=preg_replace("/\\s+/", "", file_get_contents("/tmp/app.raw")); file_put_contents("/tmp/app.zip", hex2bin($h));' \
 && find /var/www/html -mindepth 1 -maxdepth 1 -exec rm -rf {} + \
 && unzip -q /tmp/app.zip -d /var/www/html \
 && mkdir -p /data/data /data/uploads \
 && chown -R www-data:www-data /data /var/www/html \
 && rm -rf /tmp/hex /tmp/app.raw /tmp/app.zip
EXPOSE 80
