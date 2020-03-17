#!/bin/bash

cd /var/www/ultron/ultron-dev.linkstreet.co


git pull origin dev

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

git log -n5

