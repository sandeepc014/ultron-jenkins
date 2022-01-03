#!/bin/bash

cd /var/www/mvol/ultron/ultron-dev.linkstreet.co

echo ""
echo "<<<</*****Pulling latest commit into ultron-core from  bug-fix/zoom-registration-issue*****/>>"
echo ""

git pull origin bug-fix/zoom-registration-issue

sudo chown -R ubuntu:www-data storage/ bootstrap/ && sudo chmod -R 775 storage/ bootstrap/

echo ""
echo ""
echo "<<****Here the five latest commit of ultron-core from  bug-fix/zoom-registration-issue****>>"
echo ""
echo ""
git log -n5
echo ""


