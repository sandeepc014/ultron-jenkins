#!/bin/bash

cd /var/www/webroots/stage-arlenonline.linkstreet.co



git fetch --all && git checkout composer.lock && git stash && git checkout $site_version && git stash pop

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

composer update ultron/arlenonline-portal

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

echo "Program certificate Table seeder ran"
php artisan db:seed --class=ProgramCertificatesTableSeeder 
echo ""

echo "Config cleared"
php artisan config:clear 
echo ""

cp /opt/phpcredentials/arlenonline-credentials.php /tmp/credentials.php && cp /opt/ultron-core-scripts/php7/2020_01_27_update_serial_number_in_user_certificates.php /tmp/

php /tmp/2020_01_27_update_serial_number_in_user_certificates.php
echo "Serial number certificate updated"
echo ""

php artisan portal:publish && php artisan cache:clear

cp .env .env-bkf

sed '6 s/.*/APP_SITE_VERSION="'$site_version'"/' .env

echo $'\n#JWPLAYER Fallback\nFALLBACK_JW_PLAYER=false' >> .env

cd /tmp/ && rm credentials.php

