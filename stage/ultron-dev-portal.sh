#!/bin/bash

cd /var/www/ultron/ultron-dev.linkstreet.co


sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

composer update ultron/default-portal

php artisan portal:publish && php artisan cache:clear

cd /var/www/ultron/ultron-dev.linkstreet.co/vendor/ultron/default-portal

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

