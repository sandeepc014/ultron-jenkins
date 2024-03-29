#!/bin/bash

cd /var/www/mvol/ultron/ultron-dev.linkstreet.co


sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

composer update ultron/default-portal

cd /var/www/mvol/ultron/ultron-dev.linkstreet.co/vendor/ultron/default-portal/src/Portal/resources/lang

git pull origin master

cd /var/www/mount/ultron/ultron-dev.linkstreet.co

sudo chown -R ubuntu:www-data storage bootstrap && sudo chmod -R 775 storage bootstrap

sudo php artisan view:clear && sudo php artisan config:clear && sudo php artisan route:clear && sudo php artisan portal:publish && sudo php artisan cache:clear

cd /var/www/mvol/ultron/ultron-dev.linkstreet.co/vendor/ultron/default-portal

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

