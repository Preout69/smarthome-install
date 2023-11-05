#!/bin/bash

apt update
apt upgrade -y
apt install git

# Ask the user for their name
echo Enter Git repository with Token
read varname
$varname smarthome

#write out current crontab
crontab -l > mycron
echo "@reboot sh -c 'cd /root/smarthome/.output/server && pm2 start index.mjs'" >> mycron
echo "0 3 * * *  sh -c 'cd /root/smarthome && bash update-script.sh'" >> mycron
#install new cron file
crontab mycron
rm mycron

sh -c 'cd /root/smarthome && bash update-script.sh'
