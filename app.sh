#!/bin/bash
apt-get -y install git
git clone https://github.com/sugarcrm/sugarcrm_dev 
cp -r ./sugarcrm_dev /var/www/html


# change the directory rights
cd /var/www/html/sugarcrm_dev/
chmod -R 777 cache custom upload modules 
chmod -R .
