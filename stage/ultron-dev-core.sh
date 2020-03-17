#!/bin/bash

cd /var/www/ultron/ultron-dev.linkstreet.co

echo ""
echo "<<<</*****Pulling latest commit into ultron-core from Dev branch*****/>>"
echo ""

git pull origin dev

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

echo ""
echo ""
echo "<<****Here the five latest commit of ultron-core from Dev branch****>>"
echo ""
echo ""
git log -n5
echo ""


