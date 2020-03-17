#!/bin/bash

ls /var/www/webroots > /opt/scripts/webroots.txt
tablelist="/opt/scripts/webroots.txt"
for table in `sed '/^$/d' $tablelist`; do
    myarray[$index]="$table"
    index=$(($index+1))
    site_name="$(sed -n ''$index'p' /opt/scripts/webroots.txt)"

if [[ -d /var/www/webroots/$site_name ]]; then
cd /var/www/webroots/$site_name

#mkdir public/uploads/logo

#cp public/portal/theme/default/img/logo/site_logo.png  public/uploads/logo/

#cp  /public/portal/theme/default/img/logo/mobile_logo.png public/uploads/logo/


git fetch --all && git stash && git checkout v8.7.9 && git stash pop

echo "$cd"

#php artisan db:seed --class=ProgramCertificatesTableSeeder

#php artisan cache:clear

fi
done

