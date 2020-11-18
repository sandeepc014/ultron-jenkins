#!/bin/bash

cd /var/www/mount/ultron/ultron-dev.linkstreet.co


sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

composer update ultron/default-portal

cd /var/www/mount/ultron/ultron-dev.linkstreet.co/vendor/ultron/default-portal/src/Portal/resources/lang

git pull origin master

cd /var/www/mount/ultron/ultron-dev.linkstreet.co

sudo chown -R ubuntu:www-data storage bootstrap && sudo chmod -R 775 storage bootstrap

php artisan view:clear && php artisan config:clear && php artisan route:clear && php artisan portal:publish && php artisan cache:clear

cd /var/www/mount/ultron/ultron-dev.linkstreet.co/vendor/ultron/default-portal

echo ""
echo "The branch name is"
echo ""
echo ""

git branch

echo ""
echo "The latest five commits are"
echo ""

git log -n5

echo ""
echo ""

