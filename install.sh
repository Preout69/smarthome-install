#!/bin/bash

rm -R /root/smarthome/
# Ask the user for their name

echo Enter provided email token
read emailtoken

git config user.email $emailtoken

echo Enter Git repository with Token
read varname
$varname smarthome

sh -c 'cd /root/smarthome && bash update-script.sh'
