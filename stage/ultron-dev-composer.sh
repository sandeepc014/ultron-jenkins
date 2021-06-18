#!/bin/bash

cd /var/www/mount/ultron/ultron-dev.linkstreet.co

echo ""
echo "<<<</*****Updating composer*******/>>>>>>"
echo ""

git checkout composer.json

git checkout composer.json

git pull origin dev

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

composer config repositories.ultronportal vcs git@github.com:linkstreet/default-portal.git

composer require ultron/default-portal:dev-master

php artisan portal:publish

php artisan cache:clear

echo ""
echo ""
echo "<<****Here the five latest commit of ultron-core from Dev branch****>>"
echo ""
echo ""
git log -n5
echo ""


