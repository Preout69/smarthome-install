#!/bin/bash

rm -R /root/smarthome/
# Ask the user for their name
echo Enter Git repository with Token
read varname
$varname smarthome

sh -c 'cd /root/smarthome && bash update-script.sh'
