#!/bin/bash

cd /var/www/webroots/test-adapt



git fetch --all && git checkout composer.lock && git stash && git checkout $site_version && git stash pop

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

composer update ultron/adapt-portal

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

php artisan seed --class=ProgramCertificatesTableSeeder 

php artisan config:clear 

cp /opt/phpcredentials/adapt-credentials /tmp/credentials.php && cp /opt/ultron-core-scripts/php7/2019_12_25_update_adapt_certificate_template_design.php /tmp/

php /tmp/2019_12_25_update_adapt_certificate_template_design.php

php artisan portal:publish && php artisan cache:clear

sed '6 s/.*/APP_SITE_VERSION="'$site_version'"/' .env


