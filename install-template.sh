#!/bin/bash

apt update
apt upgrade -y

apt-get install -y ca-certificates curl gnupg git net-tools
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=18
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install nodejs -y

npm install pm2@latest -g

#write out current crontab
crontab -l > mycron
echo "@reboot sh -c 'cd /root/smarthome/.output/server && pm2 start index.mjs'" >> mycron
echo "0 3 * * *  sh -c 'cd /root/smarthome && bash update-script.sh'" >> mycron
#install new cron file
crontab mycron
rm mycron
